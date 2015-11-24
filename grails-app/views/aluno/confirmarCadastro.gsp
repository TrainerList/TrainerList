<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 10/11/2015
  Time: 21:32
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Confirmação de Cadastro</title>
</head>

<body>
    <div class="container">
        <label id="lblFinalizado">
        <h3>&nbsp&nbspFoi enviado um e-mail para: ${emailConfirmacao} para finalização do Cadastro.</h3>
        </label>
        <br />
        <g:link controller="aluno" action="adicionarAlunoLista" id="${alunoid}" >Lista</g:link>
        <br />

        <a href="${linkAtivacao}">Link Ativação</a>
    </div>
</body>
</html>