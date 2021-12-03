<cfif isDefined("form.emailUsuario") and compareNoCase(form.emailUsuario,"")
	and isDefined("form.senhaUsuario") and compareNoCase(form.senhaUsuario,"")>
	
	<cfset variables.login = form.emailUsuario />
	<cfset variables.senha = hash(form.senhaUsuario) />
	
	<cftry>
		
		<cfquery name="qValidaLogin" datasource="#application.datasource#">
			select id, emailaddress, password, firstname, lastname
			from administrator
			where emailaddress = <cfqueryparam value="#variables.login#" cfsqltype="cf_sql_varchar" maxlength="50">
			and password = <cfqueryparam value="#variables.senha#" cfsqltype="cf_sql_varchar" maxlength="50">
		</cfquery>
		
		<cfif qValidaLogin.recordCount gt 0>
			
			<cfset session.usuarioAtual = qValidaLogin.firstname />
			<cfset session.usuarioAtualId = qValidaLogin.id />
			
			<cflocation url="index.cfm" addtoken="false">
			
		<cfelse>
			<h3>Nenhum Usuário Encontrado.</h3>
			<p><a href="login.cfm"> Tente novamente</a></p>
		</cfif>
		
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
		</cfcatch>
		
	</cftry>
<cfelse>
	<h3>Informe os campos da tela de login.</h3>
	<p><a href="login.cfm"> Tente novamente</a></p>
</cfif>