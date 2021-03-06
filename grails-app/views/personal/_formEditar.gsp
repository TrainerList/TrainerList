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



