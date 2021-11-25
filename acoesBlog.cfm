<!---
nome da tabela: blogPost
campos:
idUsuario (int)
idCategoria (int)
title (string)
summary (string)
body (string)
dateposted (datetime: yyyy-mm-dd HH:mm:ss)
createdDateTime (datetime: yyyy-mm-dd HH:mm:ss)
--->

<cfif isDefined("form.acaoForm") and not compareNoCase(form.acaoForm,"novo")>
	<cfset variables.dataPostagem = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
	<cfif isDefined('form.dateposted') and compareNoCase(form.dateposted, '') and isDate(form.dateposted)>
		<cfset variables.dateposted = lsDateFormat(form.dateposted, 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
	<cfelse>
		<cfset variables.dateposted = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss') />
	</cfif>
	
	<cftry>
		<cfquery datasource="#application.datasource#">
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
				<cfqueryparam value="#form.idUsuario#" cfsqltype="cf_sql_integer" maxlength="4">
				, <cfqueryparam value="#form.idCategoria#" cfsqltype="cf_sql_integer" maxlength="4">
				, <cfqueryparam value="#form.title#" cfsqltype="cf_sql_varchar" maxlength="70">
				, <cfqueryparam value="#form.summary#" cfsqltype="cf_sql_longvarchar">
				, <cfqueryparam value="#form.body#" cfsqltype="cf_sql_longvarchar">
				, <cfqueryparam value="#variables.dateposted#">
				, <cfqueryparam value="#variables.dataPostagem#">
			)
		</cfquery>
			<h3>Post Cadastrado com sucesso</h3>
			<p><a href="index.cfm">Retorne a página inicial</a></p>
			
			<cfquery name="qCons" datasource="#application.datasource#">
				select * from blogPost
			</cfquery>
			<cfdump var="#qCons#">
			
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
		</cfcatch>
		
	</cftry>

<cfelseif isDefined("form.acaoForm") and not compareNoCase(form.acaoForm,"atualizar")>
<!--- depois --->	
<cfelse>
	<cflocation url="cadastrarPostBlog.cfm" addtoken="false">
</cfif>
