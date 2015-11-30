<%@ page import="Sistema.Aluno" %>

<g:if test="${treinos != null}">
    <g:if test="${treinos?.size() > 0}" >
            <g:each in="${treinos}" status="i" var="treino">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>
                        <g:link action="edit" resource="${treino}"><asset:image src="/skin/editar_20.png" alt="Editar"/></g:link>
                        ${fieldValue(bean:treino, field: "descricao")}

                        <g:link action="inativar" Id="${treino.id}"><asset:image src="/skin/inativar_20.png" alt="Remover"/></g:link>
                    </td>
                </tr>
            </g:each>
    </g:if>
    <g:else>
        <br />
        <h3>&nbsp&nbsp Nenhum treino encontrado!</h3>
    </g:else>
</g:if>