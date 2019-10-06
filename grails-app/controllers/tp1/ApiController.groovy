package tp1

import grails.converters.JSON
import grails.converters.XML

import java.text.SimpleDateFormat

class ApiController {

    AnnonceService annonceService
    String pattern = "yyyy-MM-dd"

    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                response.withFormat {
                    json { render annonceInstance as JSON }
                    xml { render annonceInstance as XML }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                if (!params.title || !params.description || !params.valideTill || !params.state)
                    return response.status = 404
                annonceInstance.setTitle(params.title)
                annonceInstance.setDescription(params.description)
                annonceInstance.setValideTill(new SimpleDateFormat(pattern).parse(params.valideTill))
                annonceInstance.setState(new Boolean(params.state))
                annonceService.save(annonceInstance)
                return response.status = 200
                break
            case "PATCH":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                if (params.title)
                    annonceInstance.setTitle(params.title)
                if (params.description)
                    annonceInstance.setDescription(params.description)
                if (params.valideTill)
                    annonceInstance.setValideTill(new SimpleDateFormat(pattern).parse(params.validTill))
                if (params.state)
                    annonceInstance.setState(new Boolean(params.state))
                annonceService.save(annonceInstance)
                return response.status = 200
                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                annonceService.delete(annonceInstance.id)
                return response.status = 200
                break
            default:
                return response.status = 405
                break
        }

        return response.status = 406
    }

    def annonces() {
        switch (request.getMethod()) {
            case 'GET':
                def annonceList = Annonce.findAllByState(false)
                if (!annonceList.id)
                    return response.status = 400
                if (!annonceList)
                    return response.status = 404
                response.withFormat {
                    json { render annonceList as JSON }
                    xml { render annonceList as XML }
                }
                break
            case 'POST':
                def file = request.getFile("file")
                def user = User.get(params.user)
                if (!params.user || !params.title || !params.description || !params.valideTill || !params.state || !file)
                    return response.status = 400
                def fileName = file.getOriginalFilename()
                file.transferTo(new File(grailsApplication.config.maconfig.assets_path + fileName))

                 def newAnnonce = new Annonce(title: params.title, description: params.description,
                         valideTill: new SimpleDateFormat(pattern).parse(params.valideTill), state: params.state)

                 newAnnonce.addToIllustration(new Illustration(fileName: fileName))
                 newAnnonce.author = user

                 annonceService.save(newAnnonce)

                 return response.status = 200
                 break
            default:
                return response.status = 405
                break
        }

        return response.status = 406
    }

}
