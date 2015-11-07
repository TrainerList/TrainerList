<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>TrainerList</title>

		<g:javascript plugin="jquery" library="jquery" />

		<script type="text/javascript">
			function Logar(data){
				if (data.mensagem == "ERRO"){
					Alert("e-mail/senha invalido!")
				}
			}
		</script>

	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="page-body" role="main">


			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>

			<g:form name="formLogin" url="[controller:'perfil', action:'logar']" >

				<div id="controller-list" role="navigation" class="row">
					<div class="input-field col s12">

						<label> ${mensagem} </label>


						<label for="email">Email</label>
						<input id="email" name="email" value="${emial}" type="email" class="validate">

						<label> Senha </label>
						<g:passwordField name="senha" value=""/> <br />

						<h6><label>  <a href="">Esqueci senha!</a> </label>
						 </h6>
					</div>
				</div>

				<br /> <br />

				<input type="submit" name="logar"  value="Entrar"/>

				<div class="row">
					<form class="col s12">
						<div class="row">
							<div class="input-field col s6">
								<i class="material-icons prefix">account_circle</i>
								<input id="icon_prefix" type="text" class="validate">
								<label for="icon_prefix">First Name</label>
							</div>
							<div class="input-field col s6">
								<i class="material-icons prefix">phone</i>
								<input id="icon_telephone" type="tel" class="validate">
								<label for="icon_telephone">Telephone</label>
							</div>
						</div>
					</form>
				</div>

			</g:form>

			<br />

			<h5>
				<a href="./personal/create.gsp">Cadastrar-se</a> <br />
			</h5>
		</div>
	</body>
</html>
