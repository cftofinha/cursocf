component{

	function configure(){

		route( "/", "home.index" );
		
		route( "/blog/verificar-se-categoria-existe/:categoria?", "blog.dspVerificarSeCategoriaExiste" );
		route( "/blog/acoes-categorias", "blog.actCategorias" );

	}

}