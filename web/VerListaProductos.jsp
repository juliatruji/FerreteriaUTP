<%@page import="Models.ProductoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   ProductoDTO[] obj_producto =(ProductoDTO[]) session.getAttribute("ListaProducto");

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
                            <h5 class="nav-item nav-link active" href="#">Ferretería UTP - Producto <span
                                    class="sr-only">(current)</span></h5>
                            <a class="nav-item nav-link" href="#" style="display: none;">Acceder</a>


                        </div>

                    </div>

                    <div class="menurighttop">
                        <a href="./PanelAdministrador.jsp" class="btn btn-outline-light"><< Volver</a>




                    </div>
                </nav>
            </div>


            <div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">


                <div class="wrap-login100">


                    <style> .wrap-login100{width: 100%}</style>
                    <form class="login100-form validate-form">

                        <% if (obj_producto== null) {

                        %>

                        <span class="login100-form-title p-b-18 p-t-0">
                            No Existen Productos
                        </span>
                        <%                          } else {

                        %>


                        <div class="container-fluid">
                            <div class="row">
                                <table class="table table-striped table-hover table-dark text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Imagen</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            for (int i = 0; i < obj_producto.length; i++) {
                                                
                                        %>
                                        <tr>
                                            <td><% out.println(obj_producto[i].getNombreProducto()); %></td>
                                            <td><% out.println(obj_producto[i].getDescripcionProducto()); %></td>
                                            <td><img src="<% out.println(obj_producto[i].getImagenProducto()); %>"
                                                width="50" 
                                                height="50"
                                                />
                                                
                                                </td>
                                        </tr>

                                        <%                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </form>



                </div>
            </div>
        </div>

        <footer class="footer mt-auto py-3 justify-content-between">
            <div>
                <span class="text-muted">© 2019 Ferreteria Utp</span>


            </div>
        </footer>


        <div id="dropDownSelect1"></div>
        <jsp:include page="Footer.jsp"/>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>


    </body>

</html>
