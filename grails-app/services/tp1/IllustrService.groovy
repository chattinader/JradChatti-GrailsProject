package tp1

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpServletRequest

@Transactional
class IllustrService {
    GrailsApplication grailsApplication
    IllustrationService illustrationService

    def uploadFile(Illustration illustration, HttpServletRequest request, String filename) {
        def f = request.getFile(filename)

        if (!f.empty) {
            String fileName = System.currentTimeMillis() + f.getOriginalFilename()
            f.transferTo(new File(grailsApplication.config.maconfig.assets_path + fileName))

            illustration.fileName = new Illustration(fileName: fileName)
            illustrationService.save(illustration)
        }
    }

    def serviceMethod() {

    }
}
