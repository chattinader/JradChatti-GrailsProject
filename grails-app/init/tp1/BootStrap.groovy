package tp1

class BootStrap {

    def init = { servletContext ->
        def userInstance = new User(
                userName: "userName",
                password: "password",
                thumbnail: new Illustration(fileName: "apple-touch-icon-retina.png"),
        ).save(flush: true, failOnError: true)

        (1..3).each {
            def annonceInstance = new Annonce(
                    title: "title " + it,
                    description: "description",
                    valideTill: new Date(),
                    state: Boolean.TRUE
            )
                    .addToIllustration(new Illustration(fileName: 'apple-touch-icon-retina.png'))
                    .addToIllustration(new Illustration(fileName: 'apple-touch-icon-retina.png'))
            userInstance.addToAnnonce(annonceInstance)
        }
        userInstance.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}
