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
							<i class="zmdi zmdi-account-add"></i> Agregar Empleado
					</span>

					<div class="wrap-input100 validate-input" data-validate="nombresEmpleado">
						<input id="nombresEmpleado" class="input100" type="text" name="nombresEmpleado" placeholder="Nombres">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="apellidosEmpleado">
						<input id="apellidosEmpleado" class="input100" type="text" name="apellidosEmpleado" placeholder="Apellidos">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                            
                                         <div class="wrap-input100 validate-input" data-validate="usuarioEmpleado">
							<input id="usuarioEmpleado" class="input100" type="text" name="usuarioEmpleado"  placeholder="Usuario">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>
                                         <div class="wrap-input100 validate-input" data-validate="passwordEmpleado">
							<input id="passwordEmpleado" class="input100" type="password" name="passwordEmpleado"  placeholder="Password">
							<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div> 
                                        <div class="form-group validate-input" data-validate="Elige el Cargo">
							<label for="Cargo_idCargo"><i class="zmdi zmdi-sign-in"></i>
								Clase</label>
                                                    <select id="Cargo_idCargo" class="form-control formulariosselect" name="Cargo_idCargo">
                                                            <option value="">Seleccione Cargo</option>
                                                            <option value="1">Administrador</option>
                                                            <option value="2">Jefe Almacen</option>
                                                            <option value="3">Encargado</option>
                                                            <option value="4">Asistente</option>
                                                            <option value="5">Vendedor</option>
							</select>
                                        </div>
                                        <div class="form-group validate-input" data-validate="Elige el Sucursal">
							<label for="idAlmacen"><i class="zmdi zmdi-sign-in"></i>
								Clase</label>
                                                    <select id="idAlmacen" class="form-control formulariosselect" name="idAlmacen">
                                                            <option value="">Seleccione Sucursal </option>
                                                            <option value="1">Arequipa</option>
                                                            <option value="2">Tacna</option>
                                                            <option value="3">Ilo</option>
                                                            <option value="4">Moquegua</option>
                                                            <option value="5">Espinar</option>
							</select>
                                        </div>
                                        <label for="fileButton"><i class="zmdi zmdi-collection-folder-image"></i> Subir Foto</label>  
                                                <input type="file" id="fileButton" value="upload"/>
                                        <div id="fotocontainer" onClick="mostrarFoto()"><img id="foto" src="" width="200" height="auto"/></div>
                                          
                                       <div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="sendAjaxEmpleado()">
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
        <div class="modal fade" id="modalfotogrande" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog fotogrande" role="document">
                <img id="fotoModal" src="" width="200" height="auto"/>
          </div>
        </div>
        <div class="overlay">
                <div><div class="spinner-border text-light" role="status"></div>
                    <div id="textooverlay" class="text-white">Subiendo Foto...</div></div>
        </div>
        <jsp:include page="Footer.jsp"/>

         <script>
            var datos = new Object();
            datos.urlEmpleado = "https://firebasestorage.googleapis.com/v0/b/contactos-9976e.appspot.com/o/img%2Fusuario.jpeg?alt=media&token=a4588e9d-b89b-4d6a-9077-270167cb7de5";
            $('.overlay').fadeOut();
            $('#fotocontainer').fadeOut();
            var firebaseConfig = {
                apiKey: "AIzaSyD8IMSIfRmP3i1OGo1-urvXvR6pLmzg65k",
                authDomain: "contactos-9976e.firebaseapp.com",
                databaseURL: "https://contactos-9976e.firebaseio.com",
                projectId: "contactos-9976e",
                storageBucket: "contactos-9976e.appspot.com",
                messagingSenderId: "138290618070",
                appId: "1:138290618070:web:313aab68ccd177b883f377"
              };
              // Initialize Firebase
              firebase.initializeApp(firebaseConfig);

            function mostrarFoto () {
                $('#modalfotogrande').modal('show');
            }

            var fileButton = document.getElementById('fileButton');
            var fotoid = document.getElementById('foto');
            var fotoid2 = document.getElementById('fotoModal');

              fileButton.addEventListener('change', function(e){
                var file = e.target.files[0];
                if (file !== null) {
                    $('.overlay').fadeIn();
                    var storageRef = firebase.storage().ref('img/'+file.name);
                    var task = storageRef.put(file);

                    task.on('state_changed', function progress(snapshot) {
                    }, function error(err) {
                        console.log(err);
                    }, function complete() {
                        task.snapshot.ref.getDownloadURL().then(function(downloadURL) {
                            datos.urlEmpleado = downloadURL;
                            fotoid.src = downloadURL;
                            fotoid2.src = downloadURL;
                            $('#fotocontainer').fadeIn();
                            $('.overlay').fadeOut();
                            $.toast({
                                heading: 'Perfecto',
                                text: 'Foto subida correctamente.',
                                icon: 'success',
                                loader: false,
                                position : 'top-right'
                            })
                        });
                    });
                }

             });

        </script>
        
        
        <script>

                           function sendAjaxEmpleado() {
                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                            
                            datos.nombresEmpleado = $('#nombresEmpleado').val();
                            datos.apellidosEmpleado = $('#apellidosEmpleado').val();
                            datos.usuarioEmpleado= $('#usuarioEmpleado').val();
                            datos.passwordEmpleado = $('#passwordEmpleado').val();
                            datos.Cargo_idCargo = $('#Cargo_idCargo').val();
                            datos.idAlmacen = $('#idAlmacen').val();
                            
                            $.ajax({
                                method: "POST",
                                url: "RegistroEmpleado",
                                data: {
                                    nombresEmpleado:datos.nombresEmpleado,
                                    apellidosEmpleado: datos.apellidosEmpleado,
                                    usuarioEmpleado: datos.usuarioEmpleado,
                                    passwordEmpleado: datos.passwordEmpleado,
                                    Cargo_idCargo: datos.Cargo_idCargo,
                                    idAlmacen: datos.idAlmacen,
                                    urlEmpleado: datos.urlEmpleado,
                                    
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
                                            fotoid.src = "";
                                            fotoid2.src = "";
                                            $('#fotocontainer').fadeOut();
                                        }
                                    });
                        };
                        
        </script>

</body>

</html>
