<%@ page import="tp1.Illustration" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-user" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.user}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}"/>
        <fieldset class="form">
            <form action="/user/update/${user.id}" method="post">
                <input type="hidden" name="_method" value="PUT"
                       id="_method"/>
                <input type="hidden" name="version" value="1" id="version"/>
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='userName'>
                            User Name<span class='required-indicator'>*</span>
                        </label><input type="text" name="userName" value="${user.userName}" required="" maxlength="20"
                                       id="userName"/>
                    </div>

                    <div class='fieldcontain required'>
                        <label for='password'>
                            Password<span class='required-indicator'>*</span>
                        </label>
                        <input type="password" name="password" required="" maxlength="30" id="password"/>
                    </div>

                    <div class='fieldcontain required'>
                        <label for='thumbnail'>
                            Thumbnail<span class='required-indicator'>*</span>
                        </label>
                        <g:select id="thumbnail"
                                  name="thumbnail.id"
                                  from="${Illustration.list()}"
                                  value="${fileName?.thumbnail*.id}"
                                  optionKey="id"/>

                    </div>

                    <div class='fieldcontain'>
                        <label for='annonce'>Annonce</label>
                        <g:each in="${user.annonce}" var="annonce" id="annonce">
                            <g:link controller="annonce" action="show" id="${annonce.id}">| ${annonce.title} |</g:link>
                        </g:each>
                    </div>
                    <div class="fieldcontain">
                        <a href="/annonce/create?user.id=${user.id}">Add Annonce</a>
                    </div>
                </fieldset>
            </form>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
