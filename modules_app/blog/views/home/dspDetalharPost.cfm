<cfscript>
	//CADASTRANDO NOVOS COMENTÁRIOS
	if(isDefined("form.author") and compareNoCase(form.author,"")){
		try {
			salvarPost = entityLoadByPK('BlogPost', form.idPost);  //UPDATE DE REGISTRO EXISTENTE
			salvarComentario = entityNew('BlogComment'); //INSERT DE NOVOS REGISTROS
			
			salvarComentario.setAuthor(form.author);
			salvarComentario.setComment(form.comment);
			entitySave(salvarComentario);
			
			salvarPost.addComment(salvarComentario);
			entitySave(salvarPost);
		} catch (any e) {
			writeOutput("Error: " & e.message);
			writeDump(e);
			abort;
		}
	}
	//
	qCategorias = createObject("component","blog.models.CategoriasBlog").getCategorias();
	if(structKeyExists(event.getRoutedStruct(),"id") && isNumeric(event.getRoutedStruct().id)){
		if( structKeyExists(event.getRoutedStruct(),"tipoDeConsulta") && not compareNoCase(event.getRoutedStruct().tipoDeConsulta,"orm")){
			qPosts = EntityLoadByPK("BlogPost", event.getRoutedStruct().id);
			variables.idPost = qPosts.getId();
		} else {
			qPosts = createObject("component","blog.models.PostBlog").getPostsBlog(condicoesFiltro: " a.blogpostid = " & event.getRoutedStruct().id);
			variables.idPost = qPosts.id;
			qComentarioPosts = createObject("component","blog.models.ComentariosPost").getComentarioPosts(condicoesFiltro: " a.blogpostid = " & event.getRoutedStruct().id);
		}
		
	} else {
		location("#event.getHTMLBaseURL()#index.cfm/blog/", "false");
	}
	//writeDump(qPosts);
	//abort;
</cfscript>

<div class="card-pattern">
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
				<div class="left">
					<!-- Blog Posts -->
					<!-- Start Blog Post -->
					<cfoutput>
						<cfif(structKeyExists(event.getRoutedStruct(),"tipoDeConsulta") && not compareNoCase(event.getRoutedStruct().tipoDeConsulta,"orm"))>
							<h5>
								<span>#lsDateFormat(qPosts.getDateposted(), 'dd/mm/yyyy')#</span>
							</h5>
							<h2>
								<a href="#event.getHTMLBaseURL()#index.cfm/blog/detalhar-post/#qPosts.getId()#" target="_blank">#qPosts.getTitle()#</a>
							</h2>
							<p>#qPosts.getBody()#</p>
							<p class="summary">
								<strong>Categoria:</strong> <cfif not arrayIsEmpty(qPosts.getCategories())> #qPosts.getCategories()[1].getBlogCategory().getName()# <cfelse>Não infomada</cfif> 
								
							</p>
						<cfelse>
							<h5>
								<span>#qPosts.dataPostagem#</span>
							</h5>
							<h2>
								<a href="#event.getHTMLBaseURL()#index.cfm/blog/detalhar-post/#qPosts.id#" target="_blank">#qPosts.titulo#</a>
							</h2>
							<p>#qPosts.conteudo#</p>
							<p class="summary">
								<strong>Categoria:</strong> #qPosts.nomeCategoria# 
							</p>
							<p>
								<a href="#event.getHTMLBaseURL()#index.cfm/blog/exportar-para-pdf/#variables.idPost#" target="_new"><img src="#event.getHTMLBaseURL()#assets/images/export_pdf.png" border="0"/></a>
							</p>
						</cfif>
						<h3>
							<strong>Comentários:</strong>
							<cfif(structKeyExists(event.getRoutedStruct(),"tipoDeConsulta") && not compareNoCase(event.getRoutedStruct().tipoDeConsulta,"orm"))>
								( #arrayLen(qPosts.getComments())# )
							<cfelse>
								(#qPosts.qtdComentarios#)
							</cfif>
						</h3>
						<div class="clr hline">&nbsp;</div>
						<div class="clr comments">
							<ul>
								<!-- Start Comment -->
								<cfif(structKeyExists(event.getRoutedStruct(),"tipoDeConsulta") && not compareNoCase(event.getRoutedStruct().tipoDeConsulta,"orm"))>
									<cfloop array="#qPosts.getComments()#" index="c">
									<li>
										<p>
											<strong>Postado em:</strong> #lsDateFormat(c.getCreatedDateTime(), 'dd/mm/yyyy')# por #c.getAuthor()#
										</p>
										<p>
											#c.getComment()#
										</p>
										<div class="clr hline">&nbsp;</div>
									</li>
									</cfloop>
								<cfelse>
									<cfloop query="qComentarioPosts">
									<li>
										<p>
											<strong>Postado em:</strong> #qComentarioPosts.dataHoraSistema# por #qComentarioPosts.author#
										</p>
										<p>
											#qComentarioPosts.comment#
										</p>
										<div class="clr hline">&nbsp;</div>
									</li>
									</cfloop>
								</cfif>
								<!-- End Comment -->
							</ul>
						</div>
						<!-- End Blog Post -->
						<h3>Postar Comentário</h3>
						<div class="clr hline">&nbsp;</div>
		
						<div class="clr postComment">
							<form action="#event.getHTMLBaseURL()#index.cfm/blog/detalhar-post/#variables.idPost#" method="post" id="form">
								<input type="hidden" name="idPost" id="idPost" value="#variables.idPost#">
								<div>
									<label>Nome <span class="font-11">(obrigatório)</span></label>
									<input name="author" id="author" type="text" class="required" />
								</div>
								<div class="textarea">
									<label>Comentário <span class="font-11">(obrigatório)</span></label>
									<textarea name="comment" id="comment" rows="6" cols="60" class="required"></textarea>
								</div>
								<div>
									<input id="submitBtn" value="Enviar"  name="submit" type="submit" class="submitBtn" />
								</div>
								<input type="hidden" name="submitted" value="1" />
							</form>
						</div>
					</cfoutput>
				</div>
				
			</div>
				<div class="right" >
					<h2>Categorias</h2>
					<!-- Blog Categories -->
					<div id="categories" align="center">
						<ul>
						<cfoutput query="qCategorias">
							<li><a href="#event.getHTMLBaseURL()#index.cfm/blog/listar-por-categoria/#qCategorias.name#">#qCategorias.name#</a></li>
						</cfoutput>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="clr"></div>
	</div>
	<!--blog end -->
	<div class="clr"></div>
</div>