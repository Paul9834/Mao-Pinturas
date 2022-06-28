<%-- 
    Document   : ActualizarProductos
    Created on : 21/05/2022, 2:37:22 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Actualizar Producto</title>

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

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);

        %>

    </head>
    <body>


        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class=" zmdi zmdi-dropbox fa-fw"></i> &nbsp; MODULO ACTUALIZAR PRODUCTO
            </h3>
            <p class="text-justify">

                En el módulo ACTUALIZAR PRODUCTOS podrá actualizar datos de los productos. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; ACTUALIZACIÓN DE PRODUCTO</a>
                </li>
            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Productos" method="POST" class="form-neon">

                <input name="txtIdProductos" type="hidden" value="${Productos.getIdProductos()}">

                <legend><i class="far fa-sticky-note "></i> &nbsp; Información básica del producto </legend><br>

                <div class="row">
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre">Nombre</label>
                            <input type="text"  class="form-control" value="${Productos.getNombre()}" name="txtNombre" id="txtNombre" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="form-control">Descripción</label>
                            <textarea autofocus="autofocus" name="txtDescripcion" class="form-control">${Productos.getDescripcion()}</textarea>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre">Marca</label>
                            <input type="text" " class="form-control" name="txtMarca" value="${Productos.getMarca()}" id="txtMarca" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Codigo Barras </label>
                            <input type="text" class="form-control" name="txtCodigo_Barras" value="${Productos.getCodigo_Barras()}"  id="txtCodigo_Barras" maxlength="40" required>
                        </div>
                    </div>   

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="cliente_dni">Estado</label>
                            <select class="form-control"  id="txtEstado"   name="txtEstado" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija Estado</option>
                                <c:choose>
                                    <c:when test="${Productos.getEstado()=='Activo'}">
                                        <option value="Activo" selected="">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </c:when>
                                    <c:when test="${Productos.getEstado()=='Inactivo'}">
                                        <option value="Activo" >Activo</option>
                                        <option value="Inactivo" selected="">Inactivo</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="Activo">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </c:otherwise>
                                </c:choose>   
                            </select>                               
                        </div>
                    </div>
                </div>
                <br>
                <legend><i class="fas fa fa-tag"></i> &nbsp; Categoria</legend><br>
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="Indicativo_Telefono">Categoria</label>
                            <select class="form-control"  id="txtCategoria_Productos" name="txtCategoria_Productos" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija una Categoria</option> 
                                <c:forEach var="categoria" items="${Categoria}">
                                    <c:choose>
                                        <c:when test="${categoria.getIdCategoriaProductos() == Productos.getCategoria_Productos()}">
                                            <option value="${categoria.getIdCategoriaProductos()}" selected=""> ${categoria.getCategoria()}</option>  
                                        </c:when> 
                                        <c:otherwise>
                                            <option value="${categoria.getIdCategoriaProductos()}"> ${categoria.getCategoria()}</option>  
                                        </c:otherwise>
                                    </c:choose>
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
                            <input type="number"  pattern="^[1-9]\d*$" value="${Productos.getCantidad()}" class="form-control" name="txtCantidad" id="txtCantidad" maxlength="40" required>
                        </div>
                    </div>   
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtTope_Min">Tope Min</label>
                            <input type="number"   pattern="^[1-9]\d*$" value="${Productos.getTope_Min()}" class="form-control" name="txtTope_Min" id="txtTope_Min" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtNombre_Empresa">Tope Max</label>
                            <input type="number"   pattern="^[1-9]\d*$"  value="${Productos.getTope_Max()}" class="form-control" name="txtTope_Max" id="txtTope_Max" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtPrecio_Compra">Precio Compra</label>
                            <input type="number"  pattern="^[1-9]\d*$"  value="${Productos.getPrecio_Compra()}" class="form-control" name="txtPrecio_Compra" id="txtPrecio_Compra" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="txtDireccion_Empresa">Precio Venta</label>
                            <input type="number"   pattern="^[1-9]\d*$" class="form-control" value="${Productos.getPrecio_Venta()}" name="txtPrecio_Venta" id="txtPrecio_Venta" maxlength="40" required>
                        </div>
                    </div>

                </div>
                <br>
                <legend><i class="fas 	fa fa-edit fa-fw"></i> &nbsp; Otros Datos</legend><br>

                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtFecha_Vencimiento">Fecha Vencimiento</label>
                            <input type="date"  class="form-control" name="txtFecha_Vencimiento"  value="${Productos.getFecha_Vencimiento()}" id="txtFecha_Vencimiento" maxlength="40" required>
                        </div>
                    </div>
                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Productos&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; ACTUALIZAR PRODUCTO</button>
                </p>
            </form>     
        </div>
    </body>
</html>