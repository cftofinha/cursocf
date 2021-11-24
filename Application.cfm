<cfapplication name="cursoCF" 
				sessionmanagement="true" 
				sessiontimeout="#CreateTimeSpan(0, 0, 30, 0)#"
>

<cfscript>
	setlocale("Portuguese (Brazilian)");
	setEncoding("URL", "UTF-8");
	setEncoding("FORM", "UTF-8");
	
	application.datasource = "dbsenac";
	session.nomeUsuario = "Tofinha";
	application.site = "Meu curso de CF";
	variables.dataHoraAtual = lsDateFormat(now(), 'dd/mm/yyyy') &" - "& lsTimeFormat(now(), 'HH:mm:ss');
	
	arrDataTecnologias = [
		{nome='ColdFusion<br />Coding', imagem='coldfusion-image.png', css='coldfusion'},
		{nome='jQuery <br />Customisation', imagem='jquery-image.png', css='jquery'},
		{nome='CSS 3<br />Customisation', imagem='css-image.png', css='css'},
		{nome='HTML 5<br /> Customisation', imagem='html-image.png', css='html'}
	];
</cfscript>