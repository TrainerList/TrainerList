<%@ page import="Sistema.ExercicioService; Sistema.SerieExercicio" %>


<div class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'exercicio', 'error')} required">
	<label for="exercicio">
		<g:message code="serieExercicio.exercicio.label" default="Exercicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exercicio" name="exercicio.id" from="${Sistema.Exercicio.list()}" optionKey="id" required="" value="${serieExercicioInstance?.exercicio?.id}" class="many-to-one"
			  onchange="chabgeExercicio(value)" />
</div>


<div id="divAteFalha" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'ateFalha', 'error')} ">
	<label for="ateFalha">
		<g:message code="serieExercicio.ateFalha.label" default="Ate Falha" />
		
	</label>
	<g:checkBox name="ateFalha" value="${serieExercicioInstance?.ateFalha}" />

</div>


<div id="divMinutos" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'minutos', 'error')} required">
	<label for="minutos">
		<g:message code="serieExercicio.minutos.label" default="Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minutos" type="number" value="${serieExercicioInstance.minutos}" required=""/>

</div>


<div id="divRepeticao" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'repeticao', 'error')} required">
	<label for="repeticao">
		<g:message code="serieExercicio.repeticao.label" default="Série" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="repeticao" type="number" value="${serieExercicioInstance.repeticao}" required=""/>

</div>


<div id="divSerie" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'quantidadeRepeticao', 'error')} required">
	<label for="quantidadeRepeticao">
		<g:message code="serieExercicio.quantidadeRepeticao.label" default="Repetições" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidadeRepeticao" type="number" value="${serieExercicioInstance.quantidadeRepeticao}" required=""/>

</div>


<div div="divIntervalo" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'tempoIntervalo', 'error')} required">
	<label for="tempoIntervalo">
		<g:message code="serieExercicio.tempoIntervalo.label" default="Tempo Intervalo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tempoIntervalo" type="number" value="${serieExercicioInstance.tempoIntervalo}" required=""/>

</div>

