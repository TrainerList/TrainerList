<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Aluno</title>

    <g:javascript plugin="jquery" library="jquery" />
</head>

<body>
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
                        <g:link action="edit" resource="${treino}">Ed.</g:link>
                        ${fieldValue(bean:treino, field: "descricao")}

                        <g:link action="inativar" Id="${treino.id}">Rem.</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <br />
        <h3>&nbsp&nbsp Nenhum treino encontrado!</h3>
    </g:else>
</body>
</html>