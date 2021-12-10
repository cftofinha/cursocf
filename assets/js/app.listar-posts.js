var urlApiRest = "http://localhost:8500/rest/api";
jQuery(document).ready(function(){
	
	$('#tabelaRegistros').DataTable( {
		"processing": true,
		"ajax": urlApiRest + "/blog/listagem-de-posts",
		"type": "get",
		"columns": [
			{ "data": "id" },
			{ "data": "titulo" },
			{ "data": "categoria" },
			{ "data": "qtdComentarios" },
			{ "data": "dataPostagem" }
		]
	});

});