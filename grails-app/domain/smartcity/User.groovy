package smartcity

class User {

	transient springSecurityService
    String firstname
    String lastname
    String email
    String university
    String classLevel
    String studentId
    boolean hasMobile
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static hasMany = [projects: Project]

	static transients = ['springSecurityService']

	static constraints = {
        firstname blank: false
        lastname blank: false
        university blank: false
        classLevel blank: false
        studentId blank: false
        email email: true, unique: true
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

    @Override
    public String toString() {
        return firstname + ' ' + lastname;
    }
}
