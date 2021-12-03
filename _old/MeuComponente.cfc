<cfcomponent>
	<cffunction name="getFullName" output="false" access="public" returnType="string">
		<cfargument name="firstName" type="string" required="true">
		<cfargument name="lastName" type="string" required="true">
		
		<cfset var fullName = arguments.firstName & " " & arguments.lastName >
		
		<cfreturn fullName>
		
	</cffunction>
	
	<cffunction name="getDadosUser" output="false" access="public" returntype="query">
		<cfargument name="usuarioAtual" type="string" required="false">
		
		<cfquery name="qUser" datasource="#application.datasource#">
			select id, no_usuario
			from tb_personal_info
			<cfif isDefined('arguments.usuarioAtual')>
				where no_usuario = <cfqueryparam value="#arguments.usuarioAtual#" cfsqltype="cf_sql_varchar" maxlength="50">
			</cfif>
		</cfquery>
		
		<cfreturn qUser>
		
	</cffunction>
	
	<cffunction name="getCategorias" output="false" access="public" returntype="query">
		<cfquery name="qConsulta" datasource="#application.datasource#">
			select id, name, imagem, css
			from category
			order by name asc 
		</cfquery>
		
		<cfreturn qConsulta>
		
	</cffunction>
	
</cfcomponent>