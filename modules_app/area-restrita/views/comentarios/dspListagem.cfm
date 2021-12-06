<cfoutput>
<main>
	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">Gerenciar</h1>
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
						<th scope="col">Titulo</th>
						<th scope="col">Resumo</th>
						<th scope="col">Ações</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>--</td>
						<td>--</td>
						<td>--</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</main>
</cfoutput>