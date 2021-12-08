<cfsetting showdebugoutput="false">
<cfsilent>
	<cfscript>
		strRetorno = {};
		variables.condicoes = "name = '#form.categoria#'";
		
		qResult = createObject("component","area-restrita.models.CategoriasBlog").getCategorias(condicoesFiltro: variables.condicoes);
		
		if(qresult.recordCount){
			strRetorno.existe = 1;
			strRetorno.mensagem = "Categoria existe na base. Escolha outro nome";
		} else {
			strRetorno.existe = 0;
			strRetorno.mensagem = "Categoria livre para uso";
		}
		
		variables.data = serializeJSON(strRetorno);
	</cfscript>
</cfsilent>
<cfoutput>#variables.data#</cfoutput>