<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-annonce" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <a href="#show-annonce" class="skip" tabindex="-1">Skip to content&hellip;</a>

    <div id="show-annonce" class="content scaffold-show" role="main">

        <ol class="property-list annonce">

            <li class="fieldcontain">
                <span id="title-label" class="property-label">Title</span>

                <div class="property-value" aria-labelledby="title-label">${annonce.title}</div>
            </li>

            <li class="fieldcontain">
                <span id="description-label" class="property-label">${annonce.description}</span>

                <div class="property-value" aria-labelledby="description-label">${annonce.description}</div>
            </li>

            <li class="fieldcontain">
                <span id="valideTill-label" class="property-label">${annonce.valideTill}</span>

                <div class="property-value" aria-labelledby="valideTill-label">${annonce.valideTill}</div>
            </li>

            <li class="fieldcontain">
                <span id="illustration-label" class="property-label">Illustration</span>

                <div class="property-value" aria-labelledby="illustration-label">
                    <ul>
                        <g:each in="${annonce.illustration}" var="illustration">
                            <g:link controller="annonce" action="show" id="${illustration.id}">
                                <img src="http://localhost:8081/assets/${illustration.fileName}"
                                     style="height: 50px; width: 50px;"/>
                            </g:link>
                        </g:each>
                    </ul>
                </div>
            </li>

            <li class="fieldcontain">
                <span id="state-label" class="property-label">State</span>

                <div class="property-value" aria-labelledby="state-label">${annonce.state}</div>
            </li>

            <li class="fieldcontain">
                <span id="author-label" class="property-label">Author</span>

                <div class="property-value" aria-labelledby="author-label"><a href="/user/show/1">${annonce.author}</a></div>
            </li>
        </ol>
        <g:form resource="${this.annonce}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.annonce}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</body>
</html>
