<%@ page import="Sistema.Exercicio" %>



<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'classesExercicio', 'error')} ">
	<label for="classesExercicio">
		<g:message code="exercicio.classesExercicio.label" default="Classes Exercicio" />
		
	</label>
	<g:select name="classesExercicio" from="${Sistema.ClasseExercicio.list()}" multiple="multiple" optionKey="id" size="5" value="${exercicioInstance?.classesExercicio*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="exercicio.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${exercicioInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'imagensExercicio', 'error')} ">
	<label for="imagensExercicio">
		<g:message code="exercicio.imagensExercicio.label" default="Imagens Exercicio" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${exercicioInstance?.imagensExercicio?}" var="i">
    <li><g:link controller="imagemExercicio" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="imagemExercicio" action="create" params="['exercicio.id': exercicioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imagemExercicio.label', default: 'ImagemExercicio')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="exercicio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${exercicioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="exercicio.status.label" default="Status" />
		
	</label>
	<g:checkBox name="status" value="${exercicioInstance?.status}" />

</div>

<div class="fieldcontain ${hasErrors(bean: exercicioInstance, field: 'video', 'error')} required">
	<label for="video">
		<g:message code="exercicio.video.label" default="Video" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="video" required="" value="${exercicioInstance?.video}"/>

</div>

