/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author brayan.daza
 */
public class Validar extends HttpServlet {

    EmpleadoDAO edao = new EmpleadoDAO();
    Empleado em = new Empleado();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {

            String user = request.getParameter("txtUsuario");
            String pass = request.getParameter("txtPassword");

            em = edao.validar(user, pass);

            if (em.getUsuario() != null) {
                if (!"Pendiente".equals(em.getEstado()) && !"Inactivo".equals(em.getEstado())) {

                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("IdEmpleado", em.getIdEmpleado());
                    sesion.setAttribute("Nombres", em.getNombre1());
                    sesion.setAttribute("Apellidos", em.getApellido1());
                    sesion.setAttribute("TipoEmpleado", em.getTipoEmpleado());
                    sesion.setAttribute("Genero", em.getGenero());

                    switch (em.getTipoEmpleado()) {
                        case "Administrador":
                            response.sendRedirect("Controlador?menu=Principal");
                            break;
                        case "Cajero":
                            response.sendRedirect("Controlador?menu=PrincipalCajero");
                            break;
                        case "Almacenista":
                            response.sendRedirect("Controlador?menu=PrincipalAlmacenista");
                            break;
                        default:
                            break;
                    }
                } else {
                    String Respuesta = "Noacceso";
                    response.sendRedirect("index.jsp?r=" + Respuesta);
                }

            } else {
                String Respuesta = "Incorrecto";
                response.sendRedirect("index.jsp?r=" + Respuesta);
            }
        } else if (accion.equalsIgnoreCase("Registrar")) {
            response.sendRedirect("Registrar_UsuarioLogin.jsp");
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
