<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 29/11/2015
  Time: 21:51
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Treinos</title>

    <g:javascript plugin="jquery" library="jquery" />
</head>

<body>

    <div class="nav" role="navigation">
        <ul>
            <li><g:link action="areaAluno" params="[tipo:'T']"><asset:image src="/skin/treino_20.png" alt="Treino"/> Treinos</g:link></li>
            <li><g:link action="areaAluno" params="[tipo:'AF']" ><asset:image src="/skin/heart_20.png" alt="Treino"/> Avaliações Físicas</g:link></li>
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

                        &nbsp<g:link action="show" resource="${treino}" ><asset:image src="/skin/visualizar_20.png" alt="Vizualizar"/></g:link>

                        <g:if test="${TipoUser} == 'P'">
                            &nbsp<g:link action="edit" resource="${treino}" ><asset:image src="/skin/editar_20.png" alt="Remover"/></g:link>

                            &nbsp<g:link action="inativar" id="${treino.id}" onclick="return confirm('Remover este Treino?');" ><asset:image src="/skin/inativar_20.png" alt="Remover"/></g:link>
                        </g:if>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <br />
        <h3>&nbsp&nbspNenhum treino encontrado!</h3>
    </g:else>

    <fieldset class="buttons">
        <g:link class="edit" action="edit" >Perfil</g:link>
        <g:link controller="perfil" action="logoff" >Logoff</g:link>
    </fieldset>
</body>
</html>