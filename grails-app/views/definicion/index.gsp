
<%@ page import="audiodiccionario.Definicion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'definicion.label', default: 'Definicion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-definicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-definicion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="definicion" title="${message(code: 'definicion.definicion.label', default: 'Definicion')}" />
					
						<th><g:message code="definicion.diccionario.label" default="Diccionario" /></th>
					
						<g:sortableColumn property="palabra" title="${message(code: 'definicion.palabra.label', default: 'Palabra')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${definicionInstanceList}" status="i" var="definicionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${definicionInstance.id}">${fieldValue(bean: definicionInstance, field: "definicion")}</g:link></td>
					
						<td>${fieldValue(bean: definicionInstance, field: "diccionario")}</td>
					
						<td>${fieldValue(bean: definicionInstance, field: "palabra")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${definicionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
