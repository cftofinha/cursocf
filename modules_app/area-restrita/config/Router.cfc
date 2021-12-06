component{

	function configure(){

		route( "/", "home.index" );
		
		route( "/listar-posts/:titulo?", "posts.dspListagem" );
		route( "/cadastrar-post/:id?", "posts.dspSalvarPost" );
		route( "/alterar-post/:id?", "posts.dspSalvarPost" );
		route( "/acoes-post/:id?/:acao?", "posts.actPost" );
		//
		
		route( "/listar-categorias/:titulo?", "categorias.dspListagem" );
		route( "/cadastrar-categoria/:id?", "categorias.dspSalvarCategoria" );
		route( "/alterar-categoria/:id?", "categorias.dspSalvarCategoria" );
		route( "/acoes-categorias", "categorias.actCategorias" );
		//
		
		route( "/listar-comentarios/:titulo?", "comentarios.dspListagem" );
		route( "/cadastrar-comentario/:id?", "comentarios.dspSalvarComentario" );
		route( "/alterar-comentario/:id?", "comentarios.dspSalvarComentario" );
		route( "/acoes-comentarios", "comentarios.actComentarios" );
		//

	}

}