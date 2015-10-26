<%@ page import="Sistema.Personal" %>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'nome', 'error')} required">
    <label for="nome">
        <g:message code="personal.nome.label" default="Nome"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nome" required="" value="${personalInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'dataNascimento', 'error')} required">
    <label for="dataNascimento">
        <g:message code="personal.dataNascimento.label" default="Data Nascimento"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataNascimento" precision="day" value="${personalInstance?.dataNascimento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="personal.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="email" required="" value="${personalInstance?.email}"/>

</div>

<div  class="fieldcontain ${hasErrors(bean: personalInstance, field: 'senha', 'error')} required">
    <label for="senha">
        <g:message code="personal.senha.label" default="Senha"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="senha" required="" value="${personalInstance?.senha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'dataCadastro', 'error')} required">
    <label for="dataCadastro">
        <g:message code="personal.dataCadastro.label" default="Data Cadastro"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataCadastro" precision="day" value="${personalInstance?.dataCadastro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'status', 'error')} ">
    <label for="status">
        <g:message code="personal.status.label" default="Status"/>

    </label>
    <g:checkBox name="status" value="${personalInstance?.status}"/>
</div>

