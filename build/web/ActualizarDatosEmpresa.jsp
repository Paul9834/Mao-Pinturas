<%-- 
    Document   : ActualizarDatosEmpresa
    Created on : 18/05/2022, 11:11:20 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Actualizar Usuarios</title>

        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">

        <!-- Bootstrap V4.3 -->
        <link rel="stylesheet" href="./css/bootstrap.min2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">

        <!-- Sweet Alerts V8.13.0 CSS file -->
        <link rel="stylesheet" href="./css/sweetalert2.min2.css">

        <!-- Sweet Alert V8.13.0 JS file-->
        <script src="./js/sweetalert2.min.js" ></script>

        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">

        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body>

        <!-- Main container -->

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZAR DATOS EMPRESA
            </h3>
            <p class="text-justify">
                En el módulo podra realizar una actualización de datos de la empresa. 
            </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZACION DATOS EMPRESA</a>
                </li>

            </ul>	
        </div>

        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=DatosEmpresa" method="POST" class="form-neon" autocomplete="off">
                <fieldset>
                    <legend><i class="fas fa-user"></i> &nbsp; Información Empresa</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Tipo de Documento</label>
                                    <select class="form-control"  id="txtTipodocumento" selected="${datos.getTipo_Documento()}" name="txtTipoDocumento" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija un tipo</option>
                                        <c:choose>
                                            <c:when test="${datos.getTipo_Documento()=='Cedula de Ciudadania'}">
                                                <option value="Cedula de Ciudadania" selected="">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="DNI">DNI</option>
                                                <option value="RUC">RUC</option>
                                                <option value="NIC">NIC</option>
                                            </c:when> 
                                            <c:when test="${datos.getTipo_Documento()== 'Cedula de Extranjeria'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria" selected="">Cédula de Extranjeria</option>
                                                <option value="DNI">DNI</option>
                                                <option value="RUC">RUC</option>
                                                <option value="NIC">NIC</option>
                                            </c:when>  
                                            <c:when test="${datos.getTipo_Documento()== 'DNI'}">
                                                 <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="DNI" selected="">DNI</option>
                                                <option value="RUC">RUC</option>
                                                <option value="NIC">NIC</option>
                                            </c:when> 
                                            <c:when test="${datos.getTipo_Documento()== 'RUC'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="DNI">DNI</option>
                                                <option value="RUC" selected="">RUC</option>
                                                <option value="NIC">NIC</option>

                                            </c:when> 
                                            <c:when test="${datos.getTipo_Documento()== 'NIC'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="DNI">DNI</option>
                                                <option value="RUC" >RUC</option>
                                                <option value="NIC" selected="">NIC</option>
                                            </c:when> 
                                            <c:otherwise>
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>                              
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Numero de Documento</label>
                                    <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" value="${datos.getDocumento()}" id="txtDocumento" name="txtDocumento" maxlength="27" required>
                                </div>
                            </div>
                           <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Nombres</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" value="${datos.getNombre()}" name="txtNombre" id="cliente_nombre" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Dirección</label>
                                    <input type="text" value="${datos.getDireccion()}" class="form-control" name="txtDireccion" id="txtDireccion" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_telefono">Teléfono</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${datos.getTelefono()}" name="txtTelefono" id="txtTelefono" maxlength="20" required>
                                </div>
                            </div>                   
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Email</label>
                                    <input type="email" value="${datos.getEmail()}" class="form-control" name="txtEmail" id="txtEmail" maxlength="50" required>
                                </div>
                            </div>
                                <div class="col-12 col-md-2">
                                <div class="form-group">
                                    <label for="cliente_telefono">Porcentaje Impuesto %</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${datos.getPorcentaje_Impuesto()}" name="txtPorcentaje_Impuesto" id="txtPorcentaje_Impuesto" maxlength="3" required>
                                </div>
                            </div>  
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Nombre Impuesto</label>
                                    <input type="text" value="${datos.getNombre_Impuesto()}" class="form-control" name="txtNombre_Impuesto" id="txtNombre_Impuesto" maxlength="40" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br><br><br>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Home" class="btn btn-raised btn-secondary btn-sm" style="background-color: red;"><i style="background-color: red" class="fas fa-paint-roller"></i> &nbsp; CANCELAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; ACTUALIZAR DATOS EMPRESA</button>
                </p>
            </form>
        </div>	

    </section>
</main>


</body>
</html>