<%-- 
    Document   : index
    Created on : 6/04/2022, 12:19:45 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Inicio de sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" />
        <style>
            body{
            background-repeat:no-repeat; 
           background-size: auto;
            background-image:url(assets/img/font-login.png);
            }
            </style>
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login.css"/>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/main.js"></script>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getParameter("r"));
        %>


    </head>
    <body>

        <%if (res.equals("Incorrecto")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error usuario o contraseña incorrecta! ", {
                    title: "Error",
                    icon: "error"
                });
            };
        </script>
        <%} else if (res.equals("Noacceso")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Error el usuario se encuentra inactivo o no tiene aún el acceso concedido por el administrador! ", {
                    title: "Error",
                    icon: "error"
                });
            };
        </script>
        <%}%>
        <div class="form-container">
            <p class="text-center" style="margin-top: 17px;">
                <i class="zmdi zmdi-account-circle zmdi-hc-5x"></i>
            </p>
            <h4 class="text-center all-tittles" style="margin-bottom: 30px;">inicia sesión con tu cuenta</h4>
            <form action="Validar" method="POST">
                <div class="group-material-login">
                    <input type="text" class="material-login-control" autocomplete="off" name="txtUsuario" required="" maxlength="70">
                    <span class="highlight-login"></span>
                    <span class="bar-login"></span>
                    <label><i class="zmdi zmdi-account"></i> &nbsp; Cedula</label>
                </div><br>
                <div class="group-material-login">
                    <input autocomplete="off"type="password" class="material-login-control" name="txtPassword" required="" maxlength="70">
                    <span class="highlight-login"></span>
                    <span class="bar-login"></span>
                    <label><i class="zmdi zmdi-lock"></i> &nbsp; Contraseña</label>
                </div>
                <div style="text-align: center; "><button class="btn-group-lg" style="background-color: black; border:none; font-size: 17px" name="accion"  value="Ingresar" type="submit">Ingresar al sistema &nbsp; <i class="zmdi zmdi-arrow-right"></i></button><br>
                </div><br>
                <br>

            </form>
              <form action="Controlador?menu=Ciudad" method="POST">
                  
                  <div><button value="ListarLogin"  class="btn-group-lg" name="accion" style="background-color: black; text-decoration: none; color: white;  border:none; font-size: 17px" type="submit"> <i class="zmdi zmdi-accounts-add"></i>&nbsp; Registrarme en el sistema </button></div>
             </form>
        </div>  
    </body>
</html>
