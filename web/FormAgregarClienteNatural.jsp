<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if(!currentUser.getIdCargo().equals("1")){
            out.println("<h1>NO estas autorizado</h1>");
            out.println("<a href=\"/\">Ingresar</a>");
            return;
        }
    }
    else {
        out.println("<h1>NO estas autorizado</h1>");
        out.println("<a href=\"/\">Ingresar</a>");
        return;
    }
    
    String nombreadmin = currentUser.getNombre();
    String apellidosadmin = currentUser.getApellidos();
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <jsp:include page="Head.jsp"/>
</head>

<body>

	<div class="limiter">
		<div class="containernav">
			<nav class="navbar navbar-expand-lg navbar-dark justify-content-between">
				<a class="navbar-brand" href="#"><span class="login100-form-logo">
						<i class="zmdi zmdi-settings"></i>
					</span></a>
				<div class="navbar-collapse collapse" id="navbarNavAltMarkup" style="">
					<div class="navbar-nav">
						<h5 class="nav-item nav-link active" href="#">Ferreteria UTP <span
								class="sr-only">(current)</span></h5>
						<a class="nav-item nav-link" href="#" style="display: none;">Acceder</a>


					</div>

				</div>

				<div class="menurighttop">

					<div class="dropdown show">
                                            <a href="PanelAdministrador.jsp" class="btn btn-outline-light">&lt;&lt; Volver</a>
						<a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="zmdi zmdi-account"></i> <%= nombreadmin %>
						</a>
					</div>


				</div>
			</nav>
		</div>


		<div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">
			<div class="wrap-login100">
                            <form id="formagregarclienteNatural" class="login100-form validate-form" action="RegistroClienteNatural" method="POST">
					<!-- <span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span> -->

					<span class="login100-form-title p-b-34 p-t-27">
							<i class="zmdi zmdi-account-add"></i> Agregar Cliente Natural
					</span>

					<div class="wrap-input100 validate-input" data-validate="Nombres">
						<input id="nombresCliente" class="input100" type="text" name="nombresCliente" placeholder="Nombres">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Apellidos">
						<input id="apellidosCliente" class="input100" type="text" name="apellidosCliente" placeholder="Apellidos">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                            
                                         <div class="wrap-input100 validate-input" data-validate="Dni">
							<input id="dniCliente" class="input100" type="text" name="dniCliente"  placeholder="DNI">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>
                                         <div class="wrap-input100 validate-input" data-validate="Telefono">
							<input id="telefonoCliente" class="input100" type="text" name="telefonoCliente"  placeholder="Telefono">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div> 
                                         <div class="wrap-input100 validate-input" data-validate="Email">
							<input id="emailCliente" class="input100" type="text" name="emailCliente"  placeholder="Email">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>  
                                         <div class="wrap-input100 validate-input" data-validate="Direccion">
							<input id="direccionCliente" class="input100" type="text" name="direccionCliente"  placeholder="Direccion">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>                                          
                                          
                                       <div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="sendAjaxCliente()">
							Agregar
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							:)
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<footer class="footer mt-auto py-3 justify-content-between">
		<div>
			<span class="text-muted">© 2019 Ferreteria UTP</span>


		</div>
	</footer>


	<div id="dropDownSelect1"></div>
        <jsp:include page="Footer.jsp"/>
        <script>
            var datos = new Object();
            datos.urlCliente = "https://firebasestorage.googleapis.com/v0/b/contactos-9976e.appspot.com/o/img%2Fusuario.jpeg?alt=media&token=a4588e9d-b89b-4d6a-9077-270167cb7de5";

                        function sendAjaxCliente() {
                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                            
                            datos.telefonoCliente = $('#telefonoCliente').val();
                            datos.direccionCliente = $('#direccionCliente').val();
                            datos.emailCliente= $('#emailCliente').val();
                            datos.nombresCliente = $('#nombresCliente').val();
                            datos.apellidosCliente = $('#apellidosCliente').val();
                            datos.dniCliente= $('#dniCliente').val();
                            
                            $.ajax({
                                method: "POST",
                                url: "RegistroClienteNatural",
                                data: {
                                    telefonoCliente: datos.telefonoCliente,
                                    direccionCliente: datos.direccionCliente,
                                    emailCliente: datos.emailCliente,
                                    nombresCliente: datos.nombresCliente,
                                    apellidosCliente: datos.apellidosCliente,
                                    dniCliente: datos.dniCliente,
                                    urlCliente: datos.urlCliente
                                    
                                },
                            })
                                    .done(function (data) {

                                        if (data === "error dni") {
                                            $.toast({
                                                heading: 'Error',
                                                text: 'El DNI ingresado ya existe',
                                                icon: 'error',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                        }
                                        else if (data === "error alias") {
                                            $.toast({
                                                heading: 'Error',
                                                text: 'El alias ingresado ya existe',
                                                icon: 'error',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                        }
                                        else {
                                            $.toast({
                                                heading: 'Perfecto',
                                                text: 'Registrado Correctamente',
                                                icon: 'success',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            //$("#formagregarpolicia").reset();
                                            $('#formagregarclienteNatural').trigger("reset");
                                        }
                                    });
                        };
                        
        </script>

</body>

</html>
