<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if(!currentUser.getIdCargo().equals("2")){
            out.println("<h1>NO estas autorizado</h1>");
            out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
            return;
        }
    }
    else {
        out.println("<h1>NO estas autorizado</h1>");
        out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
        return;
    }
    
    String nombreadmin = currentUser.getNombre();
    String apellidosadmin = currentUser.getApellidos();
    String dniadmin = currentUser.getDni();
    String idalmacen = currentUser.getIdAlmacen();
    String urlEmpleado = currentUser.getUrlEmpleado();
    //out.println(currentUser.getNombre());
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
						<a class="btn btn-dark dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="zmdi zmdi-account-circle">Compras</i>
						</a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="/ListarRequerimiento"><i class="zmdi zmdi-account-add"></i> Realizar Compra</a>
						</div>
					</div>


				</div>
				<div class="menurighttop">

					<div class="dropdown show">
						<a class="btn btn-dark dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="zmdi zmdi-accounts">Documentos</i>
						</a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="#"><i class="zmdi zmdi-plus-square"></i> Enviar Guia Remision</a>
							<a class="dropdown-item" href="#"><i class="zmdi zmdi-accounts-list"></i>Registrar Nota de ingreso</a>
							<a class="dropdown-item" href="#"><i class="zmdi zmdi-code"></i> Registrar nota de entrada</a>
							<hr/>
						</div>
					</div>


				</div> 
                                    <div class="menurighttop">

					<div class="dropdown show">
						<a class="btn btn-dark dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="zmdi zmdi-search">Consulta</i>
						</a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<!--<a class="dropdown-item" href="#"><i class="zmdi zmdi-shopping-basket"></i> Kardex</a>-->
                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-shopping-cart-plus"></i>Compras Realizadas</a>
                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-shopping-cart-plus"></i>Transferencias Realizadas</a>
							<hr/>
						</div>
					</div>


				</div> 
			</nav>
		</div>


		<div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form">

					<span class="login100-form-title p-b-34 p-t-27">
							<i class="zmdi zmdi-account"></i> Bienvenid@ JefeAlmacen
					</span>
                                        <span class="login100-form-title p-b-34 p-t-27">
                                                <%= nombreadmin %> <%= apellidosadmin %>
					</span>
                                        <span class="login100-form-title p-b-34 p-t-27">
                                        <img src="<% out.println(urlEmpleado); %>"
                                                width="100" 
                                                height="100"
                                                />
                                        </span>

					
				</form>
			</div>
		</div>
	</div>

	<footer class="footer mt-auto py-3 justify-content-between">
		<div>
			<span class="text-muted">© 2019 Ferreteria Utp</span>
                        <a class="btn btn-outline-primary" style="float:right; margin-top:-6px" href="/exit.jsp">
							<i class="zmdi zmdi-sign-in"></i> 
                        </a>


		</div>
	</footer>


	<div id="dropDownSelect1"></div>
        <jsp:include page="Footer.jsp"/>
</body>

</html>