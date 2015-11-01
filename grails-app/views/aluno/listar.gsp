<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 27/10/2015
  Time: 13:25
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <title>Alunos</title>
</head>
    <div class="nav" role="navigation">
        <ul>
            <li> <a class="create" href="${createLink(controller: 'aluno', action: 'create')}">Adicionar Alunos</a></li>
        </ul>
    </div>
<body>
    <g:form url="[action: 'pesquisar']">
        <fieldset class="buttons">
            Aluno <input type="text" name="nome" placeholder="Nome do Aluno" ></li>

        <g:submitButton name="create" class="save" value="Pesq"/>
        </fieldset>
    </g:form>

    <g:if test="${alunos.size() > 0}" >

        <table>
            <thead>
                <tr>
                <g:sortableColumn property="nome" title="${message(code: 'alunos.nome.label', default: 'Nome')}" />
                </tr>
            </thead>
            <tbody>
                <g:each in="${alunos}" status="i" var="aluno">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>
                            <g:link action="show" resource="${aluno}">
                                <image src="../assets/skin/database_table.png">
                            </g:link>
                            ${fieldValue(bean:aluno, field: "nome")}
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${alunosCount ?: 0}" />
        </div>
    </g:if>
    <g:else>
        <br />
        Nenhum aluno encontrado!
    </g:else>
</body>
</html>