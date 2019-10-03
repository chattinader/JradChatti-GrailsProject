<%@ page import="tp1.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-annonce" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div id="create-annonce" class="content scaffold-create" role="main">

        <form action="/annonce/save" method="post" enctype="multipart/form-data">
            <fieldset class="form">
                <div class='fieldcontain required'>
                    <label for='title'>
                        Title <span class='required-indicator'>*</span>
                    </label>
                    <input type="text" name="title" value="" required="" maxlength="30" id="title"/>
                </div>

                <div class='fieldcontain required'>
                    <label for='description'>
                        Description <span class='required-indicator'>*</span>
                    </label>
                    <input type="text" name="description" value="" required="" id="description"/>
                </div>

                <div class='fieldcontain required'>
                    <label for='valideTill'>
                        Valide Till <span class='required-indicator'>*</span>
                    </label>
                    <g:datePicker name="valideTill" value="${new Date()}"
                                  precision="day" noSelection="['': '-Choose-']"/>

                </div>

                <div class='fieldcontain'>
                    <label for='illustration'>Illustration</label>
                    <input type="file" name="myFile" id="illustration">
                </div>

                <div class='fieldcontain'>
                    <label for='state'>State</label>
                    <input type="checkbox"
                           name="state" id="state"/>
                </div>

                <div class='fieldcontain required'>
                    <label for='author'>Author
                        <span class='required-indicator'>*</span>
                    </label>
                    <g:select id="author"
                              name="author.id"
                              from="${User.list()}"
                              value="${userName?.user*.id}"
                              optionKey="id"/>
                </div>
            </fieldset>
            <fieldset class="buttons">
                <input type="submit" name="create" class="save" value="Create" id="create"/>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
