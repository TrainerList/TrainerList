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
        <label>
            Foi enviado um e-mail para: ${emailConfirmacao} para Confirmação de Cadastro.
        </label>
        <br />
        <br />

        <a href="${linkAtivacao}">${linkAtivacao}</a>
    </div>
</body>
</html>