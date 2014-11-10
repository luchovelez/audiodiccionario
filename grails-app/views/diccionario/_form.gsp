<%@ page import="audiodiccionario.Diccionario" %>



<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'creador', 'error')} required">
	<label for="creador">
		<g:message code="diccionario.creador.label" default="Creador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="creador" required="" value="${diccionarioInstance?.creador}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'definiciones', 'error')} ">
	<label for="definiciones">
		<g:message code="diccionario.definiciones.label" default="Definiciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${diccionarioInstance?.definiciones?}" var="d">
    <li><g:link controller="definicion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="definicion" action="create" params="['diccionario.id': diccionarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'definicion.label', default: 'Definicion')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="diccionario.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${diccionarioInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'tematica', 'error')} required">
	<label for="tematica">
		<g:message code="diccionario.tematica.label" default="Tematica" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tematica" required="" value="${diccionarioInstance?.tematica}"/>

</div>

