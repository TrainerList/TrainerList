<%@ page import="Sistema.Aluno" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-aluno" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list aluno">

        <g:if test="${alunoInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="aluno.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${alunoInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.avalicoesFisicas}">
            <li class="fieldcontain">
                <span id="avalicoesFisicas-label" class="property-label"><g:message code="aluno.avalicoesFisicas.label"
                                                                                    default="Avalicoes Fisicas"/></span>

                <g:each in="${alunoInstance.avalicoesFisicas}" var="a">
                    <span class="property-value" aria-labelledby="avalicoesFisicas-label"><g:link
                            controller="avaliacaoFisica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.dataCadastro}">
            <li class="fieldcontain">
                <span id="dataCadastro-label" class="property-label"><g:message code="aluno.dataCadastro.label"
                                                                                default="Data Cadastro"/></span>

                <span class="property-value" aria-labelledby="dataCadastro-label"><g:formatDate
                        date="${alunoInstance?.dataCadastro}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.dataNascimento}">
            <li class="fieldcontain">
                <span id="dataNascimento-label" class="property-label"><g:message code="aluno.dataNascimento.label"
                                                                                  default="Data Nascimento"/></span>

                <span class="property-value" aria-labelledby="dataNascimento-label"><g:formatDate
                        date="${alunoInstance?.dataNascimento}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.diabetico}">
            <li class="fieldcontain">
                <span id="diabetico-label" class="property-label"><g:message code="aluno.diabetico.label"
                                                                             default="Diabetico"/></span>

                <span class="property-value" aria-labelledby="diabetico-label"><g:formatBoolean
                        boolean="${alunoInstance?.diabetico}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.fumante}">
            <li class="fieldcontain">
                <span id="fumante-label" class="property-label"><g:message code="aluno.fumante.label"
                                                                           default="Fumante"/></span>

                <span class="property-value" aria-labelledby="fumante-label"><g:formatBoolean
                        boolean="${alunoInstance?.fumante}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.hipertenso}">
            <li class="fieldcontain">
                <span id="hipertenso-label" class="property-label"><g:message code="aluno.hipertenso.label"
                                                                              default="Hipertenso"/></span>

                <span class="property-value" aria-labelledby="hipertenso-label"><g:formatBoolean
                        boolean="${alunoInstance?.hipertenso}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="aluno.nome.label" default="Nome"/></span>

                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${alunoInstance}"
                                                                                        field="nome"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.observacao}">
            <li class="fieldcontain">
                <span id="observacao-label" class="property-label"><g:message code="aluno.observacao.label"
                                                                              default="Observacao"/></span>

                <span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${alunoInstance}"
                                                                                              field="observacao"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.praticaAtividadeFisica}">
            <li class="fieldcontain">
                <span id="praticaAtividadeFisica-label" class="property-label"><g:message
                        code="aluno.praticaAtividadeFisica.label" default="Pratica Atividade Fisica"/></span>

                <span class="property-value" aria-labelledby="praticaAtividadeFisica-label"><g:formatBoolean
                        boolean="${alunoInstance?.praticaAtividadeFisica}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.senha}">
            <li class="fieldcontain">
                <span id="senha-label" class="property-label"><g:message code="aluno.senha.label"
                                                                         default="Senha"/></span>

                <span class="property-value" aria-labelledby="senha-label"><g:fieldValue bean="${alunoInstance}"
                                                                                         field="senha"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="aluno.status.label"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:formatBoolean
                        boolean="${alunoInstance?.status}"/></span>

            </li>
        </g:if>

        <g:if test="${alunoInstance?.treinos}">
            <li class="fieldcontain">
                <span id="treinos-label" class="property-label"><g:message code="aluno.treinos.label"
                                                                           default="Treinos"/></span>

                <g:each in="${alunoInstance.treinos}" var="t">
                    <span class="property-value" aria-labelledby="treinos-label"><g:link controller="treino"
                                                                                         action="show"
                                                                                         id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: alunoInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${alunoInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
