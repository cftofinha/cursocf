<cfset qCons = createObject("component","area-restrita.models.CategoriasBlog").getCategorias(condicoesFiltro: "0 = 0") />
<cfoutput>
<main>
	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">Gerenciar #event.getRoutedStruct().titulo#</h1>
				<p class="lead text-muted">Bem vindo #session.usuario.nomeUsuario#</p>
				<p>
					<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita" class="btn btn-primary my-2">Voltar a tela inicial</a>
					<a href="#event.getHTMLBaseURL()#index.cfm/logout" class="btn btn-secondary my-2">Sair do Sistema</a>
				</p>
			</div>
		</div>
	</section>
	
	<div class="album py-5 bg-light">
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">##</th>
						<th scope="col">Nome da Categoria</th>
						<th scope="col">Imagem da Categoria</th>
						<th scope="col">CSS da Categoria</th>
						<th scope="col">Ações</th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="qCons">
						<tr>
							<th scope="row">#qCons.currentRow#</th>
							<td>#qCons.name#</td>
							<td>#qCons.imagem#</td>
							<td>#qCons.css#</td>
							<td>
								<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/alterar-categoria/#qCons.id#">Editar</a>
								 | 
								<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/acoes-categorias/#qCons.id#/remover">Excluir</a>
							</td>
						</tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	</div>
</main>
</cfoutput>