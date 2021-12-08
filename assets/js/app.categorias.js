var urlModulo = urlSistema + "index.cfm/area-restrita/listar-categorias";
var urlAjax = urlSistema + "index.cfm/controller-ajax/blog";

jQuery(document).ready(function(){
	
	$("#name").blur(function(){
		var nomeCategoriaAtual = $('#categoriaAtual').val();
		var nomeCategoriaNova = $(this).val().trim();
		if(nomeCategoriaNova != '' && nomeCategoriaNova != nomeCategoriaAtual){
			$.ajax({
				url: urlAjax + '/verificar-se-categoria-existe/',
				type: 'post',
				data: {categoria: nomeCategoriaNova},
				success: function(response){
					var json = $.parseJSON(response);
					console.log(json);
					console.log(json.MENSAGEM);
					//alert($('#categoriaExiste').val());
					
					$('#categoria_response').html(json.MENSAGEM);
					if(json.EXISTE == 0){
						$('#btnSalvar').prop('disabled', false);
					} else {
						$('#btnSalvar').prop('disabled', true);
					}
				}
			});
		}else{
			$("#categoria_response").html("");
		}
	});
	
	(function () {
	'use strict'
	// Fetch all the forms we want to apply custom Bootstrap validation styles to
	var forms = document.querySelectorAll('.needs-validation')
	// Loop over them and prevent submission
	Array.prototype.slice.call(forms)
		.forEach(function (form) {
			form.addEventListener('submit', function (event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
					
				} else {
					submitHandler: function(form){
						$.ajax({
							url: urlAjax + '/acoes-categorias',
							type: 'post',
							data: $(form).serialize(),
							dataType: 'json',
						}).done(function(response){
							var json = $.parseJSON(response);
							console.log(json);
							console.log(json.MENSAGEM);
						});
						return false;
					} 
					
					
				}

				form.classList.add('was-validated')
			}, false)
		})
	})();
	
});