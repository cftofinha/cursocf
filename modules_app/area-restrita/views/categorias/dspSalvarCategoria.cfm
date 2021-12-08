<cfif structKeyExists(event.getRoutedStruct(),"id")>
	<cfset variables.condicoes = "blogCategoryid = " & event.getRoutedStruct().id />
	<cfset variables.id = event.getRoutedStruct().id />
	<cfset variables.acao = "alterar" />
<cfelse>
	<cfset variables.condicoes = "blogCategoryid = " & 0 />
	<cfset variables.id = 0 />
	<cfset variables.acao = "novo" />
	<cfif not compareNocase(event.getCurrentRoutedUrl(), 'area-restrita/alterar-categoria/')>
		<cflocation url="#event.getHTMLBaseURL()#index.cfm/area-restrita/cadastrar-categoria" addtoken="false">
	</cfif>
</cfif>

<cfset qCons = createObject("component","area-restrita.models.CategoriasBlog").getCategorias(condicoesFiltro: variables.condicoes) />

<cfoutput>
	<div class="container">
		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">Gerenciar Categorias</h1>
					<p class="lead text-muted">Bem vindo #session.usuario.nomeUsuario#</p>
					<p>
						<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/listar-categorias/Categorias" class="btn btn-primary my-2">Voltar a tela de categorias</a>
						<a href="#event.getHTMLBaseURL()#index.cfm/logout" class="btn btn-secondary my-2">Sair do Sistema</a>
					</p>
				</div>
			</div>
		</section>
		<h1 class="jumbotron-heading"><p class="lead text-muted">Bem vindo #session.usuario.nomeUsuario#</p></h1>
		<p class="lead text-muted">
			Utilize o formulário abaixo para salvar os dados 
		</p>
		<div class="card">
			<div class="card-body">
				<form name="formRegistro" id="formRegistro" action="#event.getHTMLBaseURL()#index.cfm/area-restrita/acoes-categorias" method="post">
					<input type="hidden" name="acao" id="acao" value="#variables.acao#">
					<input type="hidden" name="submitted" id="submitted" value="1">
					<input type="hidden" name="id" id="id" value="#variables.id#">
					<input type="hidden" name="idUsuario" id="idUsuario" value="#session.usuario.idUsuario#">
					<input type="hidden" name="categoriaAtual" id="categoriaAtual" value="#qCons.name#">
					
					<div class="row">
						<div class="col-sm-4">
							<label for="name" class="form-label">Nome da Categoria</label>
							<input type="text" name="name" id="name" class="form-control" value="#qCons.name#" required />
							<div class="invalid-feddback">Informa o nome da categoria</div>
							<div class="text-danger" id="categoria_response"></div>
						</div>
						<div class="col-sm-4">
							<label for="imagem" class="form-label">Imagem da Categoria</label>
							<input type="text" name="imagem" id="imagem" class="form-control" value="#qCons.imagem#" required />
							<div class="invalid-feddback">Informe a imagem da categoria</div>
						</div>
						<div class="col-sm-4">
							<label for="css" class="form-label">CSS da Categoria</label>
							<input type="text" name="css" id="css" class="form-control" value="#qCons.css#" required />
							<div class="invalid-feddback">Informe o css da categoria</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-8"></div>
						<div class="col-4">
							<button type="submit" name="btnSalvar" id="btnSalvar" class="btn btn-primary" <cfif not compareNocase(variables.acao, 'novo')> disabled="disabled"</cfif> >
								Salvar Registro
							</button>
						</div>	
					</div>
				</form>
			</div>
		</div>
	</div>
</cfoutput>