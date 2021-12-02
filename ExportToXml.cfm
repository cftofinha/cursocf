<cfif isDefined("url.id") and compareNoCase(url.id,"") and isNumeric(url.id)>
	<cfset variables.condicoes = " a.blogpostid = #url.id#" />
<cfelse>
	<cfset variables.condicoes = " 0 = 0" />
</cfif>
<cfset instCFCPost = createObject("component","PostBlog") />
<cfset blogPost = instCFCPost.getPostsBlog(condicoesFiltro: variables.condicoes) />

<cfif blogPost.recordCount>
	<cfxml variable="conteudoPost">
	<post postid="<cfoutput>#blogPost.id#</cfoutput>">
		<cfoutput query="blogPost">
			<categoria id="#blogPost.idCategoria#">
				<titulo>#blogPost.title#</titulo>
				<dataPostagem>#blogPost.dateposted#</dataPostagem>
			</categoria>
		</cfoutput>
	</post>
	</cfxml>
	
	<cfdump var="#conteudoPost#">
	
	<cfoutput>
		Caminho do arquivo = #expandpath('./')# <br>
	<cftry>
		<cfset variables.noArquivoUUID = createUUID() />
		<cfset filewrite("#expandpath('./#variables.noArquivoUUID#.xml')#", conteudoPost)>
		
		<a href="#variables.noArquivoUUID#.xml" target="_blank">Exibir XML</a>
		
	<cfcatch type="any">
		<cfdump var="#cfcatch#">
	</cfcatch>
		
	</cftry>
	</cfoutput>
	<cftry>
		<cfloop array="#conteudoPost.post.xmlchildren#" index="i" >
			<cfoutput>
				title: #i.titulo.xmlText#<br/>
				dateposted: #i.dataPostagem.xmlText#<br/>
				<!---conteudo: #i.conteudo.xmlText#<br/>--->
			</cfoutput>
			<br>
		</cfloop>
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
		</cfcatch>
	</cftry>
</cfif>	