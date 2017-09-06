<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Sitio_web_SCE.html5.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SCE</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link href="../assets/css/main.css" rel="stylesheet" />
    <link href="../assets/css/noscript.css" rel="stylesheet" />
    <link href="../assets/validaciones/validacion.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnGuardarA").click(function () {
                alert('{"codigo":"' + $("#txtCodigoA").val() + '", "nombre":"' + $("#txtNombreA").val() + '", "descripcion":"' + $("#txtDescripcionA").val() + '"}');
                $.ajax({
                    type: "POST",
                    url: "../Servicios.svc/Insertar_ard",
                    data: '{"codigo":"' + $("#txtCodigoA").val() + '", "nombre":"' + $("#txtNombreA").val() + '", "descripcion":"' + $("#txtDescripcionA").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async:false,
                    processdata: true,
                    success: function (msg) {
                        alert("Entro al success");
                        alert(msg.Insertar_ardResult);
                    },
                    error: function (result) {
                        alert('Error salio algo mal: ' + result.status + '' + result.statusText);
                        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
                    }
                });
            });

            $("#btnModificarA").click(function () {
                alert('{"codigo":"' + $("#txtCodigoA").val() + '", "nombre":"' + $("#txtNombreA").val() + '", "descripcion":"' + $("#txtDescripcionA").val() + '"}');
                $.ajax({
                    type: "POST",
                    url: "../Servicios.svc/Modificar_ard",
                    data: '{"codigo":"' + $("#txtCodigoA").val() + '", "nombre":"' + $("#txtNombreA").val() + '", "descripcion":"' + $("#txtDescripcionA").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    processdata: true,
                    success: function (msg) {
                        alert("Entro al success");
                        alert(msg.Modificar_ardResult);
                    },
                    error: function (result) {
                        alert('Service call failed: ' + result.status + '' + result.statusText);
                        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
                    }
                });
            });

            $("#btnEliminarA").click(function () {
                alert('{"codigo":"' + $("#txtCodigoA").val() + '"}');
                $.ajax({
                    type: "POST",
                    url: "../Servicios.svc/Eliminar_ard",
                    data: '{"codigo":"' + $("#txtCodigoA").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    processdata: true,
                    success: function (msg) {
                        alert("Entro al success");
                        alert(msg.Eliminar_ardResult);
                    },
                    error: function (result) {
                        alert('Service call failed: ' + result.status + '' + result.statusText);
                        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
                    }
                });
            }); 
            
            $("#tbl_Arduino").css('display', 'none');
            $("#btnListarrA").click(function () {
                $.ajax({
                    type: "POST",
                    url: "../Servicios.svc/Listar_ard",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    processdata: true,
                    success: function (msg) {
                        var lis = msg.Listar_ardResult;
                        $("#tbl_Arduino").css('display', 'block');
                        $.each(lis, function (index, value) {
                            $("#tbl_Arduino").append("<tr><td>" + value.Codigo + "</td><td>" + value.Nombre + "</td><td>" + value.Decripcion + "</td></tr>");
                        });
                    },
                    error: function (result) {
                        alert('Service call failed: ' + result.status + '' + result.statusText);
                        Type = null; varUrl = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
                    }
                });
            });

        });
    </script>

</head>
<body>
    <div id="wrapper">

        <header id="header">
            <div class="logo">
                <span class="icon fa fa-lock"></span>
            </div>
            <div class="content">
                <div class="inner">
                    <h1>Sistema de Control Ergonómico</h1>
                </div>
            </div>
            <nav>
                <ul>
                    <li><a href="#admin_cuenta">Cuenta</a></li>
                    <li><a href="#admin_silla">Sillas</a></li>
                    <li><a href="#admin_arduino">Arduino</a></li>
                    <li><a href="#admin_sensor">Sensores</a></li>
                    <li><a href="../index.aspx">Cerrar sesión</a></li>
                </ul>
            </nav>
        </header>

        <form method="post" runat="server">
            <div id="main">
                <article id="admin_cuenta">
                    <h2 class="major">Administrador de cuenta</h2>
                    <div class="field">
                        <label for="name">*Codigo de cuenta</label>
                        <asp:TextBox ID="txtCodigoC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">*Nombre</label>
                        <asp:TextBox ID="txtNombreC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Apellido</label>
                        <asp:TextBox ID="txtApellidoC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Tipo de documento</label>
                        <asp:DropDownList ID="ddlTipo_documento" runat="server">
                            <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="T.I" Text="T.I"></asp:ListItem>
                            <asp:ListItem Value="C.C" Text="C.C"></asp:ListItem>
                            <asp:ListItem Value="C.E" Text="C.E"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field half">
                        <label for="name">Numero de documento</label>
                        <asp:TextBox ID="txtNumero_documentoC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Edad</label>
                        <asp:TextBox ID="txtEdadC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Sexo</label>
                        <asp:DropDownList ID="ddlSexoC" runat="server">
                            <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="M" Text="M"></asp:ListItem>
                            <asp:ListItem Value="F" Text="F"></asp:ListItem>
                            <asp:ListItem Value="Otros" Text="Otro"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field half">
                        <label for="name">Telefono</label>
                        <asp:TextBox ID="txtTelefonoC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="email">Correo</label>
                        <asp:TextBox ID="txtCorreoC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Nombre de usuario</label>
                        <asp:TextBox ID="txtUsuarioC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field half">
                        <label for="name">Contraseña</label>
                        <asp:TextBox ID="txtContraseñaC" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Rol</label>
                        <asp:DropDownList ID="ddlRol" runat="server">
                            <asp:ListItem Value="0" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Aprendiz"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Profesor"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Administrador"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <ul class="actions">
                        <li>
                            <asp:Button ID="btnGuardarC" runat="server" Text="Guardar" class="special" OnClick="btnGuardarC_Click" /></li>
                        <li>
                            <asp:Button ID="btnModificarC" runat="server" Text="Modificar" class="special" OnClick="btnModificarC_Click" /></li>
                        <li>
                            <asp:Button ID="btnListarC" runat="server" Text="Listar" class="special" OnClick="btnListarC_Click" /></li>
                    </ul>
                    <div class="table-wrapper">
                    <asp:GridView ID="gvUsuario" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id_Us" HeaderText="Codigo" />
                            <asp:BoundField DataField="Nombre_us" HeaderText="Nombre" />
                            <asp:BoundField DataField="Apellido_us" HeaderText="Apellido" />
                            <asp:BoundField DataField="Tipo_Documento_us" HeaderText="Tipo Documento" />
                            <asp:BoundField DataField="Numero_Documento_us" HeaderText="Numero Documento" />
                            <asp:BoundField DataField="Edad_us" HeaderText="Edad" />
                            <asp:BoundField DataField="Sexo_us" HeaderText="Sexo" />
                            <asp:BoundField DataField="Telefono_us" HeaderText="Telefono" />
                            <asp:BoundField DataField="Correo_us" HeaderText="Correo" />
                        </Columns>
                    </asp:GridView>
                        </div>
                </article>

                

                <article id="admin_silla">
                    <h2 class="major">Administrador de sillas</h2>   
                    <div runat="server" id="oculto">                                
                    <div class="field">
                        <asp:Label ID="lblCodgioSi" runat="server" Text="Label">Codigo de silla</asp:Label>
                        <asp:TextBox ID="txtCodigoSi" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo codigo esta vacio" 
                                        ControlToValidate="txtCodigoSi" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese solo numeros" 
                            ControlToValidate="txtCodigoSi" ValidationExpression="^[1-9]+\d*$" validationgroup="ValidarSI"></asp:RegularExpressionValidator>                        
                    </div>
                    <div class="field">
                        <asp:Label ID="lblTipo_si" runat="server" Text="Label">Tipo de silla</asp:Label>
                        <asp:DropDownList ID="ddltipo_s" runat="server">
                            <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Oficina"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Educativa"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Plastico"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Madera"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo Tipo de silla esta vacio" 
                                        ControlToValidate="ddltipo_s" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <asp:Label ID="lblMaterialSi" runat="server" Text="Label">Material</asp:Label>
                        <asp:TextBox ID="txtMaterialSi" runat="server"></asp:TextBox>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo material esta vacio" 
                                        ControlToValidate="txtMaterialSi" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese solo letras" 
                            ControlToValidate="txtMaterialSi" ValidationExpression="^[a-zA-Z]*$" validationgroup="ValidarSI"></asp:RegularExpressionValidator>
                    </div>
                    <div class="field">
                        <asp:Label ID="lblTamañoSi" runat="server" Text="Label">Tamaño</asp:Label>
                        <asp:TextBox ID="txtTamañoSi" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo Tamaño esta vacio" 
                                        ControlToValidate="txtTamañoSi" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field half">
                        <asp:Label ID="lblSensorSi" runat="server" Text="Label">Tipo de sensor</asp:Label>
                        <asp:DropDownList ID="ddlTipo_sen" runat="server">
                            <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Sensor de fuerza"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Sensor de movimiento"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo Tipo de sensor esta vacio" 
                                        ControlToValidate="ddlTipo_sen" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field half">
                        <asp:Label ID="lblArduinoSi" runat="server" Text="Label">Tipo de arduino</asp:Label>
                        <asp:DropDownList ID="ddlTipo_ard" runat="server">
                            <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Arduino uno"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="El campo Tipo de arduino esta vacio" 
                                        ControlToValidate="ddlTipo_ard" CssClass="Mensaje" validationgroup="ValidarSI"></asp:RequiredFieldValidator>
                    </div>                    
                    <ul class="actions">
                        <li>
                            <asp:Button ID="btnGuardarSi" runat="server" Text="Guardar" class="special" OnClick="btnGuardarSi_Click"
                                causesvalidation="true" validationgroup="ValidarSI"/></li>
                        <li>
                            <asp:Button ID="btnModificarSi" runat="server" Text="Modificar" class="special" OnClick="btnModificarSi_Click"
                                causesvalidation="true" validationgroup="ValidarSI"/></li>
                        <li>
                            <asp:Button ID="btnEliminarSi" runat="server" Text="Eiliminar" class="special" OnClick="btnEliminarSi_Click" /></li>
                        <li>
                            <asp:Button ID="btnListarSi" runat="server" Text="Listar" class="special" OnClick="btnListarSi_Click"/></li>
                    </ul>
                        </div> 
                    <div class="table-wrapper">
                    <asp:GridView ID="gvSillas" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id_Si" HeaderText="Codigo de la silla" />
                            <asp:BoundField DataField="Id_tipo_s" HeaderText="Tipo de silla" />
                            <asp:BoundField DataField="Tamaño_Si" HeaderText="Tamaño" />
                            <asp:BoundField DataField="Matertial_Si" HeaderText="Material" />
                            <asp:BoundField DataField="Id_sen" HeaderText="Tipo de sensor" />
                            <asp:BoundField DataField="Id_ard" HeaderText="Tipo de arduino" />
                        </Columns>
                    </asp:GridView>
                        </div>
                    <ul class="actions">
                        <li>
                            <asp:Button ID="btnVolverSi" runat="server" Text="Volver" class="special" OnClick="btnVolverSi_Click"/></li>
                    </ul>

                </article>

                <article id="admin_arduino">
                    <h2 class="major">Administrador de Arduinos</h2>
                    <div class="field">
                        <label for="name">Codigo de arduino</label>
                        <asp:TextBox ID="txtCodigoA" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Nombre</label>
                        <asp:TextBox ID="txtNombreA" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Descripción</label>
                        <asp:TextBox ID="txtDescripcionA" runat="server"></asp:TextBox>
                    </div>
                    <ul class="actions">
                        <li>
                            <!--<asp:Button ID="btnGuardarA" runat="server" Text="Guardar" class="special" />-->
                            <input id="btnGuardarA" name="Guardar" class="special" type="button" value="Guardar" />
                        </li>
                        <li>
                            <%--<asp:Button ID="btnModificarA" runat="server" Text="Modificar" class="special" />--%>
                            <input id="btnModificarA" name="Modificar" class="special" type="button" value="Modificar" />
                        </li>
                        <li>
                            <%--<asp:Button ID="btnEliminarA" runat="server" Text="Eliminar" class="special" />--%>
                            <input id="btnEliminarA" name="Eliminar" class="special" type="button" value="Eliminar" />
                        </li>
                        <li>
                            <%--<asp:Button ID="btnListarrA" runat="server" Text="Listar" class="special" />--%>
                            <input id="btnListarrA" name="Listar" class="special" type="button" value="Listar" />
                        </li>
                    </ul>
                    <div class="table-wrapper">
                        <table id="tbl_Arduino">
                            <tr>
                                <td>Codigo</td>
                                <td>Nombre</td>
                                <td>Descripción</td>
                            </tr>
                        </table>
                        </div>
                </article>

                <article id="admin_sensor">
                    <h2 class="major">Administrador de Sensores</h2>
                    <div class="field">
                        <label for="name">Codigo de sensor</label>
                        <asp:TextBox ID="txtCodigoSe" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Nombre</label>
                        <asp:TextBox ID="txtNombreSe" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Magnitud</label>
                        <asp:TextBox ID="txtMagnitudSe" runat="server"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="name">Caracteristicas</label>
                        <asp:TextBox ID="txtCaracteristicaSe" runat="server"></asp:TextBox>
                    </div>
                    <ul class="actions">
                        <li>
                            <asp:Button ID="btnGuardarSe" runat="server" Text="Guardar" class="special" /></li>
                        <li>
                            <asp:Button ID="btnModificarSe" runat="server" Text="Modificar" class="special" /></li>
                        <li>
                            <asp:Button ID="btnListarSe" runat="server" Text="Listar" class="special" /></li>
                    </ul>
                </article>

            </div>
        </form>

        <footer id="footer">
            <p>&copy Derechos reservados</p>
        </footer>

    </div>

    <div id="bg"></div>

    <!--<script src="../assets/js/jquery.min.js"></script>-->
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>
