<%-- 
    Document   : Productos
    Created on : 7/04/2022, 4:48:19 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Producto</title>

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

        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">

        <script src="./js/Funciones.js" ></script>
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("respuesta"));

        %>

    </head>
    <body>
        <%if (res.equals("Registrado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Producto Registrado! ", {
                    icon: "success"
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error! ¡No se pudo registrar el producto! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>

        <!-- Page header -->
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
                    <a  href="Controlador?menu=Productos&accion=Listar"><i class="fas fa-plus fa-fw"></i> &nbsp; LISTADO DE PRODUCTOS</a>
                </li>
                <li>
                    <a class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; AGREGAR PRODUCTO</a>
                </li>
            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Productos" method="POST" class="form-neon">

                <legend><i class="far fa-sticky-note "></i> &nbsp; Información básica del producto </legend><br>

                <div class="row">
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre">Nombre</label>
                            <input type="text"  class="form-control" name="txtNombre" id="txtNombre" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="form-control">Descripción</label>
                            <textarea name="txtDescripcion" class="form-control" ></textarea>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre">Marca</label>
                            <input type="text" " class="form-control" name="txtMarca" id="txtMarca" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Codigo Barras </label>
                            <input type="text" class="form-control" name="txtCodigo_Barras" id="txtCodigo_Barras" maxlength="40" required>
                        </div>
                    </div>   

                    <input type="hidden" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" value="Activo" class="form-control" name="txtEstado" id="txtEstado" maxlength="40" required>
                </div>
                <br>
                <legend><i class="fas fa fa-tag"></i> &nbsp; Categoria</legend><br>
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <select class="form-control"  id="txtCategoria_Productos" name="txtCategoria_Productos" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija una Categoria</option> 
                                <c:forEach var="categorias" items="${Categoria}">
                                    <option value="${categorias.getIdCategoriaProductos()}"> ${categorias.getCategoria()}</option>  
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <br>              
                <legend><i class="fas fa-store fa-fw"></i> &nbsp; Datos y Modelo del Proveedor</legend><br>

                <div class="row">
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtCantidad">Cantidad</label>
                            <input type="number"  pattern="^[1-9]\d*$" class="form-control" name="txtCantidad" id="txtCantidad" maxlength="40" required>
                        </div>
                    </div>   
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre_Empresa">Tope Min</label>
                            <input type="number"   pattern="^[1-9]\d*$" class="form-control" name="txtTope_Min" id="txtTope_Min" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre_Empresa">Tope Max</label>
                            <input type="number"   pattern="^[1-9]\d*$" class="form-control" name="txtTope_Max" id="txtTope_Max" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtPrecio_Compra">Precio Compra</label>
                            <input type="number"  pattern="^[1-9]\d*$"  class="form-control" name="txtPrecio_Compra" id="txtPrecio_Compra" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtDireccion_Empresa">Precio Venta</label>
                            <input type="number"   pattern="^[1-9]\d*$" class="form-control" name="txtPrecio_Venta" id="txtPrecio_Venta" maxlength="40" required>
                        </div>
                    </div>

                </div>
                <br>
                <legend><i class="fas 	fa fa-edit fa-fw"></i> &nbsp; Otros Datos</legend><br>

                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtFecha_Vencimiento">Fecha Vencimiento</label>
                            <input type="date"  class="form-control" name="txtFecha_Vencimiento" id="txtFecha_Vencimiento" maxlength="40" required>
                        </div>
                    </div>

                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Productos&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Agregar" name="accion"><i class="far fa-save"></i> &nbsp; REGISTRAR PRODUCTO</button>
                </p>
            </form>     
        </div>
    </body>
</html>