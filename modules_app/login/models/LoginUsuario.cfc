<cfcomponent displayname="LoginUsuario">
	<!---
	* Função: Login/autenticação de usuário
	* @name getAutenticar
	* @return query
	 --->
	<cffunction name="getAutenticar" access="remote" returntype="query">
		<cfargument name="login" required="true" type="string">
		<cfargument name="password" required="true" type="string">
		
		<cfset var qCons = "" />
		<cfset var strRetorno = {} />
		
		<cftry>
			<cfquery name="qCons" datasource="#application.config.datasource#">
				select userid
					,firstname
					,lastname
					,email
					,username
					,password
					,lastlogin
				from users
				where username = <cfqueryparam value="#arguments.login#" cfsqltype="cf_sql_varchar" maxlength="50">
				and password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" maxlength="255">
			</cfquery>
			<cfset strRetorno.erro = 0 />
			
		<cfcatch type="any">
			<cfset strRetorno.rrro = 1 />
			<cfset strRetorno.tpErro = 500 />
			<cfset strRetorno.msg = cfcatch />
			<cfset strRetorno.msgAmigavel = "Ocorreu um erro ao tentar faezr login. Nosso suporte foi avisado" />
		</cfcatch>
			
		</cftry>
		
		<cfreturn qCons>
		
	</cffunction>
	
</cfcomponent>