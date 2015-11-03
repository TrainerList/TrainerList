
<%@ page import="Sistema.SerieExercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serieExercicio.label', default: 'SerieExercicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serieExercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serieExercicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<table>
			<thead>
					<tr>
						<th><g:message code="serieExercicio.exercicio.label" default="Exercicio" /></th>

						<g:sortableColumn property="ateFalha" title="${message(code: 'serieExercicio.ateFalha.label', default: 'Ate Falha')}" />

						<g:sortableColumn property="minutos" title="${message(code: 'serieExercicio.minutos.label', default: 'Minutos')}" />

						<g:sortableColumn property="quantidadeRepeticao" title="${message(code: 'serieExercicio.quantidadeRepeticao.label', default: 'Quantidade Repeticao')}" />

						<g:sortableColumn property="repeticao" title="${message(code: 'serieExercicio.repeticao.label', default: 'Repeticao')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${serieExercicioInstanceList}" status="i" var="serieExercicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>${fieldValue(bean: serieExercicioInstance, field: "exercicio")}</td>

						<td><g:link action="show" id="${serieExercicioInstance.id}">${fieldValue(bean: serieExercicioInstance, field: "ateFalha")}</g:link></td>

						<td>${fieldValue(bean: serieExercicioInstance, field: "minutos")}</td>

						<td>${fieldValue(bean: serieExercicioInstance, field: "quantidadeRepeticao")}</td>

						<td>${fieldValue(bean: serieExercicioInstance, field: "repeticao")}</td>

						<td><g:formatBoolean boolean="${serieExercicioInstance.status}" /></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serieExercicioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
