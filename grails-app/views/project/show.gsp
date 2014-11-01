
<%@ page import="smartcity.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">

				<g:if test="${projectInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="project.title.label" default="Title" /></span>

						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${projectInstance}" field="title"/></span>

				</li>
				</g:if>

                <g:if test="${projectInstance?.owner}">
                    <li class="fieldcontain">
                        <span id="owner-label" class="property-label"><g:message code="project.owner.label" default="Owner" /></span>

                        <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${projectInstance?.owner?.id}">${projectInstance?.owner?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${projectInstance?.description}">
                    <li class="fieldcontain">
                        <span id="description-label" class="property-label"><g:message code="project.description.label" default="Description" /></span>

                        <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="description"/></span>

                    </li>
                </g:if>

			</ol>

            <div id="participants-list-project" class="content scaffold-list" role="main">
                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="firstname" title="${message(code: 'participant.firstname.label', default: 'Firstname')}" />

                        <g:sortableColumn property="lastname" title="${message(code: 'participant.lastname.label', default: 'Lastname')}" />

                        <g:sortableColumn property="university" title="${message(code: 'participant.email.label', default: 'University')}" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${participantList}" status="i" var="participation">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link controller="user" action="show" id="${participation.user.id}">${fieldValue(bean: participation.user, field: "firstname")}</g:link></td>

                            <td>${fieldValue(bean: participation.user, field: "lastname")}</td>

                            <td>${fieldValue(bean: participation.user, field: "university")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
                    <g:paginate total="${projectInstanceCount ?: 0}" />
                </div>

            <g:form url="[resource:projectInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="participate" resource="${projectInstance}"><g:message code="default.button.participate.label" default="Participate" onclick="return confirm('${message(code:
                            'default.button.participate.confirm.message', default: 'Are you sure?')}');"/></g:link>
                    <g:link class="delete" action="leave" resource="${projectInstance}"><g:message code="default.button.leave.label" default="Leave project" onclick="return confirm('${message(code:
                            'default.button.leave.confirm.message', default: 'Are you sure?')}');"/></g:link>
					<g:link class="edit" action="edit" resource="${projectInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default:
                            'Are you sure?')}');" />
                </fieldset>
            </g:form>
		</div>
	</body>
</html>
