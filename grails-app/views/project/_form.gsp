<%@ page import="smartcity.Project" %>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="project.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${projectInstance?.title}" />

</div>

<g:hiddenField name="owner.id" id="owner" value="${sec.loggedInUserInfo(field: 'id')}" />

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="project.description.label" default="Description" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="description" required="" value="${projectInstance?.description}"/>

</div>

