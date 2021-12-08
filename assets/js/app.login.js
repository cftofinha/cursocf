jQuery(document).ready(function(){
	
	$("#btnLogin").click(function(){
		var username = $("#login").val();
		var password = $("#senha").val();
		
		var jsonObj = '{"username":"' + username +'","password":"' + password + '"}';
		
		alert("jsonObj ==> " + jsonObj);
		
		$.ajax({
			url: 'http://localhost:8500/rest/api/usuario/login',
			type:'post',
			data: JSON.stringify($.parseJSON(jsonObj)),
			dataType: 'json',
			contentType: "application/json",
			success: function (response){
				console.log(response);
				
				//console.log("Nome do usuario ==> " + response.data.firstname);
			}
		});
	});
});