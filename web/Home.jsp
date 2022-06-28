<%-- 
    Document   : Home
    Created on : 7/04/2022, 4:04:35 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
                        if (session.getAttribute("Nombres") == null && session.getAttribute("TipoEmpleado") == null && session.getAttribute("idEmpleado") == null) {

                response.sendRedirect("index.jsp");
            }
            String res = String.valueOf(request.getParameter("respuesta"));
             String TipoEmpleado = String.valueOf(session.getAttribute("TipoEmpleado"));
        %>
        <link rel="stylesheet" href="css/sweetalert2.css">
        <link rel="stylesheet" href="css/material.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">

        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style.css">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min2.js" ></script>
        <script src="js/material.min.js" ></script>
        <script src="js/sweetalert2.min.js" ></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
        <script src="js/main.js" ></script>
        <link rel="stylesheet" href="./css/normalize2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">
        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body><br>
        <%if (res.equals("Actualizado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Usuario actualizado correctamente!',
                    text: 'En el proximo inicio de sesión se reflejara los cambios realizados!'
                });
            };
        </script>
        <%} else if (res.equals("NoActualizado")) {%>
        <script type="text/javascript">
                window.onload = function () {
                    swal("¡Error!", "¡No se pudo completar la actualización de Datos! ", {
                        icon: "error"
                    });
                };
        </script>
        <%}%>
         <%if (res.equals("ActualizadoEmpresa")) { %>
        <script type="text/javascript">
            window.onload = function () {
                swal({
                    icon: 'success',
                    title: '¡Datos actualizados!',
                    text: 'Los Datos de la empresa fueron actualizadas correctamente!'
                });
            };
        </script>
        <%} else if (res.equals("NoActualizadoEmpresa")) {%>
        <script type="text/javascript">
                window.onload = function () {
                    swal("¡Error!", "¡No se pudo completar la actualización de Datos! ", {
                        icon: "error"
                    });
                };
        </script>
        <%}%>
        <section class="full-width ">
            <section class="full-width text-center" ">
                <b>  <h3 class="text-center tittles">INVENTARIO Y FACTURACION</h3></b>
                <p>
                </p>
                <div style="padding-left:  20px">
                    <p class="text-condensedLight" style="font-size: 20px; text-align: left;">
                        ¡Bienvenido <b>${Nombres} ${Apellidos}</b>! Este es el panel principal del sistema acá podrá encontrar atajos para acceder a los distintos listados de cada módulo del sistema.
                    </p> <br>
                </div>
                <!-- Tiles -->
                <%if (TipoEmpleado.equals("Administrador")) {%>

                <article class="full-width tile">
                    <a href="Controlador?menu=Usuarios&accion=Listar"><div class="tile-text">
                        <span  class="text-condensedLight" style="color: #D9534F;">
                           <b>  ${cantidadadmin} </b><br>
                            <small style="color: #000; font-weight: bold;">Administradores</small>
                        </span>
                    </div>
                      <i class="zmdi zmdi-account tile-icon"></i></a>
                </article>
                <%}%>
                
                 <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Cajero") ) {%>
                <article class="full-width tile">
                    <a href="Controlador?menu=Clientes&accion=Listar" ><div  class="tile-text">
                        <span  class="text-condensedLight" style="color: #D9534F;">
                            <b> ${cantidadclientes} </b><br>
                            <small style="color: black; font-weight: bold">Clientes</small>
                        </span>
                    </div>
                    <i class="zmdi zmdi-accounts-list tile-icon"></i></a>  
                </article>
                <%}%>
                <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Almacenista") ) {%>
                <article class="full-width tile">
                    <a href="Controlador?menu=Proveedores&accion=Listar"> <div class="tile-text">
                        <span  class="text-condensedLight" style="color: #D9534F;">
                          <b>  ${cantidadproveedores} </b><br>
                            <small style="color: #000; font-weight: bold">Provedores</small>
                        </span>
                    </div>
                    <i class="zmdi zmdi-truck tile-icon"></i></a>
                </article>
                <%}%>
                
                <article class="full-width tile">
                    <a href="Controlador?menu=Categoria_Productos&accion=Listar" ><div class="tile-text">
                        <span class="text-condensedLight" style="color: #D9534F;">
                            <b>${cantidadcategorias}</b><br>
                            <small style="color: #000; font-weight: bold">Categorias</small>
                        </span>
                    </div>
                    <i class="zmdi zmdi-label tile-icon"></i></a>  
                </article>
                <article class="full-width tile">
                    <a href="Controlador?menu=Productos&accion=Listar"><div class="tile-text">
                        <span class="text-condensedLight" style="color: #D9534F;">
                            <b> ${cantidadproductos}</b><br>
                            <small style="color: #000; font-weight: bold">Productos</small>
                        </span>
                    </div>
                    <i class="zmdi zmdi-dropbox tile-icon"></i></a>
                </article>
              
                            <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Cajero") ) {%>
                <article class="full-width tile">
                   <a href="Controlador?menu=RegistrarVenta&accion=generarseries" >  
                    <div class="tile-text">
                        <span style="color:#D9534F; font-weight: bold" class="text-condensedLight">
                            <b>${cantidadventas}</b><br>
                            <small style="color: #000; font-weight: bold;">Ventas</small>
                        </span>
                    </div>
                    <i class="zmdi zmdi-shopping-cart tile-icon"></i>
                    </a>
                </article>
                 <%}%>
              <%if (TipoEmpleado.equals("Administrador")) {%>
                <a href="Controlador?menu=Usuarios&accion=Listar">  <article class="full-width tile">
                        <div class="tile-text">
                            <span style="color:#D9534F" class="text-condensedLight">
                                <b>${cantidad}</b><br>
                                <small style="color: #000; font-weight: bold;">Cajeros</small>
                            </span>
                        </div>
                        <i class="zmdi zmdi-accounts tile-icon"></i>
                    </article>
                </a>
                  <%}%>
                   <%if (TipoEmpleado.equals("Administrador")) {%>
                   
                <a href="Controlador?menu=Usuarios&accion=Listar">  <article class="full-width tile">
                        <div class="tile-text">
                            <span class="text-condensedLight" style="color:#D9534F" >
                                <b>${cantidadAlmacenista}</b><br>
                                <small style="color: #000; font-weight: bold">Almacenista</small>
                            </span>
                        </div>
                        <i class="zmdi zmdi-accounts-list tile-icon"></i>

                    </article>
                </a>
              <%}%>     
              <%if (TipoEmpleado.equals("Administrador") || TipoEmpleado.equals("Almacenista") ) {%>

                <article class="full-width tile">
                    <a href="Controlador?menu=Pedidos&accion=ListarPedidos"><div class="tile-text">
                        <span  class="text-condensedLight" style="color: #D9534F;">
                           <b>  ${cantidadpd1} </b><br>
                            <small style="color: #000; font-weight: bold;">Pedidos</small>
                        </span>
                    </div>
                      <i class="zmdi zmdi-shopping-cart-add  tile-icon"></i></a>
                </article>
                <%}%>
            </section>
        </section>
    </body>
</html>
