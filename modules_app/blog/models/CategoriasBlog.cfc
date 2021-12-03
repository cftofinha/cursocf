<cfcomponent displayname="CategoriasBlog">
	
	<cffunction name="getCategorias" output="false" access="public" returntype="query">
		<cfquery name="qConsulta" datasource="#application.config.datasource#">
			select blogCategoryid as id, name, imagem, css
			from blogCategory
			order by name asc 
		</cfquery>
		
		<cfreturn qConsulta>
		
	</cffunction>
	
</cfcomponent>
