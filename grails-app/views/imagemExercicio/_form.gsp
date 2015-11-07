<%@ page import="Sistema.ImagemExercicio" %>



<div class="fieldcontain ${hasErrors(bean: imagemExercicioInstance, field: 'exercicio', 'error')} required">
	<label for="exercicio">
		<g:message code="imagemExercicio.exercicio.label" default="Exercicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exercicio" name="exercicio.id" from="${Sistema.Exercicio.list()}" optionKey="id" required="" value="${imagemExercicioInstance?.exercicio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: imagemExercicioInstance, field: 'imagem', 'error')} required">
	<label for="imagem">
		<g:message code="imagemExercicio.imagem.label" default="Imagem" />
		<span class="required-indicator">*</span>
	</label>

	<g:textField name="imagem" required="" value="${imagemExercicioInstance?.imagem}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: imagemExercicioInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="imagemExercicio.status.label" default="Status" />
		
	</label>
	<g:checkBox name="status" value="${imagemExercicioInstance?.status}" />

</div>

