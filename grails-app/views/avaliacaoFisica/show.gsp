
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
				<li><g:link class="list" action="listarAvaliacoesFisicas">Voltar</g:link></li>
			</ul>
		</div>
		<div id="show-avaliacaoFisica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list avaliacaoFisica">


				<g:if test="${avaliacaoFisicaInstance?.data}">
					<li class="fieldcontain">
						<span id="data-label" class="property-label">Data da Avaliação</span>

						<span class="property-value" aria-labelledby="data-label"><g:formatDate format="dd/MM/yyyy" date="${avaliacaoFisicaInstance?.data}" /></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.peso}">
					<li class="fieldcontain">
						<span id="peso-label" class="property-label">Peso</span>

						<span class="property-value" aria-labelledby="peso-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="peso"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.altura}">
					<li class="fieldcontain">
						<span id="altura-label" class="property-label">Altura</span>

						<span class="property-value" aria-labelledby="altura-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="altura"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.antebracoDireito}">
					<li class="fieldcontain">
						<span id="antebracoDireito-label" class="property-label">Antebraço Direito</span>

						<span class="property-value" aria-labelledby="antebracoDireito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="antebracoDireito"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.antebracoEsquerdo}">
					<li class="fieldcontain">
						<span id="antebracoEsquerdo-label" class="property-label">Antebraóo Esquerdo</span>

						<span class="property-value" aria-labelledby="antebracoEsquerdo-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="antebracoEsquerdo"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.bicepsDireito}">
					<li class="fieldcontain">
						<span id="bicepsDireito-label" class="property-label">Biceps Direito</span>

						<span class="property-value" aria-labelledby="bicepsDireito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="bicepsDireito"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.bicepsEsquerdo}">
					<li class="fieldcontain">
						<span id="bicepsEsquerdo-label" class="property-label">Biceps Esquerdo</span>

						<span class="property-value" aria-labelledby="bicepsEsquerdo-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="bicepsEsquerdo"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.peito}">
					<li class="fieldcontain">
						<span id="peito-label" class="property-label">Peito</span>

						<span class="property-value" aria-labelledby="peito-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="peito"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.abdomen}">
					<li class="fieldcontain">
						<span id="abdomen-label" class="property-label">Abdomen</span>

						<span class="property-value" aria-labelledby="abdomen-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="abdomen"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.cintura}">
					<li class="fieldcontain">
						<span id="cintura-label" class="property-label">Cintura</span>

						<span class="property-value" aria-labelledby="cintura-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="cintura"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.quadril}">
					<li class="fieldcontain">
						<span id="quadril-label" class="property-label">Quadril</span>

						<span class="property-value" aria-labelledby="quadril-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="quadril"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.coxaDireita}">
					<li class="fieldcontain">
						<span id="coxaDireita-label" class="property-label">Coxa Direita</span>

						<span class="property-value" aria-labelledby="coxaDireita-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="coxaDireita"/></span>

					</li>
				</g:if>

				<g:if test="${avaliacaoFisicaInstance?.coxaEsquerda}">
					<li class="fieldcontain">
						<span id="coxaEsquerda-label" class="property-label">Coxa Esquerda</span>

						<span class="property-value" aria-labelledby="coxaEsquerda-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="coxaEsquerda"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.panturilhaDireita}">
					<li class="fieldcontain">
						<span id="panturilhaDireita-label" class="property-label">Panturilha Direita</span>

						<span class="property-value" aria-labelledby="panturilhaDireita-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="panturilhaDireita"/></span>

					</li>
				</g:if>

				<g:if test="${avaliacaoFisicaInstance?.panturilhaEsquerda}">
					<li class="fieldcontain">
						<span id="panturilhaEsquerda-label" class="property-label">Panturilha Esquerda</span>

						<span class="property-value" aria-labelledby="panturilhaEsquerda-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="panturilhaEsquerda"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.massaMuscular}">
					<li class="fieldcontain">
						<span id="massaMuscular-label" class="property-label">Massa Muscular</span>

						<span class="property-value" aria-labelledby="massaMuscular-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="massaMuscular"/></span>

					</li>
				</g:if>


				<g:if test="${avaliacaoFisicaInstance?.gorduraCorporal}">
				<li class="fieldcontain">
					<span id="gorduraCorporal-label" class="property-label">Gordura Corporal</span>
					
						<span class="property-value" aria-labelledby="gorduraCorporal-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="gorduraCorporal"/></span>
					
				</li>
				</g:if>
			

				<g:if test="${avaliacaoFisicaInstance?.pressao}">
				<li class="fieldcontain">
					<span id="pressao-label" class="property-label">Pressão</span>
					
						<span class="property-value" aria-labelledby="pressao-label"><g:fieldValue bean="${avaliacaoFisicaInstance}" field="pressao"/></span>
					
				</li>
				</g:if>

			</ol>

			<g:if test="${TipoUser == 'P'}">
				<g:form url="[resource:avaliacaoFisicaInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${avaliacaoFisicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="inativar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('Remover este Treino?');" />
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
