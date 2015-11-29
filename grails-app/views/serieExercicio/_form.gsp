	<%@ page import="Sistema.ExercicioService; Sistema.SerieExercicio" %>


<div class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'exercicio', 'error')} required">
	<label for="exercicio">
		<g:message code="serieExercicio.exercicio.label" default="Exercicio" />
		<span class="required-indicator">*</span>
	</label>

	<g:if test="${Sistema.Exercicio.list().size() > 0}">
		<g:select id="exercicio" name="exercicio.id" from="${Sistema.Exercicio.findAllByStatus(true)}" noSelection="['':'Selecione...']" optionValue="nome" valueMessagePrefix="cardio" optionKey="id" required=""  value="${serieExercicioInstance?.exercicio?.id}"
			  class="many-to-one" onchange="changeExercicio()" />
	</g:if>
	<g:else>
		Nenhum exercicio encontrado!
	</g:else>
</div>


<div id="divAteFalha" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'ateFalha', 'error')} " style="display:none">
	<label for="ateFalha">
		<g:message code="serieExercicio.ateFalha.label" default="Ate Falha" />
		
	</label>
	<g:checkBox id="ateFalha" name="ateFalha" value="${serieExercicioInstance?.ateFalha}" onclick="ateFalhaChange()" />
</div>


<div id="divMinutos" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'minutos', 'error')} required" style="display:none">
	<label for="minutos">
		<g:message code="serieExercicio.minutos.label" default="Minutos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="minutos" name="minutos" type="number" value="${serieExercicioInstance.minutos}"/>

</div>


<div id="divRepeticao" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'repeticao', 'error')} required" style="display:none">
	<label for="repeticao">
		<g:message code="serieExercicio.repeticao.label" default="Série" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="repeticao" name="repeticao" type="number" value="${serieExercicioInstance.repeticao}"/>

</div>


<div id="divSerie" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'quantidadeRepeticao', 'error')} required" style="display:none">
	<label for="quantidadeRepeticao">
		<g:message code="serieExercicio.quantidadeRepeticao.label" default="Repetições" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="quantidadeRepeticao" name="quantidadeRepeticao" type="number" value="${serieExercicioInstance.quantidadeRepeticao}"/>

</div>


<div id="divIntervalo" class="fieldcontain ${hasErrors(bean: serieExercicioInstance, field: 'tempoIntervalo', 'error')} required" style="display:none">
	<label for="tempoIntervalo">
		<g:message code="serieExercicio.tempoIntervalo.label" default="Tempo Intervalo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="tempoIntervalo" name="tempoIntervalo" type="number" value="${serieExercicioInstance.tempoIntervalo}"/>

</div>

