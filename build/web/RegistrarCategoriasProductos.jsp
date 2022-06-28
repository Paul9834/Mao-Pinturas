<%-- 
    Document   : RegistrarCategoriasProductos
    Created on : 20/05/2022, 5:57:45 p. m.
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

        %>
    </head>

    <body>
        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-clipboard-list fa-fw"></i> &nbsp;  REGISTRAR CATEGORIAS
            </h3>
            <p class="text-justify">
                En el módulo CATEGORIAS podrá observar las categorias registradas para registros de productos, además podrá realizar búsquedas de categorias, actualizar las categorias o eliminarlas. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a  href="Controlador?menu=Categoria_Productos&accion=Listar"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CATEGORIAS</a>
                </li>
                <li>
                    <a class="active" href="Controlador?menu=Categoria_Productos&accion=Listar"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; REGISTRAR  CATEGORIA</a>
                </li>
            </ul>	
        </div>
        <div class="container-fluid">
            <form action="Controlador?menu=Categoria_Productos" method="POST" enctype="multipart/form-data" class="form-neon">
                <legend><i class="fas fa-tags"></i> &nbsp; Información categoria</legend><br>  
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtCategoria">Categoria</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" name="txtCategoria" id="txtCategoria" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="Imagen">Imagen</label>
                            <input type="file"  class="form-control" name="txtImagen" id="txtImagen" required>
                        </div>
                    </div>
                   
                    <div class="col-12 col-md-1">
                        <div class="form-group">
                            <label>IVA</label>
                            <input type="number" min="0" value="0"  class="form-control" name="txtIVA" maxlength="4" >
                        </div>
                    </div>
                     <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label >Tipo IVA</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" value="No tiene IVA" class="form-control" name="txtTipo_IVA" maxlength="10" >
                        </div>
                    </div>
                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Categoria_Productos&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Agregar" name="accion"><i class="far fa-save"></i> &nbsp; REGISTRAR CATEGORIA</button>
                </p>
            </form>     
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


    <script src="./js/main2.js" ></script>

</html>