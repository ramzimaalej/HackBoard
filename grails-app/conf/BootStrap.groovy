import smartcity.Role
import smartcity.User
import smartcity.UserRole

class BootStrap {

    def init = { servletContext ->

        User user = new User(firstname: 'Ramzi', lastname:'Maalej', email: 'ramzi.maalej@gmail.com', hasMobile: true, username: 'rmaalej', password: 'Sfax2014')
        user.save()
        Role role = new Role(authority: 'ROLE_ADMIN')
        role.save()

        UserRole userRole = new UserRole(user: user, role: role)
        userRole.save()
    }
    def destroy = {
    }
}
