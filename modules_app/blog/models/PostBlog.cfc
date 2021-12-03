<cfcomponent displayname="PostBlog">
	
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
	
	<cffunction name="setCadastrar" output="false" access="public" returntype="Any">
		<cfargument name="idUsuario" type="numeric" required="true">
		<cfargument name="idCategoria" type="numeric" required="true">
		<cfargument name="title" type="string" required="true">
		<cfargument name="summary" type="string" required="true">
		<cfargument name="body" type="string" required="true">
		<cfargument name="dateposted" type="date" required="true">
		
		<cfset variables.dataPostagem = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
		
		<cftry>
			<cfquery datasource="#application.config.datasource#">
				insert into blogPost (
					idUsuario
					, idCategoria
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
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
			</cfcatch>
		
		</cftry>
		<cfreturn >
		
	</cffunction>
	
	<cffunction name="getComentariosPostBlog" output="false" access="remote" returntype="query">
		<cfargument name="condicoesFiltro" type="string" required="true">
		<cfquery name="qComentarios" datasource="#application.config.datasource#">
			select a.blogCommentId as id
					,a.blogpostid
					, a.author as usuario
					, a.comment as comentario
					, a.createdDateTime
			 from blogComment a
			 where #preserveSingleQuotes(arguments.condicoesFiltro)#
		</cfquery>
		
		<cfreturn qComentarios>
		
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
