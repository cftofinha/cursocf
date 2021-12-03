<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Clean Slide Responsive Vcard Template" />
	<meta name="keywords" content="jquery, Responsive Vcard, Template, Vcard, Clean Slide" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title>#application.config.site#</title>
	<base href="#event.getHTMLBaseURL()#" />
	
	<!-- Loading Google Web fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
	
	<!-- CSS Files -->
	<link href="#event.getHTMLBaseURL()#/assets/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="#event.getHTMLBaseURL()#/assets/css/style.css" rel="stylesheet" type="text/css"  id="color" />
	<link href="#event.getHTMLBaseURL()#/assets/css/typography.css" rel="stylesheet" type="text/css"  id="customFont"/>
	<link href="#event.getHTMLBaseURL()#/assets/css/arial_content.css" rel="stylesheet" type="text/css"  id="contentfont"/>
	<!---css --->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
	
	<!-- include jQuery library -->
	<script type="text/javascript" src="#event.getHTMLBaseURL()#/assets/js/jquery-1.7.min.js"></script>

	<script src="#event.getHTMLBaseURL()#/assets/js/raphael.js" type="text/javascript"></script>
	<script src="#event.getHTMLBaseURL()#/assets/js/init.js" type="text/javascript"></script>
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
					<img src="#event.getHTMLBaseURL()#assets/images/logo.png" alt="Logo" width="202" height="52" border="0"  id="logo" />
				</div>
				
				<!--head right -->
				<div class="right">
					<cfscript>
						menuSelecionadoLogin = "";
						menuSelecionadoBlog = "";
						menuSelecionadoContato = "";
						menuSelecionado = "";
						menu = event.getCurrentModule();
						switch(menu) {
							case "login":
								menuSelecionadoLogin = 'id="selected"';
								break; 
							case "blog":
								menuSelecionadoBlog = 'id="selected"';
							break; 
							case "contato":
								menuSelecionadoContato = 'id="selected"';
								break; 
							default: 
								menuSelecionado = 'id="selected"';
								break; 
						}
					</cfscript>
					<!--// Navigation //-->
					<div class="menu_nav">
						<div id="nav-wrap">
							<ul class="arrowunderline" id="nav">
								<li class="home" #menuSelecionado# ><a href="index.cfm">Home</a></li>
								<li class="about" #menuSelecionadoLogin# ><a href="#event.getHTMLBaseURL()#index.cfm/login">Login</a></li>
								<li class="blog" #menuSelecionadoBlog# ><a href="#event.getHTMLBaseURL()#index.cfm/blog">Blog</a></li>
								<li class="contact" #menuSelecionadoContato# ><a href="#event.getHTMLBaseURL()#index.cfm/contato">Contato</a></li>
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
		<!---Container And Views --->
		<div id="content">#renderView()#</div>

	<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
</body>
</html>
</cfoutput>
