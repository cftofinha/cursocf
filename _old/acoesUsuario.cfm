<!---
nome da tabela: tb_personal_info
campos:
no_usuario (string)
dt_nascimento (date: yyyy-mm-dd)
ds_endereco (string)
nu_telefone (string)
ds_email (string)
ds_site (string)
no_skype (string)
--->
<cfif isDefined("form.acaoForm") and not compareNoCase(form.acaoForm,"novo")>
	<cfquery name="qUser" datasource="#application.datasource#">
		select id, no_usuario
		from tb_personal_info
		where no_usuario = <cfqueryparam value="#form.no_usuario#" cfsqltype="cf_sql_varchar" maxlength="50">
	</cfquery>
	
	<cfif qUser.recordCount gt 0>
		<h3>Usuário já existe na base</h3>
		<p><a href="cadastrarUsuario.cfm">Retorne e use outro nome</a></p>
	<cfelse>
		<cfif isDefined('form.dt_nascimento') and compareNoCase(form.dt_nascimento, '') and isDate(form.dt_nascimento)>
			<cfset variables.dt_nascimento = lsDateFormat(form.dt_nascimento, 'yyyy-mm-dd') />
		<cfelse>
			<cfset variables.dt_nascimento = lsDateFormat(now(), 'yyyy-mm-dd') />
		</cfif>
		
		<cftry>
			<cfquery datasource="#application.datasource#">
				insert into tb_personal_info (
					no_usuario
					, dt_nascimento
					, ds_endereco
					, nu_telefone
					, ds_email
					, ds_site
					, no_skype
				)
				values(
					<cfqueryparam value="#form.no_usuario#" cfsqltype="cf_sql_varchar" maxlength="50">
					, <cfqueryparam value="#variables.dt_nascimento#">
					, <cfqueryparam value="#form.ds_endereco#" cfsqltype="cf_sql_varchar" maxlength="50">
					, <cfqueryparam value="#form.nu_telefone#" cfsqltype="cf_sql_varchar" maxlength="15">
					, <cfqueryparam value="#lCase(form.ds_email)#" cfsqltype="cf_sql_varchar" maxlength="50">
					, <cfqueryparam value="#lCase(form.ds_site)#" cfsqltype="cf_sql_varchar" maxlength="70">
					, <cfqueryparam value="#lCase(form.no_skype)#" cfsqltype="cf_sql_varchar" maxlength="30">
				)
			</cfquery>
			<cfset session.usuarioAtual = form.no_usuario />
			<!---<cflocation url="index.cfm" addtoken="false">--->
			<h3>Usuário Cadastrado com sucesso</h3>
			<p><a href="index.cfm">Retorne a página inicial</a></p>
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
			</cfcatch>
			
		</cftry>
	</cfif>

<!--- abaixo metodo de atualização --->
<cfelseif isDefined("form.acaoForm") and not compareNoCase(form.acaoForm,"atualizar")>
	<cfquery name="qUser" datasource="#application.datasource#">
		select id, no_usuario
		from tb_personal_info
		where no_usuario = <cfqueryparam value="#form.no_usuario#" cfsqltype="cf_sql_varchar" maxlength="50">
	</cfquery>
	
	<cfif qUser.recordCount gt 0>
		<h3>Usuário já existe na base</h3>
		<p><a href="cadastrarUsuario.cfm?idUsuario=<cfoutput>#form.idUsuario#</cfoutput>">Retorne e use outro nome</a></p>
	<cfelse>
		<cfif isDefined('form.dt_nascimento') and compareNoCase(form.dt_nascimento, '') and isDate(form.dt_nascimento)>
			<cfset variables.dt_nascimento = lsDateFormat(form.dt_nascimento, 'yyyy-mm-dd') />
		<cfelse>
			<cfset variables.dt_nascimento = lsDateFormat(now(), 'yyyy-mm-dd') />
		</cfif>
		<cftry>
			<cfquery datasource="#application.datasource#">
				update tb_personal_info set 
					no_usuario = <cfqueryparam value="#form.no_usuario#" cfsqltype="cf_sql_varchar" maxlength="50"> 
					, dt_nascimento = <cfqueryparam value="#variables.dt_nascimento#"> 
					, ds_endereco = <cfqueryparam value="#form.ds_endereco#" cfsqltype="cf_sql_varchar" maxlength="50"> 
					, nu_telefone = <cfqueryparam value="#form.nu_telefone#" cfsqltype="cf_sql_varchar" maxlength="15">
					, ds_email = <cfqueryparam value="#form.ds_email#" cfsqltype="cf_sql_varchar" maxlength="50">
					, ds_site = <cfqueryparam value="#form.ds_site#" cfsqltype="cf_sql_varchar" maxlength="70">
					, no_skype = <cfqueryparam value="#form.no_skype#" cfsqltype="cf_sql_varchar" maxlength="30">
				where id = <cfqueryparam value="#form.idUsuario#" cfsqltype="cf_sql_integer" maxlength="4">
			</cfquery>
			<cfset session.usuarioAtual = form.no_usuario />
			
			<h3>Usuário Atualizado com sucesso</h3>
			<p><a href="index.cfm">Retorne a página inicial</a></p>
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#">
			</cfcatch>
			
		</cftry>
	</cfif>
<!--- nada a fazer, redireciona abaixo --->
<cfelse>
	<cflocation url="index.cfm" addtoken="false">
</cfif>