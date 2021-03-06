
<%@ page import="audiodiccionario.Diccionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
                <asset:javascript src="mespeak.js"/>
                <asset:script type="text/javascript">
                 meSpeak.loadConfig("mespeak_config.json");
                 meSpeak.loadVoice("voices/es-la.json");
                </asset:script>
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
			
				<g:if test="${diccionarioInstance?.palabra}">
				<li class="fieldcontain">
					<span id="palabra-label" class="property-label"><g:message code="diccionario.palabra.label" default="Palabra" /></span>
					
						<span class="property-value" aria-labelledby="palabra-label"><g:fieldValue bean="${diccionarioInstance}" field="palabra"/></span>
					
				</li>
				</g:if>
                                
                                <g:if test="${diccionarioInstance?.definicion}">
				<li class="fieldcontain">
					<span id="definicion-label" class="property-label"><g:message code="diccionario.definicion.label" default="Definicion" /></span>
					  <div id="${fieldValue(bean: diccionarioInstance, field: "palabra")}">
						<span class="property-value" aria-labelledby="definicion-label"><g:fieldValue bean="${diccionarioInstance}" field="definicion"/>
                                                    </br>  
                                        <!--  <embed src="http://translate.google.com/translate_tts?tl=es&q=${fieldValue(bean: diccionarioInstance, field: 'definicion')}" autostart=true loop=false volume=100 HIDDEN="true"/></span> -->
                                         


</div>

<script type="text/javascript" src="http://vozme.com/get_text.js"></script>
<a href="javascript:void(0);" 
onclick="get_id('${fieldValue(bean: diccionarioInstance, field: "palabra")}','es','ml');">
<asset:image src="speaker-1-512.png" alt="Buscar Palabra" height="54" width="62"/></a></div>
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
