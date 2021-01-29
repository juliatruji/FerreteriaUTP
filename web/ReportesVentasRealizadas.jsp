<%@page import="Models.ReportesVentasRealizadasDTO"%>
<%@page import="Models.EmpleadoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ReportesVentasRealizadasDTO[] objVentasRealizadas = (ReportesVentasRealizadasDTO[]) session.getAttribute("ReportesVentasRealizadas");

%>
<!DOCTYPE html>
<html lang="es">

    <head>
    <jsp:include page="Head.jsp"/>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    
    <style>
        .dataTables_wrapper {
            width: 100%;
        }
        table.dataTable tbody tr{
            background: rgba(0, 0, 0, 0.02);
        }
        .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
            color:rgba(255, 255, 255, 0.52);
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            color:#fff !important;
        }
    </style>
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
                            <h5 class="nav-item nav-link active" href="#">Ferretería UTP - Empleado <span
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

                        <% if (objVentasRealizadas== null) {

                        %>

                        <span class="login100-form-title p-b-18 p-t-0">
                            No Existen Ventas
                        </span>
                        <%                          } else {

                        %>

                            
                        <div class="container-fluid">
                            <h1 class="text-white text-center">Reporte de Ventas</h1>
                            <div class="row">
                                <table data-order='[[ 1, "asc" ]]' data-page-length='2' id="tablaVentas" class="table table-striped table-hover table-dark text-center text-white">
                                    <thead>
                                        <tr>
                                            <th scope="col">Tipo</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Cliente</th>
                                            <th scope="col">Almacen</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            for (int i = 0; i < objVentasRealizadas.length; i++) {
                                                
                                        %>
                                        <tr>
                                            <td><%
                                                if (objVentasRealizadas[i].getTipoComprobante().equals("b")){
                                                    out.println("Boleta");
                                                }
                                                else {
                                                    out.println("Factura");
                                                }
                                                 %></td>
                                            <td><% out.println(objVentasRealizadas[i].getFechaComprobante()); %></td>
                                            <td>S/. <% out.println(objVentasRealizadas[i].getTotalComprobante()); %></td>
                                            <td><% out.println(objVentasRealizadas[i].getNombreCliente()); %></td>
                                            <td><% out.println(objVentasRealizadas[i].getNombreAlmacen()); %></td>
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

<script src="/assets/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#tablaVentas').DataTable();
    } );

      
    </script>
    </body>

</html>
