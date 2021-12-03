component{

	function configure(){

		route( "/", "home.index" );
		route( "/listar-posts", "posts.dspListagem" );
		route( "/cadastrar-post/:id?", "posts.dspSalvarPost" );
		route( "/alterar-post/:id?", "posts.dspSalvarPost" );
		route( "/acoes-post", "posts.actPost" );

	}

}