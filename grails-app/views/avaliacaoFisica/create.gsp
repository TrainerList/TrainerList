<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'avaliacaoFisica.label', default: 'AvaliacaoFisica')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<script>
			function valida(form) {
				if (form.peso.value=="" || form.senha.value <= 0) {
					alert("Peso inválido!");
					form.peso.focus();
					return false;
				} else if (form.altura.value== "" || form.altura.value <= 0) {
					alert("Altura inválida!");
					form.altura.focus();
					return false;
				}
			}

		</script>

	</head>
	<body>
		<a href="#create-avaliacaoFisica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="create-avaliacaoFisica" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${avaliacaoFisicaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${avaliacaoFisicaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:avaliacaoFisicaInstance, action:'save']" onsubmit="return valida(this);" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
