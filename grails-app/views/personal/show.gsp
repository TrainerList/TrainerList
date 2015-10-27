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
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-personal" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list personal">

        <g:if test="${personalInstance?.alunos}">
            <li class="fieldcontain">
                <span id="alunos-label" class="property-label"><g:message code="personal.alunos.label"
                                                                          default="Alunos"/></span>

                <g:each in="${personalInstance.alunos}" var="a">
                    <span class="property-value" aria-labelledby="alunos-label"><g:link controller="aluno" action="show"
                                                                                        id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${personalInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="personal.nome.label"
                                                                        default="Nome"/></span>

                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${personalInstance}"
                                                                                        field="nome"/></span>

            </li>
        </g:if>

        <g:if test="${personalInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="personal.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personalInstance}"
                                                                                         field="email"/></span>
            </li>
        </g:if>

    </ol>
    <g:form url="[resource: personalInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${personalInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
