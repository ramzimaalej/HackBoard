package smartcity

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProjectController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(["permitAll"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectInstanceCount: Project.count()]
    }

    @Secured(["ROLE_USER"])
    def show(Project projectInstance) {
        respond projectInstance
    }

    @Secured(["ROLE_USER"])
    def create() {
        respond new Project(params)
    }

    @Secured(["ROLE_USER"])
    @Transactional
    def save(Project projectInstance) {
        if (projectInstance == null) {
            notFound()
            return
        }

        if (projectInstance.hasErrors()) {
            respond projectInstance.errors, view:'create'
            return
        }

        projectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
                redirect projectInstance
            }
            '*' { respond projectInstance, [status: CREATED] }
        }
    }

    @Secured(["ROLE_USER"])
    def edit(Project projectInstance) {
        respond projectInstance
    }

    @Transactional
    @Secured(["ROLE_USER"])
    def update(Project projectInstance) {
        if (projectInstance == null) {
            notFound()
            return
        }

        def principal = springSecurityService.principal

        if(!principal.username.equals(projectInstance.owner.username)) {
            notFound()
            return
        }

        if (projectInstance.hasErrors()) {
            respond projectInstance.errors, view:'edit'
            return
        }

        projectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Project.label', default: 'Project'), projectInstance.id])
                redirect projectInstance
            }
            '*'{ respond projectInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(["ROLE_USER"])
    def delete(Project projectInstance) {

        if (projectInstance == null) {
            notFound()
            return
        }

        def principal = springSecurityService.principal

        if(!principal.username.equals(projectInstance.owner.username)) {
            notFound()
            return
        }

        projectInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Project.label', default: 'Project'), projectInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
