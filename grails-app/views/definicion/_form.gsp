<%@ page import="audiodiccionario.Definicion" %>



<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'definicion', 'error')} required">
	<label for="definicion">
		<g:message code="definicion.definicion.label" default="Definicion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="definicion" required="" value="${definicionInstance?.definicion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'diccionario', 'error')} required">
	<label for="diccionario">
		<g:message code="definicion.diccionario.label" default="Diccionario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diccionario" name="diccionario.id" from="${audiodiccionario.Diccionario.list()}" optionKey="id" required="" value="${definicionInstance?.diccionario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: definicionInstance, field: 'palabra', 'error')} required">
	<label for="palabra">
		<g:message code="definicion.palabra.label" default="Palabra" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="palabra" required="" value="${definicionInstance?.palabra}"/>

</div>

