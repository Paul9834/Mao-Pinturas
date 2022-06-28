/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Categoria_Productos;
import Modelo.Categoria_ProductosDAO;
import Modelo.CiudadDAO;
import Modelo.Clientes;
import Modelo.ClientesDAO;
import Modelo.DatosEmpresa;
import Modelo.DatosEmpresaDAO;
import Modelo.DetallePedidosProveedor;
import Modelo.DetallePedidosProveedorDAO;
import Modelo.Detalle_Ventas;
import Modelo.Detalle_VentasDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Pedidos_Proveedor;
import Modelo.Pedidos_ProveedorDAO;
import Modelo.Productos;
import Modelo.ProductosDAO;
import Modelo.Proveedores;
import Modelo.ProveedoresDAO;
import Modelo.Ventas;
import Modelo.VentasDAO;
import config.GenerarSerie;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author brayan.daza
 */
@MultipartConfig
public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    DatosEmpresa de = new DatosEmpresa();
    DatosEmpresaDAO datosempresa = new DatosEmpresaDAO();
    CiudadDAO ciudao = new CiudadDAO();
    Clientes cliente = new Clientes();
    ClientesDAO clientesdao = new ClientesDAO();
    Proveedores provedor = new Proveedores();
    ProveedoresDAO provDAO = new ProveedoresDAO();
    Categoria_Productos cp = new Categoria_Productos();
    Categoria_ProductosDAO cpDAO = new Categoria_ProductosDAO();
    Productos productos = new Productos();
    ProductosDAO productosDAO = new ProductosDAO();
    Detalle_Ventas detalleventa = new Detalle_Ventas();
    DetallePedidosProveedor detallepedidos = new DetallePedidosProveedor();
    DetallePedidosProveedorDAO detallepedidosDAO = new DetallePedidosProveedorDAO();
    Detalle_VentasDAO detallevdao = new Detalle_VentasDAO();
    Ventas ventas = new Ventas();
    VentasDAO ventasdao = new VentasDAO();
    Pedidos_Proveedor pedido = new Pedidos_Proveedor();
    Pedidos_ProveedorDAO pedidoDAO = new Pedidos_ProveedorDAO();

    DecimalFormat formato = new DecimalFormat("#,###.00");

    List<Detalle_Ventas> lista = new ArrayList<>();
    List<DetallePedidosProveedor> listapedidos = new ArrayList<>();

    int item;
    int item2;
    String codigo;
    String NombreProducto;
    double precio;
    int cantidad;
    String codigo2;
    String NombreProducto2;
    double precio2;
    int cantidad2;
    double subtotal2 = 0.00;
    double preciocantidad2 = 0.00;
    double totalPagar2 = 0.00;
    double totalPagarIVA2 = 0.00;
    String totalIVA2 = "0.00";
    double subtotal = 0.00;
    double preciocantidad = 0.00;
    double totalPagar = 0.00;
    double totalPagarIVA = 0.00;
    String totalIVA = "0.00";
    int prod;
    int prod2;
    VentasDAO vdao = new VentasDAO();
    String numeroserie;
    int resdetalle;
    int resdetallepedido;
    int resventa;
    int respedido;
    DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String FechaActual = String.valueOf(dtf4.format(LocalDateTime.now()));
    String subt = "0.00";
    String total = "0.00";
    String subt2 = "0.00";
    String total2 = "0.00";
    List lista2;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        int idu = 0;

        HttpSession sesion = request.getSession();

        if (sesion.getAttribute("Nombres") == null && sesion.getAttribute("TipoEmpleado") == null && sesion.getAttribute("IdEmpleado") == null && sesion.getAttribute("Genero") == null) {
            response.sendRedirect("index.jsp");

        }

        if (menu.equals("Principal")) {

            response.sendRedirect(request.getContextPath() + "/Principal.jsp");
        } else if (menu.equals("PrincipalCajero")) {
            response.sendRedirect(request.getContextPath() + "/PrincipalCajero.jsp");
        } else if (menu.equals("PrincipalAlmacenista")) {
            response.sendRedirect(request.getContextPath() + "/PrincipalAlmacenista.jsp");
        }
        if (menu.equals("Usuarios")) {
            switch (accion) {
                case "Listar":
                    List lista = edao.listar();
                    request.setAttribute("usuarios", lista);
                    request.getRequestDispatcher("ListarUsuarios.jsp").forward(request, response);
                    break;

                case "ListarUserEstado":

                    List ListarUserEstado = edao.listarTipoUser();
                    request.setAttribute("usuarios", ListarUserEstado);
                    request.getRequestDispatcher("ListarUserEstado.jsp").forward(request, response);
                    break;

                case "Editar":

                    String idu1 = request.getParameter("id");
                    idu = Integer.parseInt(idu1);
                    Empleado e = edao.ListarId(idu);
                    List ListarCiudad2 = ciudao.listarCiudades();
                    request.setAttribute("ciu", ListarCiudad2);
                    request.setAttribute("usuarios", e);
                    request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarEmpleados").forward(request, response);
                    break;

                case "Consultarid":
                    String idstr = request.getParameter("id");
                    int id1 = Integer.parseInt(idstr);
                    Empleado emcon = edao.ListarIdtablas(id1);
                    request.setAttribute("empleado", emcon);
                    if (emcon.getNombre1() != null) {
                        request.getRequestDispatcher("Controlador?menu=Usuarios&accion=ListarUserEstado&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Usuarios&accion=ListarUserEstado").forward(request, response);
                    }
                    break;
                case "Consultariduser":
                    String idstr1 = request.getParameter("id");
                    int id2 = Integer.parseInt(idstr1);
                    Empleado user = edao.ListarIdtablas(id2);
                    request.setAttribute("empleado", user);
                    if (user.getNombre1() != null) {
                        request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request, response);
                    }

                    break;
            }
        }
        if (menu.equals("Ciudad")) {
            switch (accion) {
                case "ListarClientes":

                    List ListarCiudad2 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad2);
                    request.getRequestDispatcher("RegistrarCliente.jsp").forward(request, response);
                    break;
                case "ListarProveedores":

                    List ListarCiudad3 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad3);
                    request.getRequestDispatcher("RegistrarProveedor.jsp").forward(request, response);
                    break;
                case "ListarEmpleados":

                    List ListarCiudad4 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad4);
                    request.getRequestDispatcher("ActualizarUsuarios.jsp").forward(request, response);
                    break;
            }

        }
        if (menu.equals("Pedidos")) {
            switch (accion) {
                case "ListarPedidos":

                    List ListarPedidos = pedidoDAO.listar();
                    request.setAttribute("pedidos", ListarPedidos);
                    request.getRequestDispatcher("ListaPedidos.jsp").forward(request, response);
                    break;
                case "ListarPedidosCancelados":
                    String Estado="Cancelado";
                    List ListarPedidos2 = pedidoDAO.listarEstado(Estado);
                    request.setAttribute("pedidos", ListarPedidos2);
                    request.getRequestDispatcher("ListaPedidos.jsp").forward(request, response);
                    break;

                case "Consultaridpd":
                    String idstr = request.getParameter("id");
                    int id = Integer.parseInt(idstr);
                    Pedidos_Proveedor pd = pedidoDAO.ListarId(id);
                    request.setAttribute("pd", pd);
                    if (pd.getFecha_Entrega() != null) {
                        request.getRequestDispatcher("Controlador?menu=Pedidos&accion=ListarPedidos&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Pedidos&accion=ListarPedidos").forward(request, response);
                    }
                    break;
                case "VerPedido":
                    String idstr2 = request.getParameter("id");
                    int id2 = Integer.parseInt(idstr2);

                    Pedidos_Proveedor pd2 = pedidoDAO.ListarId(id2);
                    List<DetallePedidosProveedor> listadt = new ArrayList<>();
                    listadt = detallepedidosDAO.ListarId(id2);

                    double subtdt = 0;
                    double totaldtIVA = 0;

                    for (int i = 0; i < listadt.size(); i++) {
                        subtdt = subtdt + listadt.get(i).getValor_Productos() * listadt.get(i).getCantidad_Productos();
                        totaldtIVA = totaldtIVA + (listadt.get(i).getValor_Productos() * listadt.get(i).getCantidad_Productos()) * listadt.get(i).getPorcentajeIVA() / 100;
                    }

                    request.setAttribute("subtdt", subtdt);
                    request.setAttribute("totaldtIVA", totaldtIVA);
                    request.setAttribute("lista", listadt);
                    request.setAttribute("pd", pd2);

                    request.getRequestDispatcher("VerPedidos.jsp").forward(request, response);
                    break;

            }

        }
        if (menu.equals("Ventas")) {
            switch (accion) {
                case "ListarVentas":

                    List ListaVentas = ventasdao.listar();
                    request.setAttribute("vts", ListaVentas);
                    request.getRequestDispatcher("ListaVentas.jsp").forward(request, response);
                    break;
                case "ListarVentasPendientes":
                    String estado="Pendiente";
                    List ListaVentas2 = ventasdao.listarestado(estado);
                    request.setAttribute("vts", ListaVentas2);
                    request.getRequestDispatcher("ListaVentasPendientes.jsp").forward(request, response);
                    break;
                case "ListarVentasEntregadas":
                    String estado2="Entregada";
                    List ListaVentas3 = ventasdao.listarestado(estado2);
                    request.setAttribute("vts", ListaVentas3);
                    request.getRequestDispatcher("ListaVentasEntregadas.jsp").forward(request, response);
                    break;
                case "ListarVentasCanceladas":
                    String estado4="Cancelada";
                    List ListaVentas4 = ventasdao.listarestado(estado4);
                    request.setAttribute("vts", ListaVentas4);
                    request.getRequestDispatcher("ListaVentasEntregadas.jsp").forward(request, response);
                    break;

                case "ConsultaridVentas":
                    String idstr = request.getParameter("id");
                    int id = Integer.parseInt(idstr);
                    Ventas vt = ventasdao.ListarId(id);
                    request.setAttribute("vt", vt);
                    if (vt.getFecha_Entrega() != null) {
                        request.getRequestDispatcher("Controlador?menu=Ventas&accion=ListarVentas&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Ventas&accion=ListarVentas").forward(request, response);
                    }
                    break;
                case "VerFactura":
                    String idstr2 = request.getParameter("id");
                    int id2 = Integer.parseInt(idstr2);
                    Ventas vt2 = ventasdao.ListarId(id2);
                    List<Detalle_Ventas> listadt = new ArrayList<>();
                    listadt = detallevdao.ListarId(id2);

                    Clientes cl = clientesdao.ListarId(vt2.getCliente());
                    Empleado em2 = edao.ListarId(vt2.getUsuario_Registra());
                    double subtdt = 0;
                    double totaldtIVA = 0;

                    for (int i = 0; i < listadt.size(); i++) {
                        subtdt = subtdt + listadt.get(i).getSubtotal();
                        totaldtIVA = totaldtIVA + listadt.get(i).getValor_Productos() * listadt.get(i).getPorcentajeIVA() / 100;
                    }

                    request.setAttribute("subtdt", subtdt);
                    request.setAttribute("totaldtIVA", totaldtIVA);
                    request.setAttribute("lista", listadt);
                    request.setAttribute("vt", vt2);
                    request.setAttribute("cl", cl);
                    request.setAttribute("em", em2);

//                    if (vt2.getFecha_Entrega()!= null) {
//                        request.getRequestDispatcher("Controlador?menu=Ventas&accion=ListarVentas&par=1").forward(request, response);
//                    } else {
//                        request.getRequestDispatcher("Controlador?menu=Ventas&accion=ListarVentas").forward(request, response);
//                    }
                    request.getRequestDispatcher("VerFacturaVentas.jsp").forward(request, response);
                    break;

            }

        }
        if (menu.equals("DatosEmpresa")) {

            switch (accion) {
                case "Editar":
                    int idemp = 1;
                    DatosEmpresa empresa = datosempresa.ListarId(idemp);
                    request.setAttribute("datos", empresa);
                    request.getRequestDispatcher("ActualizarDatosEmpresa.jsp").forward(request, response);
                    break;
            }
        }
        if (menu.equals("Home")) {
            String cantidadEmplea = edao.contarempleados();
            if (cantidadEmplea != null) {
                request.setAttribute("cantidad", cantidadEmplea);
            } else {
                request.setAttribute("cantidad", "0");
            }
            String cantidadadmin = edao.contaradmin();
            if (cantidadadmin != null) {
                request.setAttribute("cantidadadmin", cantidadadmin);
            } else {
                request.setAttribute("cantidadadmin", "0");
            }
            String cantidadAlmacenista = edao.contarAlmacenista();
            if (cantidadAlmacenista != null) {
                request.setAttribute("cantidadAlmacenista", cantidadAlmacenista);
            } else {
                request.setAttribute("cantidadAlmacenista", "0");
            }
            String cantidadproveedores = provDAO.contarproveedoress();
            if (cantidadproveedores != null) {
                request.setAttribute("cantidadproveedores", cantidadproveedores);
            } else {
                request.setAttribute("cantidadproveedores", "0");
            }
            String cantidadclientes = clientesdao.contarclientes();
            if (cantidadclientes != null) {
                request.setAttribute("cantidadclientes", cantidadclientes);
            } else {
                request.setAttribute("cantidadclientes", "0");
            }
            String cantidadcategorias = cpDAO.contarcategoria_productos();
            if (cantidadcategorias != null) {
                request.setAttribute("cantidadcategorias", cantidadcategorias);
            } else {
                request.setAttribute("cantidadcategorias", "0");
            }
            String cantidadproductos = productosDAO.contarProductos();
            if (cantidadproductos != null) {
                request.setAttribute("cantidadproductos", cantidadproductos);
            } else {
                request.setAttribute("cantidadproductos", "0");
            }
            String cantidadventas = vdao.contarVentas();
            if (cantidadventas != null) {
                request.setAttribute("cantidadventas", cantidadventas);
            } else {
                request.setAttribute("cantidadventas", "0");
            }            
            String cantidadpd1 = pedidoDAO.contarPedidos();
            System.out.println(cantidadpd1);
            if (cantidadpd1 != null) {
                request.setAttribute("cantidadpd1", cantidadpd1);
            } else {
                request.setAttribute("cantidadpd1", "0");
            }
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }

        if (menu.equals("Clientes")) {
            switch (accion) {
                case "Listar":
                    List lista = clientesdao.listar();
                    request.setAttribute("clientes", lista);
                    request.getRequestDispatcher("ListaClientes.jsp").forward(request, response);
                    break;
                case "Consultariduser":
                    String idstr1 = request.getParameter("id");
                    int id2 = Integer.parseInt(idstr1);
                    Clientes cli = clientesdao.ListarIdTablas(id2);
                    request.setAttribute("clien", cli);
                    if (cli.getNombre1() != null) {
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    }
                    break;
            }

        }
        if (menu.equals("Proveedores")) {
            switch (accion) {
                case "Listar":
                    List lista = provDAO.listar();
                    request.setAttribute("proveedores", lista);
                    request.getRequestDispatcher("ListaProveedores.jsp").forward(request, response);
                    break;
                case "Consultaridprov":
                    String idstr = request.getParameter("id");
                    int id = Integer.parseInt(idstr);
                    Proveedores prove = provDAO.ListarIdTablas(id);
                    request.setAttribute("prove", prove);
                    if (prove.getNombres() != null) {
                        request.getRequestDispatcher("Controlador?menu=Proveedores&accion=Listar&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Proveedores&accion=Listar").forward(request, response);
                    }
                    break;
                case "ListarPedidos":
                    lista2 = provDAO.listar();
                    request.setAttribute("proveedores", lista2);
                    request.setAttribute("subtotal", subt2);
                    request.setAttribute("totalIVA", totalIVA2);
                    request.setAttribute("listapedidos", listapedidos);
                    request.setAttribute("totalPagar", total2);
                    request.getRequestDispatcher("RegistrarPedidoProveedor.jsp").forward(request, response);
                    break;
            }

        }

        if (menu.equals("Categoria_Productos")) {
            switch (accion) {
                case "Listar":
                    List lista = cpDAO.listar();
                    request.setAttribute("Categoria", lista);
                    request.getRequestDispatcher("ListaCategoriaProductos.jsp").forward(request, response);
                    break;
                case "ListarImagen":
                    int id = Integer.parseInt(request.getParameter("id"));
                    cpDAO.ListarImg(id, response);
                    break;
                case "ListarImagenenProductos":
                    int id2 = Integer.parseInt(request.getParameter("id"));
                    cpDAO.ListarImg(id2, response);
                    break;
                case "ListarenProductos":
                    List listacategorias = cpDAO.listar();
                    List listaempleados = edao.listarempleados();
                    request.setAttribute("Categoria", listacategorias);
                    request.setAttribute("Usuario_Registra", listaempleados);
                    request.getRequestDispatcher("RegistrarProductos.jsp").forward(request, response);
                    break;
            }

        }
        if (menu.equals("Productos")) {
            switch (accion) {
                case "Listar":
                    List lista = productosDAO.listar();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("ListarProductos.jsp").forward(request, response);
                    break;
                case "ListarEstado":
                    List lista2 = productosDAO.listarStock();
                    request.setAttribute("productos", lista2);
                    request.getRequestDispatcher("ListaStockMinimo.jsp").forward(request, response);
                    break;
                case "Consultaridprod":
                    String idstr = request.getParameter("id");
                    int id = Integer.parseInt(idstr);
                    Productos product = productosDAO.ListarIdTablas(id);
                    request.setAttribute("product", product);

                    if (product.getCodigo_Barras() != null) {
                        request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar").forward(request, response);
                    }
                    break;
                case "Consultaridprod2":
                    String idstr2 = request.getParameter("id");
                    int id2 = Integer.parseInt(idstr2);
                    Productos product2 = productosDAO.ListarIdTablas(id2);
                    request.setAttribute("product", product2);

                    if (product2.getCodigo_Barras() != null) {
                        request.getRequestDispatcher("Controlador?menu=Productos&accion=ListarEstado&par=1").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?menu=Productos&accion=ListarEstado").forward(request, response);
                    }
                    break;
            }
        }
        if (menu.equals("RegistrarVenta")) {
            switch (accion) {
                case "generarseries":
                    numeroserie = vdao.GenerarSeries();
                    if (numeroserie == null) {
                        numeroserie = "00000001";
                        request.setAttribute("numeroserie", numeroserie);

                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserie = gs.NumeroSerie(incrementar);
                        request.setAttribute("numeroserie", numeroserie);
                    }

                    request.setAttribute("subtotal", subt);
                    request.setAttribute("totalPagar", total);
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("lista", lista);
                    request.setAttribute("cl", cliente);
                    request.setAttribute("datosempr", de);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);

                    request.getRequestDispatcher("Nueva_Venta.jsp").forward(request, response);
                    break;

                default:

                    numeroserie = vdao.GenerarSeries();
                    if (numeroserie == null) {
                        numeroserie = "00000001";

                        request.setAttribute("numeroserie", numeroserie);
                        request.setAttribute("FechaActual", FechaActual);

                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserie = gs.NumeroSerie(incrementar);

                        request.setAttribute("cl", cliente);
                        request.setAttribute("subtotal", subt);
                        request.setAttribute("datosempr", de);
                        request.setAttribute("lista", lista);
                        request.setAttribute("numeroserie", numeroserie);
                        request.setAttribute("FechaActual", FechaActual);
                        request.setAttribute("totalPagar", total);
                        request.setAttribute("totalIVA", totalIVA);
                    }

                    request.getRequestDispatcher("Nueva_Venta.jsp").forward(request, response);
            }

        }
        if (menu.equals("RegistrarPedido")) {
            switch (accion) {
                case "generarfecha":
                    request.setAttribute("FechaActual", FechaActual);

                default:
                    request.setAttribute("FechaActual", FechaActual);
                    request.getRequestDispatcher("RegistrarPedidoProveedor.jsp").forward(request, response);
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        int idu = 0;
        int r;
        if (menu.equals("Usuarios")) {
            switch (accion) {
                case "Agregar":
                    int res = 0;
                    String TipoDocumento = request.getParameter("txtTipoDocumento");
                    String Documento = request.getParameter("txtDocumento");
                    String Nombre1 = request.getParameter("txtNombre1");
                    String Nombre2 = request.getParameter("txtNombre2");
                    String Apellido1 = request.getParameter("txtApellido1");
                    String Apellido2 = request.getParameter("txtApellido2");
                    String Estado = "Pendiente";
                    String Genero = request.getParameter("txtGenero");
                    String TipoEmpleado = request.getParameter("txtTipoEmpleado");
                    String Usuario = request.getParameter("txtUsuario");
                    String Password = request.getParameter("txtPassword");
                    String Indicativo_Telefono1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono1 = request.getParameter("txtTelefono");
                    String TipoTelefono1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Telefono2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono2 = request.getParameter("txtTelefono2");
                    String TipoTelefono2 = request.getParameter("txtTipoTelefono2");
                    String Direccion = request.getParameter("txtDireccion");
                    String Email = request.getParameter("txtEmail");
                    DateTimeFormatter dtf42 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
                    String FechaActual2 = String.valueOf(dtf42.format(LocalDateTime.now()));
                    int Ciudad = Integer.parseInt(request.getParameter("txtCiudad"));

                    int re = edao.ListarDocumento(Documento);
                    System.out.println(re);
                    if (re == 0) {
                        em.setTipoDocumento(TipoDocumento);
                        em.setDocumento(Documento);
                        em.setNombre1(Nombre1);
                        em.setNombre2(Nombre2);
                        em.setApellido1(Apellido1);
                        em.setApellido2(Apellido2);
                        em.setEstado(Estado);
                        em.setGenero(Genero);
                        em.setTipoEmpleado(TipoEmpleado);
                        em.setUsuario(Usuario);
                        em.setPassword(Password);
                        em.setIndicativo_Tel1(Indicativo_Telefono1);
                        em.setTelefono1(Telefono1);
                        em.setTipo_Tel1(TipoTelefono1);
                        if (Telefono2 != null) {
                            em.setIndicativo_Tel2(Indicativo_Telefono2);
                            em.setTelefono2(Telefono2);
                            em.setTipo_Tel2(TipoTelefono2);
                        } else {
                            em.setIndicativo_Tel2("");
                            em.setTelefono2("");
                            em.setTipo_Tel2("");
                        }
                        em.setDireccion(Direccion);
                        em.setEmail(Email);
                        em.setFecha_Creacion(FechaActual2);
                        em.setCiudad(Ciudad);
                        res = edao.agregar(em);

                    } else if (re == 1) {
                        res = 2;
                    }
                    switch (res) {
                        case 1: {
                            String ress = "Registrado";
                            request.setAttribute("respuesta", ress);
                            request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarLogin").forward(request, response);
                            break;
                        }
                        case 0: {
                            String ress = "NoRegistrado";
                            request.setAttribute("respuesta", ress);
                            request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarLogin").forward(request, response);
                            break;
                        }
                        case 2: {
                            String ress = "NoRegistrado2";
                            request.setAttribute("respuesta", ress);
                            request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarLogin").forward(request, response);
                            break;
                        }
                        default:
                            break;
                    }
                    break;

                case "Actualizar":
                    int Id = Integer.parseInt(request.getParameter("Id"));

                    String TipoDocumento2 = request.getParameter("txtTipoDocumento");
                    String Documento2 = request.getParameter("txtDocumento");
                    String Nombre_1 = request.getParameter("txtNombre1");
                    String Nombre_2 = request.getParameter("txtNombre2");
                    String Apellido_1 = request.getParameter("txtApellido1");
                    String Apellido_2 = request.getParameter("txtApellido2");
                    String Estado2 = request.getParameter("txtEstado");
                    String Genero2 = request.getParameter("txtGenero");
                    String TipoEmpleado2 = request.getParameter("txtTipoEmpleado");
                    String Indicativo_Telefono_1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono_1 = request.getParameter("txtTelefono");
                    String TipoTelefono_1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Telefono_2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono_2 = request.getParameter("txtTelefono2");
                    String TipoTelefono_2 = request.getParameter("txtTipoTelefono2");
                    String Direccion2 = request.getParameter("txtDireccion");
                    String Email2 = request.getParameter("txtEmail");
                    int Ciudad2 = Integer.parseInt(request.getParameter("txtCiudad"));

                    em.setTipoDocumento(TipoDocumento2);
                    em.setDocumento(Documento2);
                    em.setNombre1(Nombre_1);
                    em.setNombre2(Nombre_2);
                    em.setApellido1(Apellido_1);
                    em.setApellido2(Apellido_2);
                    em.setEstado(Estado2);
                    em.setGenero(Genero2);
                    em.setTipoEmpleado(TipoEmpleado2);
                    em.setIndicativo_Tel1(Indicativo_Telefono_1);
                    em.setTelefono1(Telefono_1);
                    em.setTipo_Tel1(TipoTelefono_1);
                    em.setIndicativo_Tel2(Indicativo_Telefono_2);
                    em.setTelefono2(Telefono_2);
                    em.setTipo_Tel2(TipoTelefono_2);
                    em.setDireccion(Direccion2);
                    em.setEmail(Email2);
                    em.setCiudad(Ciudad2);
                    em.setIdEmpleado(Id);
                    r = edao.actualizar(em);
                    if (r == 1) {

                        String ress = "Actualizado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoActualizado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);
                    }
                    break;
                case "ActualizarEstado":
                    String estado = "Activo";
                    int ida = Integer.parseInt(request.getParameter("id"));
                    em.setEstado(estado);
                    em.setIdEmpleado(ida);
                    r = edao.actualizarEstado(em);

                    if (r == 1) {
                        String ress = "Cambiado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=ListarUserEstado&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoCambiado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=ListarUserEstado&respuesta=" + ress);

                    }
                    break;
                case "NoAprobar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    r = edao.eliminar(idu);
                    if (r == 1) {
                        String ress = "Eliminado";
                        response.sendRedirect("Controlador?menu=Usuarios&accion=ListarUserEstado&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoEliminado";
                        response.sendRedirect("Controlador?menu=Usuarios&accion=ListarUserEstado&respuesta=" + ress);
                    }
                    break;
                case "Eliminar":
                    idu = Integer.parseInt(request.getParameter("id"));
                    r = edao.eliminar(idu);
                    if (r == 1) {
                        String ress = "Eliminado";
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoEliminado";
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);
                    }
                    break;
                case "Inhabilitar":
                    String estado2 = "Inactivo";
                    int id2 = Integer.parseInt(request.getParameter("id"));
                    em.setEstado(estado2);
                    em.setIdEmpleado(id2);
                    r = edao.actualizarEstado(em);

                    if (r == 1) {
                        String ress = "Cambiado2";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoCambiado2";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Usuarios&accion=Listar&respuesta=" + ress);

                    }
                    break;
                default:
                    request.getRequestDispatcher("index.jsp").forward(request, response);

            }

        }
        if (menu.equals("Ciudad")) {

            switch (accion) {
                case "ListarLogin":
                    List ListarCiudad = ciudao.listarCiudades();
                    request.setAttribute("ciu", ListarCiudad);
                    request.getRequestDispatcher("Registrar_UsuarioLogin.jsp").forward(request, response);
                    break;
                case "ListarClientes":

                    List ListarCiudad2 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad2);
                    request.getRequestDispatcher("RegistrarCliente.jsp").forward(request, response);
                    break;
                case "ListarProveedores":

                    List ListarCiudad3 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad3);
                    request.getRequestDispatcher("RegistrarProveedor.jsp").forward(request, response);
                    break;
            }
        }
        if (menu.equals("DatosEmpresa")) {

            switch (accion) {
                case "Actualizar":
                    int idemp = 1;
                    String TipoDocumento = request.getParameter("txtTipoDocumento");
                    String Documento = request.getParameter("txtDocumento");
                    String Nombre = request.getParameter("txtNombre");
                    String Direccion = request.getParameter("txtDireccion");
                    String Telefono = request.getParameter("txtTelefono");
                    String Email = request.getParameter("txtEmail");
                    int Porcentaje_Impuesto = Integer.parseInt(request.getParameter("txtPorcentaje_Impuesto"));
                    String NombreImpuesto = request.getParameter("txtNombre_Impuesto");
                    de.setTipo_Documento(TipoDocumento);
                    de.setDocumento(Documento);
                    de.setNombre(Nombre);
                    de.setDireccion(Direccion);
                    de.setTelefono(Telefono);
                    de.setEmail(Email);
                    de.setPorcentaje_Impuesto(Porcentaje_Impuesto);
                    de.setNombre_Impuesto(NombreImpuesto);
                    de.setIdDatos_empresa(idemp);
                    r = datosempresa.actualizar(de);

                    if (r == 1) {

                        String ress = "ActualizadoEmpresa";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Home&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoActualizadoEmpresa";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Home&respuesta=" + ress);

                    }
                    break;

            }
        }
        if (menu.equals("Categoria_Productos")) {
            switch (accion) {
                case "Agregar":

                    String Nombre = request.getParameter("txtCategoria");
                    Part part = request.getPart("txtImagen");
                    String Tipo_IVA = request.getParameter("txtTipo_IVA");
                    int IVA = Integer.parseInt(request.getParameter("txtIVA"));

                    InputStream inputStream = part.getInputStream();
                    cp.setCategoria(Nombre);
                    cp.setImagen(inputStream);
                    cp.setTipo_IVA(Tipo_IVA);
                    cp.setIVA(IVA);

                    int res = cpDAO.agregar(cp);

                    if (res == 1) {
                        String ress = "Registrado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);
                    } else if (res == 0) {
                        String ress = "NoRegistrado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);
                    }
                    break;
                case "Actualizar":
                    int resss = 0;
                    String Nombre1 = request.getParameter("txtCategoria");
                    Part part1 = request.getPart("txtImagen");
                    InputStream inputStream1 = part1.getInputStream();
                    String Tipo_IVA1 = request.getParameter("txtTipo_IVA");
                    int IVA1 = Integer.parseInt(request.getParameter("txtIVA"));
                    int Id = Integer.parseInt(request.getParameter("IdCategoriaProductos"));
                    long nombre = part1.getSize();

                    if (nombre == 0) {
                        cp.setCategoria(Nombre1);
                        cp.setTipo_IVA(Tipo_IVA1);
                        cp.setIVA(IVA1);
                        cp.setIdCategoriaProductos(Id);
                        resss = cpDAO.actualizarSinImagen(cp);

                    } else if (nombre != 0) {
                        cp.setCategoria(Nombre1);
                        cp.setImagen(inputStream1);
                        cp.setTipo_IVA(Tipo_IVA1);
                        cp.setIVA(IVA1);
                        cp.setIdCategoriaProductos(Id);
                        resss = cpDAO.actualizar(cp);
                    }

                    if (resss == 1) {
                        String ress = "Actualizado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);
                    } else if (resss == 0) {
                        String ress = "NoActualizado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);
                    }
                    break;

                case "Editar":
                    String idu1 = request.getParameter("IdCategoriaProductos");
                    idu = Integer.parseInt(idu1);
                    Categoria_Productos cat = cpDAO.ListarId(idu);
                    request.setAttribute("categoria", cat);
                    request.getRequestDispatcher("ActualizarCategoriaProductos.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    idu = Integer.parseInt(request.getParameter("IdCategoriaProductos"));
                    r = cpDAO.eliminar(idu);
                    if (r == 1) {
                        String ress = "Eliminado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoEliminado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=Listar&respuesta=" + ress);
                    }
                    break;

            }
        }
        if (menu.equals("Productos")) {
            switch (accion) {
                case "Agregar":

                    String Nombre = request.getParameter("txtNombre");
                    String Descripcion = request.getParameter("txtDescripcion");
                    String Marca = request.getParameter("txtMarca");
                    int Cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    int Tope_Min = Integer.parseInt(request.getParameter("txtTope_Min"));
                    int Tope_Max = Integer.parseInt(request.getParameter("txtTope_Max"));
                    String Codigo_Barras = request.getParameter("txtCodigo_Barras");
                    double Precio_Compra = Double.parseDouble(request.getParameter("txtPrecio_Compra"));
                    double Precio_Venta = Double.parseDouble(request.getParameter("txtPrecio_Venta"));
                    DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
                    String Fecha_Registrado = String.valueOf(dtf4.format(LocalDateTime.now()));
                    String Fecha_Vencimiento = request.getParameter("txtFecha_Vencimiento");
                    String Estado = request.getParameter("txtEstado");
                    String user = String.valueOf(sesion.getAttribute("IdEmpleado"));
                    int Usuario_Registra = Integer.parseInt(user);
                    int Categoria_Productos = Integer.parseInt(request.getParameter("txtCategoria_Productos"));

                    productos.setNombre(Nombre);
                    productos.setDescripcion(Descripcion);
                    productos.setMarca(Marca);
                    productos.setCantidad(Cantidad);
                    productos.setTope_Min(Tope_Min);
                    productos.setTope_Max(Tope_Max);
                    productos.setCodigo_Barras(Codigo_Barras);
                    productos.setPrecio_Compra(Precio_Compra);
                    productos.setPrecio_Venta(Precio_Venta);
                    productos.setFecha_Registrado(Fecha_Registrado);
                    productos.setFecha_Vencimiento(Fecha_Vencimiento);
                    productos.setEstado(Estado);
                    productos.setUsuario_Registra(Usuario_Registra);
                    productos.setCategoria_Productos(Categoria_Productos);

                    int res = productosDAO.agregar(productos);

                    if (res == 1) {
                        String ress = "Registrado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=ListarenProductos&respuesta=" + ress);
                    } else if (res == 0) {
                        String ress = "NoRegistrado";
                        response.sendRedirect("Controlador?menu=Categoria_Productos&accion=ListarenProductos&respuesta=" + ress);
                    }
                    break;

                case "Actualizar":

                    String Nombre1 = request.getParameter("txtNombre");
                    String Descripcion1 = request.getParameter("txtDescripcion");
                    String Marca1 = request.getParameter("txtMarca");
                    int Cantidad1 = Integer.parseInt(request.getParameter("txtCantidad"));
                    int Tope_Min1 = Integer.parseInt(request.getParameter("txtTope_Min"));
                    int Tope_Max1 = Integer.parseInt(request.getParameter("txtTope_Max"));
                    String Codigo_Barras1 = request.getParameter("txtCodigo_Barras");
                    double Precio_Compra1 = Double.parseDouble(request.getParameter("txtPrecio_Compra"));
                    double Precio_Venta1 = Double.parseDouble(request.getParameter("txtPrecio_Venta"));
                    String Fecha_Vencimiento1 = request.getParameter("txtFecha_Vencimiento");
                    String Estado1 = request.getParameter("txtEstado");
                    String user1 = String.valueOf(sesion.getAttribute("IdEmpleado"));
                    int Usuario_Registra1 = Integer.parseInt(user1);
                    int Categoria_Productos1 = Integer.parseInt(request.getParameter("txtCategoria_Productos"));
                    int id = Integer.parseInt(request.getParameter("txtIdProductos"));

                    productos.setNombre(Nombre1);
                    productos.setDescripcion(Descripcion1);
                    productos.setMarca(Marca1);
                    productos.setCantidad(Cantidad1);
                    productos.setTope_Min(Tope_Min1);
                    productos.setTope_Max(Tope_Max1);
                    productos.setCodigo_Barras(Codigo_Barras1);
                    productos.setPrecio_Compra(Precio_Compra1);
                    productos.setPrecio_Venta(Precio_Venta1);
                    productos.setFecha_Vencimiento(Fecha_Vencimiento1);
                    productos.setEstado(Estado1);
                    productos.setUsuario_Registra(Usuario_Registra1);
                    productos.setCategoria_Productos(Categoria_Productos1);
                    productos.setIdProductos(id);
                    int resss = productosDAO.actualizar(productos);

                    if (resss == 1) {
                        String ress = "Actualizado";
                        response.sendRedirect("Controlador?menu=Productos&accion=Listar&respuesta=" + ress);
                    } else if (resss == 0) {
                        String ress = "NoActualizado";
                        response.sendRedirect("Controlador?menu=Productos&accion=Listar&respuesta=" + ress);
                    }
                    break;

                case "Editar":

                    idu = Integer.parseInt(request.getParameter("IdProductos"));
                    Productos pro = productosDAO.ListarId(idu);
                    List listacategorias = cpDAO.listar();
                    List listaempleados = edao.listarempleados();
                    request.setAttribute("Productos", pro);
                    request.setAttribute("Categoria", listacategorias);
                    request.setAttribute("Usuario_Registra", listaempleados);
                    request.getRequestDispatcher("ActualizarProductos.jsp").forward(request, response);
                    break;

                case "Eliminar":
                    idu = Integer.parseInt(request.getParameter("IdProductos"));
                    r = productosDAO.eliminar(idu);
                    if (r == 1) {
                        String ress = "Eliminado";
                        response.sendRedirect("Controlador?menu=Productos&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoEliminado";
                        response.sendRedirect("Controlador?menu=Productos&accion=Listar&respuesta=" + ress);
                    }
                    break;
            }
        }

        if (menu.equals("Proveedores")) {
            switch (accion) {
                case "Agregar":

                    String Nombres = request.getParameter("txtNombres");
                    String Indicativo_Tel1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono1 = request.getParameter("txtTelefono");
                    String Tipo_Tel1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Tel2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono2 = request.getParameter("txtTelefono2");
                    String Tipo_Tel2 = request.getParameter("txtTipoTelefono2");
                    String Direccion = request.getParameter("txtDireccion");
                    String Email = request.getParameter("txtEmail");
                    int Ciudad = Integer.parseInt(request.getParameter("txtCiudad"));
                    String Estado = "Activo";

                    provedor.setNombres(Nombres);
                    provedor.setIndicativo_Tel1(Indicativo_Tel1);
                    provedor.setTelefono1(Telefono1);
                    provedor.setTipo_Tel1(Tipo_Tel1);
                    provedor.setIndicativo_Tel2(Indicativo_Tel2);
                    provedor.setTelefono2(Telefono2);
                    provedor.setTipo_Tel2(Tipo_Tel2);
                    provedor.setDireccion(Direccion);
                    provedor.setEmail(Email);
                    provedor.setCiudad(Ciudad);
                    provedor.setEstado(Estado);
                    int res = provDAO.agregar(provedor);

                    if (res == 1) {
                        String ress = "Registrado";
                        response.sendRedirect("Controlador?menu=Ciudad&accion=ListarProveedores&respuesta=" + ress);
                    } else if (res == 0) {
                        String ress = "NoRegistrado";
                        response.sendRedirect("Controlador?menu=Ciudad&accion=ListarProveedores&respuesta=" + ress);
                    }
                    break;

                case "Actualizar":

                    String Nombres1 = request.getParameter("txtNombres");
                    String Indicativo_Tel_1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono__1 = request.getParameter("txtTelefono");
                    String Tipo_Tel_1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Tel_2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono_2 = request.getParameter("txtTelefono2");
                    String Tipo_Tel_2 = request.getParameter("txtTipoTelefono2");
                    String Direccion1 = request.getParameter("txtDireccion");
                    String Email1 = request.getParameter("txtEmail");
                    int Ciudad1 = Integer.parseInt(request.getParameter("txtCiudad"));
                    String Estado1 = request.getParameter("txtEstado");
                    int idproveedor = Integer.parseInt(request.getParameter("idProveedores"));

                    provedor.setNombres(Nombres1);
                    provedor.setIndicativo_Tel1(Indicativo_Tel_1);
                    provedor.setTelefono1(Telefono__1);
                    provedor.setTipo_Tel1(Tipo_Tel_1);
                    provedor.setIndicativo_Tel2(Indicativo_Tel_2);
                    provedor.setTelefono2(Telefono_2);
                    provedor.setTipo_Tel2(Tipo_Tel_2);
                    provedor.setDireccion(Direccion1);
                    provedor.setEmail(Email1);
                    provedor.setCiudad(Ciudad1);
                    provedor.setEstado(Estado1);
                    provedor.setIdProveedores(idproveedor);

                    int resss = provDAO.actualizar(provedor);

                    if (resss == 1) {
                        String ress = "Actualizado";
                        request.setAttribute("Actualizado", ress);
                        response.sendRedirect("Controlador?menu=Proveedores&accion=Listar&respuesta=" + ress);
                    } else if (resss == 0) {
                        String ress = "NoActualizado";
                        request.setAttribute("NoActualizado", ress);
                        response.sendRedirect("Controlador?menu=Proveedores&accion=Listar&respuesta=" + ress);
                    }
                    break;

                case "Editar":
                    String idu1 = request.getParameter("idProveedores");
                    idu = Integer.parseInt(idu1);
                    Proveedores prov = provDAO.ListarId(idu);
                    List ListarCiudad2 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad2);
                    request.setAttribute("proveedores", prov);
                    request.getRequestDispatcher("ActualizarProveedores.jsp").forward(request, response);
                    break;

                case "Inhabilitar":
                    String estado2 = "Inactivo";
                    int id2 = Integer.parseInt(request.getParameter("idProveedores"));
                    provedor.setEstado(estado2);
                    provedor.setIdProveedores(id2);
                    r = provDAO.actualizarEstado(provedor);

                    if (r == 1) {
                        String ress = "Inactivado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Proveedores&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoInactivado";
                        request.setAttribute("respuesta", ress);
                        response.sendRedirect("Controlador?menu=Proveedores&accion=Listar&respuesta=" + ress);

                    }
                    break;
            }
        }
        if (menu.equals("Clientes")) {
            switch (accion) {
                case "Agregar":
                    String TipoDocumento = request.getParameter("txtTipoDocumento");
                    String Documento = request.getParameter("txtDocumento");
                    String Nombre1 = request.getParameter("txtNombre1");
                    String Apellido1 = request.getParameter("txtApellido1");
                    String Nombre2 = request.getParameter("txtNombre2");
                    String Apellido2 = request.getParameter("txtApellido2");
                    String Direccion_Domicilio = request.getParameter("txtDireccion_Domicilio");
                    String Email = request.getParameter("txtEmail");
                    String Indicativo_Telefono1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono1 = request.getParameter("txtTelefono");
                    String TipoTelefono1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Telefono2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono2 = request.getParameter("txtTelefono2");
                    String TipoTelefono2 = request.getParameter("txtTipoTelefono2");
                    String Indicativo_Telefono3 = request.getParameter("txtIndicativo_Telefono3");
                    String Telefono3 = request.getParameter("txtTelefono3");
                    String TipoTelefono3 = request.getParameter("txtTipoTelefono3");
                    String Direccion_Empresa = request.getParameter("txtDireccion_Empresa");
                    String Nombre_Empresa = request.getParameter("txtNombre_Empresa");
                    String Estado = "Activo";
                    DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
                    String Fecha_Creado = String.valueOf(dtf4.format(LocalDateTime.now()));
                    int Ciudad = Integer.parseInt(request.getParameter("txtCiudad"));

                    cliente.setTipoDocumento(TipoDocumento);
                    cliente.setDocumento(Documento);
                    cliente.setNombre1(Nombre1);
                    cliente.setNombre2(Nombre2);
                    cliente.setApellido1(Apellido1);
                    cliente.setApellido2(Apellido2);
                    cliente.setDireccion_Domicilio(Direccion_Domicilio);
                    cliente.setEmail(Email);
                    cliente.setIndicativo_Tel1(Indicativo_Telefono1);
                    cliente.setTelefono1(Telefono1);
                    cliente.setTipo_Tel1(TipoTelefono1);
                    cliente.setIndicativo_Tel2(Indicativo_Telefono2);
                    cliente.setTelefono2(Telefono2);
                    cliente.setTipo_Tel2(TipoTelefono2);
                    cliente.setIndicativo_Tel3(Indicativo_Telefono3);
                    cliente.setTelefono3(Telefono3);
                    cliente.setTipo_Tel3(TipoTelefono3);
                    cliente.setDireccion_Empresa(Direccion_Empresa);
                    cliente.setNombre_Empresa(Nombre_Empresa);
                    cliente.setEstado(Estado);
                    cliente.setFecha_Creado(Fecha_Creado);
                    cliente.setCiudad(Ciudad);
                    int res = clientesdao.agregar(cliente);
                    if (res == 1) {
                        String ress = "Registrado";
                        request.setAttribute("respuesta", ress);
                        request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarClientes").forward(request, response);
                    } else if (res == 0) {
                        String ress = "NoRegistrado";

                        request.setAttribute("respuesta", ress);
                        request.getRequestDispatcher("Controlador?menu=Ciudad&accion=ListarClientes").forward(request, response);
                    }
                    break;
                case "Actualizar":
                    String TipoDocumento1 = request.getParameter("txtTipoDocumento");
                    String Documento1 = request.getParameter("txtDocumento");
                    String Nombre_1 = request.getParameter("txtNombre1");
                    String Apellido_1 = request.getParameter("txtApellido1");
                    String Nombre_2 = request.getParameter("txtNombre2");
                    String Apellido_2 = request.getParameter("txtApellido2");
                    String Direccion_Domicilio1 = request.getParameter("txtDireccion_Domicilio");
                    String Email1 = request.getParameter("txtEmail");
                    String Indicativo_Telefono_1 = request.getParameter("txtIndicativo_Telefono");
                    String Telefono_1 = request.getParameter("txtTelefono");
                    String TipoTelefono_1 = request.getParameter("txtTipoTelefono");
                    String Indicativo_Telefono_2 = request.getParameter("txtIndicativo_Telefono2");
                    String Telefono_2 = request.getParameter("txtTelefono2");
                    String TipoTelefono_2 = request.getParameter("txtTipoTelefono2");
                    String Indicativo_Telefono_3 = request.getParameter("txtIndicativo_Telefono3");
                    String Telefono_3 = request.getParameter("txtTelefono3");
                    String TipoTelefono_3 = request.getParameter("txtTipoTelefono3");
                    String Direccion_Empresa1 = request.getParameter("txtDireccion_Empresa");
                    String Nombre_Empresa1 = request.getParameter("txtNombre_Empresa");
                    String Estado1 = request.getParameter("txtEstado");
                    int Ciudad1 = Integer.parseInt(request.getParameter("txtCiudad"));
                    int idcliente = Integer.parseInt(request.getParameter("idCliente"));
                    cliente.setTipoDocumento(TipoDocumento1);
                    cliente.setDocumento(Documento1);
                    cliente.setNombre1(Nombre_1);
                    cliente.setNombre2(Nombre_2);
                    cliente.setApellido1(Apellido_1);
                    cliente.setApellido2(Apellido_2);
                    cliente.setDireccion_Domicilio(Direccion_Domicilio1);
                    cliente.setEmail(Email1);
                    cliente.setIndicativo_Tel1(Indicativo_Telefono_1);
                    cliente.setTelefono1(Telefono_1);
                    cliente.setTipo_Tel1(TipoTelefono_1);
                    cliente.setIndicativo_Tel2(Indicativo_Telefono_2);
                    cliente.setTelefono2(Telefono_2);
                    cliente.setTipo_Tel2(TipoTelefono_2);
                    cliente.setIndicativo_Tel3(Indicativo_Telefono_3);
                    cliente.setTelefono3(Telefono_3);
                    cliente.setTipo_Tel3(TipoTelefono_3);
                    cliente.setDireccion_Empresa(Direccion_Empresa1);
                    cliente.setNombre_Empresa(Nombre_Empresa1);
                    cliente.setEstado(Estado1);
                    cliente.setCiudad(Ciudad1);
                    cliente.setIdCliente(idcliente);
                    int resss = clientesdao.actualizar(cliente);
                    System.out.println(resss);
                    if (resss == 1) {
                        String ress = "Actualizado";
                        request.setAttribute("Actualizado", ress);
                        response.sendRedirect("Controlador?menu=Clientes&accion=Listar&respuesta=" + ress);
                    } else if (resss == 0) {
                        String ress = "NoActualizado";
                        request.setAttribute("NoActualizado", ress);
                        response.sendRedirect("Controlador?menu=Clientes&accion=Listar&respuesta=" + ress);
                    }
                    break;

                case "Editar":
                    String idu1 = request.getParameter("id");
                    idu = Integer.parseInt(idu1);
                    Clientes clien = clientesdao.ListarId(idu);
                    List ListarCiudad2 = ciudao.listarCiudades();
                    request.setAttribute("ciudades", ListarCiudad2);
                    request.setAttribute("clientes", clien);
                    request.getRequestDispatcher("ActualizarClientes.jsp").forward(request, response);
                    break;

                case "Inactivar":
                    String estado2 = "Inactivo";
                    idu = Integer.parseInt(request.getParameter("id"));
                    cliente.setEstado(estado2);
                    cliente.setIdCliente(idu);
                    r = clientesdao.actualizarEstado(cliente);
                    if (r == 1) {
                        String ress = "Inactivado";
                        response.sendRedirect("Controlador?menu=Clientes&accion=Listar&respuesta=" + ress);

                    } else if (r == 0) {
                        String ress = "NoInactivado";
                        response.sendRedirect("Controlador?menu=Clientes&accion=Listar&respuesta=" + ress);
                    }
                    break;
            }
        }
        if (menu.equals("RegistrarVenta")) {
            switch (accion) {
                case "Buscar Cliente":
                    cliente = new Clientes();
                    String DocumentoCliente = request.getParameter("txtDocumento");
                    cliente.setDocumento(DocumentoCliente);
                    cliente = clientesdao.ListarDocumento(DocumentoCliente);

                    if (cliente.getNombre1() != null) {
                        request.setAttribute("cl", cliente);
                    } else {
                        String c = "NoExiste";
                        request.setAttribute("respuesta", c);
                    }
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("subtotal", subt);
                    request.setAttribute("datosempr", de);
                    request.setAttribute("lista", lista);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);
                    request.setAttribute("totalPagar", total);
                    break;

                case "Cancelar":
                    subt = "0.0";
                    lista.clear();
                    ;
                    total = "0.0";
                    cliente = new Clientes();
                    totalIVA = "0.0";
                    totalPagar = 0;
                    subtotal = 0;
                    String respu = "Cancelado";
                    request.setAttribute("respuesta", respu);
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("subtotal", subt);
                    request.setAttribute("lista", lista);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);
                    request.setAttribute("totalPagar", total);
                    break;
                case "Buscar Producto":

                    productos = new Productos();
                    String codigoproducto = request.getParameter("txtCodigoProducto");
                    productos.setCodigo_Barras(codigoproducto);
                    productos = productosDAO.ListarCodigo_Barras(codigoproducto);

                    if (productos.getNombre() != null) {
                        request.setAttribute("productos", productos);
                    } else {
                        String c = "NoExistepro";
                        request.setAttribute("respuesta", c);
                    }
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("cl", cliente);
                    request.setAttribute("subtotal", subt);
                    request.setAttribute("datosempr", de);
                    request.setAttribute("lista", lista);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);
                    request.setAttribute("totalPagar", total);
                    break;

                case "Agregar":

                    de = datosempresa.Listardatosempresa();
                    totalPagar = 0;
                    item = item + 1;
                    codigo = request.getParameter("txtCodigoProducto");
                    prod = Integer.parseInt(request.getParameter("IdProductos"));
                    NombreProducto = request.getParameter("txtNombreproducto");
                    precio = Double.parseDouble(request.getParameter("txtPrecio"));
                    cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                    int Stock = Integer.parseInt(request.getParameter("txtCantidadProdcutos"));
                    int IVA = Integer.parseInt(request.getParameter("txtIVA"));

                    if (cantidad > Stock && Stock > 0) {
                        String respuesta = "Errorcantidad";
                        request.setAttribute("respuesta", respuesta);
                    } else if (Stock == 0) {
                        String respuesta = "Errorcantidad2";
                        request.setAttribute("respuesta", respuesta);
                    } else {

                        detalleventa = new Detalle_Ventas();

                        if (lista.isEmpty()) {
                            item = 0;
                            detalleventa.setItem(item);
                        } else {
                            detalleventa.setItem(item);
                        }

                        preciocantidad = precio * cantidad;
                        double subtotalIVA = preciocantidad * IVA / 100;
                        detalleventa.setCodigo_Producto(codigo);
                        detalleventa.setNombre_Producto(NombreProducto);
                        detalleventa.setCantidad_Producto(cantidad);
                        detalleventa.setSubtotal(preciocantidad);
                        detalleventa.setValor_Productos(precio);
                        detalleventa.setProductos(prod);
                        detalleventa.setIVA(subtotalIVA);

                        lista.add(detalleventa);

                    }
                    subtotal = 0;
                    for (int i = 0; i < lista.size(); i++) {
                        subtotal = subtotal + lista.get(i).getSubtotal();
                    }
                    totalPagarIVA = 0;
                    for (int i = 0; i < lista.size(); i++) {
                        totalPagarIVA = totalPagarIVA + lista.get(i).getIVA();
                        System.out.println("Total Iva: " + totalPagarIVA);
                    }

                    subt = formato.format(subtotal);
                    totalIVA = formato.format(totalPagarIVA);
                    totalPagar = subtotal + totalPagarIVA;
                    total = formato.format(totalPagar);

                    request.setAttribute("cl", cliente);
                    request.setAttribute("subtotal", subt);
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("lista", lista);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);
                    request.setAttribute("totalPagar", total);
                    break;

                case "Eliminardelista":

                    int articulo = Integer.parseInt(request.getParameter("articulo"));
                    double precio1 = Double.parseDouble(request.getParameter("precio"));

                    subtotal = subtotal - precio1;
                    subt = formato.format(subtotal);
                    double porcentaje1 = subtotal * de.getPorcentaje_Impuesto() / 100;

                    totalPagar = subtotal + porcentaje1;
                    total = formato.format(totalPagar);
                    if (lista.size() == 1) {
                        subt = "0.00";
                        total = "0.00";
                        totalIVA = "0.00";
                        totalPagarIVA = 0.00;
                        lista.remove(0);
                        lista.clear();
                    } else if (lista.size() == articulo) {
                        lista.remove(articulo - 1);
                    } else if (articulo > lista.size()) {
                        lista.remove(lista.size() - 1);
                    } else {
                        lista.remove(articulo);
                    }
                    request.setAttribute("totalIVA", totalIVA);
                    request.setAttribute("cl", cliente);
                    request.setAttribute("subtotal", subt);
                    request.setAttribute("datosempr", de);
                    request.setAttribute("lista", lista);
                    request.setAttribute("numeroserie", numeroserie);
                    request.setAttribute("FechaActual", FechaActual);
                    request.setAttribute("totalPagar", total);

                    break;
                case "Editardelista":

                    break;
                case "GenerarVenta":
                    ventas = new Ventas();
                    //guardar Venta
                    ventas.setNumero_Serie(numeroserie);
                    DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
                    String Fecha = String.valueOf(dtf1.format(LocalDateTime.now()));
                    ventas.setFecha_Solicitud(Fecha);
                    ventas.setFecha_Entrega(Fecha);
                    ventas.setValor_Venta(totalPagar);
                    String estado = request.getParameter("txtEstado");
                    ventas.setEstado(estado);
                    int idcliente2 = cliente.getIdCliente();
                    ventas.setCliente(idcliente2);
                    int idempl = Integer.parseInt(sesion.getAttribute("IdEmpleado").toString());
                    ventas.setUsuario_Registra(idempl);
                    resventa = vdao.guardarVentas(ventas);

                    //guardar detalle Ventas
                    int idv = Integer.parseInt(vdao.IddeVentas());
                    for (int i = 0; i < lista.size(); i++) {

                        detalleventa = new Detalle_Ventas();
                        detalleventa.setCodigo_Producto(lista.get(i).getCodigo_Producto());
                        detalleventa.setNombre_Producto(lista.get(i).getNombre_Producto());
                        detalleventa.setCantidad_Producto(lista.get(i).getCantidad_Producto());
                        detalleventa.setValor_Productos(lista.get(i).getValor_Productos());
                        detalleventa.setSubtotal(lista.get(i).getSubtotal());
                        detalleventa.setProductos(lista.get(i).getProductos());
                        detalleventa.setVenta(idv);
                        resdetalle = detallevdao.guardarDetalleVentas(detalleventa);

                    }
                    if (resventa != 0) {
                        //Actualizar venta
                        for (int i = 0; i < lista.size(); i++) {
                            int sac = 0;
                            int Cant = 0;
                            int idproductos = 0;

                            Cant = lista.get(i).getCantidad_Producto();
                            idproductos = lista.get(i).getProductos();

                            ProductosDAO apr = new ProductosDAO();
                            Productos prd = new Productos();
                            prd = apr.BuscarId(idproductos);
                            sac = prd.getCantidad() - Cant;
                            System.out.println("cantidad::" + Cant);
                            System.out.println("cantidad::" + sac);
                            apr.actualizarStock(idproductos, sac);

                        }
                        cliente = null;
                        subtotal = 0.0;
                        de = null;
                        lista.clear();
                        total = "0.0";
                        request.setAttribute("totalIVA", totalIVA);
                        request.setAttribute("cl", cliente);
                        request.setAttribute("subtotal", subt);
                        request.setAttribute("datosempr", de);
                        request.setAttribute("lista", lista);
                        request.setAttribute("numeroserie", numeroserie);
                        request.setAttribute("FechaActual", FechaActual);
                        request.setAttribute("totalPagar", total);

                    }

                    if (resdetalle == 1 && resventa == 1) {
                        String respuesta = "Registrado";
                        lista.clear();
                        request.setAttribute("respuesta", respuesta);
                    } else {
                        String respuesta = "NoRegistrado";
                        request.setAttribute("respuesta", respuesta);
                    }
                    break;
                default:

                    request.getRequestDispatcher("Nueva_Venta.jsp").forward(request, response);
            }
            request.getRequestDispatcher("Nueva_Venta.jsp").forward(request, response);
        }

        if (menu.equals("RegistrarPedido")) {
            switch (accion) {
                case "Buscar Producto":
                    productos = new Productos();
                    String codigoproducto = request.getParameter("txtCodigoProducto");
                    productos.setCodigo_Barras(codigoproducto);
                    productos = productosDAO.ListarCodigo_Barras(codigoproducto);

                    if (productos.getNombre() != null) {
                        request.setAttribute("productos", productos);
                        request.setAttribute("proveedores", lista2);
                        request.setAttribute("subtotal", subt2);
                        request.setAttribute("totalIVA", totalIVA2);
                        request.setAttribute("listapedidos", listapedidos);
                        request.setAttribute("totalPagar", total2);

                    } else {
                        String c = "NoExistepro";
                        request.setAttribute("respuesta", c);
                        request.setAttribute("proveedores", lista2);
                        request.setAttribute("subtotal", subt2);
                        request.setAttribute("totalIVA", totalIVA2);
                        request.setAttribute("listapedidos", listapedidos);
                        request.setAttribute("totalPagar", total2);
                    }

                    break;
                case "Cancelar":
                    subt2 = "0.0";
                    listapedidos.clear();
                    ;
                    total2 = "0.0";
                    totalPagar2 = 0;
                    subtotal2 = 0;
                    totalIVA2 = "0.0";
                    String respu = "Cancelado";
                    request.setAttribute("respuesta", respu);
                    request.setAttribute("proveedores", lista2);
                    request.setAttribute("subtotal", subt2);
                    request.setAttribute("totalIVA", totalIVA2);
                    request.setAttribute("listapedidos", listapedidos);
                    request.setAttribute("totalPagar", total2);
                    break;
                case "Eliminardelista":

                    int articulo = Integer.parseInt(request.getParameter("articulo"));
                    double precio1 = Double.parseDouble(request.getParameter("precio"));
                    double Iva = Double.parseDouble(request.getParameter("iva"));

                    subtotal2 = subtotal2 - precio1;
                    subt2 = formato.format(subtotal2);
                    totalPagarIVA2 = totalPagarIVA2 - Iva;
                    totalIVA2 = formato.format(totalPagarIVA2);
                    totalPagar2 = subtotal2 + totalPagarIVA2;
                    total2 = formato.format(totalPagar2);
                    if (listapedidos.size() == 1) {
                        subt2 = "0.00";
                        total2 = "0.00";
                        totalIVA2 = "0.00";
                        totalPagarIVA2 = 0.00;
                        listapedidos.remove(0);
                        listapedidos.clear();
                    } else if (listapedidos.size() == articulo) {
                        listapedidos.remove(articulo - 1);
                    } else if (articulo > listapedidos.size()) {
                        listapedidos.remove(listapedidos.size() - 1);
                    } else {
                        listapedidos.remove(articulo);
                    }
                    request.setAttribute("proveedores", lista2);
                    request.setAttribute("subtotal", subt2);
                    request.setAttribute("totalIVA", totalIVA2);
                    request.setAttribute("listapedidos", listapedidos);
                    request.setAttribute("totalPagar", total2);

                    break;

                case "Agregar al pedido":

                    codigo2 = request.getParameter("txtCodigoProducto");
                    prod2 = Integer.parseInt(request.getParameter("IdProductos"));
                    NombreProducto2 = request.getParameter("txtNombreproducto");
                    precio2 = Double.parseDouble(request.getParameter("txtPrecio_Compra"));
                    cantidad2 = Integer.parseInt(request.getParameter("txtCantidad"));
                    int txtTope_Max = Integer.parseInt(request.getParameter("txtTope_Max"));
                    int IVA = Integer.parseInt(request.getParameter("txtIVA"));

                    if (cantidad2 > txtTope_Max) {
                        String respuesta = "Errorcantidad";
                        request.setAttribute("respuesta", respuesta);
                    } else {

                        detallepedidos = new DetallePedidosProveedor();

                        if (listapedidos.isEmpty()) {
                            item2 = 0;
                            detallepedidos.setItem(item2);
                        } else {
                            detallepedidos.setItem(item2);
                        }

                        preciocantidad2 = precio2 * cantidad2;
                        double subtotalIVA = preciocantidad2 * IVA / 100;
                        detallepedidos.setCodigoProducto(codigo2);
                        detallepedidos.setNombreProducto(NombreProducto2);
                        detallepedidos.setCantidad_Productos(cantidad2);
                        detallepedidos.setSubtotal(preciocantidad2);
                        detallepedidos.setValor_Productos(preciocantidad2);
                        detallepedidos.setProductos(prod2);
                        detallepedidos.setIVA(subtotalIVA);

                        listapedidos.add(detallepedidos);
                    }
                    subtotal2 = 0;
                    for (int i = 0; i < listapedidos.size(); i++) {
                        subtotal2 = subtotal2 + listapedidos.get(i).getSubtotal();
                    }
                    totalPagarIVA2 = 0;
                    for (int i = 0; i < listapedidos.size(); i++) {
                        totalPagarIVA2 = totalPagarIVA2 + listapedidos.get(i).getIVA();
                    }

                    subt2 = formato.format(subtotal2);
                    totalIVA2 = formato.format(totalPagarIVA2);
                    totalPagar2 = subtotal2 + totalPagarIVA2;
                    total2 = formato.format(totalPagar2);

                    request.setAttribute("proveedores", lista2);
                    request.setAttribute("subtotal", subt2);
                    request.setAttribute("totalIVA", totalIVA2);
                    request.setAttribute("listapedidos", listapedidos);
                    request.setAttribute("totalPagar", total2);

                    break;

                case "GenerarPedido":

                    //guardar pedido
                    String FechadeEntrega = request.getParameter("txtFechaEntrega");
                    String Fecha_Solicitud = request.getParameter("txtFecha_Solicitud");
                    int cantotalproductos = 0;

                    for (int i = 0; i < listapedidos.size(); i++) {
                        int cantida = listapedidos.get(i).getCantidad_Productos();
                        cantotalproductos = cantotalproductos + cantida;
                    }
                    System.out.println(cantotalproductos);
                    int Proveedor = Integer.parseInt(request.getParameter("txtProveedor"));
                    int empleado = Integer.parseInt(sesion.getAttribute("IdEmpleado").toString());
                    String Estado = request.getParameter("txtEstado");
                    String txtObservaciones = request.getParameter("txtObservaciones");

                    pedido.setFecha_Entrega(FechadeEntrega);
                    pedido.setFecha_Solicitud(Fecha_Solicitud);
                    pedido.setCan_Total_Productos(cantotalproductos);
                    pedido.setValor_Pedido(totalPagar2);
                    pedido.setProveedores(Proveedor);
                    pedido.setEmpleado(empleado);
                    pedido.setEstado(Estado);
                    pedido.setObservacion_Pedido(txtObservaciones);
                    System.out.println(pedido.getCan_Total_Productos());
                    System.out.println(pedido.getEmpleado());
                    System.out.println(pedido.getEstado());
                    System.out.println(pedido.getProveedores());
                    System.out.println(pedido.getFecha_Entrega());
                    System.out.println(pedido.getFecha_Solicitud());
                    System.out.println(pedido.getEmpleado());
                    System.out.println(pedido.getValor_Pedido());
                    System.out.println(pedido.getObservacion_Pedido());
                    respedido = pedidoDAO.agregar(pedido);

                    System.out.println("resssped" + respedido);

                    //guardar detalle Ventas
                    int idv = Integer.parseInt(pedidoDAO.IddePedidos());
                    for (int i = 0; i < listapedidos.size(); i++) {

                        detallepedidos = new DetallePedidosProveedor();
                        detallepedidos.setProductos(listapedidos.get(i).getProductos());
                        detallepedidos.setValor_Productos(listapedidos.get(i).getValor_Productos());
                        detallepedidos.setCantidad_Productos(listapedidos.get(i).getCantidad_Productos());
                        detallepedidos.setPedidosProveedor(idv);

                        resdetallepedido = detallepedidosDAO.agregar(detallepedidos);
                        System.out.println("resdetallepedido" + resdetallepedido);

                    }
                    if (resdetallepedido != 0) {
                        //Actualizar venta
                        for (int i = 0; i < listapedidos.size(); i++) {
                            int sac = 0;
                            int Cant = 0;
                            int idproductos = 0;

                            Cant = listapedidos.get(i).getCantidad_Productos();
                            idproductos = listapedidos.get(i).getProductos();

                            ProductosDAO apr = new ProductosDAO();
                            Productos prd = new Productos();

                            prd = apr.BuscarId(idproductos);
                            sac = prd.getCantidad() + Cant;
                            apr.actualizarStock(idproductos, sac);

                        }

                        subt2 = "0.0";;
                        listapedidos.clear();
                        total2 = "0.0";
                        totalIVA2 = "0.0";

                    }

                    if (resdetallepedido == 1 && respedido == 1) {
                        String respuesta = "Registrado";
                        listapedidos.clear();
                        request.setAttribute("respuesta", respuesta);
                    } else {
                        String respuesta = "NoRegistrado";
                        request.setAttribute("respuesta", respuesta);
                    }
                    request.setAttribute("proveedores", lista2);
                    request.setAttribute("subtotal", subt2);
                    request.setAttribute("totalIVA", totalIVA2);
                    request.setAttribute("listapedidos", listapedidos);
                    request.setAttribute("totalPagar", total2);
                    break;

                default:
                    request.getRequestDispatcher("RegistrarPedidoProveedor.jsp").forward(request, response);
            }
            request.getRequestDispatcher("RegistrarPedidoProveedor.jsp").forward(request, response);

        }

        if (menu.equals("Ventas")) {
            switch (accion) {
                case "VentaCancelada":
                    String estado3 = "Cancelada";
                    String Observacion3 = "";
                    idu = Integer.parseInt(request.getParameter("id"));
                    ventas.setEstado(estado3);
                    ventas.setIdVentas(idu);
                    int r2 = ventasdao.actualizarEstado(ventas);
                    if (r2 == 1) {
                        String ress = "Cancelada";
                        response.sendRedirect("Controlador?menu=Ventas&accion=ListarVentas&respuesta=" + ress);

                    } else if (r2 == 0) {
                        String ress = "NoCancelada";
                        response.sendRedirect("Controlador?menu=Ventas&accion=ListarVentas&respuesta=" + ress);
                    }
                    break;
            }
        }

        if (menu.equals("Pedidos")) {
            switch (accion) {
                case "PedidoRecibido":
                    String estado2 = "Recibido";
                    idu = Integer.parseInt(request.getParameter("id"));
                    pedido = new Pedidos_Proveedor();
                    pedido.setEstado(estado2);
                    pedido.setIdPedidosProveedor(idu);
                    int resp = pedidoDAO.actualizarEstado(pedido);
                    if (resp == 1) {
                        String ress = "Recibido";
                        response.sendRedirect("Controlador?menu=Pedidos&accion=ListarPedidos&respuesta=" + ress);

                    } else if (resp == 0) {
                        String ress = "NoRecibido";
                        response.sendRedirect("Controlador?menu=Pedidos&accion=ListarPedidos&respuesta=" + ress);
                    }
                    break;
                case "PedidoCancelado":
                    String estado3 = "Cancelado";
                    idu = Integer.parseInt(request.getParameter("id"));
                    pedido = new Pedidos_Proveedor();
                    pedido.setEstado(estado3);
                    pedido.setIdPedidosProveedor(idu);
                    int r2 = pedidoDAO.actualizarEstado(pedido);
                    if (r2 == 1) {
                        String ress = "Cancelado";
                        response.sendRedirect("Controlador?menu=Pedidos&accion=ListarPedidos&respuesta=" + ress);

                    } else if (r2 == 0) {
                        String ress = "NoCancelado";
                        response.sendRedirect("Controlador?menu=Pedidos&accion=ListarPedidos&respuesta=" + ress);
                    }
                    break;
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
