<cfcomponent displayname="PostBlog">
	
	<cffunction name="getContadores" output="false" access="remote" returntype="query">
		
		<cfquery name="qContadores" datasource="#application.config.datasource#">
			select count(*) as qtd, 'Postagens' as tabela, "listar-posts" as linkTabela from blogPost
			union all
			select count(*) as qtd, 'Categorias' as tabela, "listar-categorias" as linkTabela from blogCategory
			union all
			select count(*) as qtd, 'Comentarios' as tabela, "listar-comentarios" as linkTabela from BlogComment
		</cfquery>
		
		<cfreturn qContadores>
		
	</cffunction>
	
	<cffunction name="getPostsBlog" output="false" access="remote" returntype="query">
		<cfargument name="condicoesFiltro" type="string" required="true">
		<cfquery name="qPosts" datasource="#application.config.datasource#">
			select a.blogpostid as id
					, a.idUsuario
					, a.idCategoria
					, c.name as nomeCategoria
					, a.title as titulo
					, a.summary as resumo
					, a.body as conteudo
					, DATE_FORMAT(a.dateposted,'%d/%m/%Y') as dataPostagem
					, TIME_FORMAT(a.dateposted, '%T') AS horaPostagem
					, DATE_FORMAT(a.createdDateTime,'%d/%m/%Y %H:%i:%s') as dataHoraSistema
					, (select count(*) from BlogComment bc where a.blogpostid = bc.blogpostid) as qtdComentarios
			 from blogPost a
			 inner join blogCategory c on c.blogCategoryid = a.idCategoria 
			 where #preserveSingleQuotes(arguments.condicoesFiltro)#
		</cfquery>
		
		<cfreturn qPosts>
		
	</cffunction>
	
	<cffunction name="setCadastrar" output="false" access="package" returntype="struct">
		<cfargument name="idUsuario" type="numeric" required="true">
		<cfargument name="idCategoria" type="numeric" required="true">
		<cfargument name="title" type="string" required="true">
		<cfargument name="summary" type="string" required="true">
		<cfargument name="body" type="string" required="true">
		<cfargument name="dateposted" type="date" required="true">
		
		<cfset strRetorno = {} />
		
		<cfset variables.dataPostagem = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				insert into blogPost (
					idUsuario
					,idCategoria
					, title
					, summary
					, body
					, dateposted
					, createdDateTime
				)
				values(
					<cfqueryparam value="#arguments.idUsuario#" cfsqltype="cf_sql_integer" maxlength="4">
					, <cfqueryparam value="#arguments.idCategoria#" cfsqltype="cf_sql_integer" maxlength="4">
					, <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar" maxlength="70">
					, <cfqueryparam value="#arguments.summary#" cfsqltype="cf_sql_longvarchar">
					, <cfqueryparam value="#arguments.body#" cfsqltype="cf_sql_longvarchar">
					, <cfqueryparam value="#arguments.dateposted#">
					, <cfqueryparam value="#variables.dataPostagem#">
				)
			</cfquery>
			
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Cadastro feito com sucesso" />
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
				<cfset strRetorno.retorno = "erro" />
				<cfset strRetorno.mensagem = cfcatch />
			</cfcatch>
		
		</cftry>
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setUpdate" output="false" access="package" returntype="struct">
		<cfargument name="blogpostid" type="numeric" required="true">
		<cfargument name="idUsuario" type="numeric" required="true">
		<cfargument name="idCategoria" type="numeric" required="true">
		<cfargument name="title" type="string" required="true">
		<cfargument name="summary" type="string" required="true">
		<cfargument name="body" type="string" required="true">
		<cfargument name="dateposted" type="date" required="true">
		
		<cfset strRetorno = {} />
		<cfset variables.dataAlteracao = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				update blogPost set 
					idUsuario = <cfqueryparam value="#arguments.idUsuario#" cfsqltype="cf_sql_integer" maxlength="4">
					, idCategoria = <cfqueryparam value="#arguments.idCategoria#" cfsqltype="cf_sql_integer" maxlength="4">
					, title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar" maxlength="70"> 
					, summary = <cfqueryparam value="#arguments.summary#" cfsqltype="cf_sql_longvarchar">
					, body = <cfqueryparam value="#arguments.body#" cfsqltype="cf_sql_longvarchar">
					, dateposted = <cfqueryparam value="#arguments.dateposted#">
					, modifiedDateTime = <cfqueryparam value="#variables.dataAlteracao#">
				where blogpostid = <cfqueryparam value="#arguments.blogpostid#" cfsqltype="cf_sql_integer" maxlength="4">
			</cfquery>
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Atualização feita com sucesso" />
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
				<cfset strRetorno.retorno = "erro" />
				<cfset strRetorno.mensagem = cfcatch />
			</cfcatch>
		
		</cftry>
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setExcluir" output="false" access="package" returntype="struct">
		<cfargument name="blogpostid" type="numeric" required="true">
		
		<cfset strRetorno = {} />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				delete from blogPost 
				where blogpostid = <cfqueryparam value="#arguments.blogpostid#" cfsqltype="cf_sql_integer" maxlength="4">
			</cfquery>
			<cfset strRetorno.retorno = "sucesso" />
			<cfset strRetorno.mensagem = "Exclusão feita com sucesso" />
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
				<cfset strRetorno.retorno = "erro" />
				<cfset strRetorno.mensagem = cfcatch />
			</cfcatch>
		
		</cftry>
		<cfreturn strRetorno>
		
	</cffunction>
	
	<cffunction name="setSalvarDados" access="remote" returntype="struct">
		<cfargument name="acao" type="string" required="true">
		<cfargument name="blogpostid" type="numeric" required="true">
		<cfargument name="idUsuario" type="numeric" required="true">
		<cfargument name="idCategoria" type="numeric" required="true">
		<cfargument name="title" type="string" required="true">
		<cfargument name="summary" type="string" required="true">
		<cfargument name="body" type="string" required="true">
		<cfargument name="dateposted" type="date" required="true">
		
		<cfscript>
			strRetorno = {};
			if(not compareNoCase(arguments.acao,'novo')) {
				this.setCadastrar(
					arguments.idUsuario
					,arguments.idCategoria
					,arguments.title
					,arguments.summary
					,arguments.body
					,arguments.dateposted
				);
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.mensagem;
			}
			else if(not compareNoCase(arguments.acao,'alterar')){
				this.setUpdate(
					arguments.blogpostid
					,arguments.idUsuario
					,arguments.idCategoria
					,arguments.title
					,arguments.summary
					,arguments.body
					,arguments.dateposted
				);
				
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.mensagem;
			}
			else if(not compareNoCase(arguments.acao,'remover')){
				this.setExcluir(
					arguments.blogpostid
				);
				
				strRetorno.retorno = strRetorno.retorno;
				strRetorno.mensagem = strRetorno.mensagem;
			}
		</cfscript>
		
		<cfreturn strRetorno>
		
	</cffunction>
	
	
</cfcomponent>
