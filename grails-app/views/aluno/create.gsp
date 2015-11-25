<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>

    <script>
        function valida(form) {
            if (form.senha.value=="" || form.senha.value.length < 8) {
                alert("Senhra requer entre 8 e 20 caracteres");
                form.senha.focus();
                return false;
            }
        }

        function onExitEmail() {
            $.post("/TrainerList/perfil/getEmail",{
                id: $("#email").val()
            },function(data,status){
                if (data.mensagem == "ERRO"){
                    $('#emailCadastrado').removeClass("invisivel")
                    $('#emailCadastrado').addClass("obrigatorio")
                    $('#email').val = ""
                    $('#email').focus()
                }else{
                    $('#emailCadastrado').removeClass("obrigatorio")
                    $('#emailCadastrado').addClass("invisivel")
                }
            })
        }
    </script>

    <style type="text/css" media="screen">
    span.invisivel {
        display: none;
        font-size: 10px;
    }
    span.obrigatorio {
        display: inline;
        color: #BC2F2F;
        font-size: 10px;
    }

    </style>
</head>

<body>
<a href="#create-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div id="create-aluno" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${alunoInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${alunoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: alunoInstance, action: 'save']" onsubmit="return valida(this);">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
