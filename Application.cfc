/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Application properties
	this.name              = "cursoCF";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	setlocale("Portuguese (Brazilian)");
	setEncoding("URL", "UTF-8");
	setEncoding("FORM", "UTF-8");
	
	//this.rootDirectory = expandPath(".");
	this.datasource = "dbsenac";
	this.ormenabled = "true";
	this.ormSettings = {
		cfclocation="models/com/entity",
		dbCreate = "update",
		//autogenmap = true,
		//automanageSession = true,
		logsql = false
	};
	
	this.mappings[ '/coldbox' ] = 'C:/ColdFusion2021/cfusion/wwwroot/cursocf/coldbox/'
	
		

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE   = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY       = "";

	// application start
	public boolean function onApplicationStart() {
		application.cbBootstrap = new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		
		application.config 								= structNew();
		//datasources
		application.config.datasource 					= this.datasource;
		
		application.config.myName='Francisco Paulino';
		application.config.myPosition='A ColdFusion Developer';
		
		application.config.site = "Meu curso de CF";
		
		application.config.utilities = CreateObject('models.cfc.utilities');
		
		
		return true;
	}

	// application end
	public void function onApplicationEnd( struct appScope ){
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	// request start
	public boolean function onRequestStart( string targetPage ){
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}
	
	function onError( any Exception, string EventName){
		//include 'sorry.cfm';
		writeDump(Exception);
		/*var errorEmail = new mail();
		errorEmail.setTo('you@domain.com');
		errorEmail.setFrom('system@domain.com');
		errorEmail.setSubject('An Error has Occured');
		errorEmail.setBody('
			Message: #arguments.exception.message# <br />
			Details: #arguments.exception.detail# <br />
			Type: #arguments.exception.type# <br />
		');
		errorEmail.setType('html');
		errorEmail.send();*/
	}

}
