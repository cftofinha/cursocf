<cfset qCategorias = createObject("component","area-restrita.models.CategoriasBlog").getCategorias(condicoesFiltro: "0 = 0") />

<cfif structKeyExists(event.getRoutedStruct(),"id")>
	<cfset variables.condicoes = "blogpostid = " & event.getRoutedStruct().id />
	<cfset variables.id = event.getRoutedStruct().id />
	<cfset variables.acao = "alterar" />
<cfelse>
	<cfset variables.condicoes = "blogpostid = " & 0 />
	<cfset variables.id = 0 />
	<cfset variables.acao = "novo" />
	<cfif not compareNocase(event.getCurrentRoutedUrl(), 'area-restrita/alterar-post/')>
		<cflocation url="#event.getHTMLBaseURL()#index.cfm/area-restrita/cadastrar-post" addtoken="false">
	</cfif>
</cfif>
<cfset qPosts = createObject("component","area-restrita.models.PostBlog").getPostsBlog(condicoesFiltro: variables.condicoes) />
<!---<cfdump var="#qPosts#"><cfabort>--->

<cfparam name="form.id" default="#variables.id#">
<cfparam name="form.submitted" default="0">
<cfparam name="form.categoria" default="#qPosts.idCategoria#">
<cfparam name="form.title" default="#qPosts.titulo#">
<cfparam name="form.summary" default="#qPosts.resumo#">
<cfparam name="form.body" default="#qPosts.conteudo#">
<cfparam name="form.datePosted" default="#qPosts.dataPostagem#">
<cfoutput>
	<div class="container">
		<h1 class="jumbotron-heading"><p class="lead text-muted">Bem vindo #session.usuario.nomeUsuario#</p></h1>
		<p class="lead text-muted">
			Utilize o formulário abaixo para salvar os dados 
		</p>
		<!---<cfif isDefined("session.msgErro")>
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>ERRO #session.codErro#!</strong>#session.msgErro#
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</cfif>--->
		<div class="card">
			<div class="card-body">
				<form name="formLogin" id="formLogin" action="#event.getHTMLBaseURL()#index.cfm/area-restrita/acoes-post" method="post">
					<input type="hidden" name="acao" id="acao" value="#variables.acao#">
					<input type="hidden" name="submitted" id="submitted" value="1">
					<input type="hidden" name="id" id="id" value="#variables.id#">
					<input type="hidden" name="idUsuario" id="idUsuario" value="#session.usuario.idUsuario#">
					<div class="form-group">
						<label for="login">Categoria</label>
						<select name="categoria" id="categoria" class="form-select" aria-label=".form-select-lg example">
							<option value="0" selected="selected">--Selecione--</option>
							<cfloop query="qCategorias">
								<option value="#qCategorias.id#" <cfif not compareNocase(qCategorias.id, form.categoria)> selected='selected'</cfif> >#qCategorias.name#</option>
							</cfloop>
						</select>
					</div>
					<div class="form-group">
						<label for="title">Titulo</label>
						<input type="text" name="title" id="title" class="form-control" value="#form.title#">
					</div>
					<div class="form-group">
						<label for="summary">Resumo</label>
						<textarea name="summary" id="summary" class="form-control" cols="4">#form.summary#</textarea>
					</div>
					<div class="form-group">
						<label for="body">Conteúdo</label>
						<textarea name="body" id="body" class="form-control" cols="4">#form.body#</textarea>
					</div>
					<div class="form-group">
						<label for="title">Data de Postagem</label>
						<input type="text" name="datePosted" id="datePosted" class="form-control" value="#form.datePosted#">
					</div>
					<br />
					<button type="submit" class="btn btn-primary">Salvar registro</button>
				</form>
			</div>
		</div>
	</div>
</cfoutput>