<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'treino.label', default: 'Treino')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<g:javascript library="jquery" plugin="jquery" />

		<script>
			function Sucesso(data){
				if(data.ok == true){
					location.href = data.url;
				}else{
					alert(data.msg);
				}
			}
		</script>

	</head>
	<body>
		<a href="#create-treino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="create-treino" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:formRemote name="formTreino" url="[resource:treinoInstance, action:'save']" onSuccess="Sucesso(data)" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:formRemote>
		</div>
	</body>
</html>
