<%-- 
    Document   : ListarUsuarios
    Created on : 17/04/2022, 11:38:43 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Usuarios pendientes por Aprobar</title>
        <style>
            p{
                text-align: left;
            }
        </style>
        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">

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
        <script src="sweetalert2.all.min.js"></script>
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
        <%if (res.equals("Cambiado")) { %>
        <script type="text/javascript">
             window.onload = function () {
                Swal.fire({
                    icon: 'success',
                    title: 'Aprobado',
                    text: '¡Usuario Aprobado para acceder al sistema!'
                });
            };
        </script>
        <%} else if (res.equals("NoCambiado")) {%>
        <script type="text/javascript">
              window.onload = function () {
                Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡Usuario no pudo ser aprobado! '

                });
            };
        </script>
        <%} else if (res.equals("Eliminado")) {%>
        <script type="text/javascript">
             window.onload = function () {
                Swal.fire({
                    icon: 'info',
                    title: '¡No Aprobado!!',
                    text: '!Usuario NO aprobado para acceder al sistema! '

                });
            };
        </script>
        <%} else if (res.equals("NoEliminado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error en la no aprobación del usuario! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp; MODULO DE ACEPTACION DE USUARIOS EN EL SISTEMA
            </h3>
            <p class="text-justify">
                En este módulo el usuario ADMINISTRADOR podrá Aprobar o Eliminar a los usuarios que intentaron registrarse en el sistema. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="ListarUserEstado.jsp"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS PENDIENTES POR APROBAR REGISTRO EN EL SISTEMA</a>
                </li>

            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <div class="table-responsive table-hover">
                <table class="table  table-sm  table table-bordered table stacktable"  id="tablax">
                    <thead style="background-color: #d9534f">
                        <tr class="text-center roboto-medium">
                            <th>#</th>
                            <th>NOMBRES Y APELLIDOS</th>
                            <th>DOCUMENTO</th>
                            <th>TELEFONO</th>
                            <th>ESTADO</th>
                            <th>TIPO USUARIO</th>
                            <th>APROBAR</th>
                            <th>NO APROBAR</th>
                        </tr>
                    </thead>
                    <tbody >
                        <c:forEach var="usu" items="${usuarios}">
                            <tr class="text-center" >
                                <td>${usu.getIdEmpleado()}</td>
                                <td><a href="Controlador?menu=Usuarios&accion=Consultarid&id=${usu.getIdEmpleado()}" >
                                        <button style="border: none; color:#d9534f; font-weight: bold;" class="btn btn-outline-info">${usu.getNombre1()} ${usu.getApellido1()}</button>
                                    </a>
                                </td>
                                <td>${usu.getDocumento()}</td>
                                <td>${usu.getTelefono1()}</td>
                                <td>${usu.getEstado()}</td>
                                <td>${usu.getTipoEmpleado()}</td>

                                <td>
                                    <form action="Controlador?menu=Usuarios&accion=ActualizarEstado&id=${usu.getIdEmpleado()}" method="post">
                                        <button type="submit" class="btn btn-success"> 
                                            <i class="fas fa-check"></i></button>	                                        
                                    </form>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Usuarios&accion=NoAprobar&id=${usu.getIdEmpleado()}"  method="post">
                                        <button type="submit" class="btn btn-warning"> 
                                            <i class="zmdi zmdi-close" style="font-size: 20px; font-weight: bold; "></i></button>
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
                html: `<h1>${empleado.getNombre1()} ${empleado.getApellido1()}</h1>  <br>
      <p>Tipo de Documento:     <strong>${empleado.getTipoDocumento()}</strong><br>
      Documento:    <strong>${empleado.getDocumento()}</strong><br>
      Nombres y apellidos:    <strong>${empleado.getNombre1()} ${empleado.getNombre2()} ${empleado.getApellido1()} ${empleado.getApellido2()}</strong><br>
      Tipo de Telefono:    <strong>${empleado.getTipo_Tel1()}</strong><br>
      Telefono:    <strong>${empleado.getIndicativo_Tel1()} ${empleado.getTelefono1()}</strong><br>
      Tipo de Telefono:    <strong>${empleado.getTipo_Tel2()}</strong><br>
      Telefono:    <strong>${empleado.getIndicativo_Tel2()} ${empleado.getTelefono2()}</strong><br>
      Estado:    <strong>${empleado.getEstado()}</strong><br>
      Genero:   <strong>${empleado.getGenero()}</strong><br>
      Tipo de Empleado:   <strong>${empleado.getTipoEmpleado()}</strong><br>
      Dirección:   <strong>${empleado.getDireccion()}</strong><br>
      Email:   <strong>${empleado.getEmail()}</strong><br>
      Ciudad:   <strong>${empleado.getNombreCiudad()}</strong><br>
      Fecha de Registro: <strong>${empleado.getFecha_Creacion()}</strong></p>
      
      `, icon: "info",
         position: "top",  
                width: "40%"
            });
        };

    </script>
    <%}%>

    <script src="./js/main2.js" ></script>

</html>