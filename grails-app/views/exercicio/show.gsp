
<%@ page import="Sistema.Exercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exercicio.label', default: 'Exercicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exercicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exercicio">
			
				<g:if test="${exercicioInstance?.classesExercicio}">
				<li class="fieldcontain">
					<span id="classesExercicio-label" class="property-label"><g:message code="exercicio.classesExercicio.label" default="Classes Exercicio" /></span>
					
						<g:each in="${exercicioInstance.classesExercicio}" var="c">
						<span class="property-value" aria-labelledby="classesExercicio-label"><g:link controller="classeExercicio" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${exercicioInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="exercicio.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${exercicioInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exercicioInstance?.imagensExercicio}">
				<li class="fieldcontain">
					<span id="imagensExercicio-label" class="property-label"><g:message code="exercicio.imagensExercicio.label" default="Imagens Exercicio" /></span>
					
						<g:each in="${exercicioInstance.imagensExercicio}" var="i">
						<span class="property-value" aria-labelledby="imagensExercicio-label"><g:link controller="imagemExercicio" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${exercicioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="exercicio.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${exercicioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exercicioInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="exercicio.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${exercicioInstance?.status}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${exercicioInstance?.video}">
				<li class="fieldcontain">
					<span id="video-label" class="property-label"><g:message code="exercicio.video.label" default="Video" /></span>
					
						<span class="property-value" aria-labelledby="video-label"><g:fieldValue bean="${exercicioInstance}" field="video"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:exercicioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${exercicioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
