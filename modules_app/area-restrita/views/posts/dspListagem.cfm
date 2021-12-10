<cfset qCons = createObject("component","area-restrita.models.PostBlog").getPostsBlog(condicoesFiltro: "0 = 0") />
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
			<h3><a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/cadastrar-post" class="btn btn-primary my-2">Cadastrar Novo Post</a></h3>
			<table id="tabelaRegistros" class="display" style="width:100%">
				<thead>
					<tr>
						<th scope="col">##</th>
						<th scope="col">Titulo</th>
						<th scope="col">Categoria</th>
						<th scope="col">Comentários</th>
						<th scope="col">Data de Postagem</th>
						<th scope="col">Ações</th>
					</tr>
				</thead>
				<!---<tbody>
					<cfloop query="qCons">
						<tr>
							<th scope="row">#qCons.currentRow#</th>
							<td>#qCons.titulo#</td>
							<td>#qCons.dataPostagem#</td>
							<td>
								<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/alterar-post/#qCons.id#">Editar</a>
								 | 
								<a href="#event.getHTMLBaseURL()#index.cfm/area-restrita/acoes-post/#qCons.id#/remover">Excluir</a>
							</td>
						</tr>
					</cfloop>
				</tbody>--->
			</table>
		</div>
	</div>
</main>
</cfoutput>