<cfset instComponente = createObject("component","models.cfc.CategoriasHome") />
<cfset qConsulta = instComponente.getCategorias() />
<cfset variables.conteudoDev = "Professional Web design and Development and specializes in developing 
							<span>clean, effective and smart&nbsp;&nbsp;</span>websites" />

<!---<cfset ormReload()>
<cfparam name="url.id" default="1">
<cfset blogPost = EntityLoad('BlogPost', url.id, true) />
<cfdump var="#blogPost#">--->
<div class="card-pattern">
				<!--home -->
				<div id="home">
					<div class="clr">
						<div class="top-bg">
							<div class="top-left" >
								<!-- Data Output -->
								<cfif isDefined("session.usuarioAtual")>
									<div class="tag">
										Olá, <span><cfoutput>--</cfoutput>,</span>
									</div>
									<div class="sub-tag"><cfoutput>#application.config.myPosition#</cfoutput></div>
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
							<cfoutput query="qConsulta">
								<div class="#qConsulta.css#">
									<img src='assets/images/#qConsulta.imagem#'  border="0" height="" alt=" "  />
									<h3>#qConsulta.name#</h3>
								</div>
							</cfoutput>
						</div>
					</div>
					<div class="clr bottom-space"></div>
				</div>
				<!--home end -->
				
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>