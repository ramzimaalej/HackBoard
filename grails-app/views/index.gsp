<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Hackathon - DigitalCity - ENIS - 2014</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="list" action="index" controller="project"><g:message code="default.list.label" args="['Projects']" /></g:link></li>
                <sec:ifNotLoggedIn>
                    <li><g:link class="list" uri="/login"><g:message code="user.login" /></g:link></li>
                    <li><g:link class="create" action="create" controller="user"><g:message code="user.register" /></g:link></li>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li><g:remoteLink class="logout" controller="logout" asynchronous="false">${message(code: 'springSecurity.logout.link')}</g:remoteLink></li>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <div style="padding:10px 5px 10px 5px;">
            <h1>Présentation</h1>
            <p>
                Sous l'égide de l'ENIS, le Hackathon DIGIC (DIGItal City) est organisé, et est soutenu par ses partenaires, afin de promouvoir l’innovation et la création d’entreprise. 10 équipes de 4 participants seront réunies pour proposer des
                solutions pratiques aux
                problèmes des
                résidents et des visiteurs de la ville de Sfax.
            </p>
            <h1>Programme</h1>
            <ul style="padding:0px 20px 10px 20px">
                <li>
                    <h2>Jeudi 06/11/2014</h2>
                    <p>
                        16h:00 Cérémonie d'ouverture <br/>
                        16h:20 Présenation des idées <br/>
                        17h:00 Formation des équipes <br/>
                        17h:15 Pause café et résautage <br/>
                    </p>
                </li>
                <li>
                    <h2>Vendredi 07/11/2014</h2>
                    <p>
                        09h:00 Petit-déjeuner <br/>
                        09h:30 Démarrage des activités <br/>
                        12h:00 Déjeuner <br/>
                        14h:00 Visite des coaches (Tour de table)<br/>
                    </p>
                </li>
                <li>
                    <h2>Samedi 08/11/2014</h2>
                    <p>
                        09h:00 Petit-déjeuner <br/>
                        11h:00 Visite des coaches (Tour de table)<br/>
                        12h:00 Déjeuner <br/>
                        14h:00 Pré-présentation des travaux aux coaches <br/>
                        15h:00 Présentation des travaux au jury <br/>
                        16h:00 Délibération et annonce des gagnants <br/>
                    </p>
                </li>
            </ul>
            <h1>Coaches</h1>
            <ul style="padding:0px 40px 10px 40px">
                <li>
                    <p>Slim Ben Hammouda: Sifast-chef du pôle mobile</p>
                </li>
                <li>
                    <p>Noureddine Loukil: Maître-assisant FSS et chef d'entreprise</p>
                </li>
                <li>
                    <p>Ramzi Maalej: Consultant Agile Management - Canada</p>
                </li>
                <li>
                    <p>Riadh Ben Halima: Maître assistant ENIS</p>
                </li>
            </ul>
            <h1>Jury</h1>
            <ul style="padding:0px 40px 10px 40px">
                <li>
                    <p>Habib Kammoun: GDG Sfax Manager</p>
                </li>
                <li>
                    <p>Anis Samet: Directeur de Sifast</p>
                </li>
                <li>
                    <p>Chafik Loukil: Président de l'AIDENIS</p>
                </li>
            </ul>
        </div>
	</body>
</html>
