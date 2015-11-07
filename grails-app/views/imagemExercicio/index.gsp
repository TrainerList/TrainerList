
<%@ page import="Sistema.ImagemExercicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagemExercicio.label', default: 'ImagemExercicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imagemExercicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imagemExercicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="imagemExercicio.exercicio.label" default="Exercicio" /></th>
					
						<g:sortableColumn property="imagem" title="${message(code: 'imagemExercicio.imagem.label', default: 'Imagem')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'imagemExercicio.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imagemExercicioInstanceList}" status="i" var="imagemExercicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imagemExercicioInstance.id}">${fieldValue(bean: imagemExercicioInstance, field: "exercicio")}</g:link></td>
					
						<td>${fieldValue(bean: imagemExercicioInstance, field: "imagem")}</td>
					
						<td><g:formatBoolean boolean="${imagemExercicioInstance.status}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imagemExercicioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
