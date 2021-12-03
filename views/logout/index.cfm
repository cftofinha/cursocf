<cflock timeout="10" scope="Session" type="exclusive">
	<cflogout />
</cflock>
<cfscript>
	structClear(SESSION);
	structDelete(cookie,"loginUsuario");
	location( url="#event.getHTMLBaseURL()#index.cfm/login" )
</cfscript>