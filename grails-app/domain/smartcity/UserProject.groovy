package smartcity

import org.apache.commons.lang.builder.HashCodeBuilder

class UserProject implements Serializable {

    private static final long serialVersionUID = 1

    User user
    Project project

    boolean equals(other) {
        if (!(other instanceof UserProject)) {
            return false
        }

        other.user?.id == user?.id &&
                other.project?.id == project?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (user) builder.append(user.id)
        if (project) builder.append(project.id)
        builder.toHashCode()
    }

    static UserProject get(long userId, long projectId) {
        UserProject.where {
            user == User.load(userId) &&
                    project == Project.load(projectId)
        }.get()
    }

    static boolean exists(long userId, long projectId) {
        UserProject.where {
            user == User.load(userId) &&
                    project == Project.load(projectId)
        }.count() > 0
    }

    static UserProject create(User user, Project project, boolean flush = false) {
        def instance = new UserProject(user: user, project: project)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(User u, Project p, boolean flush = false) {
        if (u == null || p == null) return false

        int rowCount = UserProject.where {
            user == User.load(u.id) &&
                    project == Project.load(p.id)
        }.deleteAll()

        if (flush) {
            UserProject.withSession { it.flush() }
        }

        rowCount > 0
    }

    static void removeAll(User u, boolean flush = false) {
        if (u == null) return

        UserProject.where {
            user == User.load(u.id)
        }.deleteAll()

        if (flush) {
            UserProject.withSession { it.flush() }
        }
    }

    static void removeAll(Project p, boolean flush = false) {
        if (p == null) return

        UserProject.where {
            project == Project.load(p.id)
        }.deleteAll()

        if (flush) {
            UserProject.withSession { it.flush() }
        }
    }

    static constraints = {
        project validator: { Project p, UserProject ur ->
            if (ur.user == null) return
            boolean existing = false
            UserProject.withNewSession {
                existing = UserProject.exists(ur.user.id, p.id)
            }
            if (existing) {
                return 'UserProject.exists'
            }
        }
    }

    static mapping = {
        id composite: ['project', 'user']
        version false
    }
}

