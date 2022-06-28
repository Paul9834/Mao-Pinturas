<%-- 
    Document   : ActualizarUsuarios
    Created on : 18/04/2022, 2:08:35 p. m.
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
                <i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZAR DATOS
            </h3>
            <p class="text-justify">
                En el módulo ACTUALIZAR DATOS el usuario podrá actualizar los datos registrados en el sistema, como tambien podra cambiar su contraseña. 
            </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZACION DATOS</a>
                </li>

            </ul>	
        </div>

        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Usuarios" method="POST" class="form-neon" autocomplete="off">
                <fieldset>
                    <legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
                    <div class="container-fluid">
                        <div class="row">


                            <input name="Id" type="hidden" value="${idEmpleado}">

                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Tipo de Documento</label>
                                    <select class="form-control"  id="txtTipodocumento" selected="${usuarios.getTipoDocumento()}" name="txtTipoDocumento" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija un tipo</option>
                                        <c:choose>
                                            <c:when test="${usuarios.getTipoDocumento()=='Cedula de Ciudadania'}">
                                                <option value="Cedula de Ciudadania" selected="">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${usuarios.getTipoDocumento()== 'Cedula de Extranjeria'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria" selected="">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${usuarios.getTipoDocumento()== 'Pasaporte'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte" selected="">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>

                                            </c:when> 
                                            <c:when test="${usuarios.getTipoDocumento()== 'Registro Civil'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad" selected="">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${usuarios.getTipoDocumento()== 'Tarjeta de Identidad'}">
                                                option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte" selected="">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad" selected="">Tarjeta de Identidad</option> 
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
                                    <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" value="${usuarios.getDocumento()}" id="cliente_dni" name="txtDocumento" maxlength="27" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Nombres</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}"  value="${usuarios.getNombres()}" class="form-control" name="txtNombres" id="cliente_nombre" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Apellidos </label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" value="${usuarios.getApellidos()}" class="form-control" name="txtApellidos" id="cliente_nombre" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-1">
                                <div class="form-group">
                                    <label for="Indicativo_Telefono">Indicativo</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" value="${usuarios.getIndicativo_Telefono()}" class="form-control" name="txtIndicativo_Telefono" id="txtIndicativo_Telefono" maxlength="3" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_telefono">Teléfono</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${usuarios.getTelefono()}" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                                </div>
                            </div>                          
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Genero</label>
                                    <select class="form-control"  id="txtTipodocumento" name="txtGenero" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija Genero</option>
                                        <c:choose>
                                            <c:when test="${usuarios.getGenero()=='Femenino'}">
                                                <option value="Femenino" selected="">Femenino</option>
                                                <option value="Masculino">Masculino</option>
                                            </c:when>
                                            <c:when test="${usuarios.getGenero()=='Masculino'}">
                                                <option value="Masculino" selected="">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="Femenino">Femenino</option>
                                                <option value="Masculino">Masculino</option>
                                            </c:otherwise>
                                        </c:choose>   
                                    </select>                               
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group" style="position: relative;">
                                    <label for="cliente_apellido" >Contraseña</label>
                                    <i class="zmdi zmdi-eye-off" id="eye" name="eye" style="position: absolute; right: 10px; top: 73%; transform: translateY(-50%); cursor: pointer; "></i>
                                    <input type="password" class="form-control" value="${usuarios.getPassword()}" name="txtPassword" id="txtPassword" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Dirección</label>
                                    <input type="text" value="${usuarios.getDireccion()}" class="form-control" name="txtDireccion" id="txtDireccion" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="Ciudad" >Ciudad</label>
                                    <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                        <c:forEach var="ciudad" items="${ciu}">
                                            <c:choose>
                                                <c:when test="${ciudad.getIdCiudad() == usuarios.getCiudad()}">
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
                        </div>
                    </div>
                </fieldset>
                <br><br><br>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Home" class="btn btn-raised btn-secondary btn-sm" style="background-color: red;"><i style="background-color: red" class="fas fa-paint-roller"></i> &nbsp; CANCELAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; Actualizar</button>
                </p>
            </form>
        </div>	

    </section>
</main>


</body>
<script type="text/javascript">
    var eye = document.getElementById("eye");
    var input = document.getElementById("txtPassword");
    eye.addEventListener("click", function () {
    if (input.type === "password") {
    input.type = "text";
    eye.style.opacity = 0.2;
    } else {
    input.type = "password";
    eye.style.opacity = 0.8;
    }

    });

</script>
</html>