package smartcity

class Project {

    String title
    String description

    User owner

    static constraints = {
        title blank: false
        description blank: false, minSize: 100, maxSize: 1500
    }

    @Override
    public String toString() {
        return title
    }
}
