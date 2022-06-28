<%-- 
    Document   : Principal
    Created on : 6/04/2022, 12:20:26 a. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/sweetalert2.css">
        <link rel="stylesheet" href="css/material.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/material.min.js" ></script>
        <script src="js/sweetalert2.min.js" ></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
        <script src="js/main.js" ></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if (session.getAttribute("Nombres") == null && session.getAttribute("TipoEmpleado") == null && session.getAttribute("idEmpleado") == null) {

                response.sendRedirect("index.jsp");
            }
            String Genero = String.valueOf(session.getAttribute("Genero"));
        %>
        <script type="text/javascript">
            swal({
                title: "Bienvenido!",
                text: "Cargando...",
                timer: 1500,
                showConfirmButton: false
            });

        </script>
    </head>
    <body>


        <!-- navBar -->
        <div class="full-width navBar">
            <div class="full-width navBar-options">
                <i class="zmdi zmdi-more-vert btn-menu" id="btn-menu"></i>	
                <div class="mdl-tooltip" for="btn-menu">Menu</div>
                <nav class="navBar-options-list">
                    <ul class="list-unstyle">

                        <li class="btn-exit" id="btn-exit">

                            <form action="FinalizarSesion" id="form1" method="POST">
                                <input type="button" for="btn-exit"   style="border-bottom-color: none; background-color: transparent; border-style: none;"><i class="zmdi zmdi-power"/></i>
                                <div class="mdl-tooltip" >Salir</div>
                            </form>
                        </li>
                        <li class="text-condensedLight noLink" ><small> ${Nombres} ${Apellidos}</small></li>
                        <li class="noLink">
                            <figure>
                                <%if (Genero.equals("Masculino")) {%>
                                <img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
                                <%} else {%>
                                <img src="assets/img/avatar-female.png" alt="Avatar" class="img-responsive">
                                <%}%>
                            </figure>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- navLateral -->
        <section class="full-width navLateral">
            <div class="full-width navLateral-bg btn-menu"></div>
            <div class="full-width navLateral-body">
                <div class="full-width navLateral-body-logo text-center tittles">
                    <i class="zmdi zmdi-close btn-menu"></i> Mao Pinturas 
                </div>
                <figure class="full-width" style="height: 77px;">
                    <div class="navLateral-body-cl">
                        <%if (Genero.equals("Masculino")) {%>
                        <img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
                        <%} else {%>
                        <img src="assets/img/avatar-female.png" alt="Avatar" class="img-responsive">
                        <%}%>

                    </div>
                    <figcaption class="navLateral-body-cr hide-on-tablet">
                        <span>
                            ${Nombres} ${Apellidos}<br>
                            <small>${TipoEmpleado}</small>
                        </span>
                    </figcaption>
                </figure>
                <a href="Controlador?menu=Home" target="myframe" class="full-width" style="text-decoration: none;
                   color: black;">
                    <div class="full-width tittles navLateral-body-tittle-menu">
                        <i class="zmdi zmdi-desktop-mac"></i><span class="hide-on-tablet">&nbsp; DASHBOARD</span>
                    </div>
                </a>
                <nav class="full-width">
                    <ul class="full-width list-unstyle menu-principal">
                        <li class="full-width">
                            <a href="Controlador?menu=Home" target="myframe" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-view-dashboard"></i>
                                </div>
                                <div class="navLateral-body-cr hide-on-tablet">
                                    PAGINA PRINCIPAL
                                </div>
                            </a>
                        </li>

                        <li class="full-width divider-menu-h"></li>
                        <li class="full-width">


                            <a href="Controlador?menu=Clientes&accion=Listar"  target="myframe" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-accounts-list"></i>
                                </div>
                                <div class="navLateral-body-cr hide-on-tablet">
                                    CLIENTES
                                </div>
                            </a>

                        </li>

                        <li class="full-width divider-menu-h"></li>
                        <li class="full-width">
                            <a href="Nueva_Venta.jsp" target="myframe"class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-shopping-cart"></i>
                                </div>
                                <div class="navLateral-body-cr hide-on-tablet">
                                    VENTAS
                                </div>
                            </a>
                        </li>
                        <li class="full-width divider-menu-h"></li>
                            <li class="full-width divider-menu-h"></li>
                             <li class="full-width">
                            <a href="#!" class="full-width btn-subMenu">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-store"></i>
                                </div>
                                <div class="navLateral-body-cr hide-on-tablet">
                                    INVENTARIOS
                                </div>
                                <span class="zmdi zmdi-chevron-left"></span>
                            </a>
                       
                             <ul class="full-width menu-principal sub-menu-options">
                                <li class="full-width">

                                    <a href="Controlador?menu=Categoria_Productos&accion=Listar" class="full-width" target="myframe">
                                        <div class="navLateral-body-cl">
                                            <i class="zmdi zmdi-label "></i>
                                        </div>
                                        <div class="navLateral-body-cr hide-on-tablet">
                                            CATEGORIAS DE PRODUCTOS
                                        </div>
                                    </a>
                                </li>
                                <li class="full-width">

                                    <a href="Controlador?menu=Productos&accion=Listar" class="full-width" target="myframe">
                                        <div class="navLateral-body-cl">
                                            <i class="zmdi zmdi-dropbox "></i>
                                        </div>
                                        <div class="navLateral-body-cr hide-on-tablet">
                                            PRODUCTOS
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="full-width divider-menu-h"></li>
                        <li class="full-width">
                            <a href="#!" class="full-width btn-subMenu">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-wrench"></i>
                                </div>
                                <div class="navLateral-body-cr hide-on-tablet">
                                    CONFIGURACION DE USUARIO
                                </div>
                                <span class="zmdi zmdi-chevron-left"></span>
                            </a>
                            <ul class="full-width menu-principal sub-menu-options">
                                <li class="full-width">
                                    <a href="Controlador?menu=Usuarios&accion=Editar&id=${usuario.getIdEmpleado()}" class="full-width" target="myframe">
                                        <div class="navLateral-body-cl">
                                            <i class="zmdi zmdi-accounts-add"></i>
                                        </div>
                                        <div class="navLateral-body-cr hide-on-tablet">
                                            ACTUALIZAR DATOS
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </section>
        <!-- pageContent -->


        <section class="full-width pageContent">
             <div class="m-4" style="height: 1070px">
                <iframe  style="  position: absolute;
                         top:0;
                         left: 0;
                         width: 100%;
                         height: 94%;
                         border: none;" name="myframe"  src="Controlador?menu=Home">  
                </iframe>
            </div>
            <footer class="footer full-reset" style="">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-xs-12 col-sm-6">
                            <h6 class="s">Desarrolladores</h6>
                            <i class="zmdi zmdi-check zmdi-hc-fw"></i>&nbsp; Brayan Daza <i class="zmdi zmdi-facebook zmdi-hc-fw footer-social"></i><i class="zmdi zmdi-instagram zmdi-hc-fw footer-social"></i>
                            <i class="zmdi zmdi-check zmdi-hc-fw"></i>&nbsp; Kevin Montenegro <i class="zmdi zmdi-facebook zmdi-hc-fw footer-social"></i><i class="zmdi zmdi-instagram zmdi-hc-fw footer-social"></i>

                        </div>
                    </div>
                </div>
                <div class="footer-copyright full-reset all-tittles">©2022 - Version 1.0</div></footer>
        </section>

    </body>
</html>
