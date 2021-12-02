<cfif isDefined("url.id") and compareNoCase(url.id,"") and isNumeric(url.id)>
	<cfset variables.condicoes = " a.blogpostid = #url.id#" />
<cfelse>
	<cfset variables.condicoes = " a.blogpostid = 0" />
</cfif>
<cfset instCFCPost = createObject("component","PostBlog") />
<cfset blogPost = instCFCPost.getPostsBlog(condicoesFiltro: variables.condicoes) />
<cfif blogPost.recordCount>
	<cfdocument format="pdf" name="myGeneratedPDF">
		<cfdocumentitem type="header">
			<h1 style="text-align:center;">Gerado pela CFDOCUMENT</h1>
		</cfdocumentitem>	
		<cfoutput>
		<h1>
			#blogPost.title#
		</h1>
		<p>
			<strong>Date Posted</strong>: #blogPost.dateposted#
		</p>
		<p>	
		#blogPost.body#
		</p>		
		</cfoutput>
	</cfdocument>	
	<cfpdf action="addWatermark" source="myGeneratedPDF" image="assets/images/watermark.jpeg" foreground="yes" overwrite="yes" />
	<cfcontent variable="#toBinary(myGeneratedPDF)#" type="application/pdf" />
</cfif>	