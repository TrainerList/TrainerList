
<%@ page import="Sistema.AvaliacaoFisica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'avaliacaoFisica.label', default: 'AvaliacaoFisica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-avaliacaoFisica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-avaliacaoFisica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="abdomen" title="${message(code: 'avaliacaoFisica.abdomen.label', default: 'Abdomen')}" />
					
						<th><g:message code="avaliacaoFisica.aluno.label" default="Aluno" /></th>
					
						<g:sortableColumn property="antebracoDireito" title="${message(code: 'avaliacaoFisica.antebracoDireito.label', default: 'Antebraco Direito')}" />
					
						<g:sortableColumn property="antebracoEsquerdo" title="${message(code: 'avaliacaoFisica.antebracoEsquerdo.label', default: 'Antebraco Esquerdo')}" />
					
						<g:sortableColumn property="bicepsDireito" title="${message(code: 'avaliacaoFisica.bicepsDireito.label', default: 'Biceps Direito')}" />
					
						<g:sortableColumn property="bicepsEsquerdo" title="${message(code: 'avaliacaoFisica.bicepsEsquerdo.label', default: 'Biceps Esquerdo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${avaliacaoFisicaInstanceList}" status="i" var="avaliacaoFisicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${avaliacaoFisicaInstance.id}">${fieldValue(bean: avaliacaoFisicaInstance, field: "abdomen")}</g:link></td>
					
						<td>${fieldValue(bean: avaliacaoFisicaInstance, field: "aluno")}</td>
					
						<td>${fieldValue(bean: avaliacaoFisicaInstance, field: "antebracoDireito")}</td>
					
						<td>${fieldValue(bean: avaliacaoFisicaInstance, field: "antebracoEsquerdo")}</td>
					
						<td>${fieldValue(bean: avaliacaoFisicaInstance, field: "bicepsDireito")}</td>
					
						<td>${fieldValue(bean: avaliacaoFisicaInstance, field: "bicepsEsquerdo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${avaliacaoFisicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
