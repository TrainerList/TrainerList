
<%@ page import="Sistema.ImagemExercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagemExercicio.label', default: 'ImagemExercicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagemExercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagemExercicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagemExercicio">
			
				<g:if test="${imagemExercicioInstance?.exercicio}">
				<li class="fieldcontain">
					<span id="exercicio-label" class="property-label"><g:message code="imagemExercicio.exercicio.label" default="Exercicio" /></span>
					
						<span class="property-value" aria-labelledby="exercicio-label"><g:link controller="exercicio" action="show" id="${imagemExercicioInstance?.exercicio?.id}">${imagemExercicioInstance?.exercicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemExercicioInstance?.imagem}">
				<li class="fieldcontain">
					<span id="imagem-label" class="property-label"><g:message code="imagemExercicio.imagem.label" default="Imagem" /></span>
					
						<span class="property-value" aria-labelledby="imagem-label"><g:fieldValue bean="${imagemExercicioInstance}" field="imagem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagemExercicioInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="imagemExercicio.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${imagemExercicioInstance?.status}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:imagemExercicioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${imagemExercicioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
