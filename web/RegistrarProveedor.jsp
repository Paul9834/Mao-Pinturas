<%-- 
    Document   : RegistrarProveedor
    Created on : 20/05/2022, 2:52:17 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Proveedor</title>

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
                swal("¡Proveedor Registrado! ", {
                    icon: "success"
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error! ¡Proveedor no registrado! ", {
                    icon: "error"
                });
            };
        </script>
        <%}%>

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-user-friends fa-fw"></i> &nbsp; REGISTRAR NUEVO PROVEEDOR
            </h3>
            <p class="text-justify">
                En el módulo REGISTRAR PROVEEDOR podrá registrar en el sistema los datos de los proveedores. </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a href="Controlador?menu=Proveedores&accion=Listar"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES</a>
                </li>
                <li>
                    <a  class="active"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; REGISTRAR  PROVEEDORES</a>
                </li>

            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Proveedores" method="POST" class="form-neon">
                <legend><i class="fas fa-store fa-fw"></i> &nbsp; Información básica Proveedor</legend><br>  
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_nombre">Nombres</label>
                            <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,60}" class="form-control" name="txtNombres" id="txtNombres" maxlength="40" required>
                        </div>
                    </div>
                      <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="cliente_nombre">Dirección</label>
                            <input type="text"  class="form-control" name="txtDireccion" id="txtDireccion" maxlength="45" required>
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
                            <label for="Ciudad" >Ciudad</label>
                            <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                <c:forEach var="ciudad" items="${ciudades}">
                                    <option value="${ciudad.getIdCiudad()}"> ${ciudad.getNombre()}</option>  
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label >Tipo de Teléfono</label>
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
                            <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono"  maxlength="20" required>
                        </div>
                    </div>
                    <button type="button"  onclick="AgregarTel2()" id="boton1" class="btn btn-dark"><i class="fas fa-plus"></i></button>        
                    <div style="display:none;" id="tel2" class="form-group">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label >Tipo de Teléfono</label>
                                <select class="form-control"   name="txtTipoTelefono2" onchange="elegir_opcion(this);" >
                                    <option value="" disabled="" selected="">Elija tipo de Teléfono</option>
                                    <option value="Fijo">Teléfono Fijo</option>
                                    <option value="Movil">Teléfono Móvil</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-1">
                            <div class="form-group">
                                <label for="Indicativo_Telefono">Indicativo</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtIndicativo_Telefono2" id="Indicativo_Telefono" maxlength="3" >
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="">Teléfono 2</label>
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono2" id="cliente_telefono" maxlength="20" >
                            </div>
                        </div>
                    </div>
                  

                </div>
                <p class="text-center" style="margin-top: 40px;">
                    <a href="Controlador?menu=Proveedores&accion=Listar" class="btn btn-raised btn-dark btn-dark"> &nbsp; REGRESAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Agregar" name="accion"><i class="far fa-save"></i> &nbsp; REGISTRAR PROVEEDOR</button>
                </p>
            </form>     
        </div>
    </body>
    <script type="text/javascript">
        function AgregarTel2() {
            document.getElementById("tel2").style.display = "contents";
         document.getElementById("boton1").style.display = "none";
    }

        ;
    </script>
</html>