package tp1

class User {

    String userName
    String password
    Date dateCreated
    Date lastUpdated
    Illustration thumbnail

    static hasMany = [annonce: Annonce]

    static constraints = {
        userName nullable: false, blank: false, size: 5..20
        password password: true, nullable: false, blank: false, size: 8..30
        thumbnail nullable: false
        annonce nullable: true
    }

    @Override
    String toString() {
        return userName
    }
}
