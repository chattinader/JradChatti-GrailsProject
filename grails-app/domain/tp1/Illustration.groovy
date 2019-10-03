package tp1

class Illustration {

    String fileName

    static constraints = {
        fileName nullable: false, blank: false
    }

    @Override
    String toString() {
        return fileName
    }
}
