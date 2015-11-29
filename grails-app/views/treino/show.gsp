
<%@ page import="Sistema.Treino" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'treino.label', default: 'Treino')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-treino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="listarTreino">Treino</g:link></li>
			</ul>
		</div>
		<div id="show-treino" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list treino">
			
				<g:if test="${treinoInstance?.dataInicio}">
				<li class="fieldcontain">
					<span id="dataInicio-label" class="property-label">Data Início</span>
					
						<span class="property-value" aria-labelledby="dataInicio-label"><g:formatDate format="dd/MM/yyyy" date="${treinoInstance?.dataInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.dataTermino}">
				<li class="fieldcontain">
					<span id="dataTermino-label" class="property-label">Data Término</span>
					
						<span class="property-value" aria-labelledby="dataTermino-label"><g:formatDate format="dd/MM/yyyy" date="${treinoInstance?.dataTermino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label">Descrição</span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${treinoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${treinoInstance?.seriesExercicios}">
				<li class="fieldcontain">
					<span id="seriesExercicios-label" class="property-label">Exercicios</span>
					<br />
					<fieldset class="buttons">
						<g:each in="${treinoInstance.seriesExercicios}" var="serieExercicio">
							<span class="property-value" aria-labelledby="seriesExercicios-label">

								<li>
									${serieExercicio.exercicio.nome}

									<br />
									<g:if test="${serieExercicio.exercicio.cardio}">
										${serieExercicio.minutos} Minutos
									</g:if>
									<g:else>
										<g:if test="${serieExercicio.ateFalha}">
											até a Falha
										</g:if>
										<g:else>
											${serieExercicio.repeticao} X ${serieExercicio.quantidadeRepeticao}
										</g:else>

										Intevalo: ${serieExercicio.tempoIntervalo} seg
									</g:else>
								</li>

							</span>
						</g:each>
					</fieldset>
				</li>
				</g:if>
			
			</ol>
			<g:if test="${TipoUser} == 'P'">
				<g:form url="[resource:treinoInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${treinoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
