package tp1

class CronTestJob {
    static triggers = {
      simple repeatInterval: 60000L //
    }

    def execute() {

        def annonces = Annonce.findAllByState(Boolean.TRUE)
        annonces.each {
            if (it.valideTill.before(new Date())){
                println("Mise à jour de l'annonce "+it.id+" réalisé")
                it.state = Boolean.FALSE
                it.save(flush : true)
            }
        }
    }
}
