
<%@ page import="Sistema.Exercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exercicio.label', default: 'Exercicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-exercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-exercicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'exercicio.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'exercicio.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'exercicio.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="video" title="${message(code: 'exercicio.video.label', default: 'Video')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${exercicioInstanceList}" status="i" var="exercicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${exercicioInstance.id}">${fieldValue(bean: exercicioInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: exercicioInstance, field: "nome")}</td>
					
						<td><g:formatBoolean boolean="${exercicioInstance.status}" /></td>
					
						<td>${fieldValue(bean: exercicioInstance, field: "video")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${exercicioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
