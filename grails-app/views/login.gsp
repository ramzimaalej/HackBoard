<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hackathon - DigitalCity - ENIS - 2014</title>
</head>
<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create" controller="user"><g:message code="user.register" /></g:link></li>
    </ul>
</div>
<div>
    <div id="login">
        <div class="inner">
            <div class="fheader">Please Login</div>

            <form action="/SmartCity/j_spring_security_check" method="POST" id="loginForm" class="cssform" autocomplete="off">
                <p>
                    <label for="username">Username:</label>
                    <input type="text" class="text_" name="j_username" id="username">
                </p>

                <p>
                    <label for="password">Password:</label>
                    <input type="password" class="text_" name="j_password" id="password">
                </p>

                <p id="remember_me_holder">
                    <input type="checkbox" class="chk" name="_spring_security_remember_me" id="remember_me">
                    <label for="remember_me">Remember me</label>
                </p>

                <p>
                    <input type="submit" id="submit" value="Login">
                </p>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</html>
