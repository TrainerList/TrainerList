
<%@ page import="Sistema.SerieExercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serieExercicio.label', default: 'SerieExercicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serieExercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serieExercicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serieExercicio">
			
				<g:if test="${serieExercicioInstance?.ateFalha}">
				<li class="fieldcontain">
					<span id="ateFalha-label" class="property-label"><g:message code="serieExercicio.ateFalha.label" default="Ate Falha" /></span>
					
						<span class="property-value" aria-labelledby="ateFalha-label"><g:formatBoolean boolean="${serieExercicioInstance?.ateFalha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.exercicio}">
				<li class="fieldcontain">
					<span id="exercicio-label" class="property-label"><g:message code="serieExercicio.exercicio.label" default="Exercicio" /></span>
					
						<span class="property-value" aria-labelledby="exercicio-label"><g:link controller="exercicio" action="show" id="${serieExercicioInstance?.exercicio?.id}">${serieExercicioInstance?.exercicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.minutos}">
				<li class="fieldcontain">
					<span id="minutos-label" class="property-label"><g:message code="serieExercicio.minutos.label" default="Minutos" /></span>
					
						<span class="property-value" aria-labelledby="minutos-label"><g:fieldValue bean="${serieExercicioInstance}" field="minutos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.quantidadeRepeticao}">
				<li class="fieldcontain">
					<span id="quantidadeRepeticao-label" class="property-label"><g:message code="serieExercicio.quantidadeRepeticao.label" default="Quantidade Repeticao" /></span>
					
						<span class="property-value" aria-labelledby="quantidadeRepeticao-label"><g:fieldValue bean="${serieExercicioInstance}" field="quantidadeRepeticao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.repeticao}">
				<li class="fieldcontain">
					<span id="repeticao-label" class="property-label"><g:message code="serieExercicio.repeticao.label" default="Repeticao" /></span>
					
						<span class="property-value" aria-labelledby="repeticao-label"><g:fieldValue bean="${serieExercicioInstance}" field="repeticao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="serieExercicio.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${serieExercicioInstance?.status}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieExercicioInstance?.tempoIntervalo}">
				<li class="fieldcontain">
					<span id="tempoIntervalo-label" class="property-label"><g:message code="serieExercicio.tempoIntervalo.label" default="Tempo Intervalo" /></span>
					
						<span class="property-value" aria-labelledby="tempoIntervalo-label"><g:fieldValue bean="${serieExercicioInstance}" field="tempoIntervalo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serieExercicioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serieExercicioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
