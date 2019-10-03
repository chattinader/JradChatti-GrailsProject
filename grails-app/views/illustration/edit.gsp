<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-illustration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-illustration" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.illustration}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.illustration}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
                    <form action="/illustration/update/${illustration.id}" method="post" enctype="multipart/form-data">
                        <fieldset class="form">
                            <div class="fieldcontain">
                                <label for="fileName">File name</label>
                                <label id="fileName">${illustration.fileName}</label>
                            </div>
                            <div class='fieldcontain'>
                                <label for='imgFile'>
                                    Illustration
                                </label>
                                <img src="http://localhost:8081/assets/${illustration.fileName}" id="imgFile"
                                     style="height: 150px; width: 150px">
                            </div>
                            <div class="fieldcontain">
                                <label for="imgFileEdit">Edit illustration</label>
                                <input type="file" name="myFile" id="imgFileEdit">
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="Update" />
                        </fieldset>
                    </form>
        </div>
    </body>
</html>
