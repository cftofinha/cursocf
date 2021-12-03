<cfscript>
	qPosts = EntityLoad("BlogPost");
	qPostsCons = EntityToQuery(qPosts);
	//writeDump(qPostsCons);
	
	//qHQL = ORMExecuteQuery("from BlogPost a join a.categories cat ");
	//qHQL = ORMExecuteQuery("select count(*) from BlogPost ");
	//writeDump(qHQL);
</cfscript>
<!---<cfabort>--->
<div class="card-pattern">
	<div id="home">
		<div class="clr">
			
			<div class="top-bg">
				<div class="tag">
					<cfoutput>
					<span>Posts usando Querys </span><br />
					<span><a href="#event.getHTMLBaseURL()#index.cfm/blog/posts-com-orm">Posts usando ORM</a> </span><br />
					<span><a href="#event.getHTMLBaseURL()#index.cfm/blog/posts-com-orm-querys">Posts usando ORM com  Querys </span>
					</cfoutput>
				</div>
			</div>
			
		</div>
		<div class="blog-top">	
			<div class="clr">
				<div class="left">
					<cfoutput query="qPostsCons">
							<h2>#qPostsCons.title#</h2>
							<h5>#dateFormat(qPostsCons.dateposted, 'dd/mm/yyyy')#</h5>
							<p class="summary">#qPostsCons.summary#</p>
							<!---<span>Categoria: #qPostsCons.nomeCategoria#</span>--->
							<br><hr><br>
						</cfoutput>
				</div>
			</div>
		</div>
	</div>
</div>