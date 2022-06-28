<%-- 
    Document   : ListaPedidos
    Created on : 24/06/2022, 2:18:19 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Pedidos</title>

        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">
        <style>
            p{
                text-align: left;
            }
        </style>
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">

        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">

        <link rel="stylesheet" href="./css/dataTables.bootstrap4.min.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("respuesta"));
            String emp = String.valueOf(request.getParameter("par"));
        %>
    </head>

    <body>
        <%if (res.equals("Recibido")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Pedido actualizado correctamente!'
                });
            };
        </script>
        <%} else if (res.equals("NoRecibido")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error!", "¡No se pudo completar la actualización de Datos! ", {
                    icon: "error"
                });
            };
        </script>
<% }else if (res.equals("Cancelado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Pedido Cancelado! ", "!El Pedido se Cancalado con exitó! ", {
            icon: "warning"
            });
            };
        </script>
        <%} else if (res.equals("NoCancelado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Error!", "El estado del Pedido no pudo actualizarse" {
            icon: "error"
            });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp;  LISTADO DE PEDIDOS
            </h3>
            <p class="text-justify">
                En el módulo PEDIDOS podrá observar los PEDIDOS registrados para registros de productos, además podrá realizar búsquedas de pedidos, actualizar  pedidos o cancelarlos. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="#"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PEDIDOS</a>
                </li>
                <li>
                    <a  href="Controlador?menu=Proveedores&accion=ListarPedidos"><i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRAR  PEDIDOS</a>
                </li>

            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <div class="table-responsive table-hover">
                <table class="table  table-sm  table table-bordered table stacktable"  id="tablax">
                    <thead style="background-color: #d9534f">
                        <tr class="text-center roboto-medium">
                            <th scope="row">#</th>
                            <th scope="row">FECHA SOLICITUD</th>
                            <th scope="row">FECHE ENTREGA</th>
                            <th scope="row">CANTIDAD DE PRODUCTOS</th>
                            <th scope="row">VALOR PEDIDO</th>
                            <th scope="row">PROVEEDOR</th>
                             <th>VER PEDIDO</th>
                            <th scope="row">PEDIDO RECIBIDO</th>
                             <th>CANCELAR PEDIDO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pedidos" items="${pedidos}">
                            <tr class="text-center" >
                                <td><a href="Controlador?menu=Pedidos&accion=Consultaridpd&id=${pedidos.getIdPedidosProveedor()}" >
                                        <button style="border: none; color:#d9534f; font-weight: bold;" class="btn btn-outline-info">000${pedidos.getIdPedidosProveedor()}</button>
                                    </a>
                                </td>
                                <td>${pedidos.getFecha_Solicitud()}</td>
                                <td>${pedidos.getFecha_Entrega()}</td>
                                <td>${pedidos.getCan_Total_Productos()}</td>
                                <td>${pedidos.getValor_Pedido()}</td>
                                <td>${pedidos.getProveedor()}</td>
  
                                 <td>
                                    <a href="Controlador?menu=Pedidos&accion=VerPedido&id=${pedidos.getIdPedidosProveedor()}"> 
                                      <i  class="fas fa-file-pdf"></i></a>
                                
                                </td>
                                <td>
                                    <form action="Controlador?menu=Pedidos&accion=PedidoRecibido&id=${pedidos.getIdPedidosProveedor()}" method="post">
                                        <button type="submit" class="btn btn-success"> 
                                            <i class="fas fa-check"></i>	</button>	                                        
                                    </form>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Pedidos&accion=PedidoCancelado&id=${pedidos.getIdPedidosProveedor()}"  method="post">
                                        <button type="submit" class="btn btn-warning"> 
                                             <i class="	fas fa-times"></i>  <i  class="	fas fa-truck-moving"></i></button>
                                    </form>
                                </td>
                                               
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    </body>
    <!--=============================================
    =            Include JavaScript files           =
    ==============================================-->
    <!-- jQuery V3.4.1 -->
    <script src="./js/jquery-3.4.1.min.js" ></script>

    <!-- popper -->
    <script src="./js/popper.min2.js" ></script>

    <!-- Bootstrap V4.3 -->
    <script src="./js/bootstrap.min.js" ></script>

    <!-- jQuery Custom Content Scroller V3.1.5 -->
    <script src="./js/jquery.mCustomScrollbar.concat.min2.js" ></script>

    <!-- Bootstrap Material Design V4.0 -->

    <!-- DATATABLES -->
    <script src="./js/jquery.dataTables.min.js"></script>
    <!-- BOOTSTRAP -->
    <script src="./js/dataTables.bootstrap4.min.js"></script>
    <script>
                $(document).ready(function () {
                    $('#tablax').DataTable({
                        language: {

                            processing: "Tratamiento en curso...",
                            search: "Buscar&nbsp;:",
                            lengthMenu: "Agrupar de _MENU_ items",
                            info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                            infoEmpty: "No existen datos.",
                            infoFiltered: "(filtrado de _MAX_ elementos en total)",
                            infoPostFix: "",
                            loadingRecords: "Cargando...",
                            zeroRecords: "No se encontraron datos con tu busqueda",
                            emptyTable: "No hay datos disponibles en la tabla.",
                            paginate: {
                                first: "Primero",
                                previous: "Anterior",
                                next: "Siguiente",
                                last: "Ultimo"
                            },
                            aria: {
                                sortAscending: ": active para ordenar la columna en orden ascendente",
                                sortDescending: ": active para ordenar la columna en orden descendente"
                            }
                        }
                    });
                });


    </script>
    <%if (emp.equals("1")) { %>
    <script type="text/javascript">
        window.onload = function () {
            Swal.fire({
                html: `<h1>000${pd.getIdPedidosProveedor()}</h1>  <br>
      <p>Fecha Solicitud:    <strong>${pd.getFecha_Solicitud()}</strong></p>
      <p>Fecha Entrega:    <strong> ${pd.getFecha_Entrega()}</strong></p>
      <p>Cantidad Total Productos:    <strong>${pd.getCan_Total_Productos()}</strong></p>
      <p>Valor del Pedido:    <strong> ${pd.getValor_Pedido()}</strong></p>
      <p>Proveedor:   <strong> ${pd.getProveedor()}</strong></p>
      <p>Usuario que registro Pedido:   <strong> ${pd.getUsuario()}</strong></p>
      <p>Estado del Pedido: <strong> ${pd.getEstado()}</strong></p>  
       <p>Observaciones del Pedido: <strong> ${pd.getObservacion_Pedido()}</strong></p>  
      <br>
      `, icon: "info",
                position: "top"
            });
        };
    </script>
    <%}%>


    <script src="./js/main2.js" ></script>

</html>