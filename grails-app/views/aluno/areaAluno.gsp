<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Aluno</title>

    <g:javascript plugin="jquery" library="jquery" />
</head>

<body>
    <div class="nav" role="navigation">
        <ul>
            <li><g:link action="areaAluno" params="[tipo:0]"><asset:image src="/skin/treino_20.png" alt="Treino"/> Treinos</g:link></li>
            <li><g:link action="areaAluno" params="[tipo:1]" ><asset:image src="/skin/heart_20.png" alt="Treino"/> Avaliações Físicas</g:link></li>
        </ul>
    </div>

    <g:if test="${treinos != null}">
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
                            <g:link action="edit" resource="${treino}"><asset:image src="/skin/editar_20.png" alt="Editar"/></g:link>
                            ${fieldValue(bean:treino, field: "descricao")}

                            <g:link action="inativar" Id="${treino.id}"><asset:image src="/skin/inativar_20.png" alt="Remover"/></g:link>
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
    </g:if>
    <g:elseif test="${avaliacoesFisicas != null}">
        <g:if test="${avaliacoesFisicas.size() > 0}" >
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="nome" title="${message(code: 'avaliacoesFisicas.data.label', default: 'Descricao')}" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${avaliacoesFisicas}" status="i" var="avaliacaoFisica">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>
                            <g:link action="edit" resource="${avaliacaoFisica}"><asset:image src="/skin/editar_20.png" alt="Editar"/></g:link>
                            ${fieldValue(bean:avaliacaoFisica, field: "data")}

                            <g:link action="inativar" Id="${avaliacaoFisica.id}"><asset:image src="/skin/inativar_20.png" alt="Remover"/></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>
        <g:else>
            <br />
            <h3>&nbsp&nbsp Nenhuma Avaliação Física encontrada!</h3>
        </g:else>
    </g:elseif>
    <g:else>
        <br />
        <h3>&nbsp&nbsp Nenhum Dado encontrado!</h3>
    </g:else>
    <fieldset class="buttons">
        <g:link class="edit" action="edit" >Perfil</g:link>
        <g:link controller="perfil" action="logoff" >Logoff</g:link>
    </fieldset>
</body>
</html>