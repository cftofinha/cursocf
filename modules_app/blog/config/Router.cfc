component{

	function configure(){

		route( "/", "home.index" );
		
		route( "/posts-com-orm", "home.dspPostsComOrm" );
		route( "/posts-com-orm-querys", "home.dspPostsOrmComQuerys" );
		
		route( "/detalhar-post/:id?/:tipoDeConsulta?", "home.dspDetalharPost" );
		
		route( "/exportar-para-pdf/:id?", "home.dspExportParaPDF" );

	}

}