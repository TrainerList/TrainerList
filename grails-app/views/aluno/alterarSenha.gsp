<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 22/11/2015
  Time: 14:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Alterar Senha</title>

    <script>
        function valida(form) {
            if (form.senha.value=="" || form.senha.value.length < 8) {
                alert("Senha requer entre 8 e 20 caracteres");
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
    <g:form url="[controller:'aluno', action: 'confirmarCadastro']" onsubmit="return valida(this);">
        <div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'senha', 'error')} ">
            <label for="senha">
                Senha
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="senha" required="" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'senha', 'error')} ">
            <label for="senha">
                Confirmar Senha
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="senhaConfirmar" required="" value=""/>
        </div>


        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Salvar"/>
        </fieldset>
    </g:form>
</body>
</html>