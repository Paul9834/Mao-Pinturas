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
        <title>Lista de Usuarios</title>
        <style>
            p{
                text-align: left;
            }
        </style>
        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">

        <!-- Bootstrap V4.3 -->
        <link rel="stylesheet" href="./css/bootstrap.min2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">

        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="./css/dataTables.bootstrap4.min.css">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("respuesta"));
            String emp = String.valueOf(request.getParameter("par"));
        %>
    </head>
    <body>

        <% if (res.equals("Cambiado2")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Empleado Inactivado! ", "!El empleado se Inhabilitado con exitó! ", {
            icon: "warning"
            });
            };
        </script>
        <%} else if (res.equals("NoCambiado2")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Error!", "El estado del empleado no pudo actualizarse" {
            icon: "error"
            });
            };
        </script>
        <%}%>
        <% if (res.equals("Actualizado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Empleado Actualizado! ", "!la información del empleado se Actualizo con exitó! ", {
            icon: "success"
            });
            };
        </script>
        <%} else if (res.equals("NoActualizado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Error!", "El empleado no pudo actualizarse" {
            icon: "error"
            });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE EMPLEADOS REGISTRADOS
            </h3>
            <p class="text-justify">
                En el módulo Empleados podrá ver la lista de empleados registrados, podrá eliminar empleados, buscar empleados en el sistema, actualizar datos de otros empleados y los suyos. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="#"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE EMPLEADOS ACTIVOS E INACTIVOS</a>
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
                            <th>ACTUALIZAR</th>
                            <th>INAHABILITAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usu" items="${usuarios}">
                            <tr class="text-center" >

                                <td>${usu.getIdEmpleado()}</td>
                                <td><a href="Controlador?menu=Usuarios&accion=Consultariduser&id=${usu.getIdEmpleado()}" >
                                        <button style="border: none; color:#d9534f; font-weight: bold;" class="btn btn-outline-info">${usu.getNombre1()} ${usu.getApellido1()}</button>
                                    </a>
                                </td>
                                <td>${usu.getDocumento()}</td>
                                <td>${usu.getIndicativo_Tel1()} ${usu.getTelefono1()}</td>
                                <td>${usu.getEstado()}</td>
                                <td>${usu.getTipoEmpleado()}</td>


                                <td>
                                    <a href="Controlador?menu=Usuarios&accion=Editar&id=${usu.getIdEmpleado()}" class="btn btn-success">
                                        <i class="fas fa-sync-alt"></i>	
                                    </a>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Usuarios&accion=Inhabilitar&id=${usu.getIdEmpleado()}"  method="post">
                                        <button type="submit" class="btn btn-warning"> 
                                            <i class="	fas fa-times"></i>  <i  class="	fas fa-user"></i></button>
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
    <script src="./js/jquery-3.4.1.min2.js" ></script>

    <!-- popper -->
    <script src="./js/popper.min2.js" ></script>

    <!-- Bootstrap V4.3 -->
    <script src="./js/bootstrap.min2.js" ></script>

    <!-- jQuery Custom Content Scroller V3.1.5 -->
    <script src="./js/jquery.mCustomScrollbar.concat.min2.js" ></script>

    <!-- Bootstrap Material Design V4.0 -->

    <!-- DATATABLES -->
    <script src="./js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="./js/dataTables.bootstrap4.min.js">
    </script>
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
      <p>Tipo de Documento:     <strong>${empleado.getTipoDocumento()}</strong></p>
      <p>Documento:    <strong>${empleado.getDocumento()}</strong></p>
      <p>Nombres y apellidos:    <strong>${empleado.getNombre1()} ${empleado.getNombre2()} ${empleado.getApellido1()} ${empleado.getApellido2()}</strong></p>
      <p>Tipo de Telefono:    <strong>${empleado.getTipo_Tel1()}</strong></p>
      <p>Telefono:    <strong>${empleado.getIndicativo_Tel1()} ${empleado.getTelefono1()}</strong></p>
      <p>Tipo de Telefono:    <strong>${empleado.getTipo_Tel2()}</strong></p>
      <p>Telefono:    <strong>${empleado.getIndicativo_Tel2()} ${empleado.getTelefono2()}</strong></p>
      <p>Estado:    <strong>${empleado.getEstado()}</strong></p>
      <p>Genero:   <strong>${empleado.getGenero()}</strong></p>
      <p>Tipo de Empleado:   <strong>${empleado.getTipoEmpleado()}</strong></p>
      <p>Dirección:   <strong>${empleado.getDireccion()}</strong></p>
      <p>Email:   <strong>${empleado.getEmail()}</strong></p>
      <p>Ciudad:   <strong>${empleado.getNombreCiudad()}</strong></p>
      <p>Fecha de Registro: <strong>${empleado.getFecha_Creacion()}</strong></p>
      <br>
      `, icon: "info",
                position: "top"
        });
        };
    </script>
    <%}%>
    <script src="./js/main2.js" ></script>

</html>