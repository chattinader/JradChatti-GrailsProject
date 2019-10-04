<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>
<body>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Available Controllers</h1>

        <div class="row" id="controllers" role="navigation">
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <div class="col-md-auto" style="margin: 25px;">
                        <label style="font-size: 32px"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link></label>
                    </div>
                </g:each>
        </div>
    </section>
</div>

</body>
</html>
