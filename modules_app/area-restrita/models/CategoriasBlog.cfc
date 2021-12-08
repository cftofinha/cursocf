<cfcomponent displayname="CategoriasBlog">
	
	<cffunction name="getCategorias" output="false" access="public" returntype="query">
		<cfargument name="condicoesFiltro" type="string" required="true">
		
		<cfquery name="qConsulta" datasource="#application.config.datasource#">
			select blogCategoryid as id, name, imagem, css
			from blogCategory
			where #preserveSingleQuotes(arguments.condicoesFiltro)#
			order by name asc 
		</cfquery>
		
		<cfreturn qConsulta>
		
	</cffunction>
	
	<cffunction name="setCadastrar" output="false" access="package" returntype="struct">
		<cfargument name="name" type="string" required="true">
		<cfargument name="imagem" type="string" required="true">
		<cfargument name="css" type="string" required="true">
		
		<cfset strRetorno = {} />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				insert into blogCategory (
					name
					, imagem
					, css
				) values (
					<cfqueryparam  value="#arguments.name#" cfsqltype="cf_sql_varchar" maxlength="50">
					, <cfqueryparam  value="#arguments.imagem#" cfsqltype="cf_sql_varchar" maxlength="50">
					, <cfqueryparam  value="#arguments.css#" cfsqltype="cf_sql_varchar" maxlength="50">
				)
			</cfquery>
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Cadastro feito com sucesso" />
			
		<cfcatch type="any">
			<cfset strRetorno.retorno = "erro" />
			<cfset strRetorno.mensagem = cfcatch />
		</cfcatch>
			
		</cftry>
		
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setUpdate" output="false" access="package" returntype="struct">
		<cfargument name="blogCategoryid" type="numeric" required="true">
		<cfargument name="name" type="string" required="true">
		<cfargument name="imagem" type="string" required="true">
		<cfargument name="css" type="string" required="true">
		
		<cfset strRetorno = {} />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				update blogCategory set 
					name = <cfqueryparam  value="#arguments.name#" cfsqltype="cf_sql_varchar" maxlength="50">
					, imagem = <cfqueryparam  value="#arguments.imagem#" cfsqltype="cf_sql_varchar" maxlength="50">
					, css = <cfqueryparam  value="#arguments.css#" cfsqltype="cf_sql_varchar" maxlength="50">
				where blogCategoryid = <cfqueryparam  value="#arguments.blogCategoryid#" cfsqltype="cf_sql_integer" maxlength="4">
			</cfquery>
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Atualização feita com sucesso" />
			
		<cfcatch type="any">
			<cfset strRetorno.retorno = "erro" />
			<cfset strRetorno.mensagem = cfcatch />
		</cfcatch>
			
		</cftry>
		
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setExcluir" output="false" access="package" returntype="struct">
		<cfargument name="blogCategoryid" type="numeric" required="true">
		
		<cfset strRetorno = {} />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				delete from blogCategory
				where blogCategoryid = <cfqueryparam  value="#arguments.blogCategoryid#" cfsqltype="cf_sql_integer" maxlength="4">
			</cfquery>
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Exclusão feita com sucesso" />
			
		<cfcatch type="any">
			<cfset strRetorno.retorno = "erro" />
			<cfset strRetorno.mensagem = cfcatch />
		</cfcatch>
			
		</cftry>
		
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setSalvarDados" access="remote" returntype="struct">
		<cfargument name="acao" type="string" required="true">
		<cfargument name="blogCategoryid" type="numeric" required="true">
		<cfargument name="name" type="string" required="true">
		<cfargument name="imagem" type="string" required="true">
		<cfargument name="css" type="string" required="true">
		
		<cfscript>
			srtRetorno = {};
			
			if(not compareNoCase(arguments.acao, "novo")){
				this.setCadastrar (
					arguments.name
					,arguments.imagem
					,arguments.css
				);
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.retorno;
			}
			else if(not compareNoCase(arguments.acao, "alterar")){
				this.setUpdate (
					arguments.blogCategoryid
					,arguments.name
					,arguments.imagem
					,arguments.css
				);
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.mensagem;
			}
			else if(not compareNoCase(arguments.acao, "remover")){
				this.setExcluir (
					arguments.blogCategoryid
				);
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.mensagem;
			}
		</cfscript>
		
		<cfreturn strRetorno>
		
	</cffunction>
	
</cfcomponent>
