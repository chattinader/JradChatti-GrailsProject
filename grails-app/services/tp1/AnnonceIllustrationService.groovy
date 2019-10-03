package tp1

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpServletRequest

@Transactional
class AnnonceIllustrationService {

    AnnonceService annonceService
    GrailsApplication grailsApplication

    def uploadFile(Annonce annonce, HttpServletRequest request, String filename) {
            def f = request.getFile(filename)

        if (!f.empty) {
            String fileName = System.currentTimeMillis() + f.getOriginalFilename()
            f.transferTo(new File(grailsApplication.config.maconfig.assets_path + fileName))

            annonce.addToIllustration(new Illustration(fileName: fileName))
            annonceService.save(annonce)
        }
    }

    def serviceMethod() {

    }
}
