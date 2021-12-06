<!---<cfdump var="#form#">--->
<!---<cfdump var="#event.getRoutedStruct()#"><cfabort>--->
<cfscript>
	instCFC = createObject("component","area-restrita.models.PostBlog");
	
	if(structKeyExists(event.getRoutedStruct(),"acao") && not compareNoCase(event.getRoutedStruct().acao,"remover")){
		variables.dateposted = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
		qResult = instCFC.setSalvarDados(
			acao: "remover"
			, blogpostid: event.getRoutedStruct().id
			,idUsuario: 0
			,idCategoria: 0
			,title: ""
			,summary: ""
			,body: ""
			,dateposted: variables.dateposted
		)
		//writeDump(form);
		//abort;
	} else {
		if(isDefined("form.id") and isNumeric(form.id)){
			if(isDate(form.dateposted)){
				variables.dateposted = lsDateFormat(form.dateposted, 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
			} else {
				variables.dateposted = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
			}
			
			try {
				qResult = instCFC.setSalvarDados(
					acao: form.acao
					,blogpostid: form.id
					,idUsuario: form.idUsuario
					,idCategoria: form.categoria
					,title: form.title
					,summary: form.summary
					,body: form.body
					,dateposted: variables.dateposted
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