<%-- 
    Document   : Nueva_Venta
    Created on : 9/05/2022, 6:43:43 p. m.
    Author     : brayan.daza
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nueva Venta</title>
        <style>

            .se{
                font-family: arial;
                font-size: 14px;
            }
            .see{
                font-family: arial;
                font-size: 14px;
            }

            .footer{
                font-family: arial;
                font-size: 10px;
            }
            .footere{
                font-family: arial;
                font-size: 10px;
            }
            .tablax{
                font-family: arial;
                font-size: 12px;


            }
            body::-webkit-scrollbar {
                -webkit-appearance: none;
            }

            body::-webkit-scrollbar:vertical {
                width:10px;
            }

            body::-webkit-scrollbar-button:increment,body::-webkit-scrollbar-button {
                display: none;
            }

            body::-webkit-scrollbar:horizontal {
                height: 10px;
            }

            body::-webkit-scrollbar-thumb {
                background-color: #797979;
                border-radius: 20px;
                border: 2px solid #f1f2f3;
            }


            @media print{
                .parte01,.parte02, .parte03, .acciones{
                    display: none;

                }

                @page {
                    font-family: arial;
                    size: auto;/* auto is the initial value */
                    margin: 100%;
                }
                .se{
                    font-family: arial;
                    font-size: 18px;
                }
                .footere{
                    font-family: arial;
                    font-size: 12px;
                }
                .can{
                    font-family: arial;
                    font-size: 14px;
                }
                .footer{
                    font-family: arial;
                    font-size: 17px;
                }
                .tablax{
                    font-family: arial;
                    font-size: 15px;
                    ;
                }
                .datosfactura{
                    color:red;
                    display: block;
                }
            }
        </style>
        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <!-- Bootstrap V4.3 -->
        <link rel="stylesheet" href="./css/bootstrap.min2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <script src="js/jquery.mCustomScrollbar.concat.min2.js" ></script>
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">
        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="./css/dataTables.bootstrap4.min.css">
        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getAttribute("respuesta"));
            DecimalFormat formato = new DecimalFormat("#,###.00");

        %>

    </head>
    <body>

        <%if (res.equals("Registrado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'success',
                    title: '¡Venta Aprobada!',
                    text: 'Venta registrada correctamente'

                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡No se pudo registrar la venta!!'

                });
            };
        </script>
        <%} else if (res.equals("Errorcantidad")) {%>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡Está ingresando una cantidad mayor a la disponible en el Stock! !'

                });
            };
        </script>
        <%} else if (res.equals("Errorcantidad2")) {%>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'info',
                    title: '¡Stock insuficiente!',
                    text: '¡no hay stock disponible para el producto seleccionado.!!'

                });
            };
        </script>
        <%} else if (res.equals("NoExiste")) {%>%>
        <script type="text/javascript">
            window.onload = function () {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: '!Cliente No Encontrado¡',
                    text: "¿Desea registrar el cliente?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, deseo registrarlo!',
                    cancelButtonText: 'No, deseo registrarlo!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        window.location.href = "Controlador?menu=Ciudad&accion=ListarClientes";
                    } else {
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel;
                    }
                });
            };
        </script>
        <%} else if (res.equals("NoExistepro")) {%>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡El Codigo Buscado no existe!! !'

                });
            };
        </script>
        <%} else if (res.equals("Cancelado")) {%>
        <script type="text/javascript">
             window.onload = function () {
                Swal.fire({
                    icon: 'success',
                    title: '¡Venta Cancelada!',
                    text: 'Venta cancelada correctamente'

                });
            };
        </script>
        <%}%>
        <!-- Page header -->
        <div class="full-box page-header container-fluid parte01">
            <h3 class="text-left">
                <i class="zmdi zmdi-shopping-cart-add"></i> &nbsp; NUEVA VENTA
            </h3>
            <p class="text-justify">
                En el módulo USUARIO podrá registrar nuevos usuarios en el sistema ya sea un administrador o un cajero, también podrá ver la lista de usuarios registrados, buscar usuarios en el sistema, actualizar datos de otros usuarios y los suyos.
            </p>
        </div>
        <div class="container-fluid parte01">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="Nueva_Venta.jsp"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVA VENTA</a>
                </li>
                <li>
                    <a href="Controlador?menu=Ciudad&accion=ListarClientes"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR CLIENTE</a>
                </li>
            </ul>	
        </div>

        <div class="d-flex">
            <div class="col-sm-4 parte02">
                <div class="card">
                    <form action="Controlador?menu=RegistrarVenta" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label style="color: black; font-weight: bold;">Datos Del Cliente</label>
                            </div>
                            <input type="hidden" name="txtIdCliente" value="${cl.getIdCliente()}">
                            <div class="form-group d-inline-blockblock">
                                <div class="col-sm-10 d-flex">
                                    <input type="text" id="Documentocli" required="" name="txtDocumento"  value="${cl.getDocumento()}" class="form-control" placeholder="Documento Cliente">
                                    <input type="submit"id="btn_cli" name="accion"  value="Buscar Cliente" class="btn btn-outline-info">
                                </div>
                                <div class="col-sm-10 d-flex">
                                    <input type="text" readonly="" value="${cl.getNombre1()} ${cl.getApellido1()}"  name="NombresCliente" class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action="Controlador?menu=RegistrarVenta" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label style="color: black; font-weight: bold;">Datos Producto</label>
                            </div>
                            <div class="form-group d-inline-blockblock">
                                <div class="col-sm-10 d-flex">
                                    <input type="hidden" name="IdProductos" value="${productos.getIdProductos()}">
                                    <input type="hidden" name="txtIVA" value="${productos.getIVA()}">
                                    <input type="text" name="txtCodigoProducto" required="" value="${productos.getCodigo_Barras()}"class="form-control" placeholder="Codigo Producto">
                                    <input type="submit" id="btnbuscarpro" required="" name="accion" value="Buscar Producto" class="btn btn-outline-info">
                                </div>

                                <div class="col-sm-10 d-flex">
                                    <input type="text" readonly="" id="txtNombreproducto" required=""  name="txtNombreproducto" value="${productos.getNombre()}" class="form-control" >   
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="txtPrecio" value="${productos.getPrecio_Venta()}" required="" readonly=""  class="form-control" placeholder="$/.0.00">
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <input type="number" name="txtCantidad" min="1" value="1" required=""class="form-control" placeholder="">
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <input type="text" name="txtCantidadProdcutos" required="" value="${productos.getCantidad()}" readonly=""  class="form-control" placeholder="Stock">
                                </div>
                            </div>

                            <div class="form-group d-flex">
                                <input  id="btnagregarproductos"type="submit"  name="accion" value="Agregar" class="btn btn-raised btn-info btn-sm">

                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body">
                        <div class="row justify-content-around">

                            <img src="./assets/img/Logo2.png" width="15%;"  style="align-content: initial">

                            <p class="se"  style=" text-align: center;"><b>ROLAN MAURICIO MELO</b><br>
                                NIT: 80.804.865.6<br>
                                CR 12B #10 - 46<br>
                                Tel: 3232491438<br>
                                Mosquera - Colombia<br>
                                Samuel18062099@hotmail.com</p>
                            <img src="./assets/img/logo.png" width="20%;" height="12%" style="float:right; padding-top: 30px;">
                        </div>
                        <br>
                         <div class="row justify-content-around" style="margin-right: 150px;">
                            <span class="border border-0">
                                <label class="se"  style="font-weight: bold;">Fecha y Hora: </label>
                                <label class="se" name="FechaActual">${vt.getFecha_Solicitud()}</label> <br>
                                <label class="se"  style="text-align: center; font-weight: bold; ">Datos Cliente </label>
                                <div class="col-12"> 

                                    <label class="se"  style="font-weight: bold;">Facturar a: </label>
                                    <label class="se"  name="cliente" >${cl.getNombre1()} ${cl.getApellido1()}</label>
                                    <br>    
                                    <label class="se"  style="font-weight: bold; ">Tipo Documento </label>
                                    <label class="se"  name="cliente" >${cl.getTipoDocumento()}</label>
                                    <br>    
                                    <label class="se" style="font-weight: bold;">Documento: </label>
                                    <label class="se" name="cliente" >${cl.getDocumento()}</label>
                                    <br>    
                                    <label class="se"  style="font-weight: bold;">Telefono: </label>
                                    <label class="se"  name="cliente" >${cl.getTelefono1()}, ${cl.getTelefono2()}</label>
                                    <br>
                                    <label class="se"  style="font-weight: bold;">Email: </label>
                                    <label class="se"  name="cliente" >${cl.getEmail()}</label><br>
                                </div></span><span class="border border-0">
                                <label class="se"  style="font-weight: bold;">Datos Empresa </label><br>
                                <div class="col-12" > 

                                    <label class="se"  style="font-weight: bold;">Nombre: </label>
                                    <label class="se"  name="empresa">${cl.getNombre_Empresa()}</label><br>
                                    <label class="se"  style="font-weight: bold;">Dirección: </label>
                                    <label class="se"  name="empresa" >${cl.getDireccion_Empresa()}</label><br>
                                </div>
                                <label  class="se" style=" font-weight:  bold;">Datos Vendedor </label><br>
                                <div class="col-12" >                                      
                                    <label class="se" style="font-weight: bold;">Vendedor: </label>
                                    <label class="se" name="empresa" >${Nombres} ${Apellidos}</label><br>
                                </div></span>
                        </div> 
                        <br>
                        <div  class="d-flex col-sm-5 ml-auto">
                            <label class="se" style="color: black; font-weight: bold;">Nro. Serie: </label><br><br>
                            <label class="se" name="NroSerie" class="form-control">${numeroserie}</label>
                        </div>

                        <br>
                        <div class="container-fluid">
                            <table   class="table table-hover container-fluid" >
                                <thead class="thead" style="color: black; text-align: center" >
                                    <tr  style="text-align: center">
                                        <th class="see" style="color: black; font-weight: bold;">Nro</th>
                                        <th class="see" style="color: black; font-weight: bold;">Codigo</th>
                                        <th class="see" style="color: black; font-weight: bold;">Descripcion</th>
                                        <th class="see" style="color: black; font-weight: bold;">Valor Unitario</th>
                                        <th class="see" style="color: black; font-weight: bold;">Cantidad</th>
                                        <th class="see" style="color: black; font-weight: bold;">IVA</th>
                                        <th class="see" style="color: black; font-weight: bold;">Subtotal</th>
                                        <th class="acciones" style="color: black; text-align: center; font-weight: bold;">Acciones</th>
                                    </tr>

                                </thead>  
                                <tbody  class="tablax">

                                    <c:forEach var="lista" items="${lista}"  varStatus="status">
                                        <tr style="text-align: center;">
                                            <td><c:out value="${status.count}" /></td>
                                            <td>${lista.getCodigo_Producto()}</td>
                                            <td>${lista.getNombre_Producto()}</td>
                                            <td>$${lista.getValor_Productos()}</td>
                                            <td><input class="tablax" style="text-align: center; border: none;" min="1"  type="number"  value="${lista.getCantidad_Producto()}" name="txtCantidadLista"/></td>
                                            <td>$${lista.getIVA()}</td>
                                            <td>$${lista.getSubtotal()}</td>
                                            <td class="parte01">
                                                <form action="Controlador?menu=Productos&accion=Editar&IdProductos=${lista.getProductos()}" method="post">
                                                    <button type="submit" class="btn btn-success"> 
                                                        <i class="fas fa-check"></i></button>	                                        
                                                </form>
                                            </td>
                                            <td class="parte01">
                                                <form action="Controlador?menu=RegistrarVenta&accion=Eliminardelista&articulo=${lista.getItem()}&precio=${lista.getSubtotal()}"  method="post">
                                                    <button type="submit" class="btn btn-warning"> 
                                                        <i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card-footer d-flex">

                    <form action="Controlador?menu=RegistrarVenta&accion=GenerarVenta" class="parte01" method="post">

                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label style="color: black; font-weight: bold;">Estado de la venta: </label>
                                <select class="form-control"   name="txtEstado" required="" onchange="elegir_opcion(this);">
                                    <option value="" disabled="" selected="">Elija Estado</option>
                                    <option value="Pediente">Pediente entrega</option>
                                    <option value="Pediente">Pediente Pago</option>
                                    <option value="Pediente">Pediente Pago y Entrega</option>
                                    <option value="Entregado">Entregado</option>
                                </select>                               

                            </div>

                        </div>
                        <button type="submit" name="accion" onclick="print()" value="GenerarVenta" class="btn btn-success">Genarar Venta </button>                                     
                    </form>

                    <form action="Controlador?menu=RegistrarVenta&accion=Cancelar" class="parte01" method="post">
                        <button type="submit" name="accion" onclick="Cancelado();" value="Cancelar" style="margin-top: 82px;" class="btn btn-danger">Cancelar </button>                                     
                    </form>
                    <div class="col-sm-4 ml-auto" >

                        <label class="se" style="color: black; font-weight: bold;">SUBTOTAL </label>
                        <label class="se" name="txtsubtotal">$${subtotal}</label><br>
                        <label class="se" style="color: black; font-weight: bold;">TIPO DE IVA </label>
                        <label class="se" name="txttipoiva">IGV</label><br>
                        <label class="se" style="color: black; font-weight: bold;">IVA </label>
                        <label class="se" name="txtiva">$${totalIVA}</label><br>
                        <label class="se" style="color: black; font-weight: bold;">TOTAL A PAGAR </label>
                        <label class="se" name="txtTotalaPagar">$${totalPagar}</label>
                    </div>

                </div>
                <div class="card-footer footere">
                    <center><p class="footere" >A esta factura de venta aplican las normas relativas a la letra de cambio (articulo 5 Ley 1231 de 2008).
                            Con esta el comprador declara haber recibido real y materialmente las mercancias o prestación de servicios 
                            descritos en este titulo - valor. <b>Numero Autoriazación 18764024135862 aprobado en 20220115 prefijo A desde el numero
                                1 al 360 Vigencia:6 meses</b>
                            Régimen simple de tributación - Actividad Económica 4752 Comercio al por menor de articulos de ferretería, pinturas y productos de vidrio en establecimientos especializados.
                        </p></center> 
                    <center><label class="footer" style="font-weight: bold;">Carrera 12B No. 10-46 Mosqueera - Cel.:3212146094</label></center>
                </div>
            </div>
        </div>

    </body>
    <!-- jQuery V3.4.1 -->
    <script src="./js/jquery-3.4.1.min.js" ></script>

    <!-- popper -->
    <script src="./js/popper.min2.js" ></script>

    <!-- Bootstrap V4.3 -->
    <script src="./js/bootstrap.min.js" ></script>

    <!-- jQuery Custom Content Scroller V3.1.5 -->
    <script src="./js/jquery.mCustomScrollbar.concat.min2.js" ></script>

    <!-- Bootstrap Material Design V4.0 -->

    <!-- DATATABLES -->
    <script src="./js/jquery.dataTables.min.js"></script>
    <!-- BOOTSTRAP -->
    <script src="./js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript">

                            function Mostrar() {
                                document.getElementById('datosfactura').style.display = 'block';
                            }

    </script>
    <script type="text/javascript">

        $(document).keys(function () {



            let btncompra = document.getElementById('btnagregarproductos');

            let txtNombreproducto = document.getElementById('txtNombreproducto');
            btncompra.disabled = true;


            $('#txtPassword2').val(function () {
                if (txtNombreproducto === "") {
                    btncompra.disabled = true;
                } else {
                    btncompra.disabled = false;
                }
            });
        });

        btn_cli = document.getElementById('btn_cli');
        btn_cli.disabled = true;

        $('#Documentocli').keyup(function () {
            btn_cli.disabled = false;
        });

      
    </script>
    

</html>
