<cfparam name="form.nome" default="Tofinha">
<cfif isDefined("form.no_usuario") and compareNocase(form.id, "")>
	<cfquery datasource="#application.datasource#">
		update tb_personal_info set 
		no_usuario = <cfqueryparam value="#form.no_usuario#" cfsqltype="cf_sql_varchar" maxlength="50">
		where id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer" maxlength="4">
	</cfquery>
	<cfset form.nome = "#form.no_usuario#">
</cfif>
<cfif isDefined("url.salvar") and not compareNoCase(url.salvar, 'banco')>
	<cfif isDefined("url.nome") and compareNoCase(url.nome, '')>
		<cfquery datasource="#application.datasource#">
			insert into tb_personal_info (no_usuario, dt_nascimento, ds_endereco, nu_telefone, ds_email, ds_site, no_skype)
			values('#url.nome#', '04/01/1975', 'Águas Claras - Brasilia/DF', '(61) 98332-4846', 'tofinha@gmail.com', 'http://www.adobe.com/products/coldfusion', 'cftofinha')
		</cfquery>
	</cfif>
</cfif>

<cfquery name="qDados" datasource="#application.datasource#">
	select id, no_usuario, dt_nascimento, ds_endereco, nu_telefone, 
		ds_email, ds_site, no_skype
	from tb_personal_info
	where no_usuario = <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar" maxlength="50">
</cfquery>

<cfif qDados.recordCount gt 0>
	<cfscript>
		personalInfo = {name='#qDados.no_usuario#', dob='#qDados.dt_nascimento#', address='#qDados.ds_endereco#', phonenumber='#qDados.nu_telefone#', email='#qDados.ds_email#', website='#qDados.ds_site#', skype='#qDados.no_skype#'};
	</cfscript>
<cfelse>
	<cfscript>
		personalInfo = {name='Tofinha', dob='23/11/2021', address='Águas Claras', phonenumber='(61) 98332-4846', email='tofinha@gmail.com', website='http://www.adobe.com/products/coldfusion', skype='cftofinha'};
	</cfscript>	
</cfif>
<!---<cfdump var="#personalInfo#">
<cfabort>--->
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
								<li class="about" id="selected"><a href="about.cfm">About</a></li>
								<li class="resume"><a href="resume.cfm">Resume</a></li>
								<li class="blog"><a href="blog.cfm">Blog</a></li>
								<li class="portfolio"><a href="portfolio.cfm">Portfolio</a></li>
								<li class="contact"><a href="contact.cfm">Contact</a></li>	
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
			<!-- about -->
				<div id="about">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div><h1>About me - <cfoutput>#session.nomeUsuario#</cfoutput></h1></div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="clr">
						<h6>
							<span>A little about myself, and the UI &amp; UX design services I provide. </span> <br />.If you are interested to know something about me then you can read the info below.
						</h6>
					</div>
					<div class="clr hline">&nbsp;</div>
					<div class="clr">
						<div class="left">
							<div id="SliderBackground">
								<div id="Slider" align="center" >
									<img src="assets/images/headshot/headshot.jpg" alt="photo" />
								</div><!-- #Slider -->   
							</div><!-- #SliderBackground -->
						</div>
						<div class="content">
							<h2>A brief info about me</h2>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nunc ante, feugiat molestie fringilla id, faucibus ut sem. Aenean vitae purus vel nibh porttitor adipiscing. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum congue lectus eu magna porta consectetur. Duis in adipiscing nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac. 
							</p>
							<h2>Stay Connected</h2>
							<ul class="no-list social-list">
								<li class="social-list-twitter"> <span>Twitter Profile</span> <a href="http://twitter.com/username">http://twitter.com/username</a> </li>
								<li class="social-list-facebook"> <span>Facebook Profile</span> <a href="http://facebook.com/username">http://facebook.com/username</a> </li>
							</ul>
							
							<form name="formRegistro" id="formRegistro" method="post" action="about.cfm">
								<cfoutput>
								<label>Nome</label>
								<input type="hidden" name="id" id="id" value="#qDados.id#">
								<input type="text" name="no_usuario" id="no_usuario" value="#qDados.no_usuario#">
									
								<input type="submit" value="Salvar dados">
								</cfoutput>
							</form>
							
							
						</div>
						<!-- Personal Information Output -->
						<div class="right">
							<h2>Personal Info</h2>
							<cfoutput>
								<div class="clr"><div class="input-box">Name </div><span>#personalInfo.name#</span> </div>
								<div class="clr"><div class="input-box">Date of birth </div><span> #personalInfo.dob#</span></div>
								<div class="clr"><div class="input-box">Address</div><span> #personalInfo.address#</span></div>
								<div class="clr"><div class="input-box">Phone</div> <span>#personalInfo.phonenumber#</span>  </div>
								<div class="clr"><div class="input-box">E-mail</div><span><a href="##">#personalInfo.email#</a></span>  </div>
								<div class="clr"><div class="input-box">Website </div> <span><a href="##">#personalInfo.website#</a></span> </div> 
								<div class="clr"><div class="box1">Skype </div> <span><a href="##">#personalInfo.skype#</a></span> </div> 
							</cfoutput>
						</div>
					</div>
					<div class="clr"></div>
				</div><!--about end -->

				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
	<cfdump var="#form#">
	<cfdump var="#qDados#">
</body>
</html>