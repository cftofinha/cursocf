<cfset instComponente = createObject("component","MeuComponente") />
<cfset qPosts = createObject("component","PostBlog").getPostsBlog() />
<cfset qCategorias = instComponente.getCategorias() />
<cfif isDefined("session.usuarioAtual")>
	<cfset qUser = instComponente.getDadosUser(usuarioAtual: session.usuarioAtual) />
<cfelse>
	<cfset qUser = instComponente.getDadosUser() />
</cfif>
<cfset variables.idUsuario = qUser.id />

<cfset variables.acaoForm = "novo">
<cfset variables.txtForm = "Novo registro de Post" />

<cfset contactInfo = {address='Águas Claras - Brasilia/DF', phonenumber='(61) 98332-4846', email='tofinha@gmail.com', skype='cftofinha'} />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Clean Slide Responsive Vcard Template" />
	<meta name="keywords" content="jquery, Responsive Vcard, Template, Vcard, Clean Slide" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title>This is my WebSite</title>
	
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
								<li class="home"><a href="index.cfm">Home</a></li>
								<li class="about"><a href="about.cfm">About</a></li>
								<li class="resume"><a href="resume.cfm">Resume</a></li>
								<li class="blog"><a href="blog.cfm">Blog</a></li>
								<li class="portfolio"><a href="portfolio.cfm">Portfolio</a></li>
								<li class="contact" id="selected"><a href="contact.cfm">Contact</a></li>	
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
				<!-- contact -->
				<div id="contact">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div><h1>Cadastrar Post de Blog</h1></div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="clr">
						<div class="clr">
							<h6>
								<span>Utilize o formulário abaixo para cadastrar posts de Blog</span><br />
								Este formulário terá uma página de ação
							</h6>
						</div>
						<div class="clr hline">&nbsp;</div>
						<div class="left">
							<div class="clr">
								<div id="respond">
									<h2><cfoutput>#variables.txtForm#</cfoutput></h2>
									<!-- Message Output -->
									<div id="post_message" class="post_message"></div>
									
									<div class="boxBody">			  
										<div class="desc">
											<cfoutput>
												<form name="form" id="form" action="acoesBlog.cfm" method="post">
													<input type="hidden" name="acaoForm" id="acaoForm" value="#variables.acaoForm#">
													<input type="hidden" name="idUsuario" id="idUsuario" value="#variables.idUsuario#">
													<div>
														<label>Categoria <span class="font-11">(required)</span></label>
														<select name="idCategoria" id="idCategoria">
															<cfloop query="qCategorias">
																<option value="#qCategorias.id#">#qCategorias.name#</option>
															</cfloop>
														</select>
													</div>
													<div>
														<label>Título <span class="font-11">(required)</span></label>
														<input name="title" id="title" type="text" class="required" />
													</div>
													<div>
														<label>Data de postagem <span class="font-11">(required)</span></label>
														<input name="dateposted" id="dateposted" type="text" class="required" value="#lsDateFormat(now(), 'dd/mm/yyyy')#" />
													</div>
													<div class="textarea">
														<label>Resumo <span class="font-11">(required)</span></label>				
														<textarea name="summary" id="summary" rows="6" cols="60" class="required"></textarea>		
													</div>
													<div class="textarea">
														<label>Conteúdo <span class="font-11">(required)</span></label>				
														<textarea name="body" id="body" rows="6" cols="60" class="required"></textarea>		
													</div>
													<div>
														<input id="submitBtn" value="Salvar" name="submit" type="submit" class="submitBtn" />
													</div>
												</form>
											</cfoutput>
										</div><!--END desc show--> 
									<!--END desc-->	
									</div>					
									<div  class="clr"></div>
								</div>
							</div>
						</div>
					</div>
					<!--//left end //-->
					<div class="right">
						<div class="clr">
							<!-- Personal Information -->
							<h2>Contact Info</h2>
							<div class="clr">
								<cfoutput>
									<div class="clr"><div class="input-box1">Address</div><span>#contactInfo.address#</span></div>
									<div class="clr"> &nbsp;</div>
									<div class="clr"><div class="input-box1">Phone</div><span>#contactInfo.phonenumber#</span></div>
									<div class="clr"><div class="input-box1">E-mail</div><span><a href="##">#contactInfo.email#</a></span>  </div>
									<div class="clr"><div class="input-box1">Skype </div> <span><a href="##">contactInfo.skype</a></span> </div> 
								</cfoutput>
							</div>
							<div class="clr">
								<div class="pad-top5"></div>
								<h2>Latest Tweet</h2>
								<div class="twitter clr"> 
									<!-- Twitter Output -->
									<ul>
										<li>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div><!--//clr end //-->
					<div class="clr"></div>
				</div><!-- contact end -->
		
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
</body>
</html>