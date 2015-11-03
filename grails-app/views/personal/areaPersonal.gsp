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
                <li> <g:link class="create" url="[controller:'aluno', action:'listar', params:'nome:null' ]" > Add Aluno </g:link> </li>
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
                            ${fieldValue(bean: aluno, field: "nome")}

                            <g:link controller="treino" action="listarTreino" id="${aluno.id}" >T.</g:link>
                            <!-- controller="AvaliacaoFisica" -->
                            <g:link  action="edit" id="${aluno.id}">A.F.</g:link>
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