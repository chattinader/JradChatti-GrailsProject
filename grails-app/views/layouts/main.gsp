<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="grails.svg" alt="Grails Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>
    <div class="row collapse navbar-collapse" style="height: 0.8px;">
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <div class="col-sm-auto"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link></div>
        </g:each>
    </div>
</nav>

<g:layoutBody/>

<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="http://docs.grails.org" target="_blank">
            <asset:image src="dev.png" alt="Grails Documentation" class="float-left"/>
        </a>
        <br>
        <p>Developed by</p>
        <strong class="centered">Hamza JRAD & Nader CHATTI</strong>
    </div>
    <div class="col">
        <a href="http://docs.grails.org" target="_blank">
            <asset:image src="github.png" alt="Grails Documentation" class="float-left"/>
        </a>
        <br>
        <p>project available on GitHub via the link below</p>
        <a href="https://github.com/chattinader/JradChatti-GrailsProject" target="_blank">https://github.com/chattinader/JradChatti-GrailsProject</a>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
