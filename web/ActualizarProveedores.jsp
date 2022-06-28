<%-- 
    Document   : ActualizarProveedores
    Created on : 20/05/2022, 3:51:46 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : RegistrarProveedor
    Created on : 20/05/2022, 2:52:17 a. m.
    Author     : brayan.daza
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Actualizar Proveedor</title>

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

        %>

    </head>
    <body>

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-user-friends fa-fw"></i> &nbsp; ACTUALIZAR PROVEEDOR
            </h3>
            <p class="text-justify">
                En el módulo ACTUALIZAR PROVEEDOR podrá actualizar datos de todos los proveedores. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; ACTUALIZAR PROVEEDOR</a>
                </li>
            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Proveedores" method="POST" class="form-neon">
                <input name="idProveedores" type="hidden" value="${proveedores.getIdProveedores()}">
                <legend><i class="fas fa-store fa-fw"></i> &nbsp; Información básica Proveedor</legend><br>  
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_nombre">Nombres</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" value="${proveedores.getNombres()}" name="txtNombres" id="txtNombres" maxlength="40" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Dirección</label>
                            <input type="text"  class="form-control" value="${proveedores.getDireccion()}" name="txtDireccion" id="txtDireccion" maxlength="45" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="Ciudad" >Ciudad</label>
                            <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                <c:forEach var="ciudad" items="${ciudades}">
                                    <c:choose>
                                        <c:when test="${ciudad.getIdCiudad() == proveedores.getCiudad()}">
                                            <option value="${ciudad.getIdCiudad()}" selected=""> ${ciudad.getNombre()}</option>  
                                        </c:when> 
                                        <c:otherwise>
                                            <option value="${ciudad.getIdCiudad()}"> ${ciudad.getNombre()}</option>  
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Email</label>
                            <input type="email" class="form-control" name="txtEmail" value="${proveedores.getEmail()}"id="txtEmail" maxlength="45" required>
                        </div>
                    </div>  
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label >Tipo de Teléfono</label>
                            <select class="form-control"  id="txtTipoTelefono" name="txtTipoTelefono" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                <c:choose>
                                    <c:when test="${proveedores.getTipo_Tel1()=='Fijo'}">
                                        <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${proveedores.getTipo_Tel1()=='Movil'}">
                                        <option value="Fijo">Teléfono Fijo</option>
                                        <option value="Movil" selected="">Teléfono Móvil</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="Fijo">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:otherwise>
                                </c:choose>   
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-1">
                        <div class="form-group">
                            <label for="Indicativo_Telefono">Indicativo</label>
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${proveedores.getIndicativo_Tel1()}"  name="txtIndicativo_Telefono" id="Indicativo_Telefono" maxlength="5" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="">Teléfono</label>
                            <input type="text" pattern="[0-9()+]{1,20}" value="${proveedores.getTelefono1()}" class="form-control" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label >Tipo de Teléfono</label>
                            <select class="form-control"   name="txtTipoTelefono2" onchange="elegir_opcion(this);" >
                                <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                <c:choose>
                                    <c:when test="${proveedores.getTipo_Tel2()=='Fijo'}">
                                        <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${proveedores.getTipo_Tel2()=='Movil'}">
                                        <option value="Fijo">Teléfono Fijo</option>
                                        <option value="Movil" selected="">Teléfono Móvil</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="Fijo">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:otherwise>
                                </c:choose>   
                            </select>

                        </div>
                    </div>

                    <div class="col-12 col-md-1">
                        <div class="form-group">
                            <label for="Indicativo_Telefono">Indicativo</label>
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono2" id="Indicativo_Telefono" value="${proveedores.getIndicativo_Tel2()}" maxlength="3" >
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="">Teléfono 2</label>
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${proveedores.getTelefono2()}" name="txtTelefono2" id="cliente_telefono" maxlength="20" >
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label  >Estado</label>
                            <select class="form-control"  id="txt Estado" name="txtEstado" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija un Estado</option>
                                <c:choose>
                                    <c:when test="${proveedores.getEstado()=='Activo'}">
                                        <option value="Activo" selected="">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </c:when>
                                    <c:when test="${proveedores.getEstado()=='Inactivo'}">
                                        <option value="Activo">Activo</option>
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
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Proveedores&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; ACTUALIZAR PROVEEDOR</button>
                </p>
            </form>     
        </div>
    </body>
</html>