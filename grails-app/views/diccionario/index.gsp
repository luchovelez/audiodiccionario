
<%@ page import="audiodiccionario.Diccionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diccionario.label', default: 'Diccionario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-diccionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-diccionario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                                                <g:sortableColumn property="palabra" title="${message(code: 'diccionario.palabra.label', default: 'Palabra')}" />
						<g:sortableColumn property="definicion" title="${message(code: 'diccionario.definicion.label', default: 'Definicion')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${diccionarioInstanceList}" status="i" var="diccionarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${diccionarioInstance.id}">${fieldValue(bean: diccionarioInstance, field: "palabra")}</g:link></td>
					
						<td>${fieldValue(bean: diccionarioInstance, field: "definicion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${diccionarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
