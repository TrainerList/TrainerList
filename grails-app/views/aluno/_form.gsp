<%@ page import="Sistema.Aluno" %>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'nome', 'error')} required">
    <label for="nome">
        Nome
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nome" required="" value="${alunoInstance?.nome}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'dataNascimento', 'error')} required">
    <label for="dataNascimento">
        Data Nascimento
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataNascimento" precision="day" value="${alunoInstance?.dataNascimento}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'email', 'error')} required">
    <label for="email">
        e-mail
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${alunoInstance?.email}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'senha', 'error')} ">
    <label for="senha">
        <g:message code="aluno.senha.label" default="Senha"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="senha" required="" value="${alunoInstance?.senha}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'diabetico', 'error')} ">
    <label for="diabetico">
        Diabético
    </label>
    <g:checkBox name="diabetico" value="${alunoInstance?.diabetico}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'fumante', 'error')} ">
    <label for="fumante">
        Fumante
    </label>
    <g:checkBox name="fumante" value="${alunoInstance?.fumante}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'hipertenso', 'error')} ">
    <label for="hipertenso">
        Hipertenso
    </label>
    <g:checkBox name="hipertenso" value="${alunoInstance?.hipertenso}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'praticaAtividadeFisica', 'error')} ">
    <label for="praticaAtividadeFisica">
        Pratica Atividade Física
    </label>
    <g:checkBox name="praticaAtividadeFisica" value="${alunoInstance?.praticaAtividadeFisica}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'observacao', 'error')}">
    <label for="observacao">
        Observação
    </label>
    <g:textArea name="observacao" value="${alunoInstance?.observacao}"> </g:textArea>

</div>