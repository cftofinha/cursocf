<cfoutput>
	<div class="container">
		<h1 class="jumbotron-heading">Login</h1>
		<p class="lead text-muted">
			Utilize o formulário abaixo para efetuar login e lembre-se que nunca compartilhamos suas informações com mais ninguém 
		</p>
		<div class="card">
			<div class="card-body">
				<form name="formLogin" id="formLogin" action="#event.getHTMLBaseURL()#index.cfm/login/validar-login" method="post">
					<div class="form-group">
						<label for="login">Login de Acesso</label>
						<input type="text" name="login" id="login" placeholder="Digite seu login" maxlength="50" class="form-control">
						<small id="loginHelp" class="form-text text-muted">Seu username</small>
					</div>
					<div class="form-group">
						<label for="senha">Senha de Acesso</label>
						<input type="password" name="senha" id="senha" placeholder="Digite sua senha" class="form-control">
					</div>
					<div class="form-check">
						<input type="checkbox" name="remember" id="remember" class="form-check-input">
						<label class="form-check-label">Lembrar minhas credenciais</small>
					</div>
					<br />
					<button type="submit" class="btn btn-primary">Entrar no Sistema</button>
				</form>
			</div>
		</div>
	</div>
</cfoutput>