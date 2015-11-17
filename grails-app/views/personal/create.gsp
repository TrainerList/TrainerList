<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>

    <script>
        function valida(form) {
            if (form.senha.value=="" || form.senha.value.length < 8) {
                alert("Senhra requer entre 8 e 20 caracteres");
                form.senha.focus();
                return false;
            } else if (form.senha.value != form.senhaConfirmar.value) {
                alert("Senhas divergentes");
                form.senha.focus();
                return false;
            }
        }
    </script>
</head>

<body>
<a href="#create-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div id="create-personal" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personalInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${personalInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: personalInstance, action: 'save']" onsubmit="return valida(this);">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Salvar"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
