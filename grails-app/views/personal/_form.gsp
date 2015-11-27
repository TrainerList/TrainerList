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
    <g:textField name="email" required="" value="${personalInstance?.email}" onchange="onExitEmail()"/>
    <span id="emailCadastrado" class="invisivel"  >email já cadastrado</span>

</div>

<div  class="fieldcontain ${hasErrors(bean: personalInstance, field: 'senha', 'error')} required">
    <label for="senha">
        <g:message code="personal.senha.label" default="Senha"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="senha" required="" value="${personalInstance?.senha}" maxlength="20" />

</div>

<div  class="fieldcontain ${hasErrors(bean: personalInstance, field: 'senha', 'error')} required">
    <label for="senha">
        <g:message code="personal.senha.label" default="Confirmar Senha"/>
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="senhaConfirmar" required="" value="" maxlength="20" />
</div>



