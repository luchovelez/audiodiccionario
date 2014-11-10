<%@ page import="audiodiccionario.Diccionario" %>



<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'definicion', 'error')} required">
	<label for="definicion">
		<g:message code="diccionario.definicion.label" default="Definicion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="definicion" required="" value="${diccionarioInstance?.definicion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'palabra', 'error')} required">
	<label for="palabra">
		<g:message code="diccionario.palabra.label" default="Palabra" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="palabra" required="" value="${diccionarioInstance?.palabra}"/>

</div>

