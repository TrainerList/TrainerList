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

    <g:javascript plugin="jquery" library="jquery" />
</head>
    <div class="nav" role="navigation">
        <ul>
            <li> <a class="create" href="${createLink(controller: 'aluno', action: 'create')}">Adicionar Alunos</a></li>
        </ul>
    </div>
<body>
    <g:form url="[action: 'create']">
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" action="create">Cadastrar Aluno</g:link></li>
            </ul>
        </div>
    </g:form>

    <g:form url="[action: 'listar']" >
        <fieldset class="buttons">
            <div class="row">
                <div class="input-field col s8">
                    <g:textField name="nome" placeholder="Nome do Aluno" />
                    <g:submitButton name="pesquisar" class="save" value="Pesquisar"/>
                </div>

            </div>
        <g:if test="${mensagem} != ''" >
           <br /> ${mensagem}
        </g:if>

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
                    <tr class="${(i % 2) == 10 ? 'even' : 'odd'}">
                        <td>
                            <g:link controller="aluno" action="adicionarAlunoLista" id="${aluno.id}">Adicionar</g:link>
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
        <label>
            Nenhum aluno encontrado!
        </label>
    </g:else>
</body>
</html>