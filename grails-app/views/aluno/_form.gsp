<%@ page import="Sistema.Aluno" %>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'nome', 'error')} required">
    <label for="nome">
        <g:message code="aluno.nome.label" default="Nome"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nome" required="" value="${alunoInstance?.nome}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'dataNascimento', 'error')} required">
    <label for="dataNascimento">
        <g:message code="aluno.dataNascimento.label" default="Data Nascimento"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataNascimento" precision="day" value="${alunoInstance?.dataNascimento}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="aluno.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${alunoInstance?.email}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'senha', 'error')} required">
    <label for="senha">
        <g:message code="aluno.senha.label" default="Senha"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="senha" required="" value="${alunoInstance?.senha}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'diabetico', 'error')} ">
    <label for="diabetico">
        <g:message code="aluno.diabetico.label" default="Diabetico"/>

    </label>
    <g:checkBox name="diabetico" value="${alunoInstance?.diabetico}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'fumante', 'error')} ">
    <label for="fumante">
        <g:message code="aluno.fumante.label" default="Fumante"/>

    </label>
    <g:checkBox name="fumante" value="${alunoInstance?.fumante}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'hipertenso', 'error')} ">
    <label for="hipertenso">
        <g:message code="aluno.hipertenso.label" default="Hipertenso"/>

    </label>
    <g:checkBox name="hipertenso" value="${alunoInstance?.hipertenso}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'praticaAtividadeFisica', 'error')} ">
    <label for="praticaAtividadeFisica">
        <g:message code="aluno.praticaAtividadeFisica.label" default="Pratica Atividade Fisica"/>

    </label>
    <g:checkBox name="praticaAtividadeFisica" value="${alunoInstance?.praticaAtividadeFisica}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'observacao', 'error')} required">
    <label for="observacao">
        <g:message code="aluno.observacao.label" default="Observacao"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="observacao" required="" value="${alunoInstance?.observacao}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'treinos', 'error')} ">
    <label for="treinos">
        <g:message code="aluno.treinos.label" default="Treinos"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${alunoInstance?.treinos ?}" var="t">
            <li><g:link controller="treino" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="treino" action="create"
                    params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'treino.label', default: 'Treino')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'avalicoesFisicas', 'error')} ">
    <label for="avalicoesFisicas">
        <g:message code="aluno.avalicoesFisicas.label" default="Avalicoes Fisicas"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${alunoInstance?.avalicoesFisicas ?}" var="a">
            <li><g:link controller="avaliacaoFisica" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="avaliacaoFisica" action="create"
                    params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'avaliacaoFisica.label', default: 'AvaliacaoFisica')])}</g:link>
        </li>
    </ul>

</div>
