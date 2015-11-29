<%@ page import="Sistema.AvaliacaoFisica" %>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="avaliacaoFisica.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${avaliacaoFisicaInstance?.data}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'peso', 'error')} required">
	<label for="peso">
		Peso
		<span class="required-indicator">*</span>
	</label>
	<g:field id="peso" name="peso" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'peso')}" required=""/>

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'altura', 'error')} required">
	<label for="altura">
		Altura
		<span class="required-indicator">*</span>
	</label>
	<g:field id="altura" name="altura" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'altura')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'antebracoDireito', 'error')} ">
	<label for="antebracoDireito">
		Antebraço Direito
	</label>
	<g:field name="antebracoDireito" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'antebracoDireito')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'antebracoEsquerdo', 'error')} ">
	<label for="antebracoEsquerdo">
		Antebraço Esquerdo
	</label>
	<g:field name="antebracoEsquerdo" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'antebracoEsquerdo')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'bicepsDireito', 'error')} ">
	<label for="bicepsDireito">
		Biceps Direito
	</label>
	<g:field name="bicepsDireito" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'bicepsDireito')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'bicepsEsquerdo', 'error')} ">
	<label for="bicepsEsquerdo">
		Biceps Esquerdo
	</label>
	<g:field name="bicepsEsquerdo" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'bicepsEsquerdo')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'peito', 'error')} ">
	<label for="peito">
		Peito
	</label>
	<g:field name="peito" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'peito')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'abdomen', 'error')} ">
	<label for="abdomen">
		Abdomen
	</label>
	<g:field name="abdomen" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'abdomen')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'cintura', 'error')} ">
	<label for="cintura">
		Cintura
	</label>
	<g:field name="cintura" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'cintura')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'quadril', 'error')} ">
	<label for="quadril">
		Quadril
	</label>
	<g:field name="quadril" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'quadril')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'coxaDireita', 'error')} ">
	<label for="coxaDireita">
		Coxa Direita
	</label>
	<g:field name="coxaDireita" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'coxaDireita')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'coxaEsquerda', 'error')} ">
	<label for="coxaEsquerda">
		Coxa Esquerda
	</label>
	<g:field name="coxaEsquerda" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'coxaEsquerda')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'panturilhaDireita', 'error')} ">
	<label for="panturilhaDireita">
		Panturilha Direita
	</label>
	<g:field name="panturilhaDireita" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'panturilhaDireita')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'panturilhaEsquerda', 'error')} ">
	<label for="panturilhaEsquerda">
		Panturilha Esquerda
	</label>
	<g:field name="panturilhaEsquerda" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'panturilhaEsquerda')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'massaMuscular', 'error')} ">
	<label for="massaMuscular">
		Massa Muscular
	</label>
	<g:field name="massaMuscular" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'massaMuscular')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'gorduraCorporal', 'error')} ">
	<label for="gorduraCorporal">
		Gordura Corporal
	</label>
	<g:field name="gorduraCorporal" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'gorduraCorporal')}" />

</div>


<div class="fieldcontain ${hasErrors(bean: avaliacaoFisicaInstance, field: 'pressao', 'error')} ">
	<label for="pressao">
		Pressão
	</label>
	<g:field name="pressao" value="${fieldValue(bean: avaliacaoFisicaInstance, field: 'pressao')}" />

</div>