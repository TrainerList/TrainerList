<%@ page import="Sistema.Treino" %>


<div class="fieldcontain ${hasErrors(bean: treinoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="treino.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${treinoInstance?.descricao}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: treinoInstance, field: 'dataInicio', 'error')} required">
	<label for="dataInicio">
		<g:message code="treino.dataInicio.label" default="Data Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicio" precision="day"  value="${treinoInstance?.dataInicio}"  />

</div>


<div class="fieldcontain ${hasErrors(bean: treinoInstance, field: 'dataTermino', 'error')} required">
	<label for="dataTermino">
		<g:message code="treino.dataTermino.label" default="Data Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataTermino" precision="day"  value="${treinoInstance?.dataTermino}"  />

</div>

<g:if test="${mensagem} != ''">
	${mensagem}
</g:if>

<div class="content scaffold-list" role="main" ${hasErrors(bean: treinoInstance, field: 'status', 'error')} ">
	<br />
	<div class="nav" role="navigation">
		<ul>
			<li><g:link class="create" controller="serieExercicio" action="create">Add Série</g:link>
			</li>
		</ul>

		<br />
		<table>
			<tbody>
			<g:each in="${treinoInstance.seriesExercicios}" status="i" var="seriesExercicio">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
						<fieldset class="buttons">
							<li>
								${seriesExercicio.exercicio.nome}

								<br />
								<g:if test="${seriesExercicio.exercicio.cardio}">
									${seriesExercicio.minutos} Minutos
								</g:if>
								<g:else>
									<g:if test="${seriesExercicio.ateFalha}">
										até a Falha
									</g:if>
									<g:else>
										${seriesExercicio.repeticao} X ${seriesExercicio.quantidadeRepeticao}
									</g:else>

									Intevalo: ${seriesExercicio.tempoIntervalo} seg
								</g:else>
							</li>
								<li><g:link controller="treino" action="removerSerieExercicio" resource="${treinoInstance}" id="${treinoInstance.id}"
											params='[serieID:"${seriesExercicio.id}"]'
											nclick="return confirm('Confirmar Remoção?');">
										<asset:image src="/skin/inativar_20.png" alt="Remover"/>
									</g:link>
								</li>

						</fieldset>
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
</div>