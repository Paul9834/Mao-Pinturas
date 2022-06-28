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

    </head>
    <body>

        <!-- Main container -->

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZAR USUARIO
            </h3>
            <p class="text-justify">
                En el módulo USUARIO podrá registrar nuevos usuarios en el sistema ya sea un administrador o un cajero, también podrá ver la lista de usuarios registrados, buscar usuarios en el sistema, actualizar datos de otros usuarios y los suyos.	
            </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active"><i class="fas fa-plus fa-fw"></i> &nbsp; ACTUALIZACION USUARIO</a>
                </li>

            </ul>	
        </div>

</body>
    <div class="container-fluid">
            <form action="Controlador?menu=Usuarios" method="POST" class="form-neon" style="width: 99%;">
                    <legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
                    <div class="container-fluid">
                        <div class="row">
                                  <input name="Id" type="hidden" value="${usuarios.getIdEmpleado()}">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label >Tipo de Documento</label>
                                    <select class="form-control"  id="txtTipodocumento" name="txtTipoDocumento" onchange="elegir_opcion(this);" required>
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
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
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
                                    <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" required id="txtDocumento" name="txtDocumento" value="${usuarios.getDocumento()}" maxlength="27" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Primer Nombre</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" value="${usuarios.getNombre1()}" required name="txtNombre1" id="cliente_nombre" maxlength="40" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Segundo Nombre</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" value="${usuarios.getNombre2()}"  class="form-control" required name="txtNombre2" id="cliente_nombre" maxlength="40" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Primer Apellido</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" value="${usuarios.getApellido1()}" class="form-control" required name="txtApellido1" id="cliente_nombre" maxlength="40" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Segundo Apellido </label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" value="${usuarios.getApellido2()}"  class="form-control" required name="txtApellido2" id="cliente_nombre" maxlength="40" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Genero</label>
                                    <select class="form-control"  id="txtTipodocumento" name="txtGenero" required onchange="elegir_opcion(this);" >
                                        <option value="" disabled="" selected="">Elija Genero</option>
                                <c:choose>
                                    <c:when test="${usuarios.getGenero()=='Femenino'}">
                                        <option value="Femenino" selected="">Femenino</option>
                                        <option value="Masculino">Masculino</option>
                                    </c:when>
                                    <c:when test="${usuarios.getGenero()=='Masculino'}">
                                        <option value="Femenino" >Femenino</option>
                                        <option value="Masculino" selected="">Masculino</option>
                                    </c:when>
                                    <c:otherwise>
                                         <option value="Femenino" >Femenino</option>
                                        <option value="Masculino" >Masculino</option>
                                    </c:otherwise>
                                </c:choose>   
                                    </select>                               
                                </div>
                            </div>
                            
                             <legend><i class="fas fa-phone"></i> &nbsp; Información de Contacto</legend>
                    
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label >Tipo de Teléfono</label>
                                    <select class="form-control"  id="txtTipoTelefono" name="txtTipoTelefono" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                 <c:choose>
                                    <c:when test="${usuarios.getTipo_Tel1()=='Fijo'}">
                                      <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${usuarios.getTipo_Tel1()=='Movil'}">
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
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${usuarios.getIndicativo_Tel1()}"  name="txtIndicativo_Telefono" id="Indicativo_Telefono" maxlength="5" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="">Teléfono</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" value="${usuarios.getTelefono1()}" class="form-control" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                                </div>
                            </div>
                                 <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label >Tipo de Teléfono</label>
                                    <select class="form-control"   name="txtTipoTelefono2" onchange="elegir_opcion(this);" >
                                        <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                         <c:choose>
                                    <c:when test="${usuarios.getTipo_Tel2()=='Fijo'}">
                                      <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${usuarios.getTipo_Tel2()=='Movil'}">
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
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono2" id="Indicativo_Telefono" value="${usuarios.getIndicativo_Tel2()}" maxlength="3" >
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="">Teléfono 2</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${usuarios.getTelefono2()}" name="txtTelefono2" id="cliente_telefono" maxlength="20" >
                                </div>
                            </div>
            
                               <div class="col-12 col-md-4">
                                <div class="form-group" style="position: relative;">
                                    <label for="cliente_nombre">Dirección</label>
                                    <input type="text"  class="form-control" name="txtDireccion" value="${usuarios.getDireccion()}" id="txtDireccion" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                 <div class="form-group" style="position: relative;">
                                    <label for="Ciudad" >Ciudad</label>
                                    <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija una Ciudad</option>                                   
                                      <c:forEach var="ciudad" items="${ciudades}">
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
                              <div class="col-12 col-md-4">
                                <div class="form-group" style="position: relative;">
                                    <label >Email</label>
                                    <input type="email"  class="form-control" name="txtEmail" value="${usuarios.getEmail()}" id="txtEmail" maxlength="50" required>
                                </div>
                            </div>
                             
                               <legend><i class="fas fa-lock-open"></i> &nbsp; Información de acceso al sistema</legend>
                               
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label  >Tipo Usuario</label>
                                    <select class="form-control"  id="txtTipousuario" name="txtTipoEmpleado" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija un tipo</option>
                                           <c:choose>
                                    <c:when test="${usuarios.getTipoEmpleado()=='Administrador'}">
                                        <option value="Administrador" selected="">Administrador</option>
                                        <option value="Cajero">Cajero</option>
                                        <option value="Almacenista">Almacenista</option>
                                    </c:when>
                                    <c:when test="${usuarios.getTipoEmpleado()=='Cajero'}">
                                        <option value="Administrador">Administrador</option>
                                        <option value="Cajero" selected="">Cajero</option>
                                        <option value="Almacenista">Almacenista</option>
                                    </c:when>
                                    <c:when test="${usuarios.getTipoEmpleado()=='Almacenista'}">
                                        <option value="Administrador">Administrador</option>
                                        <option value="Cajero">Cajero</option>
                                        <option value="Almacenista"  selected="">Almacenista</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="Administrador">Administrador</option>
                                        <option value="Cajero">Cajero</option>
                                        <option value="Almacenista">Almacenista</option>
                                    </c:otherwise>
                                </c:choose>   
                                        
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label  >Estado</label>
                                    <select class="form-control"  id="txt Estado" name="txtEstado" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija un Estado</option>
                                        <c:choose>
                                    <c:when test="${usuarios.getEstado()=='Activo'}">
                                      <option value="Activo" selected="">Activo</option>
                                        <option value="Inactivo">Inactivo</option>
                                    </c:when>
                                    <c:when test="${usuarios.getEstado()=='Inactivo'}">
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
                    </div>
                    <br><br>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Usuarios&accion=Listar" class="btn btn-raised btn-secondary btn-sm" style="background-color: red;"><i style="background-color: red" class="fas fa-paint-roller"></i> &nbsp; CANCELAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; ACTUALIZAR</button>
                </p>
            </form>
        </div>	
    </body>
</html>