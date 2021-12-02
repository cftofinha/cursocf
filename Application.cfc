component{
	this.name='cursoCF';
	this.datasource='dbsenac';
	this.applicationTimeout=CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement=true;
	this.sessionTimeout=CreateTimeSpan(0, 0, 30, 0);
	
	this.ormEnabled=true;
	this.ormSettings={
		logsql=true,
		dbcreate="update",
		cfclocation="com/entity"
		};
		
	this.invokeImplicitAccessor=true;
	this.sessionCookie.httpOnly=true;
	this.sessionCookie.timeout='10';
	this.sessionCookie.disableupdate=true;
	
	function onApplicationStart(){
		application.myName='Francisco Paulino';
		application.myPosition='A ColdFusion Developer';
		
		application.datasource = "dbsenac";
		session.nomeUsuario = "Tofinha";
		application.site = "Meu curso de CF";
		variables.dataHoraAtual = lsDateFormat(now(), 'dd/mm/yyyy') &" - "& lsTimeFormat(now(), 'HH:mm:ss');
		
		application.utilities = CreateObject('cfc.utilities');
		return true;
	}
	
	function onRequestStart(string targetPage){
		if(structKeyExists(url, 'reload')){
			onApplicationStart();
			ormReload();
		}
		arrDataTecnologias = [
			{nome='ColdFusion<br />Coding', imagem='coldfusion-image.png', css='coldfusion'},
			{nome='jQuery <br />Customisation', imagem='jquery-image.png', css='jquery'},
			{nome='CSS 3<br />Customisation', imagem='css-image.png', css='css'},
			{nome='HTML 5<br /> Customisation', imagem='html-image.png', css='html'}
		];
	}
	
	function onError( any Exception, string EventName){
		//include 'sorry.cfm';
		var errorEmail = new mail();
		errorEmail.setTo('you@domain.com');
		errorEmail.setFrom('system@domain.com');
		errorEmail.setSubject('An Error has Occured');
		errorEmail.setBody('
			Message: #arguments.exception.message# <br />
			Details: #arguments.exception.detail# <br />
			Type: #arguments.exception.type# <br />
		');
		errorEmail.setType('html');
		errorEmail.send();
	}
}