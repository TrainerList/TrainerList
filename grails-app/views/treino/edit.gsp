<%@ page import="Sistema.Treino" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'treino.label', default: 'Treino')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>

		<g:javascript library="jquery" plugin="jquery" />

		<script>
			function verificaSerie() {
				if (${treinoInstance.seriesExercicios.size()} = 0 ) {
					alert('Nenhuma Série Informada')
				}
			}
		</script>
	</head>
	<body>
		<a href="#edit-treino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-treino" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${treinoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${treinoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:treinoInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${treinoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update"  onclick="verificaSerie" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
