<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Personal</title>

    <g:javascript plugin="jquery" library="jquery" />
</head>

<body>
    <div id="list-alunos" class="content scaffold-list" role="main">
        <h1>Alunos</h1>

        <div class="nav" role="navigation">
            <ul>
                <li> <a class="create" href="${createLink(uri: '/aluno/lista')}">Add Aluno</a></li>
            </ul>
        </div>

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
                            <g:link class="" action="edit" resource="${aluno}">E</g:link>

                            ${fieldValue(bean: aluno, field: "nome")}
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
            Não há alunos Cadastrados.
        </g:else>
    </div>
</body>
</html>