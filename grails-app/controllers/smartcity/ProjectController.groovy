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
        def list = UserProject.findAllByProject(projectInstance)
        respond projectInstance, model: [participantList: list]
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
    @Transactional
    def participate(Project projectInstance) {
        if(!projectInstance.owner.username.equals(springSecurityService.principal.username)) {
            def user = User.findByUsername(springSecurityService.principal.username)
            UserProject userProject = new UserProject(user: user, project: projectInstance)
            userProject.save(flush: true)
            redirect(action: 'show', id: projectInstance.id)
            return
        }
    }

    @Secured(["ROLE_USER"])
    @Transactional
    def leave(Project projectInstance) {
        def user = User.findByUsername(springSecurityService.principal.username)
        UserProject userProject = new UserProject(user: user, project: projectInstance)
        userProject.delete(flush: true)
        redirect(action: 'show', id: projectInstance.id)
        return
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
            missingPermission()
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
            missingPermission()
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

    protected void missingPermission() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.missing.permission.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: METHOD_NOT_ALLOWED }
        }
    }
}
