<!---<cfdump var="#form#">
<!---<cfdump var="#hash('cf123@', 'SHA-256', 'UTF-8')#">--->
<cfabort>--->
<cfif isDefined("form.login") and isDefined("form.senha")>
	<cfif not compareNoCase(form.login, "") and not compareNoCase(form.senha, "")>
		<cfset session.codErro = 403 />
		<cfset session.msgErro = "Campos inválidos" />
		<cflocation url="#event.getHTMLBaseURL()#index.cfm/login" addtoken="false">
		<!---<cfdump var="AQUI">--->
	<cfelse>
		<cfscript>
			qAutenticar = createObject("component","login.models.Loginusuario").getAutenticar(login: form.login);
			//writeDump(qAutenticar);abort;
			variables.dataHoraAtual = lsDateFormat(now(), 'yyyy-mm-dd') &" "& lsTimeFormat(now(), 'HH:mm:ss');
			
			if(qAutenticar.recordcount eq 1 and not compareNoCase(Hash(qAutenticar.salt & form.senha, 'SHA-256', 'UTF-8'), qAutenticar.password)){
				//definindo uma struct do usuário em sessão
				usuario = structNew();
				usuario.idUsuario			=	qAutenticar.userid;
				usuario.nomeUsuario			=	qAutenticar.firstname;
				usuario.sobreNomeUsuario	=	qAutenticar.lastname;
				usuario.loginUsuario		=	qAutenticar.username;
				usuario.emailUsuario		=	qAutenticar.email;
				usuario.lastLoginUsuario	=	qAutenticar.lastlogin;
				
				session.usuario 			= usuario; //definido a estrutura em sessão
				session.statusLogin			= true;
				
				cflogin(idletimeout=3600) {
					cfloginuser(name="#form.login#", password="#form.senha#", roles="usuario");
 				}
 				
 				cfcookie(name="loginUsuario", value="#session.usuario.loginUsuario#", expires="never");
 				
 				location( url="#event.getHTMLBaseURL()#index.cfm/area-restrita", addtoken="false"  );
				
			} else {
				session.codErro = 403;
				session.msgErro = "Login inválido";
				location( url="#event.getHTMLBaseURL()#index.cfm/login", addtoken="false"  );
			}
		</cfscript>
		
	</cfif>
	
	<!---<cflogin>
		<cfloginuser name="#form.login#" password="#form.senha#" roles="usuario">
	</cflogin>
	<cfif isDefined("form.remember")>
		<cfcookie name="loginUsuario" value="#session.usuario.loginUsuario#" expires="never">
	</cfif>
	
	<cflocation url="#event.getHTMLBaseURL()#index.cfm/area-restrita" addtoken="false">--->
	
<cfelse>
	<!---<cfdump var="AQUI 2">--->
	<cflocation url="#event.getHTMLBaseURL()#index.cfm/login" addtoken="false">
</cfif>