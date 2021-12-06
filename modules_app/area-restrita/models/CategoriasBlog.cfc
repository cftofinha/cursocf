<cfcomponent displayname="CategoriasBlog">
	
	<cffunction name="getCategorias" output="false" access="public" returntype="query">
		<cfquery name="qConsulta" datasource="#application.config.datasource#">
			select blogCategoryid as id, name, imagem, css
			from blogCategory
			order by name asc 
		</cfquery>
		
		<cfreturn qConsulta>
		
	</cffunction>
	
	<cffunction name="setCadastrarComentario" output="false" access="public" returntype="Any">
		<cfargument name="blogpostid" type="numeric" required="true">
		<cfargument name="author" type="string" required="true">
		<cfargument name="comment" type="string" required="true">
		
		<cfset variables.dataPostagem = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				insert into blogComment (
					 blogpostid
					, author
					, comment
					, createdDateTime
				)
				values(
					<cfqueryparam value="#arguments.blogpostid#" cfsqltype="cf_sql_integer" maxlength="4">
					, <cfqueryparam value="#arguments.author#" cfsqltype="cf_sql_varchar" maxlength="70">
					, <cfqueryparam value="#arguments.comment#" cfsqltype="cf_sql_longvarchar">
					, <cfqueryparam value="#variables.dataPostagem#">
				)
			</cfquery>
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
			</cfcatch>
		
		</cftry>
		<cfreturn >
		
	</cffunction>
	
</cfcomponent>
