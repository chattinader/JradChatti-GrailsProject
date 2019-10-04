package tp1

class CronTestJob {
    static triggers = {
      simple repeatInterval: 60000L //
    }

    def execute() {

        def annonces = Annonce.findAllByState(Boolean.TRUE)
        annonces.each {
            if (it.valideTill.before(new Date())){
                println("mise a jour faite"+it.id)
                it.state = Boolean.FALSE
                it.save(flush : true)
            }
        }
    }
}
