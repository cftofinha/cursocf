jQuery(document).ready(function(){
	
	$("#btnLogin").click(function(){
		var username = $("#login").val();
		var password = $("#senha").val();
		
		var jsonObj = '{"username":"' + username +'","password":"' + password + '"}';
		
		//alert("jsonObj ==> " + jsonObj);
		
		$.ajax({
			url: 'http://localhost:8500/rest/api/usuario/login',
			type:'post',
			data: JSON.stringify($.parseJSON(jsonObj)),
			dataType: 'json',
			contentType: "application/json",
			success: function (response){
				console.log(response);
				if(response.success){
					sessionStorage.setItem("logado", true);
					sessionStorage.setItem("user", response.data.username);
					sessionStorage.setItem("token", response.token);
					//window.location = urlSistema + "index.cfm/login/validar-login;
					//console.log("Nome do usuario ==> " + response.data.firstname);
					submitLogin();
				} else {
					alert(response.data);
				}
			}
		});
	});
});

function submitLogin(){
	document.formLogin.action = urlSistema + "index.cfm/login/validar-login";
	document.formLogin.submit();
}