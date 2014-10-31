<!DOCTYPE html>
<html>
	<head>
		<title>Method not allowed</title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:else>
			<ul class="errors">
				<li>${flash.message}</li>
			</ul>
		</g:else>
	</body>
</html>
