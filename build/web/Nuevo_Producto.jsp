<%-- 
    Document   : Nuevo_Producto
    Created on : 11/05/2022, 5:14:06 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <title>SISTEMA VENTAS LITE</title>

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
        <link rel="stylesheet" href="./css/style.css">

        <script src="./js/Funciones.js" ></script>
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">




    <body>

         <div class="container-fluid">
            <div class="table-responsive">
                <table class="table table-hover " id="tablax">  
                    <thead style="background-color: #0062cc;  text-align: center;">
                        <tr>
                            <th scope="row">#</th>
                            <th scope="row">NOMBRE</th>
                            <th scope="row">DESCRIPCION</th>
                            <th scope="row">MARCA</th>
                            <th scope="row">CANTIDAD</th>
                            <th scope="row">TOPE MIN</th>
                            <th scope="row">TOPE MAX</th>
                            <th scope="row">CODIGO DE BARRAS</th>
                            <th scope="row">PRECIO DE COMPRA</th>
                            <th scope="row">PRECIO DE VENTA</th>
                            <th scope="row">FECHA REGISTRADO</th>
                            <th scope="row">FECHA VENCIMIENTO</th>
                            <th scope="row">ESTADO</th>
                            <th scope="row">USUARIO QUE REGISTRA</th>
                            <th scope="row">CATEGORIA</th>
                            <th scope="row">ACTUALIZAR</th>
                            <th scope="row">ELIMINAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="produ" items="${productos}">
                            <tr>
                                <td scope="row">${produ.getIdProductos()}</td>
                                <td>${produ.getNombre()}</td>
                                <td>${produ.getDescripcion()}</td>
                                <td>${produ.getMarca()}</td>
                                <td>${produ.getCantidad()}</td>
                                <td>${produ.getTope_Min()}</td>
                                <td>${produ.getTope_Max()}</td>
                                <td>${produ.getCodigo_Barras()}</td>
                                <td>${produ.getPrecio_Compra()}</td>
                                <td>${produ.getFecha_Registrado()}</td>
                                <td>${produ.getFecha_Vencimiento()}</td>
                                <td>${produ.getEstado()}</td>
                                <td>${produ.getUsuario_Registra()}</td>
                                <td>${produ.getCategoria_Productos()}</td>
                                <td>
                                    <form action="Controlador?menu=Proveedores&accion=Editar&idProveedores=${produ.getIdProductos()}" method="post">
                                        <button type="submit" class="btn btn-success"> 
                                            <i class="fas fa-sync-alt"></i>	</button>	                                        
                                    </form>
                                </td>
                                <td>
                                    <form action="Controlador?menu=Proveedores&accion=Eliminar&idProveedores=${produ.getIdProductos()}"  method="post">
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

        <div class="container-fluid" style="background-color: #FFF; padding-bottom: 20px;">
            
                        <p class="text-uppercase text-center media-product-title"><strong>1 - Aceite Nuevo</strong></p>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-barcode"></i> <strong>Código de barras:</strong> 8906063987444</div>

                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-barcode"></i> <strong>SKU:</strong> </div>

                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="far fa-money-bill-alt"></i> <strong>Precio:</strong> $29.00 USD </div><div class="col-12 col-md-6 col-lg-3 col-product" ><i class="fas fa-clipboard-check"></i> <strong>Estado:</strong> Habilitado</div>

                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-box"></i> <strong>Disponibles:</strong> 934</div>
                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-box-open"></i> <strong>Vendidos:</strong> 770</div>
                                <div class="col-12 col-md-6 col-lg-3 col-product"><i class="fas fa-calendar-alt"></i> <strong>Vencimiento:</strong> <span class="badge badge-warning">Vencido</span></div>
                            </div>
                        </div>
                        <div class="text-right media-product-options">
                            <span><i class="fas fa-tools"></i> &nbsp; OPCIONES: </span>
                            <a href="http://systems.designlopers.com/SVIL/product-info/VWFpb2w2V3lkbW45Szk5dWJ1SlBrdz09/" class="btn btn-info" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Información detallada" >
                                <i class="fas fa-box-open"></i>
                            </a>
                            <a href="http://systems.designlopers.com/SVIL/product-image/VWFpb2w2V3lkbW45Szk5dWJ1SlBrdz09/" class="btn btn-secondary" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Gestionar imagen">
                                <i class="far fa-image"></i>
                            </a>
                            <a href="http://systems.designlopers.com/SVIL/product-update/VWFpb2w2V3lkbW45Szk5dWJ1SlBrdz09/" class="btn btn-success" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Actualizar producto">
                                <i class="fas fa-sync"></i>
                            </a>
                            <form class="FormularioAjax form-product" action="http://systems.designlopers.com/SVIL/ajax/productoAjax.php" method="POST" data-form="delete" autocomplete="off">
                                <input type="hidden" name="producto_id_del" value="VWFpb2w2V3lkbW45Szk5dWJ1SlBrdz09">
                                <input type="hidden" name="modulo_producto" value="eliminar">
                                <button type="submit" class="btn btn-warning" data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Eliminar producto" >
                                    <i class="far fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>
                    </div>
  
               
<p class="text-right">Mostrando productos <strong>1</strong> al <strong>15</strong> de un <strong>total de 46</strong></p><nav aria-label="Page navigation example"><ul class="pagination justify-content-center"><li class="page-item disabled" ><a class="page-link" ><i class="fas fa-angle-double-left"></i></a></li><li class="page-item" ><a class="page-link active" href="http://systems.designlopers.com/SVIL/product-list/1/">1</a></li><li class="page-item" ><a class="page-link" href="http://systems.designlopers.com/SVIL/product-list/2/">2</a></li><li class="page-item" ><a class="page-link" href="http://systems.designlopers.com/SVIL/product-list/3/">3</a></li><li class="page-item" ><a class="page-link" href="http://systems.designlopers.com/SVIL/product-list/4/">4</a></li>
                    <li class="page-item" ><a class="page-link" href="http://systems.designlopers.com/SVIL/product-list/2/">Siguiente</a></li>
                    <li class="page-item" ><a class="page-link" href="http://systems.designlopers.com/SVIL/product-list/4/"><i class="fas fa-angle-double-right"></i></a></li>
                </ul></nav></div>		</section>

</body>
</html>