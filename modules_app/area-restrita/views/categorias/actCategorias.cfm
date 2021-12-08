<!---<cfdump var="#form#">--->
<!---<cfdump var="#event.getRoutedStruct()#"><cfabort>--->
<cfscript>
	instCFC = createObject("component","area-restrita.models.CategoriasBlog");
	
	if(structKeyExists(event.getRoutedStruct(),"acao") && not compareNoCase(event.getRoutedStruct().acao,"remover")){
		variables.dateposted = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
		qResult = instCFC.setSalvarDados(
			acao: "remover"
			, blogCategoryid: event.getRoutedStruct().id
			,name: ""
			,summary: ""
			,imagem: ""
			,css: ""
		)
		//writeDump(form);
		//abort;
	} else {
		if(isDefined("form.id") and isNumeric(form.id)){
			try {
				qResult = instCFC.setSalvarDados(
					acao: form.acao
					,blogCategoryid: form.id
					,name: form.name
					,imagem: form.imagem
					,css: form.css
				)
				
				if(not compareNoCase(qResult.retorno,"sucesso")){
					variables.mensagem = qResult.mensagem;
				}
				
			} catch (Exception e){
				variables.mensagem = e.message;
				writeDump(e);
				abort;
			}
		} else {
			
		}
	}
	
</cfscript>
<cfdump var="#qResult#">
<cfoutput>
	<strong>#qResult.mensagem#!</strong>
</cfoutput>