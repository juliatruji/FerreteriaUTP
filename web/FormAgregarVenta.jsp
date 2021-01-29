<%@page import="Models.UserDTO"%>
<%@page import="Models.ClienteNaturalDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if(!currentUser.getIdCargo().equals("5")){
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
    String idAlmacen= currentUser.getIdAlmacen();
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
                                            <a href="PanelVendedor.jsp" class="btn btn-outline-light">&lt;&lt; Volver</a>
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
							<i class="zmdi zmdi-mall"></i> Registrar Venta
					</span>
                                        <div class="cuatruplecolumn">
                                            <div class="wrap-input100 validate-input" data-validate="Dni">
                                                <input id="dniruc" class="input100" type="text" name="dni" maxlength="10" placeholder="DNI o RUC">
                                                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                                            </div>
                                            <div>
                                                <button class="btn btn-outline-light" onclick="obtenerTipoUsuario()">
							Verificar
						</button>
                                            </div>
                                        </div>
                               <div id="sectionCliente">
                                   
                                   <div class="triplecolumn">
                                       <div class="wrap-input100 " data-validate="Nombres">
						<input id="nombres" class="input100" type="text" name="nombres" placeholder="Nombres">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					
                                        <div class="wrap-input100 " data-validate="Apellidos">
                                                <input id="apellidos" class="input100" type="text" name="apellidos"  placeholder="Apellidos">
                                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>
                                       
                                       <div class="wrap-input100 " data-validate="Telefono">
						<input id="telefonoCliente" class="input100" type="text" name="telefonoCliente" placeholder="Telefono">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                    </div>
                                   
                                        
                                    <div class="triplecolumn">
                                        <div class="wrap-input100 " data-validate="Direccion">
                                                <input id="direccion" class="input100" type="text" name="direccion"  placeholder="Direccion">
                                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                                        </div>
                                        
                                        <div class="wrap-input100 " data-validate="Email">
						<input id="emailCliente" class="input100" type="text" name="emailCliente" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
                                        <div>
                                                <button id="registrarNatural" class="btn btn-outline-light" onclick="agregarUsuario()">
							Registrar
						</button>
                                            </div>
                                    </div>
                            </div>


                            <div id="sectionEmpresa">
                                <div class="triplecolumn">
                                        <div class="wrap-input100" data-validate="RUC">
						<input id="ruc" class="input100" type="text" name="ruc" placeholder="RUC">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100" data-validate="Razon Social">
						<input id="razon" class="input100" type="text" name="razon" placeholder="Razon Social">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>
                                
                                        <div class="wrap-input100" data-validate="Direccion">
						<input id="direccionClienteEmpresa" class="input100" type="text" name="direccionClienteEmpresa" placeholder="Direccion">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>
                                </div>
                                <div class="cuatruplecolumn">
                                        <div class="wrap-input100" data-validate="telefono">
						<input id="telefonoClienteEmpresa" class="input100" type="text" name="telefonoClienteEmpresa" placeholder="Telefono">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>
                                        <div class="wrap-input100" data-validate="Correoempresa">
						<input id="emailClienteEmpresa" class="input100" type="text" name="emailClienteEmpresa" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>
                                        <div id="passswordEmpresaContainer" class="wrap-input100" data-validate="password">
						<input id="passswordClienteEmpresa" class="input100" type="password" name="passswordClienteEmpresa" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>  
                                    <div>
                                                <button id="registrarEmpresa" class="btn btn-outline-light" onclick="agregarEmpresa()">
							Registrar
						</button>
                                            </div>
                                </div>
                            </div>
                                        
                                        

                        


                        
                        
                                    <div id="sectionProducto" class="quintuplecolumn">
                    
                                        
                                        <div class="wrap-input100" data-validate="idProducto">
						<input id="idProducto" class="input100" type="number" name="idProducto" placeholder="Código">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>  
                                        <div class="wrap-input100" data-validate="Nombre">
                                            <input id="nombreProducto" class="input100" type="text" name="nombreProducto" disabled="disabled" placeholder="Descripción">
						<span class="focus-input100" data-placeholder="&#xf183;"></span>
					</div>    
                                        <div class="wrap-input100" data-validate="Precio">
						<input id="precioProducto" class="input100" type="text" name="precioProducto" disabled="disabled" placeholder="Precio">
						<span class="focus-input100" data-placeholder="&#xf19a;"></span>
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
                                        <!--seccion de Lista Productos-->
                                        <div class="container-fluid">
                                            <div class="row">
                                                <table class="table table-striped table-hover table-dark text-center">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Nro</th>
                                                            <th scope="col">Producto</th>
                                                            <th scope="col">Cantidad</th>
                                                            <th scope="col">Precio</th>
                                                            <th scope="col">Importe</th>
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
                                                            <th scope="col">Total: S/<span id="totaltabla">0</span></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        
                                        <div class="btn-group btn-group-toggle">
                                                <label  id="btnBoleta" class="btn btn-outline-light active">
                                                  <input type="radio" name="options" id="boleta" autocomplete="on" checked> Boleta
                                                </label>
                                                <label  id="btnFactura" class="btn btn-outline-light">
                                                  <input type="radio" name="options" id="factura" autocomplete="off"> Factura
                                                </label>
                                                
                                            </div>
                                        
				<div class="container-login100-form-btn">
                                    
                                    
						<button class="login100-form-btn" onclick="sendAjaxPago('factura')">
							Completar
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
    #sectionCliente, #sectionEmpresa {
        display:none;
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
            //creamos estructura de tabla comprobante
             var estructuraventa = function () {
              var estructura = {
                idComprobante:"",
                tipoComprobante: "",
                fechaComprobante:"",
                horaComprobante:"",
                totalComprobante:0,
                pagadoComprobante:1,
                Cliente_idCliente:"",
                idAlmacen:"",
                arrayProductos:[]
                
              };
              return estructura;
            }
            //estructura de tabla venta
            var estructuraproducto = function () {
              var estructura = {
                nombreProducto: "",
                cantidadProducto: "",
                importeVenta: "",
                Comprobante_idComprobante: "",
                Stock_idStock: "",
              };
              return estructura;
            }
            //creamos un objeto de estructura venta
            let miventa = estructuraventa();
            miventa.idAlmacen = idAlmacenget;
            
            function obtenerTipoUsuario(){
                event.preventDefault();
                var valuerucdni = $("#dniruc").val();
                
                if(valuerucdni.length === 8) {
                    $.ajax({
                                method: "POST",
                                url: "ObtenerDatosVenta",
                                data: {
                                    numero: valuerucdni,
                                    tipo: "dni"
                                }
                            })
                                    .done(function (data) {
                                        if (data.status == 200) {
                                             $.toast({
                                                heading: 'DNI Correcto',
                                                text: 'El Usuario Existe',
                                                icon: 'success',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            $( "#btnBoleta" ).addClass( "active" );
                                            $( "#btnFactura" ).removeClass("active");
                                            miventa.Cliente_idCliente=data.idCliente;
                                            miventa.tipoComprobante="b";
                                            $("#nombres").val(data.nombresCliente);
                                            $("#apellidos").val(data.apellidosCliente);
                                            $("#direccion").val(data.direccionCliente);
                                            $("#telefonoCliente").val(data.telefonoCliente);
                                            $("#emailCliente").val(data.emailCliente);                         
                                            $("#registrarNatural").hide();
                                            
                                            
                                        }
                                       
                                        else if (data.status == 404) {
                                            $.toast({
                                                heading: 'DNI no encontrado',
                                                text: 'El Cliente no existe',
                                                icon: 'warning',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            miventa.Cliente_idCliente="";
                                            $("#nombres").val("");
                                            $("#apellidos").val("");
                                            $("#direccion").val("");
                                            $("#telefonoCliente").val("");
                                            $("#emailCliente").val("");
                                            $("#registrarNatural").show();
                                        }
                                        $("#sectionCliente").show();
                                        $("#sectionEmpresa").hide();
                                        
                                        
                                        
                                    });
                                    
                    
                }
                else if(valuerucdni.length === 10) {
                            $.ajax({
                                method: "POST",
                                url: "ObtenerDatosVenta",
                                data: {
                                    numero: valuerucdni,
                                    tipo: "ruc"
                                }
                            })
                                    .done(function (data) {
                                         if (data.status == 200) {
                                             $.toast({
                                                heading: 'RUC Correcto',
                                                text: 'La Empresa existe',
                                                icon: 'success',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            $( "#btnFactura" ).addClass( "active" );
                                            $( "#btnBoleta" ).removeClass("active");                                            
                                            miventa.Cliente_idCliente=data.idCliente;
                                            miventa.tipoComprobante="f";
                                            $("#ruc").val(data.rucCliente);
                                            $("#razon").val(data.razonCliente);
                                            $("#direccionClienteEmpresa").val(data.direccionCliente);
                                            $("#telefonoClienteEmpresa").val(data.telefonoCliente);
                                            $("#emailClienteEmpresa").val(data.emailCliente);
                                            $("#passswordEmpresaContainer").hide();
                                            $("#registrarEmpresa").hide();
                                            
                                        }
                                        else if (data.status == 404) {
                                            $.toast({
                                                heading: 'RUC no encontrado',
                                                text: 'La Empresa no existe',
                                                icon: 'warning',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                            miventa.Cliente_idCliente="";
                                            $("#ruc").val("");
                                            $("#razon").val("");
                                            $("#direccionClienteEmpresa").val("");
                                            $("#telefonoClienteEmpresa").val("");
                                            $("#emailClienteEmpresa").val("");
                                            $("#passswordEmpresaContainer").show();
                                            $("#registrarEmpresa").show()
                                        }
                                        $("#sectionEmpresa").show();
                                        $("#sectionCliente").hide();
                                        ;

                                    });
                }
                
                else {
                     $.toast({
                        heading: 'Número Inválido',
                        text: 'Ingrese un RUC o DNI',
                        icon: 'error',
                        loader: false,
                        position : 'top-right'
                    })
                    $("#sectionEmpresa").hide();
                    $("#sectionCliente").hide();
        
                }
                
            }
            function agregarUsuario(){
                         var datos = new Object();
                        datos.urlCliente = "https://firebasestorage.googleapis.com/v0/b/contactos-9976e.appspot.com/o/img%2Fusuario.jpeg?alt=media&token=a4588e9d-b89b-4d6a-9077-270167cb7de5";

                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                                                        
                            datos.telefonoCliente = $('#telefonoCliente').val();
                            datos.direccionCliente = $('#direccion').val();
                            datos.emailCliente= $('#emailCliente').val();
                            datos.nombresCliente = $('#nombres').val();
                            datos.apellidosCliente = $('#apellidos').val();
                            datos.dniCliente= $('#dniruc').val();
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
                                        else {
                                            $.toast({
                                                heading: 'Perfecto',
                                                text: 'Registrado Correctamente',
                                                icon: 'success',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                           
                                        }
                                    });
                        }
            function agregarEmpresa(){
                            var datos = new Object();
                            datos.urlCliente = "https://firebasestorage.googleapis.com/v0/b/contactos-9976e.appspot.com/o/img%2Fusuario.jpeg?alt=media&token=a4588e9d-b89b-4d6a-9077-270167cb7de5"; 
                            
                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                   
                            datos.razonCliente = $('#razon').val();
                            datos.rucCliente = $('#ruc').val();
                            datos.telefonoCliente = $('#telefonoClienteEmpresa').val();
                            datos.direccionCliente = $('#direccionClienteEmpresa').val();
                            datos.emailCliente= $('#emailClienteEmpresa').val();
                            datos.passwordCliente=$('#passswordClienteEmpresa').val();
                            
                            $.ajax({
                                method: "POST",
                                url: "RegistroClienteEmpresa",
                                data: {
                                    razonCliente: datos.razonCliente,
                                    rucCliente: datos.rucCliente,
                                    telefonoCliente: datos.telefonoCliente,
                                    direccionCliente: datos.direccionCliente,
                                    emailCliente: datos.emailCliente,
                                    passwordCliente:datos.passwordCliente,
                                    urlCliente:datos.urlCliente,
                                    
                                },
                            })
                                    .done(function (data) {

                                        if (data === "error ruc") {
                                            $.toast({
                                                heading: 'Error',
                                                text: 'El RUC ingresado ya existe',
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

                                            
                                            fotoid.src = "";
                                            fotoid2.src = "";
                                            $('#fotocontainer').fadeOut();;
                                            
                                        }
                                    });                            
                            
                        } 
            function agregarProductoLista(){
                event.preventDefault();
                var idprod = $("#idProducto").val();
                var nombreprod = $("#nombreProducto").val();
                var precioprod = $("#precioProducto").val();
                var cantidadprod = $("#cantidadProducto").val();
                //creamos un objeto de tipo estructuraproducto
                let miproducto = estructuraproducto();
                miproducto.cantidadProducto = cantidadprod;
                miproducto.importeVenta =precioprod;
                miproducto.Stock_idStock =idprod;
                miproducto.nombreProducto=nombreprod;
                miventa.arrayProductos.push(miproducto);
                miventa.totalComprobante+=cantidadprod*precioprod;
                $("#totaltabla").html(miventa.totalComprobante);
                
                var cantidaditems = miventa.arrayProductos.length;
                
                var itemsproductos = `<tr>
                                <td>\${cantidaditems}</td>
                                <td>\${nombreprod}</td>
                                <td>\${cantidadprod}</td>
                                <td>S/\${precioprod}</td>
                                <td>S/\${cantidadprod*precioprod}</td>
                                <td><button class="btn btn-outline-danger" onclick="eliminarItem(\${cantidaditems-1},\${cantidadprod*precioprod})"><i class="zmdi zmdi-delete"></i></button></td>
                            </tr>`;

                $("#tablalistaproductos").append(itemsproductos);
                limpiarCuadroProducto();

            }
            function eliminarItem(val,monto){
                //elminar elemento de esa posicion
                miventa.arrayProductos.splice(val,1)
                //console.log(miventa);
                var bodyTabla=document.getElementById("tablalistaproductos");
                bodyTabla.innerHTML= "";
                var limpiartotal=document.getElementById("totaltabla");
                limpiartotal.innerHTML= "";
                actualizarProductos();
                miventa.totalComprobante-=monto;
                $("#totaltabla").html(miventa.totalComprobante);
                
                
            }
            function actualizarProductos(){
                var cantidaditems = miventa.arrayProductos.length;
                for (var i = 0; i < cantidaditems; i++) {
                    
                    
                    var itemsproductos = `<tr>
                                <td>\${i+1}</td>
                                <td>\${miventa.arrayProductos[i].nombreProducto}</td>
                                <td>\${miventa.arrayProductos[i].cantidadProducto}</td>
                                <td>S/\${miventa.arrayProductos[i].importeVenta}</td>
                                <td>S/\${miventa.arrayProductos[i].cantidadProducto*miventa.arrayProductos[i].importeVenta}</td>
                                <td><button class="btn btn-outline-danger" onclick="eliminarItem(\${i},\${miventa.arrayProductos[i].cantidadProducto*miventa.arrayProductos[i].importeVenta})"><i class="zmdi zmdi-delete"></i></button></td>
                            </tr>`;

                $("#tablalistaproductos").append(itemsproductos);
    
                }
                
            }    
            function limpiarCuadroProducto(){
                event.preventDefault();
                $("#idProducto").val("");
                $("#nombreProducto").val("");
                $("#precioProducto").val("");
                $("#cantidadProducto").val("1");
                $( "#idProducto" ).focus();
            }
                                            
            

      //escucha el boton  para sacar datos de producto   
$( "#idProducto" ).bind('input', function() { 
    //funcion para sacar datos de producto
    var codprod = $("#idProducto").val();
    // la cantidad de numero que se esta ingresando
    if (codprod.length > 0) {
        $.ajax({
                                method: "POST",
                                url: "ObtenerDatosVenta",
                                data: {
                                    numero: codprod,
                                    tipo: "producto",
                                    almacen: idAlmacenget
                                }
                            })
                                    .done(function (data) {
                                       
                                        if (data.status == 200) {
                                            
                                            $("#nombreProducto").val(data.descripcionProducto);
                                            $("#precioProducto").val(data.precioProducto);
                                            
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
});

//funcion que valida en ingresar dni o ruc puro numero
(function($) {
    $.fn.inputFilter = function(inputFilter) {
      return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
        if (inputFilter(this.value)) {
          this.oldValue = this.value;
          this.oldSelectionStart = this.selectionStart;
          this.oldSelectionEnd = this.selectionEnd;
        } else if (this.hasOwnProperty("oldValue")) {
          this.value = this.oldValue;
          this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        }
      });
    };
  }(jQuery));

$("#dniruc").inputFilter(function(value) {
    return /^\d*$/.test(value);
});




   function sendAjaxPago() {
                            event.preventDefault();
                            var fechaHora = new Date();
                            var fecha = fechaHora.getFullYear()+"-"+(fechaHora.getMonth()+1)+"-"+fechaHora.getDate();
                            var hora = fecha + " "+ fechaHora.getHours()+":"+fechaHora.getMinutes()+":"+fechaHora.getSeconds();
                            miventa.fechaComprobante = fecha;
                            miventa.horaComprobante = hora;
                            $.ajax({
                                method: "POST",
                                url: "ObtenerDatosVenta",
                                data: {
                                    ventacompleto : JSON.stringify(miventa),
                                    tipo: "venta"
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
                                            $('#formagregarventa').trigger("reset");
                                        }
                                    });
                        };

                        
                            
                                                 
                        
        </script>

</body>

</html>


