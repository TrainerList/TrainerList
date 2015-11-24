<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 10/11/2015
  Time: 21:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Cadastro Finalizado</title>
</head>

<body>
    <div class="container">
        <label id="lblFinalizado">
            &nbspCadastro finalizado com sucesso. <br/><br/>
            &nbspFaça o <a href="/TrainerList/" >login</a>.
        </label>
        <br />
        <br />

        <g:link controller="aluno" action="adicionarAlunoLista" id="${alunoid}" >Lista</g:link>
        <br />
    </div>
</body>
</html>