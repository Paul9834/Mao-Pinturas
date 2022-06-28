<%-- 
    Document   : ListaProveedores
    Created on : 20/05/2022, 3:10:27 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Proveedores</title>

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
        <%if (res.equals("Actualizado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Proveedor actualizado correctamente!'
                });
            };
        </script>
        <%} else if (res.equals("NoActualizado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error!", "¡No se pudo completar la actualización de Datos! ", {
                    icon: "error"
                });
            };
        </script>
<% }else if (res.equals("Inactivado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Proveedor Inactivado! ", "!El Proveedor se Inhabilitado con exitó! ", {
            icon: "warning"
            });
            };
        </script>
        <%} else if (res.equals("NoInactivado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Error!", "El estado del Proveedor no pudo actualizarse" {
            icon: "error"
            });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp;  LISTADO DE PROVEEDORES
            </h3>
            <p class="text-justify">
                En el módulo PROVEEDORES podrá observar los proveedores registrados para registros de productos, además podrá realizar búsquedas de proveedores, actualizar datos de sus proveedores o eliminarlos si así lo desea. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="ListaProveedores.jsp"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES</a>
                </li>
                <li>
                    <a  href="Controlador?menu=Ciudad&accion=ListarProveedores"><i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRAR  PROVEEDORES</a>
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
                            <th scope="row">NOMBRES</th>
                            <th scope="row">TELEFONO</th>
                            <th scope="row">DIRECCION</th>
                            <th scope="row">CIUDAD</th>
                            <th scope="row">ACTUALIZAR</th>
                             <th>INAHABILITAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="prov" items="${proveedores}">
                            <tr class="text-center" >
                                <td scope="row">${prov.getIdProveedores()}</td>
                                <td><a href="Controlador?menu=Proveedores&accion=Consultaridprov&id=${prov.getIdProveedores()}" >
                                        <button style="border: none; color:#d9534f; font-weight: bold;" class="btn btn-outline-info">${prov.getNombres()}</button>
                                    </a>
                                </td>
                                <td>${prov.getIndicativo_Tel1()} ${prov.getTelefono1()}</td>
                                <td>${prov.getDireccion()}</td>
                                <td>${prov.getNombreCiudad()}</td>
                                <td>
                                    <form action="Controlador?menu=Proveedores&accion=Editar&idProveedores=${prov.getIdProveedores()}" method="post">
                                        <button type="submit" class="btn btn-success"> 
                                            <i class="fas fa-sync-alt"></i>	</button>	                                        
                                    </form>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Proveedores&accion=Inhabilitar&idProveedores=${prov.getIdProveedores()}"  method="post">
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
                html: `<h1>${prove.getNombres()}</h1>  
     <p> Tipo de Telefono:    <strong>${prove.getTipo_Tel1()}</strong><br>
      Telefono:    <strong> ${prove.getIndicativo_Tel1()} ${prove.getTelefono1()}</strong><br>
      Tipo de Telefono:    <strong>${prove.getTipo_Tel2()}</strong><br>
      Telefono:    <strong> ${prove.getIndicativo_Tel2()} ${prove.getTelefono2()}</strong><br>
      Direccion:   <strong> ${prove.getDireccion()}</strong><br>
      Ciudad: <strong> ${prove.getNombreCiudad()}</strong><br>
      Estadp <strong> ${prove.getEstado()}</strong></p>

      `, icon: "info",
                position: "top"
            });
        };

    </script>
    <%}%>


    <script src="./js/main2.js" ></script>

</html>