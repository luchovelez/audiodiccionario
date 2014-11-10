
<%@ page import="audiodiccionario.Diccionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diccionario.label', default: 'Diccionario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diccionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-diccionario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diccionario">
			
				<g:if test="${diccionarioInstance?.creador}">
				<li class="fieldcontain">
					<span id="creador-label" class="property-label"><g:message code="diccionario.creador.label" default="Creador" /></span>
					
						<span class="property-value" aria-labelledby="creador-label"><g:fieldValue bean="${diccionarioInstance}" field="creador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diccionarioInstance?.definiciones}">
				<li class="fieldcontain">
					<span id="definiciones-label" class="property-label"><g:message code="diccionario.definiciones.label" default="Definiciones" /></span>
					
						<g:each in="${diccionarioInstance.definiciones}" var="d">
						<span class="property-value" aria-labelledby="definiciones-label"><g:link controller="definicion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${diccionarioInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="diccionario.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${diccionarioInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diccionarioInstance?.tematica}">
				<li class="fieldcontain">
					<span id="tematica-label" class="property-label"><g:message code="diccionario.tematica.label" default="Tematica" /></span>
					
						<span class="property-value" aria-labelledby="tematica-label"><g:fieldValue bean="${diccionarioInstance}" field="tematica"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:diccionarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${diccionarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
