<cfif isDefined("url.id") and compareNoCase(url.id,"") and isNumeric(url.id)>
	<cfset variables.condicoes = " a.blogpostid = #url.id#" />
<cfelse>
	<cfset variables.condicoes = " a.blogpostid = 0" />
</cfif>
<cfset instCFCPost = createObject("component","PostBlog") />
<cfset qPosts = instCFCPost.getPostsBlog(condicoesFiltro: variables.condicoes) />
<cfif isDefined("form.author") and compareNoCase(form.author,"")>
	<cfscript>
		qSalvar = instCFCPost.setCadastrarComentario(
			blogpostid: #form.idPost#
			, author: '#form.author#'
			, comment: '#form.comment#'
		);
	</cfscript>
	
</cfif>
<cfset qComentarios = instCFCPost.getComentariosPostBlog(condicoesFiltro: variables.condicoes) />



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
								<li class="blog" id="selected"><a href="blog.cfm">Blog</a></li>
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
				<!-- blog -->
				<div id="blog">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div><h1>Blog</h1></div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="blog-top">	
						<div class="clr">
							<cfoutput>
							<div class="left">
								<!-- Blog Title -->
								<h2 class="big">
									#qPosts.title#
								</h2>
								<!-- Date Published -->
								<h5>
									<strong>Date Posted</strong>: #qPosts.dateposted#
								</h5>
								<!-- Blog Body -->
								<p>
									#qPosts.body#
								</p>
								<!-- Blog Comments Section -->
								<h3>
									Comentarios (#qComentarios.recordCount#)
								</h3>
								<div class="clr hline">&nbsp;</div>
		
								<div class="clr comments">
									<ul>
										<!-- Start Comment -->
										<cfloop query="qComentarios">
											<li>
												<p>
													<strong>Postado:</strong> #qComentarios.createdDateTime# Por #qComentarios.usuario#
												</p>
												<p>
													#qComentarios.comentario#
												</p>
												<div class="clr hline">&nbsp;</div>
											</li>
										</cfloop>
										<!-- End Comment -->
										
									</ul>
								</div>
								<h3>
									Postar Comentario
								</h3>
								<div class="clr hline">&nbsp;</div>
		
								<div class="clr postComment">
									<form action="blogpost.cfm?id=#url.id#" method="post" id="form">
										<input type="hidden" id="idPost" name="idPost" value="#url.id#">
										<div>
											<label>Name <span class="font-11">(required)</span></label>
											<input name="author" type="text" class="required" />
										</div>
										<div class="textarea">
											<label>Comment <span class="font-11">(required)</span></label>				
											<textarea name="comment" rows="6" cols="60" class="required"></textarea>		
										</div>
										<div>
											<input id="submitBtn" value="Submit"  name="submit" type="submit" class="submitBtn" />
										</div>
										<input type="hidden" name="submitted" value="1" />
									</form>
								</div>	
							</div>
							</cfoutput>
							<div class="right" >
								<h2>Categories</h2>
								<!-- Blog Specific Categories -->
								<div id="categories" align="center">
									<ul>
										<li><a href="#">ColdFusion</a></li>
										<li><a href="#">Development</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="clr"></div>
				</div> <!--resume end -->

				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
</body>
</html>