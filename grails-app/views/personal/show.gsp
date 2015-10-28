<%@ page import="Sistema.Personal" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}"/>
    <title>Personal</title>
</head>

<body>
<a href="#show-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li> <a class="home" href="${createLink(uri: '/')}">Alunos</a></li>
        <li> <a class="home" href="${createLink(uri: './personal/areaPersonal.gsp')}">Alunos</a></li>
    </ul>
</div>

<div id="show-personal" class="content scaffold-show" role="main">
    <h1>${personalInstance.nome}</h1>

    <ol class="property-list personal">

        <g:if test="${personalInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="personal.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personalInstance}"
                                                                                         field="email"/></span>
            </li>
        </g:if>

        <g:if test="${personalInstance?.email}">
            <li class="fieldcontain">
                <span id="dataNascimento-label" class="property-label"><g:message code="personal.dataNascimento.label"
                                                                         default="dataNascimento"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personalInstance}"
                                                                                         field="dataNascimento"/></span>
            </li>
        </g:if>

    </ol>
    <g:form url="[resource: personalInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${personalInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
