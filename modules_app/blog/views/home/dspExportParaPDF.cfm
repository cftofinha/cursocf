<cfscript>
	if(structKeyExists(event.getRoutedStruct(),"id") && isNumeric(event.getRoutedStruct().id)){
		blogPost = EntityLoad("BlogPost", event.getRoutedStruct().id, true);
	} else {
		location("#event.getHTMLBaseURL()#index.cfm/blog/", "false");
	}
	//writeDump(qPosts);
	//abort;
</cfscript>
<cfif !isNull(blogPost)>
	<cfdocument format="pdf" name="pdfGeradoByCfDocument">
		<cfdocumentitem type="header">
			<h1 style="text-align:center;">Gerado pelo Curso CF</h1>
		</cfdocumentitem>	
		<cfoutput>
		<h1>
			#blogPost.getTitle()#
		</h1>
		<p>
			<strong>Data de Postagem</strong>: #dateformat(blogPost.getDatePosted(),'mm/dd/yyyy')#
		</p>
		<p>	
		#blogPost.getBody()#
		</p>		
		</cfoutput>
	</cfdocument>	
	<cfpdf action="addWatermark" source="pdfGeradoByCfDocument" image="#event.getHTMLBaseURL()#assets/images/watermark.jpeg" foreground="yes" overwrite="yes" />
	<cfcontent variable="#toBinary(pdfGeradoByCfDocument)#" type="application/pdf" /> 
<cfelse>
	<h1 style="color:#000 !important">Post Não Encontrado</h1>
</cfif>	