package smartcity

class Project {

    String title
    String description

    User owner

    static constraints = {
        title blank: false
        description blank: false, minSize: 100
    }

    @Override
    public String toString() {
        return title
    }
}
