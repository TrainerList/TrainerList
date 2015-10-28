
<%@ page import="Sistema.Personal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-personal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'personal.nome.label', default: 'Nome')}" />

						<g:sortableColumn property="email" title="${message(code: 'personal.email.label', default: 'Email')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${personalInstanceList}" status="i" var="personalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:link class="edit" action="edit" resource="${personalInstance}">E</g:link>

							${fieldValue(bean: personalInstance, field: "nome")}
						</td>

						<td>${fieldValue(bean: personalInstance, field: "email")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
