<%@ page import="smartcity.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="user.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${userInstance?.firstname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="user.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${userInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'classLevel', 'error')} required">
    <label for="classLevel">
        <g:message code="user.classLevel.label" default="Class level" />
        <span class="required-indicator">*</span>
    </label>
    <!--g:field type="classLevel" name="classLevel" required="" value="${userInstance?.classLevel}"/-->

    <g:select name="classLevel" from="${smartcity.ClassLevel.values()}" value="${userInstance?.classLevel}"></g:select>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'studentId', 'error')} required">
    <label for="studentId">
        <g:message code="user.studentId.label" default="Student Id" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="studentId" required="" value="${userInstance?.studentId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${userInstance?.password}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <g:hiddenField name="accountExpired" value="false" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <g:hiddenField name="accountLocked" value="false" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <g:hiddenField name="enabled" value="true" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'hasMobile', 'error')} ">
	<label for="hasMobile">
		<g:message code="user.hasMobile.label" default="Has Mobile" />

	</label>
	<g:checkBox name="hasMobile" value="${userInstance?.hasMobile}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <g:hiddenField name="passwordExpired" value="false" />
</div>

