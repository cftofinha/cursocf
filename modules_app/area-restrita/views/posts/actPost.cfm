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
			/*if(isDate(form.dateposted)){
				variables.dateposted = lsDateFormat(form.dateposted, 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
			} else {
				variables.dateposted = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
			}*/
			
			try {
				
				variables.structform = {};
				if(compareNoCase(form.id, "") && compareNoCase(form.id, "0")){
					variables.structform['idPost'] = form.id;
				}
				variables.structform['idUsuario'] = form.idUsuario;
				variables.structform['idCategoria'] = form.categoria;
				variables.structform['titulo'] = form.title;
				variables.structform['resumo'] = form.summary;
				variables.structform['conteudo'] = form.body;
				variables.structform['dataPostagem'] = form.dateposted;
				
				variables.structform = serializeJSON(variables.structform);
				
				cfhttp(url="http://localhost:8500/rest/api/blog/salvar-post", method="post", result="httpResposta", timeout="60"){
					cfhttpparam(type="header", name="Content-Type", value="application/json");
					cfhttpparam(type="body", value="#variables.structform#");
				}
				variables.mensagem = httpResposta.fileContent;
				/*qResult = instCFC.setSalvarDados(
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
				}*/
				
			} catch (Exception e){
				variables.mensagem = e.message;
				writeDump(e);
				abort;
			}
		}
	}
</cfscript>
<cfdump var="#httpResposta#">
<cfoutput>
	<strong>#httpResposta.fileContent#!</strong>
</cfoutput>