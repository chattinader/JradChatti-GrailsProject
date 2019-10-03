package tp1

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpServletRequest

@Transactional
class UserIllustrationService {

    GrailsApplication grailsApplication
    UserService userService

    def uploadFile(User user, HttpServletRequest request, String filename) {
        def f = request.getFile(filename)

        if (!f.empty) {
            String fileName = System.currentTimeMillis() + f.getOriginalFilename()
            f.transferTo(new File(grailsApplication.config.maconfig.assets_path + fileName))

            user.thumbnail = new Illustration(fileName: fileName)
            userService.save(user)
        }
    }

    def serviceMethod() {

    }

}