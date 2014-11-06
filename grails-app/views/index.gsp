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
                Sous l'égide de l'ENIS, le <a href="https://drive.google.com/file/d/0B7xQw2T9dRJLdFVtbVdNVXhNOVE/view?usp=sharing">Hackathon DIGIC (DIGItal City)</a> est organisé, et est soutenu par ses partenaires, afin de promouvoir l’innovation et la création d’entreprise. 10 équipes de 4 participants seront réunies pour
            proposer
            des
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
                    <p>Mohamed Amri: Maître-assisant FSS</p>
                </li>
                <li>
                    <p>Ramzi Maalej: Consultant Agile Management - Canada</p>
                </li>
                <li>
                    <p>Riadh Ben Halima: Maître assistant ENIS</p>
                </li>
                <li>
                    <p>Mohamed Amin Kallel: Directeur - Stratos Consultants</p>
                </li>
            </ul>
            <h1>Jury</h1>
            <ul style="padding:0px 40px 10px 40px">
                <li>
                    <p>Mohamed Jmaiel: Directeur du Centre de recherche sur les TIC</p>
                </li>
                <li>
                    <p>Habib Kammoun: GDG Sfax Manager</p>
                </li>
                <li>
                    <p>Anis Samet: Directeur de Sifast</p>
                </li>
                <li>
                    <p>Chafik Loukil: Président de l'AIDENIS</p>
                </li>
                <li>
                    <p>Mohamed MEDHAFFAR: Professeur FSS - Chef d'entreprise</p>
                </li>
                <li>
                    <p>Amin Ben Abdallah: Telnet</p>
                </li>
            </ul>
            <h1>Sponsors</h1>
            <div style="text-align: center;">
                <asset:image src="sponsors/enis.png" height="40px" width="40px"/>
                <asset:image src="sponsors/aidenis.jpg" height="40px" width="40px"/>
                <asset:image src="sponsors/acm.jpg" height="40px" width="40px"/>
                <asset:image src="sponsors/sfax.png" height="40px" width="40px"/>
                <asset:image src="sponsors/ieee.jpg" height="40px" width="100px"/>
                <asset:image src="sponsors/ieee-enis.jpg" height="40px" width="100px"/>
                <asset:image src="sponsors/ieee-student.jpg" height="40px" width="100px"/>
                <asset:image src="sponsors/cdg-sfax.jpg" height="40px" width="100px"/>
                <asset:image src="sponsors/sifast.jpg" height="40px" width="100px"/>
                <asset:image src="sponsors/univ-env.png" height="40px" width="100px"/>
            </div>
        </div>
	</body>
</html>
