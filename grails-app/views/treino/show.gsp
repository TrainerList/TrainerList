
<%@ page import="Sistema.Treino" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'treino.label', default: 'Treino')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-treino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-treino" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list treino">
			
				<g:if test="${treinoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="treino.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${treinoInstance?.status}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="treino.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${treinoInstance?.aluno?.id}">${treinoInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.dataInicio}">
				<li class="fieldcontain">
					<span id="dataInicio-label" class="property-label"><g:message code="treino.dataInicio.label" default="Data Inicio" /></span>
					
						<span class="property-value" aria-labelledby="dataInicio-label"><g:formatDate date="${treinoInstance?.dataInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.dataTermino}">
				<li class="fieldcontain">
					<span id="dataTermino-label" class="property-label"><g:message code="treino.dataTermino.label" default="Data Termino" /></span>
					
						<span class="property-value" aria-labelledby="dataTermino-label"><g:formatDate date="${treinoInstance?.dataTermino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="treino.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${treinoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.seriesExercicios}">
				<li class="fieldcontain">
					<span id="seriesExercicios-label" class="property-label"><g:message code="treino.seriesExercicios.label" default="Series Exercicios" /></span>
					
						<g:each in="${treinoInstance.seriesExercicios}" var="s">
						<span class="property-value" aria-labelledby="seriesExercicios-label"><g:link controller="serieExercicio" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:treinoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${treinoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
