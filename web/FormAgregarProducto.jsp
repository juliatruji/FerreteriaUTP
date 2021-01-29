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
                            <form id="formagregarproducto" class="login100-form validate-form" action="RegistroProducto" method="POST">
					<!-- <span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span> -->

					<span class="login100-form-title p-b-34 p-t-27">
							<i class="zmdi zmdi-account-add"></i> Agregar  Producto
					</span>

					<div class="wrap-input100 validate-input" data-validate="Nombre Producto">
						<input id="nombreProducto" class="input100" type="text" name="nombreProducto" placeholder="Nombre Producto">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Descripcion Producto">
						<input id="descripcionProducto" class="input100" type="text" name="descripcionProducto" placeholder="Descripcion Producto">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>
                                        
                                        
                                        <label for="fileButton"><i class="zmdi zmdi-collection-folder-image"></i> Subir Foto</label>  
                                                <input type="file" id="fileButton" value="upload"/>
                                        <div id="fotocontainer" onClick="mostrarFoto()"><img id="foto" src="" width="200" height="auto"/></div>   
                             
                                        
                                        
				<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="sendAjaxProducto()">
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
        datos.imagenProducto = "https://firebasestorage.googleapis.com/v0/b/contactos-9976e.appspot.com/o/img%2Fproducto.jpeg?alt=media&token=884b0407-01d8-452d-a86b-0de2f2978c96";
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
                        datos.imagenProducto = downloadURL;
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
            


                        function sendAjaxProducto() {
                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                            
                            datos.nombreProducto = $('#nombreProducto').val();
                            datos.descripcionProducto = $('#descripcionProducto').val();
                            
                            
                            $.ajax({
                                method: "POST",
                                url: "RegistroProducto",
                                data: {
                                    nombreProducto: datos.nombreProducto,
                                    descripcionProducto: datos.descripcionProducto,
                                    imagenProducto: datos.imagenProducto,
                                    
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
                                            $('#formagregarproducto').trigger("reset");
                                            fotoid.src = "";
                                            fotoid2.src = "";
                                            $('#fotocontainer').fadeOut();
                        
                                            
                                        }
                                    });
                        };
                        
        </script>

</body>

</html>

