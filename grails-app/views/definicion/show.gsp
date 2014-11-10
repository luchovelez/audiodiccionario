
<%@ page import="audiodiccionario.Definicion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'definicion.label', default: 'Definicion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-definicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-definicion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list definicion">
			
				<g:if test="${definicionInstance?.definicion}">
				<li class="fieldcontain">
					<span id="definicion-label" class="property-label"><g:message code="definicion.definicion.label" default="Definicion" /></span>
					
						<span class="property-value" aria-labelledby="definicion-label"><g:fieldValue bean="${definicionInstance}" field="definicion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${definicionInstance?.diccionario}">
				<li class="fieldcontain">
					<span id="diccionario-label" class="property-label"><g:message code="definicion.diccionario.label" default="Diccionario" /></span>
					
						<span class="property-value" aria-labelledby="diccionario-label"><g:link controller="diccionario" action="show" id="${definicionInstance?.diccionario?.id}">${definicionInstance?.diccionario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${definicionInstance?.palabra}">
				<li class="fieldcontain">
					<span id="palabra-label" class="property-label"><g:message code="definicion.palabra.label" default="Palabra" /></span>
					
						<span class="property-value" aria-labelledby="palabra-label"><g:fieldValue bean="${definicionInstance}" field="palabra"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:definicionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${definicionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
