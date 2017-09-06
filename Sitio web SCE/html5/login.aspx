<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Sitio_web_SCE.html5.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCE</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link href="../assets/css/main.css" rel="stylesheet" />
        <link href="../assets/css/noscript.css" rel="stylesheet" />
        <link href="../assets/validaciones/validacion.css" rel="stylesheet" />
</head>
<body>
    <div id="wrapper">
					<header id="header">
						<div class="logo">
							<span class="icon fa fa-lock"></span>
						</div>
						<div class="content">
							<div class="inner">
								<h2 class="major">Inicio de sesión</h2>
								<form runat="server">
									<div class="field">
										<label for="txtUsuario">Usuario</label>
										<asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
									</div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo usuario esta vacio" 
                                        ControlToValidate="txtUsuario" CssClass="Mensaje" validationgroup="ValidarLogin"></asp:RequiredFieldValidator>
                                    <div class="field">
										<label for="txtContraseña">Contraseña</label>
                                        <asp:TextBox TextMode="Password" ID="txtContraseña" runat="server"></asp:TextBox>
									</div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo contraseña esta vacio" 
                                        ControlToValidate="txtContraseña" CssClass="Mensaje" validationgroup="ValidarLogin"></asp:RequiredFieldValidator>
									<ul class="actions">                                       
										<li><asp:Button ID="btnEntrar" runat="server" Text="Entrar" class="special" OnClick="btnEntrar_Click"
                                            causesvalidation="true" validationgroup="ValidarLogin"/></li>
                                        <li><asp:Button ID="btnVolver" runat="server" Text="Volver" class="special" OnClick="btnVolver_Click" 
                                            causesvalidation="false" validationgroup="ValidarLogin"/></li>
									</ul>
								</form>
							</div>
						</div>
					</header>

        <footer id="footer">
						<p>&copy Derechos reservados</p>
					</footer>

			</div>

			<div id="bg"></div>

			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
</body>
</html>
