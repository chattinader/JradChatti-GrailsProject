<%@ page import="tp1.Illustration; tp1.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
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
    <form action="/user/save" method="post" enctype="multipart/form-data">
        <fieldset class="form">
            <div class='fieldcontain required'>
                <label for='userName'>
                    User Name<span class='required-indicator'>*</span>
                </label>
                <input type="text" name="userName" value="" required="" maxlength="20" id="userName"/>
            </div>

            <div class='fieldcontain required'>
                <label for='password'>
                    Password<span class='required-indicator'>*</span>
                </label>
                <input type="password" name="password" required="" maxlength="30" value="" id="password"/>
            </div>

            <div class='fieldcontain'>
                <label for='thumbnail'>
                    Thumbnail
                </label>
                <input type="file" name="myFile" id="thumbnail">
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </form>
</div>
</body>
</html>
