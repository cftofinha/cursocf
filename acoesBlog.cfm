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
	
	<cfscript>
		instPostBlog = createObject("component","PostBlog");
		instPostBlog.setCadastrar(
			#form.idUsuario#
			,#form.idCategoria#
			,'#form.title#'
			,'#form.summary#'
			,'#form.body#'
			,'#variables.dateposted#'
		);
	</cfscript>
	
	<h3>cadastro com sucesso</h3>

<cfelseif isDefined("form.acaoForm") and not compareNoCase(form.acaoForm,"atualizar")>
<!--- depois --->	
<cfelse>
	<cflocation url="cadastrarPostBlog.cfm" addtoken="false">
</cfif>
