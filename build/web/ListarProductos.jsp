<%-- 
    Document   : ListadoProductos
    Created on : 20/05/2022, 7:31:48 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Lista de Productos</title>
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
        <style>  th {
                text-align: center;
            }
            tr{
                text-align: center;
            }
        </style>        
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("respuesta"));
            String emp = String.valueOf(request.getParameter("par"));
            String TipoEmpleado = String.valueOf(session.getAttribute("TipoEmpleado"));
        %>
    </head>

    <body>
        <%if (res.equals("Actualizado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Producto actualizado correctamente!'
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
        <%} else if (res.equals("Eliminado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Eliminado! ", "!Producto eliminado correctamente! ", {
                    icon: "success"
                });
            };
        </script>
        <%} else if (res.equals("NoEliminado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error! ¡Producto no actualizado! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class=" zmdi zmdi-dropbox fa-fw"></i> &nbsp; MODULO PRODUCTOS
            </h3>
            <p class="text-justify">

                En el módulo PRODUCTOS podrá agregar nuevos productos al sistema, 
                actualizar datos de los productos, eliminar o actualizar la imagen de los productos, 
                imprimir códigos de barras o SKU de cada producto, buscar productos en el sistema, 
                ver todos los productos en almacén, ver los productos más vendido y filtrar productos por categoría. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTADO DE PRODUCTOS</a>
                </li>
                   <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Almacenista") ) {%>
                <li>
                    <a href="Controlador?menu=Categoria_Productos&accion=ListarenProductos"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO</a>
                </li>
              <%}%>
            </ul>	
        </div>
        <!-- Content here-->
   <div class="container-fluid">
            <div class="table-responsive table-hover">
                <table  class="table  table-sm  table table-bordered table stacktable" id="tablax">
                   
                    <thead style="background-color: white;">
                        <tr class="text-center roboto-medium">
                            <th scope="row" style="color: #000;;"><strong>PRODUCTOS</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="produ" items="${productos}" varStatus="status">
                        <tr class="text-center">
                            <td>
                           <p class="text-uppercase text-center media-product-title"><strong> <c:out value="${status.count}" /> - ${produ.getNombre()}</strong></p>
                                <ul class="list-unstyled" style="padding: 5px;" ><li class="media media-product">
                                        <img class="mr-4 img-fluid img-product-list" width="12%" src="Controlador?menu=Categoria_Productos&accion=ListarImagen&id=${produ.getCategoria_Productos()}">
                                        <div class="media-body product-media-body">
                                            <p class="text-uppercase text-center media-product-title"></p>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-10 col-md-6 col-lg-3 col-product"><i class="fas fa-barcode"></i> <strong>Código de barras:</strong> ${produ.getCodigo_Barras()}</div><br>

                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-user"></i> <strong>Usuario que Registro:</strong> ${produ.getUsuario()}</div>

                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="far fa-money-bill-alt"></i> <strong>Precio:</strong> $${produ.getPrecio_Venta()} </div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product" ><i class="fas fa-clipboard-check"></i> <strong>Estado:</strong> ${produ.getEstado()}</div>

                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-box"></i> <strong>Disponibles:</strong> ${produ.getCantidad()}</div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-calendar-week"></i> <strong>Fecha Registro:</strong> ${produ.getFecha_Vencimiento()}</div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-calendar-alt"></i> <strong>Vencimiento:</strong> ${produ.getFecha_Registrado()}</div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>
                                                    <div class="col-12 col-md-6 col-lg-3 col-product"></div>
                                                        <br>
                                                        <br>
                                                        
                                                        <span><i class="fas fa-tools"></i> &nbsp; OPCIONES: </span>
                                                        <a href="Controlador?menu=Productos&accion=Consultaridprod&id=${produ.getIdProductos()}" class="btn btn-info"  data-trigger="hover" data-placement="top" data-content="Información detallada" >
                                                            <i class="fas fa-box-open"></i>
                                                        </a>
                                                        <form action="Controlador?menu=Productos&accion=Editar&IdProductos=${produ.getIdProductos()}" method="post">
                                        <button type="submit" class="btn btn-success" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Actualizar producto"> 
                                              <i class="fas fa-sync"></i>	</button>	                                        
                                    </form>
                         
                                        <form action="Controlador?menu=Productos&accion=Eliminar&IdProductos=${produ.getIdProductos()}"  method="post">
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

     <%if (emp.equals("1")) { %>
    <script type="text/javascript">
        window.onload = function () {
            Swal.fire({
                html: `   <img src="Controlador?menu=Categoria_Productos&accion=ListarImagen&id=${product.getCategoria_Productos()}" width="110" height="90">
    <h2>${product.getNombre()}</h2> 
                <h5>${product.getCodigo_Barras()}</h5>  <br>
      <p>Nombre:    <strong> ${product.getNombre()}</strong><br>
      Descripcion:   <strong> ${product.getDescripcion()}</strong><br>
      Marca:   <strong> ${product.getMarca()}</strong><br>
      Cantidad:   <strong> ${product.getCantidad()}</strong><br>
      Tope Minimo:   <strong> ${product.getTope_Min()}</strong><br>
      Tope Maximo:   <strong> ${product.getTope_Max()}</strong><br>
      Precio Compra:   <strong> ${product.getPrecio_Compra()}</strong><br>
      Precio Venta:   <strong> ${product.getPrecio_Venta()}</strong><br>
      Fecha de Registro:   <strong> ${product.getFecha_Registrado()}</strong><br>
      Fecha de Vencimiento:   <strong> ${product.getFecha_Vencimiento()}</strong><br>
      Estado:   <strong> ${product.getEstado()}</strong><br>
      Usuario_Registra: <strong> ${product.getUsuario()}</strong><br>
      Categoria: <strong> ${product.getCategoria()}</strong><br>
      IVA: <strong> ${product.getIVA()}</strong>  <br>
      Tipo IVA: <strong> ${product.getTipo_IVA()}</strong></p>  
      `,
                position: "top"
            });
        };

    </script>
    <%}%>
  
    <script src="./js/main2.js" ></script>

</html>