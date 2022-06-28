<%-- 
    Document   : RegistrarPedidoProveedor
    Created on : 22/06/2022, 2:33:00 p. m.
    Author     : brayan.daza
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Producto</title>
        <style>
            .datospedido{
                display: none;
            }
            @media print{
                .parte01,.parte02, .parte03, .acciones,.btns{
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
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//borrar cahe
            response.setHeader("pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String res = String.valueOf(request.getAttribute("respuesta"));

        %>


        <%if (res.equals("Registrado")) { %>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'success',
                    title: '¡Pedido Registrado!',
                    text: 'Se registro con Éxito el pedido.'

                });
            };
        </script>
        <%} else if (res.equals("NoRegistrado")) {%>
        <script type="text/javascript">
            window.onload = function () {
                Swal.fire({
                    icon: 'error',
                    title: '¡Error!',
                    text: '¡No se pudo registrar el Pedido!!'

                });
            };
        </script>
        <%} else if (res.equals("NoExistepro")) {%>
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
                    title: '!El Producto no se encuentra registrado¡',
                    text: "¿Desea registrar el Producto?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Si, deseo registrarlo!',
                    cancelButtonText: 'No, deseo registrarlo!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        window.location.href = "Controlador?menu=Categoria_Productos&accion=ListarenProductos";
                    } else {
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel;
                    }
                });
            };
        </script> 
        <%} else if (res.equals("Errorcantidad")) {%>
        <script type="text/javascript">
            window.onload = function () {
                swal("¡Está ingresando una cantidad mayor a la permitida en el Stock! ", {
                    title: "¡Error!",
                    icon: "error"
                });
            };
        </script>
         <%} else if (res.equals("Cancelado")) {%>
        <script type="text/javascript">
             window.onload = function () {
                Swal.fire({
                    icon: 'success',
                    title: '¡Pedido Cancelado!',
                    text: 'Pedido cancelado correctamente'

                });
            };
        </script>
        <%}%>
    </head>
    <body>
        <!-- Page header -->
        <div class="full-box page-header parte01">
            <h3 class="text-left">
                <i class=" zmdi zmdi-dropbox fa-fw"></i> &nbsp; MODULO REGISTRAR NUEVO PEDIDO PROVEEDOR
            </h3>
            <p class="text-justify">
                En el módulo REGISTRAR NUEVO PEDIDO podrá registrar los pedidos solicitados a los proveedores. </p>
        </div>

        <div class="container-fluid parte01">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a href="Controlador?menu=Productos&accion=ListarEstado"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTADO DE PRODUCTOS CON STOCK MINIMO</a>
                </li>
                <li>
                    <a class="active"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR NUEVO PEDIDO</a>
                </li>
            </ul>	
        </div>
        <!-- Content here-->
        <form action="Controlador?menu=RegistrarPedido" name="formulario" method="POST" class="form-neon">
            <div class="container-fluid parte01">
                <div class="datospedido parte01" id="datospedido">
                    <legend><i class="far fa-sticky-note "></i> &nbsp; Información básica del pedido </legend><br>

                    <div class="row">

                        <div class="col-12 col-md-3">
                            <div class="form-group">
                                <label>Proveedor  </label>
                                <a href="Controlador?menu=Ciudad&accion=ListarProveedores"> <i class="fas fa-shipping-fast fa-fw"></i>+</a>
                                <select class="form-control"   name="txtProveedor" onchange="elegir_opcion(this);" >
                                    <option value="" disabled="" selected="">Elija Proveedor</option>
                                    <c:forEach var="prov" items="${proveedores}">
                                        <option value="${prov.getIdProveedores()}"> ${prov.getNombres()}</option>  
                                    </c:forEach>
                                </select>   
                            </div>
                        </div>


                        <div class="col-12 col-md-5">
                            <div class="form-group">
                                <label>Fecha de Entrega</label>
                                <input type="date"  class="form-control"  name="txtFechaEntrega"   >
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="form-group">
                                <label>Fecha de Solicitud</label>
                                <input type="date"  class="form-control" name="txtFecha_Solicitud" >
                            </div>
                        </div>

                    </div>
                </div>
                <br>
                <div class="datosproduc parte01" id="datosproduc">
                    <legend><i class="fas fa fa-tag"></i> &nbsp; Datos de Producto: </legend>
                    <label>Agregue aqui todos los productos que desea pedir.</label><br><br>
                    <div class="row">
                        <div class="col-12 col-md-2">
                            <div class="form-group">
                                <label >Codigo Barras </label>
                                <input type="text" class="form-control" name="txtCodigoProducto" value="${productos.getCodigo_Barras()}" id="txtCodigoProducto" maxlength="40" >
                            </div>
                        </div> 
                        <div class="form-group" >
                            <input type="submit" style="margin-top: 20px;"  name="accion" value="Buscar Producto" class="btn btn-outline-info">
                        </div>


                        <div class="col-12 col-md-2">
                            <div class="form-group">
                                <label for="txtNombre">Nombre </label>
                                <input type="text"  class="form-control" name="txtNombreproducto" readonly="" value="${productos.getNombre()}" id="txtNombre" maxlength="40" required>
                            </div>
                        </div>
                        <div class="col-5 col-sm-2">
                            <div class="form-group">
                                <label for="txtNombre_Empresa">Tope Min</label>
                                <input type="number"   pattern="^[1-9]\d*$" class="form-control" readonly="" value="${productos.getTope_Min()}" placeholder="0" name="txtTope_Min" id="txtTope_Min" maxlength="40" required>
                            </div>
                        </div>
                        <div class="col-5 col-sm-2">
                            <div class="form-group">
                                <label for="txtNombre_Empresa">Tope Max</label>
                                <input type="number"   pattern="^[1-9]\d*$" class="form-control" value="${productos.getTope_Max()}" readonly="" placeholder="0"  name="txtTope_Max" id="txtTope_Max" maxlength="40" required>
                            </div>
                        </div>
                        <div class="col-5 col-sm-2">
                            <div class="form-group">
                                <label for="txtCantidad">Cant. Stock</label>
                                <input type="number"  pattern="^[1-9]\d*$" class="form-control" placeholder="0" value="${productos.getCantidad()}"  readonly=""  name="txtCantidadProdcutos" id="txtCantidad" maxlength="40" required>
                            </div>
                        </div>   
                        <div class="col-12 col-md-2">
                            <div class="form-group">
                                <label for="txtPrecio_Compra">Precio Compra</label>
                                <input type="number"  pattern="^[1-9]\d*$"  class="form-control" readonly="" placeholder="$/.0.00" value="${productos.getPrecio_Compra()}" name="txtPrecio_Compra" id="txtPrecio_Compra" maxlength="40" required>
                            </div>
                        </div>
                        <div class="col-1 col-md-2">
                            <div class="form-group">
                                <label for="txtPrecio_Compra">IVA</label>
                                <input type="number"  pattern="^[1-9]\d*$"  class="form-control" readonly="" placeholder="0" value="${productos.getIVA()}" name="txtIVA" id="txtIVA"  required>
                            </div>
                        </div>
                        <div class="col-12 col-md-2">
                            <div class="form-group">
                                <label for="txtCantidad">Cantidad a pedir</label>
                                <input type="number"  pattern="^[1-9]\d*$" class="form-control" value="1" min="1" name="txtCantidad" id="txtCantidadapedir" maxlength="40" required>
                            </div>
                        </div> 
                        <div class="form-group" >
                            <input type="submit" style="margin-top: 20px;"id="btnagregarproductos" name="accion" value="Agregar al pedido" class="btn btn-raised btn-info btn-sm">
                        </div>    
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group" >
                            <button type="button" onclick="datospedido()" class="btn btn-raised btn-dark btn-sm"><i class="fas fa fa-directions"></i> Siguiente Paso</button>     
                        </div>
                    </div>
                </div>

                <input type="hidden" name="IdProductos" value="${productos.getIdProductos()}">
                <div parte01 class="datospedido" id="datospedidos">
                    <legend><i class="fas fa fa-edit fa-fw"></i> &nbsp; Otros Datos</legend><br>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label >Estado</label>
                            <select class="form-control"   name="txtEstado" onchange="elegir_opcion(this);">
                                <option value="" disabled="" selected="">Elija Estado</option>
                                <option value="Pediente">Pediente entrega</option>
                                <option value="Recibido">Recibido</option>
                            </select>                               
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <label>Observaciones del pedido</label>
                                <textarea name="txtObservaciones" class="form-control" ></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group" >
                            <button type="button" onclick="datosproduc()" class="btn btn-raised btn-dark btn-sm">Anterior Paso</button>     
                        </div>
                    </div>
                </div>   
            </div>   

            <div class="d-flex">
                <div class="col-sm-8">
                    <div class="card">
                        <div class="card-body">


                            <label class="se" style="color: black; font-weight: bold;"> Resumen de Pedido</label><br><br>



                            <br>
                            <div class="container-fluid">
                                <table id="tablax"  class="table table-hover container-fluid table-responsive-lg" >
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
                                    <tbody class="tablax">

                                        <c:forEach var="listapedidos" items="${listapedidos}"  varStatus="status">
                                            <tr style="text-align: center;">
                                                <td><c:out value="${status.count}" /></td>
                                                <td>${listapedidos.getCodigoProducto()}</td>
                                                <td>${listapedidos.getNombreProducto()}</td>
                                                <td>$${listapedidos.getValor_Productos()}</td>
                                                <td><input class="tablax" style="text-align: center; border: none;" min="1"  type="number"  value="${listapedidos.getCantidad_Productos()}" name="txtCantidadLista"/></td>
                                                <td>$${listapedidos.getIVA()}</td>
                                                <td>$${listapedidos.getSubtotal()}</td>

                                                <td class="parte01">
                                                    <button type="submit" onClick="document.formulario.action = 'Controlador?menu=RegistrarPedido&accion=Eliminardelista&articulo=${listapedidos.getItem()}&precio=${listapedidos.getSubtotal()}&iva=${listapedidos.getIVA()}';
                                                            document.formuario.submit()";  class="btn btn-warning"> 
                                                        <i class="far fa-trash-alt"></i></button>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="card-footer d-flex">
                        <div class="col-sm-4 ml-auto" >

                            <label class="se" style="color: black; font-weight: bold;">SUBTOTAL </label>
                            <label class="se" name="txtsubtotal">$${subtotal}</label><br>
                            <label class="se" style="color: black; font-weight: bold;">TIPO DE IVA </label>
                            <label class="se" name="txttipoiva">IGV</label><br>
                            <label class="se" style="color: black; font-weight: bold;">IVA </label>
                            <label class="se" name="txtiva">$${totalIVA}</label><br>
                            <label class="se" style="color: black; font-weight: bold;">TOTAL A PAGAR </label>
                            <label class="se" id="total" name="txtTotalaPagar">$${totalPagar}</label>
                        </div>

                    </div>

                </div>
            </div>


            <div class="parte02">
                <div id="btns" class="btns" style="display: none;">

                    <button type="submit" name="accion" onclick="print()" value="GenerarPedido" class="btn btn-raised btn-success btn-success btn-sm"><i class="far fa-save"></i> &nbsp; GENERAR PEDIDO</button>                                     


                    <button type="submit" name="accion" value="Cancelar" class="btn btn-raised btn-danger btn-sm">&nbsp;CANCELAR </button>                                     

                    <button type="button" onclick="print()" class="btn btn-raised btn-info">&nbsp;IMPRIMIR PEDIDO</button>   

                </div>
            </div>
        </form>



    </body>
    <script type="text/javascript">
        function datospedido() {

            document.getElementById('datospedido').style.display = 'contents';
            document.getElementById('datospedidos').style.display = 'contents';
            document.getElementById('datosproduc').style.display = 'none';
            document.getElementById('btns').style.display = 'contents';


        }

        function datosproduc() {
            document.getElementById('datospedido').style.display = 'none';
            document.getElementById('datospedidos').style.display = 'none';
            document.getElementById('datosproduc').style.display = 'contents';
            document.getElementById('btns').style.display = 'none';
        }
    </script>

</html>
