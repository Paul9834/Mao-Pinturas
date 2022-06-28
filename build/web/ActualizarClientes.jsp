<%-- 
    Document   : ActualizarClientes
    Created on : 20/05/2022, 12:43:21 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : RegistrarCliente
    Created on : 19/05/2022, 7:10:58 p. m.
    Author     : brayan.daza
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Actualizar Cliente</title>

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
                <i class="fas fa-user-friends fa-fw"></i> &nbsp; ACTUALIZACION DATOS CLIENTE
            </h3>
            <p class="text-justify">
                En el módulo ACTUALIZAR CLIENTE podrá actualizar datos de todos los clientes. </p>
        </div>

        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Clientes" method="POST" class="form-neon">

                <legend><i class="far fa-address-card"></i> &nbsp; Información básica</legend><br>

                <div class="row">
                       <input name="idCliente" type="hidden" value="${clientes.getIdCliente()}">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_dni">Tipo de Documento</label>
                            <select class="form-control"  id="txtTipodocumento" name="txtTipoDocumento" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija un tipo</option>
                                <c:choose>
                                            <c:when test="${clientes.getTipoDocumento()=='Cedula de Ciudadania'}">
                                                <option value="Cedula de Ciudadania" selected="">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${clientes.getTipoDocumento()== 'Cedula de Extranjeria'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria" selected="">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${clientes.getTipoDocumento()== 'Pasaporte'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte" selected="">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>

                                            </c:when> 
                                            <c:when test="${clientes.getTipoDocumento()== 'Registro Civil'}">
                                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                                <option value="Pasaporte">Pasaporte</option>
                                                <option value="Registro Civil">Registro Civil</option>
                                                <option value="Tarjeta de Identidad" selected="">Tarjeta de Identidad</option>
                                            </c:when> 
                                            <c:when test="${clientes.getTipoDocumento()== 'Tarjeta de Identidad'}">
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
                                    <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" required  name="txtDocumento" value="${clientes.getDocumento()}" maxlength="27" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Primer Nombre</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,32}" class="form-control" value="${clientes.getNombre1()}" required name="txtNombre1" id="cliente_nombre" maxlength="32" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Segundo Nombre</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,32}" value="${clientes.getNombre2()}"  class="form-control"  name="txtNombre2" id="cliente_nombre" maxlength="32" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label >Primer Apellido</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,32}" value="${clientes.getApellido1()}" class="form-control" required name="txtApellido1"  maxlength="32" >
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Segundo Apellido </label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,32}" value="${clientes.getApellido2()}"  class="form-control"  name="txtApellido2" maxlength="32" >
                                </div>
                            </div>

                        <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni">Estado</label>
                                    <select class="form-control"   name="txtEstado" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija Estado</option>
                                        <c:choose>
                                            <c:when test="${clientes.getEstado()=='Activo'}">
                                                <option value="Activo" selected="">Activo</option>
                                                <option value="Inactivo">Inactivo</option>
                                            </c:when>
                                            <c:when test="${clientes.getEstado()=='Inactivo'}">
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
                <br><br>
                <legend><i class="fas fa-phone-volume"></i> &nbsp; Información de Contacto</legend><br>

                <div class="row">
                     <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label >Tipo de Teléfono</label>
                                    <select class="form-control"  id="txtTipoTelefono" name="txtTipoTelefono" onchange="elegir_opcion(this);" required>
                                        <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                 <c:choose>
                                    <c:when test="${clientes.getTipo_Tel1()=='Fijo'}">
                                      <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${clientes.getTipo_Tel1()=='Movil'}">
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
                                    <label >Indicativo</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${clientes.getIndicativo_Tel1()}"  name="txtIndicativo_Telefono"  maxlength="5" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="">Teléfono</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" value="${clientes.getTelefono1()}" class="form-control" name="txtTelefono"  maxlength="20" required>
                                </div>
                            </div>
                                 <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label >Tipo de Teléfono</label>
                                    <select class="form-control"   name="txtTipoTelefono2" onchange="elegir_opcion(this);" >
                                        <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                         <c:choose>
                                    <c:when test="${clientes.getTipo_Tel2()=='Fijo'}">
                                      <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${clientes.getTipo_Tel2()=='Movil'}">
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
                                    <label >Indicativo</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono2"  value="${clientes.getIndicativo_Tel2()}" maxlength="5" >
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="">Teléfono 3</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${clientes.getTelefono2()}" name="txtTelefono2"  maxlength="15" >
                                </div>
                            </div>
                                 <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label >Tipo de Teléfono</label>
                                    <select class="form-control"   name="txtTipoTelefono3" onchange="elegir_opcion(this);" >
                                        <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                         <c:choose>
                                    <c:when test="${clientes.getTipo_Tel3()=='Fijo'}">
                                      <option value="Fijo" selected="">Teléfono Fijo</option>
                                        <option value="Movil">Teléfono Móvil</option>
                                    </c:when>
                                    <c:when test="${clientes.getTipo_Tel3()=='Movil'}">
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
                                    <label >Indicativo</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono3" id="Indicativo_Telefono" value="${clientes.getIndicativo_Tel3()}" maxlength="3" >
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="">Teléfono 3</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" value="${clientes.getTelefono3()}" name="txtTelefono3" id="cliente_telefono" maxlength="20" >
                                </div>
                            </div>
                                
                                 
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Email</label>
                            <input type="email" class="form-control" name="txtEmail" value="${clientes.getEmail()}" id="txtEmail" maxlength="45" required>
                        </div>
                    </div>   
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Dirección Domicilio</label>
                            <input type="text"  class="form-control" name="txtDireccion_Domicilio" value="${clientes.getDireccion_Domicilio()}" id="txtDireccion_Domicilio" maxlength="45" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="Ciudad" >Ciudad</label>
                            <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                 <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                        <c:forEach var="ciudad" items="${ciudades}">
                                            <c:choose>
                                                <c:when test="${ciudad.getIdCiudad() == clientes.getCiudad()}">
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
                <br><br>
                <legend><i class="fas fa-store fa-fw"></i> &nbsp; Información de la Empresa</legend><br>

                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtNombre_Empresa">Nombre de la Empresa</label>
                            <input type="text"  class="form-control" value="${clientes.getNombre_Empresa()}" name="txtNombre_Empresa" id="txtNombre_Empresa" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtDireccion_Empresa">Dirección de la Empresa</label>
                            <input type="text"  class="form-control" value="${clientes.getDireccion_Empresa()}"  name="txtDireccion_Empresa" id="txtDireccion_Empresa" maxlength="40" required>
                        </div>
                    </div>

                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Clientes&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Actualizar" name="accion"><i class="far fa-save"></i> &nbsp; ACTUALIZAR CLIENTE</button>
                </p>
            </form>     
        </div>
    </body>
</html>