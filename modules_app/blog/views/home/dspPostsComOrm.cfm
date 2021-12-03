<cfscript>
	qPosts = EntityLoad("BlogPost");
	//writeDump(qPosts);
</cfscript>

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
					<cfoutput>
						<!---<cfdump var="#qPosts[3].title#">--->
						<cfloop array="#qPosts#" index="posts">
							<h2>#posts.getTitle()#</h2>
							<h5>#dateFormat(posts.getDateposted(), 'dd/mm/yyyy')#</h5>
							<p class="summary">#posts.getSummary()#</p>
							<span>
								Categoria: 
								<cfif arrayLen(posts.getCategories()) gt 0>
									#posts.getCategories()[1].getBlogCategory().getName()#
								<cfelse>
									Não informada
								</cfif>
							</span>
							<br />
							<span>
								Comentários: #arrayLen(posts.getComments())#
							</span>
							<br><hr><br>
						</cfloop>
					</cfoutput>
				</div>
			</div>
		</div>
	</div>
</div>