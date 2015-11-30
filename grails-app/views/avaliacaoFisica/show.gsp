
<%@ page import="Sistema.AvaliacaoFisica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'avaliacaoFisica.label', default: 'AvaliacaoFisica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-avaliacaoFisica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<g:if test="${TipoUser == 'P'}">
					<li><g:link class="list" action="listarAvaliacoesFisicas">Voltar</g:link></li>
				</g:if>
				<g:else>
					<li><g:link controller="aluno" class="list" action="areaAluno" params="[tipo:'AF']">Voltar</g:link></li>
				</g:else>
			</ul>
		</div>
		<div id="show-avaliacaoFisica" class="content scaffold-show" role="main">
			<h1>Avaliação Física</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list avaliacaoFisica">


					<li class="fieldcontain">
						<span id="data-label" class="property-label">Data da Avaliação</span>

						<span class="property-value" aria-labelledby="data-label"><g:formatDate format="dd/MM/yyyy" date="${avaliacaoFisicaInstance?.data}" /></span>

					</li>


					<li class="fieldcontain">
						<span id="peso-label" class="property-label">Peso</span>

						<span class="property-value" aria-labelledby="peso-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="peso"/></span>

					</li>


					<li class="fieldcontain">
						<span id="altura-label" class="property-label">Altura</span>

						<span class="property-value" aria-labelledby="altura-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="altura"/></span>

					</li>



					<li class="fieldcontain">
						<span id="antebracoDireito-label" class="property-label">Antebraço Direito</span>

						<span class="property-value" aria-labelledby="antebracoDireito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="antebracoDireito"/></span>

					</li>



					<li class="fieldcontain">
						<span id="antebracoEsquerdo-label" class="property-label">Antebraóo Esquerdo</span>

						<span class="property-value" aria-labelledby="antebracoEsquerdo-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="antebracoEsquerdo"/></span>

					</li>


					<li class="fieldcontain">
						<span id="bicepsDireito-label" class="property-label">Biceps Direito</span>

						<span class="property-value" aria-labelledby="bicepsDireito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="bicepsDireito"/></span>

					</li>


					<li class="fieldcontain">
						<span id="bicepsEsquerdo-label" class="property-label">Biceps Esquerdo</span>

						<span class="property-value" aria-labelledby="bicepsEsquerdo-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="bicepsEsquerdo"/></span>

					</li>


					<li class="fieldcontain">
						<span id="peito-label" class="property-label">Peito</span>

						<span class="property-value" aria-labelledby="peito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="peito"/></span>

					</li>


					<li class="fieldcontain">
						<span id="abdomen-label" class="property-label">Abdomen</span>

						<span class="property-value" aria-labelledby="abdomen-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="abdomen"/></span>

					</li>


					<li class="fieldcontain">
						<span id="cintura-label" class="property-label">Cintura</span>

						<span class="property-value" aria-labelledby="cintura-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="cintura"/></span>

					</li>


					<li class="fieldcontain">
						<span id="quadril-label" class="property-label">Quadril</span>

						<span class="property-value" aria-labelledby="quadril-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="quadril"/></span>

					</li>


					<li class="fieldcontain">
						<span id="coxaDireita-label" class="property-label">Coxa Direita</span>

						<span class="property-value" aria-labelledby="coxaDireita-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="coxaDireita"/></span>

					</li>

					<li class="fieldcontain">
						<span id="coxaEsquerda-label" class="property-label">Coxa Esquerda</span>

						<span class="property-value" aria-labelledby="coxaEsquerda-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="coxaEsquerda"/></span>

					</li>


					<li class="fieldcontain">
						<span id="panturilhaDireita-label" class="property-label">Panturilha Direita</span>

						<span class="property-value" aria-labelledby="panturilhaDireita-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="panturilhaDireita"/></span>

					</li>

					<li class="fieldcontain">
						<span id="panturilhaEsquerda-label" class="property-label">Panturilha Esquerda</span>

						<span class="property-value" aria-labelledby="panturilhaEsquerda-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="panturilhaEsquerda"/></span>

					</li>


					<li class="fieldcontain">
						<span id="massaMuscular-label" class="property-label">Massa Muscular</span>

						<span class="property-value" aria-labelledby="massaMuscular-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="massaMuscular"/></span>

					</li>


				<li class="fieldcontain">
					<span id="gorduraCorporal-label" class="property-label">Gordura Corporal</span>
					
						<span class="property-value" aria-labelledby="gorduraCorporal-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="gorduraCorporal"/></span>
					
				</li>


				<li class="fieldcontain">
					<span id="pressao-label" class="property-label">Pressão</span>
					
						<span class="property-value" aria-labelledby="pressao-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="pressao"/></span>
					
				</li>

			</ol>

			<g:if test="${TipoUser == 'P'}">
				<g:form url="[resource:avaliacaoFisicaInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${avaliacaoFisicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit id="Inativar" class="delete" action="inativar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('Remover este Treino?');" />
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
