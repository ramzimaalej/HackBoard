package smartcity

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    @Secured(["ROLE_USER"])
    def show(User userInstance) {
        def principal = springSecurityService.principal

        if(userInstance == null || !userInstance.username.equals(principal.username)) {
            notFound()
            return
        }

        respond userInstance
    }

    @Secured(["permitAll"])
    def create() {
        respond new User(params)
    }

    @Secured(["permitAll"])
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    @Secured(["ROLE"])
    def edit(User userInstance) {

        def principal = springSecurityService.principal

        if(userInstance == null || !userInstance.username.equals(principal.username)) {
            notFound()
            return
        }

        respond userInstance
    }

    @Transactional
    @Secured(["ROLE_USER"])
    def update(User userInstance) {

        def principal = springSecurityService.principal

        if (userInstance == null) {
            notFound()
            return
        }

        if(!userInstance.username.equals(principal.username) && SpringSecurityUtils.ifNotGranted("ROLE_ADMIN")) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(["ROLE_ADMIN"])
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
