<cfcomponent displayname="ComentariosPost">
	
	<cffunction name="getComentarioPosts" output="false" access="remote" returntype="query">
		<cfargument name="condicoesFiltro" type="string" required="true">
		<cfquery name="qComentarios" datasource="#application.config.datasource#">
			select a.blogCommentid as id
					, a.author
					, a.comment
					, a.blogpostid
					, DATE_FORMAT(a.createdDateTime,'%d/%m/%Y %H:%i:%s') as dataHoraSistema
			 from BlogComment a
			 where #preserveSingleQuotes(arguments.condicoesFiltro)#
		</cfquery>
		
		<cfreturn qComentarios>
		
	</cffunction>
	
	
</cfcomponent>
