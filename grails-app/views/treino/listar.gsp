<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <title>Alunos</title>


</head>
<body>
    <div class="nav" role="navigation">
        <ul>
            <li> <a class="create" href="${createLink(controller: 'treino', action: 'create')}">Adicionar Treino</a></li>
        </ul>
    </div>

    <g:if test="${treinos.size() > 0}" >
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="nome" title="${message(code: 'treinos.descricao.label', default: 'Descricao')}" />
            </tr>
            </thead>
            <tbody>
            <g:each in="${treinos}" status="i" var="treino">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>
                        ${fieldValue(bean:treino, field: "descricao")}
                        <g:link action="edit" resource="${treino}" >Ed.</g:link>

                        <g:link action="inativar" id="${treino.id}" onclick="return confirm('Remover este Treino?');" >Rem.</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <br />
        Nenhum treino encontrado!
    </g:else>
</body>
</html>