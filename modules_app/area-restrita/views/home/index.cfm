<cfset qContadores = createObject("component","area-restrita.models.PostBlog").getContadores() />
<cfoutput>
<main>
	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">Área Restrita do blog</h1>
				<p class="lead text-muted">Bem vindo #session.usuario.nomeUsuario#</p>
				<p>
					<a href="##" class="btn btn-primary my-2">Alterar meus dados</a>
					<a href="#event.getHTMLBaseURL()#index.cfm/logout" class="btn btn-secondary my-2">Sair do Sistema</a>
				</p>
			</div>
		</div>
	</section>
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="container marketing">
				
				<div class="row">
					<cfloop query="qContadores">
						<div class="col-lg-4">
							<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="##777"/><text x="50%" y="50%" fill="##777" dy=".3em">Blog</text></svg>
							<h2>#qContadores.tabela#</h2>
							<p>#qContadores.qtd#</p>
							<p><a class="btn btn-secondary" href="#event.getHTMLBaseURL()#index.cfm/area-restrita/#qContadores.linkTabela#/#qContadores.tabela#">Gerenciar #qContadores.tabela#</a></p>
						</div>
					</cfloop>
					<!---<div class="col-lg-4">
						<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="##555"/><text x="50%" y="50%" fill="##555" dy=".3em">Categorias</text></svg>
						<h2>Categorias</h2>
						<p>5</p>
						<p><a class="btn btn-secondary" href="#event.getHTMLBaseURL()#index.cfm/area-restrita/listar-categorias">Gerenciar Categorias</a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="##333"/><text x="50%" y="50%" fill="##333" dy=".3em">Comentários</text></svg>
						<h2>Comentários</h2>
						<p>2</p>
						<p><a class="btn btn-secondary" href="#event.getHTMLBaseURL()#index.cfm/area-restrita/listar-comentarios">Gerenciar Comentários</a></p>
					</div>--->
			</div>
		</div>
	</div>
</main>
</cfoutput>