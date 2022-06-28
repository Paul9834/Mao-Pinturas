<%-- 
    Document   : RegistrarCliente
    Created on : 19/05/2022, 7:10:58 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Cliente</title>

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
            String res = String.valueOf(request.getAttribute("respuesta"));

        %>

    </head>
    <body>

        <%if (res.equals("Registrado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Cliente Registrado! ", {
                    icon: "success"
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error! ¡Cliente no registrado! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-user-friends fa-fw"></i> &nbsp; REGISTRAR NUEVO CLIENTE
            </h3>
            <p class="text-justify">
                En el módulo REGISTRAR CLIENTE podrá registrar en el sistema los datos de sus clientes más frecuentes para realizar ventas. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a  href="Nueva_Venta.jsp"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVA VENTA</a>
                </li>
                <li>
                    <a class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; AGREGAR CLIENTE</a>
                </li>
            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Clientes" method="POST" class="form-neon">

                <legend><i class="far fa-address-card"></i> &nbsp; Información básica</legend><br>

                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_dni">Tipo de Documento</label>
                            <select class="form-control"  id="txtTipodocumento" name="txtTipoDocumento" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija un tipo</option>
                                <option value="Cedula de Ciudadania">Cédula de Ciudadania</option>
                                <option value="Cedula de Extranjeria">Cédula de Extranjeria</option>
                                <option value="Pasaporte">Pasaporte</option>
                                <option value="Registro Civil">Registro Civil</option>
                                <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                            </select>                                
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_dni">Numero de Documento</label>
                            <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" id="txtDocumento" name="txtDocumento" maxlength="27" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="cliente_nombre">Primer Nombre</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" required name="txtNombre1" id="cliente_nombre" maxlength="40" >
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="cliente_nombre">Segundo Nombre</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control"  name="txtNombre2" id="cliente_nombre" maxlength="40" >
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="cliente_nombre">Primer Apellido</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" required name="txtApellido1" id="cliente_nombre" maxlength="40" >
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="cliente_nombre">Segundo Apellido </label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control"  name="txtApellido2" id="cliente_nombre" maxlength="40" >
                        </div>
                    </div>
                </div>



                <br><br>
                <legend><i class="fas fa-phone-volume"></i> &nbsp; Información de Contacto</legend><br>

                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="cliente_apellido" >Tipo de Teléfono</label>
                            <select class="form-control"  id="txtTipoTelefono" name="txtTipoTelefono" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                <option value="Fijo">Teléfono Fijo</option>
                                <option value="Movil">Teléfono Móvil</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-1">
                        <div class="form-group">
                            <label for="Indicativo_Telefono">Indicativo</label>
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono" id="Indicativo_Telefono" maxlength="3" required>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="">Teléfono</label>
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                        </div>
                    </div>
                    <button type="button" id="boton1" onclick="AgregarTel2()" class="btn btn-dark"><i class="fas fa-plus"></i></button>        
                    <div style="display:none;" id="tel2" class="form-group">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="cliente_apellido" >Tipo de Teléfono</label>
                                <select class="form-control"  id="txtTipoTelefono2" name="txtTipoTelefono2" onchange="elegir_opcion(this);" >
                                    <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                    <option value="Fijo">Teléfono Fijo</option>
                                    <option value="Movil">Teléfono Móvil</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-1">
                            <div class="form-group">
                                <label for="Indicativo_Telefono">Indicativo</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono2" id="txtIndicativo_Telefono2" maxlength="3" >
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="">Teléfono 2</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono2" id="cliente_telefono" maxlength="20" >
                            </div>
                        </div>
                        <button type="button"  onclick="AgregarTel3()" class="btn btn-dark"><i class="fas fa-plus"></i></button>	
                    </div>
                    <div style="display:none;" id="tel3" class="tel3">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="cliente_apellido" >Tipo de Teléfono</label>
                                <select class="form-control"  id="txtTipoTelefono2" name="txtTipoTelefono3" onchange="elegir_opcion(this);" >
                                    <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                    <option value="Fijo">Teléfono Fijo</option>
                                    <option value="Movil">Teléfono Móvil</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-1">
                            <div class="form-group">
                                <label for="Indicativo_Telefono">Indicativo</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono3" id="Indicativo_Telefono" maxlength="3" >
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="">Teléfono 3</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono3" id="cliente_telefono" maxlength="20" >
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Email</label>
                            <input type="email" class="form-control" name="txtEmail" id="txtEmail" maxlength="45" required>
                        </div>
                    </div>   
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Dirección Domicilio</label>
                            <input type="text"  class="form-control" name="txtDireccion_Domicilio" id="txtDireccion_Domicilio" maxlength="45" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="Ciudad" >Ciudad</label>
                            <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                <c:forEach var="ciudad" items="${ciudades}">
                                    <option value="${ciudad.getIdCiudad()}"> ${ciudad.getNombre()}</option>  
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
                            <input type="text"  class="form-control" name="txtNombre_Empresa" id="txtNombre_Empresa" maxlength="40" required>
                        </div>
                    </div>

                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="txtDireccion_Empresa">Dirección de la Empresa</label>
                            <input type="text"  class="form-control" name="txtDireccion_Empresa" id="txtDireccion_Empresa" maxlength="40" required>
                        </div>
                    </div>
                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Nueva_Venta.jsp" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Agregar" name="accion"><i class="far fa-save"></i> &nbsp; REGISTRAR CLIENTE</button>
                </p>
            </form>     
            <br>
        </div>
    </body>
    <script type="text/javascript">
        function AgregarTel2() {
            document.getElementById("tel2").style.display = "contents";
            document.getElementById("boton1").style.display = "none";
        }
        ;
        function AgregarTel3() {
            document.getElementById("tel3").style.display = "contents";
        }
        ;
    </script>
</html>