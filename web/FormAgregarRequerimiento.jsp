<%@page import="Models.UserDTO"%>
<%@page import="Models.ClienteNaturalDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if(!currentUser.getIdCargo().equals("3")){
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
    String idAlmacen = currentUser.getIdAlmacen();
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
                                            <a href="PanelEncargadoSucursal.jsp" class="btn btn-outline-light">&lt;&lt; Volver</a>
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
                            <form id="formagregarventa" class="login100-form validate-form" action="RegistrarVenta" method="POST">
					<!-- <span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span> -->

					<span class="login100-form-title p-b-34 p-t-27">
							<i class="zmdi zmdi-mall"></i> Realizar Requerimiento
					</span>

                                    <div id="sectionProducto" class="quintuplecolumn">
                    
                                        
                                        <div class="wrap-input100" data-validate="idProducto">
						<input id="idProducto" class="input100" type="number" name="idProducto" placeholder="Código">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>  
                                        <div class="wrap-input100" data-validate="Nombre">
                                            <input id="nombreProducto" class="input100" type="text" name="nombreProducto" disabled="disabled" placeholder="Descripción">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>    
                                        <div>
						
					</div>
                                        <div class="wrap-input100" data-validate="Cantidad">
						<input id="cantidadProducto" class="input100" type="number" name="cantidadProducto" placeholder="Cantidad" value="1">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>

                                        <div>
                                            <button class="btn btn-outline-light" onclick="agregarProductoLista()">
							<i class="zmdi zmdi-plus"></i> Agregar
						</button> 
                                            <button class="btn btn-outline-light" onclick="limpiarCuadroProducto()">
							<i class="zmdi zmdi-close"></i>
						</button>
                                            </div>
                                        
                                    </div>
                                        
                                        <div class="container-fluid">
                                            <div class="row">
                                                <table class="table table-striped table-hover table-dark text-center">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Nro</th>
                                                            <th scope="col">Producto</th>
                                                            <th scope="col">Cantidad</th>
                                                            <th scope="col">Acción</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tablalistaproductos">
                                                        

                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th scope="col"></th>
                                                            <th scope="col"></th>
                                                            <th scope="col"></th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        
				<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="sendAjaxEnviar('factura')">
							Enviar
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
        <jsp:include page="Footer.jsp"/>
        
<style>
    #sectionCliente {
        border: 1px solid #fff;
        border-radius: 18px;
        padding: 20px 20px 0;
        margin-bottom:20px;
    }
    #sectionProducto {
        border: 1px solid #fff;
        border-radius: 18px;
        padding: 20px 20px;
        margin-bottom: 20px;
    }
    .wrap-login100 {
        width: 100% !important;
    }
    .triplecolumn>div {
        width: 33% !important;
        display: inline-block;
    }
    .quintuplecolumn div {
        display: inline-block;
        margin: 0 2%;
    }
    .quintuplecolumn div:nth-child(1) {
        width: 116px;
    }
    .quintuplecolumn div:nth-child(2) {
        width: 252px;
    }
    .quintuplecolumn div:nth-child(3) {
        width: 106px;
    }
    .quintuplecolumn div:nth-child(4) {
        width: 137px;
    }
    .quintuplecolumn div:nth-child(5) {
        width: 148px;
    }
    .cuatruplecolumn {
        margin-bottom: 20px;
    }
    .cuatruplecolumn>div {
        width: 18% !important;
        display: inline-block;
        margin: 0 3%;
    }
    
</style>

        <script>
        var idAlmacenget="<%=idAlmacen%>";


            //creamos estructura como una clase de venta
            var estructuraventa = function () {
              var estructura = {
                idRequerimiento:"",
                fechaRequerimiento: "",
                horaRequerimiento:"",
                completadoRequerimiento:1,
                Almacen_idAlmacen:idAlmacenget,
                arrayProductos:[]
              };
              return estructura;
            }
            var estructuraproducto = function () {
              var estructura = {
                cantidadItemRequerimiento: "",
                Producto_idProducto: "",
                nombreProducto:""
              };
              return estructura;
            }
            //creamos un objeto de estructura venta
            let miventa = estructuraventa();
            
            function agregarProductoLista(){
                event.preventDefault();
                var idprod = $("#idProducto").val();
                var cantidadprod = $("#cantidadProducto").val();
                var nombreProd = $("#nombreProducto").val();
                //creamos un objeto de tipo estructuraproducto
                let miproducto = estructuraproducto();
                miproducto.cantidadItemRequerimiento = cantidadprod;
                miproducto.Producto_idProducto =idprod;
                miproducto.nombreProducto =nombreProd;
                miventa.arrayProductos.push(miproducto);
                
                var cantidaditems = miventa.arrayProductos.length;
                
                var itemsproductos = `<tr>
                                <td>\${cantidaditems}</td>
                                <td>\${nombreProd}</td>
                                <td>\${cantidadprod}</td>
                                <td><button class="btn btn-outline-danger" onclick="eliminarItem(\${cantidaditems-1})"><i class="zmdi zmdi-delete"></i></button></td>
                            </tr>`;

                $("#tablalistaproductos").append(itemsproductos);
                limpiarCuadroProducto();

            }
            function eliminarItem(val){
                miventa.arrayProductos.splice(val,1)
                //console.log(miventa);
                var bodyTabla=document.getElementById("tablalistaproductos");
                bodyTabla.innerHTML= "";
                actualizarProductos();
                
                
            }
            function actualizarProductos(){
                var cantidaditems = miventa.arrayProductos.length;
                for (var i = 0; i < cantidaditems; i++) {
                    
                    
                    var itemsproductos = `<tr>
                                <td>\${i+1}</td>
                                <td>\${miventa.arrayProductos[i].nombreProducto}</td>
                                <td>\${miventa.arrayProductos[i].cantidadItemRequerimiento}</td>
                                <td><button class="btn btn-outline-danger" onclick="eliminarItem(\${i})"><i class="zmdi zmdi-delete"></i></button></td>
                            </tr>`;

                $("#tablalistaproductos").append(itemsproductos);
    
                }
                
            }    
            function limpiarCuadroProducto(){
                event.preventDefault();
                $("#idProducto").val("");
                $("#nombreProducto").val("");
                $("#cantidadProducto").val("1");
                $( "#idProducto" ).focus();
            }
                                            
            

        //escucha el boton    
$( "#idProducto" ).bind('input', function() { 
    //funcion para sacar datos de producto
    var codprod = $("#idProducto").val();
    // tamaño de contenido
    if (codprod.length > 0) {
        $.ajax({
                                method: "POST",
                                url: "RegistrarRequerimiento",
                                data: {
                                    numero: codprod,
                                    tipo: "producto",
                                    almacen: 1
                                }
                            })
                                    .done(function (data) {
                                        console.log(data);
                                        if (data.status == 200) {
                                            
                                            $("#nombreProducto").val(data.descripcionProducto);
                                            
                                            
                                        }
                                        else if (data.status == 404) {
                                            $.toast({
                                                heading: 'El producto no se encontro',
                                                text: 'El producto no se encontro',
                                                icon: 'warning',
                                                loader: false,
                                                position : 'top-right'
                                            })

                                        }
                                        
                                    });
    }
    else {

    }
});



   function sendAjaxEnviar() {
                            event.preventDefault();
                            var fechaHora = new Date();
                            var fecha = fechaHora.getFullYear()+"-"+(fechaHora.getMonth()+1)+"-"+fechaHora.getDate();
                            var hora = fecha + " "+ fechaHora.getHours()+":"+fechaHora.getMinutes()+":"+fechaHora.getSeconds();
                            miventa.fechaRequerimiento = fecha;
                            miventa.horaRequerimiento = hora;
                            
                            console.log(miventa);
                          if(miventa.length<1) {
                               return;                           }
                            
                            $.ajax({
                                method: "POST",
                                url: "RegistrarRequerimiento",
                                data: {
                                    ventacompleto : JSON.stringify(miventa),
                                    tipo: "requerimiento"
                                }
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

                                        else {
                                            $.toast({
                                                heading: 'Perfecto',
                                                text: 'Registrado Correctamente',
                                                icon: 'success',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            //$("#formagregarpolicia").reset();
                                            $('#formagregarventa').trigger("reset");
                                        }
                                    });
                        };

                        
                            
                                                 
                        
        </script>

</body>

</html>


