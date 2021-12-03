<cfscript>
	variables.condicoes = "0 = 0";
	qPosts = createObject("component","blog.models.PostBlog").getPostsBlog(condicoesFiltro: variables.condicoes);
	qCategorias = createObject("component","blog.models.CategoriasBlog").getCategorias();
	//writeDump(qPosts);
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
					<cfoutput query="qPosts">
					<h5>
						<span>#qPosts.dataPostagem#</span>
					</h5>
					<h2>
						<a href="#event.getHTMLBaseURL()#index.cfm/blog/detalhar-post/#qPosts.id#" target="_blank">#qPosts.titulo#</a>
					</h2>
					<p>#qPosts.resumo#</p>
					<p class="summary">
						<strong>Categoria:</strong> #qPosts.nomeCategoria# <strong>Comentários:</strong> #qPosts.qtdComentarios#
					</p>
					</cfoutput>
					<!-- End Blog Post -->
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