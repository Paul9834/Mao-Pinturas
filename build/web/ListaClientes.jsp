<%-- 
    Document   : Clientes
    Created on : 7/04/2022, 4:48:28 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Clientes</title>

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
                    title: '¡Cliente actualizado correctamente!'
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
            swal("¡Cliente Inactivado! ", "!El cliente se Inhabilitado con exitó! ", {
            icon: "warning"
            });
            };
        </script>
        <%} else if (res.equals("NoInactivado")) {%>
        <script type="text/javascript">
            window.onload = function () {
            swal("¡Error!", "El estado del cliente no pudo actualizarse" {
            icon: "error"
            });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp;  LISTA DE CLIENTES
            </h3>
            <p class="text-justify">
                En el módulo CLIENTE podrá observar los clientes registrados para realizar ventas, además podrá realizar búsquedas de clientes, actualizar datos de sus clientes o eliminarlos si así lo desea. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="ListaClientes.jsp"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CLIENTES</a>
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
                            <th scope="row">NOMBRES Y APELLIDOS</th>
                            <th scope="row">DOCUMENTO</th>
                            <th scope="row">TELEFONO</th>
                            <th scope="row">CIUDAD</th>
                            <th scope="row">NOMBRE EMPRESA</th>
                            <th scope="row">DIRECCION EMPRESA</th>
                            <th scope="row">ACTUALIZAR</th>
                            <th scope="row">ELIMINAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cli" items="${clientes}">
                            <tr class="text-center" >
                                <td scope="row">${cli.getIdCliente()}</td>
                                <td><a href="Controlador?menu=Clientes&accion=Consultariduser&id=${cli.getIdCliente()}" >
                                        <button style="border: none; color:#d9534f; font-weight: bold;" class="btn btn-outline-info">${cli.getNombre1()} ${cli.getApellido1()}</button>
                                    </a>
                                </td>
                                <td>${cli.getDocumento()}</td>
                                <td>${cli.getIndicativo_Tel1()} ${cli.getTelefono1()}</td>
                                <td>${cli.getNombreCiudad()}</td>
                                <td>${cli.getNombre_Empresa()}</td>
                                <td>${cli.getDireccion_Empresa()}</td>
                                <td>
                                    <form action="Controlador?menu=Clientes&accion=Editar&id=${cli.getIdCliente()}" method="post">
                                        <button type="submit" class="btn btn-success"> 
                                            <i class="fas fa-sync-alt"></i>	</button>	                                        
                                    </form>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Clientes&accion=Inactivar&id=${cli.getIdCliente()}"  method="post">
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
                html: `<h1>${clien.getNombre1()} ${clien.getApellido1()}</h1>  
      <p>Tipo de Documento:     <strong>${clien.getTipoDocumento()}</strong><br>
      Documento:    <strong>${clien.getDocumento()}</strong><br>
      Nombres y apellidos:    <strong>${clien.getNombre1()} ${clien.getNombre2()} ${clien.getApellido1()} ${clien.getApellido2()}</strong><br>
      Tipo de Telefono:    <strong>${clien.getTipo_Tel1()}</strong><br>
      Telefono:    <strong>${clien.getIndicativo_Tel1()} ${clien.getTelefono1()}</strong><br>
      Tipo de Telefono:    <strong>${clien.getTipo_Tel2()}</strong><br>
      Telefono:    <strong>${clien.getIndicativo_Tel2()} ${clien.getTelefono2()}</strong><br>
      Tipo de Telefono:    <strong>${clien.getTipo_Tel3()}</strong><br>
      Telefono:    <strong>${clien.getIndicativo_Tel3()} ${clien.getTelefono3()}</strong><br>
      Direccion_Domicilio:   <strong>${clien.getDireccion_Domicilio()}</strong><br>
      Email:   <strong>${clien.getEmail()}</strong><br>
      Nombre de la Empresa:   <strong>${clien.getNombre_Empresa()}</strong><br>
      Direccion de la Empresa:   <strong>${clien.getDireccion_Empresa()}</strong><br>
      Ciudad: <strong>${clien.getNombreCiudad()}</strong>  <br>
      Estado:    <strong>${clien.getEstado()}</strong><br>
      Fecha de Registro: <strong>${clien.getFecha_Creado()}</strong></p>
      <br>
      `, icon: "info",
                position: "top",
                         position: "top",  
                width: "40%"
            });
        };

    </script>
    <%}%>

    <script src="./js/main2.js" ></script>

</html>