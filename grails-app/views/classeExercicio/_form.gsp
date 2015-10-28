<%@ page import="Sistema.ClasseExercicio" %>



<div class="fieldcontain ${hasErrors(bean: classeExercicioInstance, field: 'classe', 'error')} required">
	<label for="classe">
		<g:message code="classeExercicio.classe.label" default="Classe" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="classe" required="" value="${classeExercicioInstance?.classe}"/>

</div>

