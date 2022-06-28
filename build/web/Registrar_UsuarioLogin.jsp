
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Nuevo Usuario</title>

        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">

        <!-- Bootstrap V4.3 -->
        <link rel="stylesheet" href="./css/bootstrap.min2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
                swal("¡Empleado Registrado! ", {
                    icon: "success"
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error Usuario no registrado! ", {
                    icon: "error"
                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado2")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error Usuario no registrado!", "El documento ingresado ya se encuentra registrado en la Base de datos.", {
                    icon: "error"
                });
            };
        </script>
        <%}%>

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRARME EN EL SISTEMA
            </h3>
            <p class="text-justify">
                A continuación debera llenar la siguiente información para hacer su registro en el sistema, al llenar la información solicitada y dar clic en REGISTRARME debe esperar la aprobación del administrador para poder acceder al sistema.
            </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" style="text-align: center;" href="Registrar_Usuario.jsp"><i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRARME</a>
                </li>

            </ul>	
        </div>
        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Usuarios&accion=Agregar" onsubmit="checkForm(this); return false;" name="form" method="POST" class="form-neon" style="width: 99%;">
                <legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-md-6">
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
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="cliente_dni">Numero de Documento</label>
                                <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" required id="txtDocumento" name="txtDocumento" onkeyup="GenerarUser()" maxlength="27" >
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
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label for="cliente_dni">Genero</label>
                                <select class="form-control"  id="txtTipodocumento" name="txtGenero" required onchange="elegir_opcion(this);" >
                                    <option value="" disabled="" selected="">Elija Genero</option>
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                </select>                               
                            </div>
                        </div>

                        <legend><i class="fas fa-phone"></i> &nbsp; Información de Contacto</legend>

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
                                <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                            </div>
                        </div>   
                        <button type="button" id="boton1" onclick="AgregarTel2()" class="btn btn-dark"><i class="fas fa-plus"></i></button>        
                   
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


                        <div class="col-12 col-md-4">
                            <div class="form-group" style="position: relative;">
                                <label for="cliente_nombre">Dirección</label>
                                <input type="text"  class="form-control" name="txtDireccion" id="txtDireccion" maxlength="40" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group" style="position: relative;">
                                <label for="Ciudad" >Ciudad</label>
                                <select class="form-control"  id="txtCiudad" name="txtCiudad" onchange="elegir_opcion(this);" required>
                                    <option value="" disabled="" selected="">Elija una Ciudad</option> 
                                    <c:forEach var="ciudad" items="${ciu}">
                                        <option value="${ciudad.getIdCiudad()}"> ${ciudad.getNombre()}</option>  
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group" style="position: relative;">
                                <label >Email</label>
                                <input type="email"  class="form-control" name="txtEmail" id="txtEmail" maxlength="50" required>
                            </div>
                        </div>

                        <legend><i class="fas fa-lock-open"></i> &nbsp; Información de acceso al sistema</legend>

                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label  >Tipo Usuario</label>
                                <select class="form-control"  id="txtTipousuario" name="txtTipoEmpleado" onchange="elegir_opcion(this);" required>
                                    <option value="" disabled="" selected="">Elija un tipo</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Cajero">Cajero</option>
                                    <option value="Almacenista">Almacenista</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="cliente_apellido" >Usuario</label>
                                <input type="text" readonly=""  class="form-control" name="txtUsuario" id="txtUsuario" required>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group" style="position: relative;">

                                <i class="zmdi zmdi-eye-off" id="eye" name="eye" style="position: absolute; right: 10px; top: 73%; transform: translateY(-50%); cursor: pointer; " ></i>
                                <input type="password" class="form-control" name="txtPassword" required id="txtPassword" maxlength="40" >
                            </div>
                            <label id="valida" style="display: none;">La clave no es valida</label>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-group" style="position: relative;">
                                <label for="cliente_apellido" >Repetir Contraseña</label>
                                <i class="zmdi zmdi-eye-off" id="eye2" name="eye2" style="position: absolute; right: 10px; top: 73%; transform: translateY(-50%); cursor: pointer; " ></i>
                                <input type="password" class="form-control" name="txtPassword2" required id="txtPassword2" maxlength="40" >    
                            </div>
                        </div>
                        <div id="pswd_info">
                            <h4>La contraseña debe cumplir los siguientes requerimientos:</h4>
                            <ul>
                                <li id="letter" class="invalid">Al menos <strong>una letra</strong></li>
                                <li id="capital" class="invalid">Al menos <strong>una letra mayúscula</strong></li>
                                <li id="capital" class="invalid">Al menos <strong>una letra minúscula</strong></li>
                                <li id="number" class="invalid">Al menos <strong>un número</strong></li>
                                <li id="length" class="invalid">Al menos <strong>8 carácteres</strong></li>
                                <li id="null" class="invalid">Debe <strong>confirmar la contraseña</strong></li>
                                <li id="match" class="invalid">Las contraseñas <strong>deben cohincidir</strong></li>
                                <li id="blank" class="invalid">Las contraseñas <strong>no deben tener espacios</strong></li>
                            </ul>
                        </div>
                    
                    </div>
                    <br><br>
                </div>


                <p class="text-center" style="margin-top: 40px;">
                    <a href="index.jsp" class="btn btn-raised btn-danger btn-danger"> &nbsp; CANCELAR</a>
                    &nbsp; &nbsp;
                    <button type="submit" value="Agregar" name="accion"   class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; REGISTRARME</button>
                </p>
            </form>
        </div>	

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

        var eye2 = document.getElementById("eye2");
        var input2 = document.getElementById("txtPassword2");

        eye2.addEventListener("click", function () {
            if (input2.type === "password") {
                input2.type = "text";
                eye2.style.opacity = 0.2;

            } else {
                input2.type = "password";
                eye2.style.opacity = 0.8;
            }

        });


    </script>
    <script type="text/javascript">
        function AgregarTel2() {
            document.getElementById("tel2").style.display = "contents";
            document.getElementById("boton1").style.display = "none";
        }
        ;
    
    </script>
    <script type="text/javascript">
   function checkPassword(valor){
    var myregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/; 
   if(myregex.test(valor)){
       alert(valor+" es valido :-) !");
       return true;        
   }else{
       swal({
                    icon: 'error',
                    title: '¡Cliente actualizado correctamente!',
                    text: '¡La contraseña no cumple los requisitos solicitados.!'
                });
                
       return false;        
   }   
 }

  function checkForm(form){
    if(form.txtDocumento.value === "") {
      alert("Error: Debe escribir Usuario!");
      form.username.focus();
      return false;
    }
    re = /^\w+$/;
    if(!re.test(form.txtNombre1.value)) {
      alert("Error: Nombre de usuario debe contener únicamente letras, numeros y underscores!");
      form.username.focus();
      return false;
    }
    if(form.txtPassword.value !== "" && form.txtPassword.value === form.txtPassword2.value) {
      if(!checkPassword(form.txtPassword2.value)) {
       swal({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡La contraseña no cumple los requisitos solicitados.!'
                });
        form.txtPassword.focus();
        return false;
      }
    } else {
                 swal({
                    icon: 'error',
                    title: '¡Error!!',
                    text: '¡Error: las contraseñas no coinciden.!'
                });
      form.txtPassword.focus();
      return false;
    }
    window.form.submit();
    return true;
  }
    </script>

</html>