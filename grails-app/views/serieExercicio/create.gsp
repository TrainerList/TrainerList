<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serieExercicio.label', default: 'SerieExercicio')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

		<script>
			function changeExercicio(cardio) {

				if (cardio){
					$('#divMinutos :input').attr('enabled', true)

					$('#divAteFalha :input').attr('enabled', false)
					$('#divSerie :input').attr('enabled', false)
					$('#divRepeticao :input').attr('enabled', false)
					$('#divIntervalo :input').attr('enabled', false)
				} else {
					$('#divMinutos :input').attr('enabled', false)

					$('#divAteFalha :input').attr('enabled', true)
					$('#divSerie :input').attr('enabled', true)
					$('#divRepeticao :input').attr('enabled', true)
					$('#divIntervalo :input').attr('enabled', true)
				}
			}

			function ateFalhaChange(ateFalha) {

				if (ateFalha.value){
					$('#divMinutos :input').attr('enabled', true)

					$('#divAteFalha :input').attr('enabled', false)
					$('#divSerie :input').attr('enabled', false)
					$('#divRepeticao :input').attr('enabled', false)
					$('#divIntervalo :input').attr('enabled', false)
				} else {
					$('#divMinutos :input').attr('enabled', false)

					$('#divAteFalha :input').attr('enabled', true)
					$('#divSerie :input').attr('enabled', true)
					$('#divRepeticao :input').attr('enabled', true)
					$('#divIntervalo :input').attr('enabled', true)
				}


			}

		</script>

	</head>
	<body>
		<a href="#create-serieExercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-serieExercicio" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serieExercicioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serieExercicioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:serieExercicioInstance, action:'save']" >
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
