package tp1

class Annonce {

    String title
    String description
    Date dateCreated
    Date valideTill
    Boolean state = Boolean.FALSE

    static belongsTo = [author: User]
    static hasMany = [illustration: Illustration]

    static constraints = {
        title blank: false, nullable: false, size: 2..30
        description blank: false, nullable: false
        valideTill nullable: false
        illustration nullable: true
    }
}
