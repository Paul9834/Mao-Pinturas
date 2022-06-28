<%-- 
    Document   : VerPedidos
    Created on : 24/06/2022, 11:04:25 p. m.
    Author     : brayan.daza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pedidos</title>
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

        %>

    </head>
    <body>
      

        <div class="d-flex" style="margin: 50px;">
                <div class="col-sm-12">
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
                                    </tr>

                                </thead>  

                                     <tbody  class="tablax">

                                    <c:forEach var="lista" items="${lista}"  varStatus="status">
                                        <tr style="text-align: center;">
                                            <td><c:out value="${status.count}" /></td>
                                            <td>${lista.getCodigoProducto()}</td>
                                            <td>${lista.getNombreProducto()}</td>
                                            <td>$${lista.getValor_Unitario()}</td>
                                            <td>${lista.getCantidad_Productos()}</td>
                                            <td>${(lista.getValor_Productos()*lista.getCantidad_Productos())*lista.getPorcentajeIVA()/100}</td>
                                            <td>$${lista.getValor_Productos()*lista.getCantidad_Productos()}</td>
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
                        <label class="se" name="txtsubtotal">$${subtdt}</label><br>
                        <label class="se" style="color: black; font-weight: bold;">TIPO DE IVA </label>
                        <label class="se" name="txttipoiva">IGV</label><br>
                        <label class="se" style="color: black; font-weight: bold;">IVA </label>
                        <label class="se" name="txtiva">$${totaldtIVA}</label><br>
                        <label class="se" style="color: black; font-weight: bold;">TOTAL A PAGAR </label>
                        <label class="se" name="txtTotalaPagar">$${pd.getValor_Pedido()}</label>
                        </div>

                    </div>
                 <div class="col-sm-4 ml-auto parte01" >

                 <a href="Controlador?menu=Pedidos&accion=ListarPedidos">  <button type="button"  class="btn btn-raised btn-danger">REGRESAR </button> </a>
                        <button type="button" onclick="print()" class="btn btn-raised btn-success">IMPRIMIR FACTURA </button>             
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
   
   
</html>
