<cfsilent>
<cfset instComponente = createObject("component","MeuComponente") />
<cfset variables.nomeCompleto = instComponente.getFullName(firstName="Curso", lastName="Senac de CF") />
<cfif isDefined("session.usuarioAtual")>
	<cfset qUser = instComponente.getDadosUser(usuarioAtual: session.usuarioAtual) />
<cfelse>
	<cfset qUser = instComponente.getDadosUser() />
</cfif>
<cfset qConsulta = instComponente.getCategorias() />
<!---<cfdump var="#qUser#" label="Usuarios">
<cfdump var="#qConsulta#" label="Categorias">
<cfabort>--->
<!---<cfdump var="#qUser#"><cfabort>--->

<cfparam name="url.myName" default="#session.nomeUsuario#">
<cfset session.nome = url.myName />
<cfparam name="url.myPosition" default="ColdFusion Developer">
<cfset variables.conteudoDev = "Professional Web design and Development and specializes in developing 
							<span>clean, effective and smart&nbsp;&nbsp;</span>websites" />
</cfsilent>

<!---<cfdump var="#qConsulta#"><cfabort>--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Clean Slide Responsive Vcard Template" />
	<meta name="keywords" content="jquery, Responsive Vcard, Template, Vcard, Clean Slide" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title><cfoutput>#application.site#</cfoutput></title>
	
	<!-- Loading Google Web fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
	
	<!-- CSS Files -->
	<link href="assets/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"  id="color" />
	<link href="assets/css/typography.css" rel="stylesheet" type="text/css"  id="customFont"/>
	<link href="assets/css/arial_content.css" rel="stylesheet" type="text/css"  id="contentfont"/>
	
	<!-- include jQuery library -->
	<script type="text/javascript" src="assets/js/jquery-1.7.min.js"></script>

	<script src="assets/js/raphael.js" type="text/javascript"></script>
	<script src="assets/js/init.js" type="text/javascript"></script>
</head>
	
<body>

	<!-- wrapper -->
	<div class="clr" id="top-head">&nbsp;</div>
	<div id="container">
		<!--header -->
		<div id="header" >
			<div class="logo-bg" >
				<!--logo -->
				<div class="logo">
					<img src="assets/images/logo.png" alt="Logo" width="202" height="52" border="0"  id="logo" />
				</div>
				
				<!--head right -->
				<div class="right">
				
					<!--// Navigation //-->
					<div class="menu_nav">
						<div id="nav-wrap">
							<ul class="arrowunderline" id="nav">
								<li class="home" id="selected"><a href="index.cfm">Home</a></li>
								<li class="about"><a href="cadastrarUsuario.cfm?idUsuario=<cfoutput>#qUser.id#</cfoutput>">Usuário</a></li>
								<!---<li class="resume"><a href="resume.cfm">Resume</a></li>--->
								<li class="blog"><a href="blog.cfm">Blog</a></li>
								<!---<li class="portfolio"><a href="portfolio.cfm">Portfolio</a></li>--->
								<li class="contact"><a href="contact.cfm">Contact</a></li>
								<li class="contact"><a href="cadastrarPostBlog.cfm?idUsuario=<cfoutput>#qUser.id#</cfoutput>">Post Blog</a></li>	
							</ul>
						</div>
					</div>
					<!--// Navigation End //-->
				</div>
				<!--// -head right end //-->
			</div>
			<!--// logo bg end //-->
		</div>
		<!--header end -->
	
		<!-- Content Start -->
  	
		<!--Card  -->
		<div id="content">
			<div class="card-pattern">
				<!--home -->
				<div id="home">
					<div class="clr">
						<div class="top-bg">
							<div class="top-left" >
								<!-- Data Output -->
								<!---<cfset StructDelete(Session, "usuarioAtual") />--->
								<!---This is where the name and position are output--->
								<cfif isDefined("session.usuarioAtual")>
									<div class="tag">
										Olá, <span><cfoutput>--</cfoutput>,</span>
									</div>
									<div class="sub-tag"><cfoutput>#url.myPosition#</cfoutput></div>
								<cfelse>
									<div class="tag">
										<span>Usuário não logado</span>
									</div>
								</cfif>
							</div> 
						</div>
					</div>
					<div class="clr">
						<div class="pat-topleft">&nbsp;</div>
						<div class="middle"></div>
						<div class="pat-topright">&nbsp;</div>
					</div>
					<div class="clr pat" >
						<p>
							<cfoutput>#variables.conteudoDev#</cfoutput>
						</p>
					</div>
					<div class="clr">
						<div class="pat-bottomleft">&nbsp;</div>
						<div class="pat-bottomright">&nbsp;</div>
					</div>
					<div class="clr">
						<h2>Specialising in</h2>
						<div class="special">
							Lorem ipsum dolor sit amet, habitasse pretium dolor sociis. Nulla et facilisis interdum elit amet.
						</div>
					</div>
					<div class="clr">
						<div>
							<!---<cfdump var="#arrDataTecnologias#">--->
							<cfoutput query="qConsulta">
								<!---<cfloop query="qConsulta">--->
									<div class="#qConsulta.css#">
										<img src='assets/images/#qConsulta.imagem#'  border="0" height="" alt=" "  />
										<h3>#qConsulta.name#</h3>
									</div>
								<!---</cfloop>--->
								<!---<cfloop array ="#arrDataTecnologias#" index="data">
									<div class="#data.css#">
										<img src='assets/images/#data.imagem#'  border="0" height="" alt=" "  />
										<h3>#data.nome#</h3>
									</div>
								</cfloop>--->
								<!--- <cfset listDataTecnologias = 'ColdFusion,jQuery,CSS,HTML'>
								<cfloop list="#listDataTecnologias#" index="valorDaLista" delimiters=",">
									<div class="#lCase(valorDaLista)#">
										<img src='assets/images/#lCase(valorDaLista)#-image.png'  border="0" height="" alt=" "  />
										<cfif not compareNocase(valorDaLista, 'ColdFusion')>
											<h3>#valorDaLista#<br />Coding</h3>
										<cfelseif not compareNocase(valorDaLista, 'jQuery')>
											<h3>#valorDaLista# <br />Customisation</h3>
										<cfelseif not compareNocase(valorDaLista, 'CSS')>
											<h3>#valorDaLista# 3<br />Customisation</h3>
										<cfelseif not compareNocase(valorDaLista, 'HTML')>
											<h3>#valorDaLista# 5<br />Customisation</h3>
										</cfif>
									</div>
								</cfloop>--->
							</cfoutput>
						</div>
					</div>
					<div class="clr bottom-space"></div>
				</div>
				<!--home end -->
				
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
	<!---<cfset StructClear(Session)>--->
	<!---<cfset StructDelete(Session, "nome")>--->
	<!---<cfdump var="#variables#">--->
</body>
</html>
