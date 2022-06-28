<%-- 
    Document   : ListaCategoriaProductos
    Created on : 20/05/2022, 2:29:15 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista Categorias de Productos</title>

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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("respuesta"));
            String TipoEmpleado = String.valueOf(session.getAttribute("TipoEmpleado"));
        %>

        %>
    </head>

    <body>
       <%if (res.equals("Registrado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Categoria de Productos registrada correctamente!'
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error!", "¡No se pudo completar el registro! ", {
                    icon: "error"
                });
            };
        </script>
        <%}else if (res.equals("Actualizado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Categoria de productos actualizado correctamente!'
                });
            };
        </script>
        <%} else if (res.equals("NoActualizado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error!", "¡No se pudo completar la actualización! ", {
                    icon: "error"
                });
            };
        </script>
        <%} else if (res.equals("Eliminado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Eliminado! ", "!Categoria de producto eliminada correctamente! ", {
                    icon: "info"
                });
            };
        </script>
        <%} else if (res.equals("NoEliminado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error! ¡No se pudo eliminar Categoria de producto.! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp;  LISTADO DE CATEGORIAS
            </h3>
            <p class="text-justify">
                En el módulo CATEGORIAS podrá observar las categorias registradas para registros de productos, además podrá realizar búsquedas de categorias, actualizar las categorias o eliminarlas. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="#"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CATEGORIAS</a>
                </li>
                  <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Almacenista") ) {%>
                <li>
                    <a  href="RegistrarCategoriasProductos.jsp"><i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRAR CATEGORIA</a>
                </li>
                  <%}%>
            </ul>	
        </div>
        
          <div class="container-fluid">
            <div class="table-responsive table-hover">
                <table  class="table  table-sm  table table-bordered table stacktable" id="tablax">
                   
                    <thead style="background-color: white;">
                        <tr class="text-center roboto-medium">
                            <th scope="row" style="color: #000;;"><strong>CATEGORIAS</strong></th>
                        </tr>
                    </thead>
        
        <!-- Content here-->
       <tbody>
                  <c:forEach var="Categoria" items="${Categoria}" varStatus="status">
                        <tr class="text-center">
                            <td>
                           <p class="text-uppercase text-center media-product-title"><strong> <c:out value="${status.count}" /> - ${Categoria.getCategoria()}</strong></p>
                                <ul class="list-unstyled" style="padding: 5px;" ><li class="media media-product">
                                        <img class="mr-4 img-fluid img-product-list" width="12%" src="Controlador?menu=Categoria_Productos&accion=ListarImagen&id=${Categoria.getIdCategoriaProductos()}">
                                        <div class="media-body product-media-body">
                                            <p class="text-uppercase text-center media-product-title"></p>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-10 col-md-6 col-lg-3 col-product"><i class="fas fa-highlighter"></i> <strong>NRO.:</strong> ${Categoria.getIdCategoriaProductos()}</div><br>

                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="	fa fa-shopping-bag"></i> <strong>Categoria:</strong> ${Categoria.getCategoria()} </div>

                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-money-bill-wave-alt"></i> <strong>Tipo IVA:</strong> ${Categoria.getTipo_IVA()} </div>
                                                    
                                                    <div class="col-12 col-md-6 col-lg-3 col-product" ><i class="far fa-money-bill-alt"></i> <strong>IVA:</strong> %${Categoria.getIVA()}</div>
                                                    <br><br>
                                                    <br>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>

                                                    <div class="col-12 col-6 col-lg-3 col-product"></div>
                                                    
                                                        <br>
                                                        <br>
                                                        
                                                        <span><i class="fas fa-tools"></i> &nbsp; OPCIONES: </span>
                                                        
                                                        <form action="Controlador?menu=Categoria_Productos&accion=Editar&IdCategoriaProductos=${Categoria.getIdCategoriaProductos()}" method="post">
                                        <button type="submit" class="btn btn-success" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Actualizar producto"> 
                                              <i class="fas fa-sync"></i>	</button>	                                        
                                    </form>
                         
                                        <form action="Controlador?menu=Categoria_Productos&accion=Eliminar&IdCategoriaProductos=${Categoria.getIdCategoriaProductos()}"  method="post">
                                        <button type="submit" class="btn btn-warning" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Eliminar producto" >
                                              <i class="far fa-trash-alt"></i></button>
                                    </form>
                                        
                                                 
                                                </div>
                                            </div>
                                            </div>

                                        </div></ul>

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

    <script src="./js/main2.js" ></script>
</html>