<%@ page import="Sistema.Aluno" %>

<g:if test="${avaliacoesFisicas != null}">
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
</g:if>