/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author brayan.daza
 */
public class VentasDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public String GenerarSeries() {
        String numeroserie = "";
        String sql = "Select max(Numero_Serie) from ventas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                numeroserie = rs.getString(1);
            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return numeroserie;
    }


    
    public String IddeVentas() {
        String idventas = "";
        String sql = "Select max(IdVentas) from ventas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                idventas = rs.getString(1);

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return idventas;
    }

    public int guardarVentas(Ventas ve) {
        String sql = "insert into ventas(Numero_Serie,Fecha_Solicitud, Fecha_Entrega,Valor_Venta,Estado,Cliente,Usuario_Registra)values(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ve.getNumero_Serie());
            ps.setString(2, ve.getFecha_Solicitud());
            ps.setString(3, ve.getFecha_Entrega());
            ps.setDouble(4, ve.getValor_Venta());
            ps.setString(5, ve.getEstado());
            ps.setInt(6, ve.getCliente());
            ps.setInt(7, ve.getUsuario_Registra());
            r= ps.executeUpdate();

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return r;
    }
    
     public String contarVentas() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from ventas";
        String Can = null;
        try {
            con = cn.Conexion();
            Statement consulta = con.createStatement();
            cantidad = consulta.executeQuery(sql);

            if (cantidad.next()) {
                Can = cantidad.getString("CANTIDAD");

            }
        } catch (Exception e) {

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return Can;
    }
     
    public List listar() {

        String sql = "SELECT vt.*, cl.Nombre1,cl.Apellido1, em.Nombre1, em.Apellido1 FROM ventas vt INNER JOIN clientes cl ON cl.IdCliente = vt.Cliente INNER JOIN empleado em ON em.IdEmpleado = vt.Usuario_Registra";

        List<Ventas> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Ventas vts = new Ventas();

                vts.setIdVentas(rs.getInt("vt.IdVentas"));
                vts.setNumero_Serie(rs.getString("vt.Numero_Serie"));
                vts.setFecha_Solicitud(rs.getString("vt.Fecha_Solicitud"));
                vts.setFecha_Entrega(rs.getString("vt.Fecha_Entrega"));
                vts.setValor_Venta(rs.getDouble("vt.Valor_Venta"));
                vts.setEstado(rs.getString("vt.Estado"));
                vts.setNombreCliente(rs.getString("cl.Nombre1")+" "+rs.getString("cl.Apellido1"));
                vts.setNombreUsuario(rs.getString("em.Nombre1")+" "+rs.getString("em.Apellido1"));
               
                lista.add(vts);

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }
    public List listarestado(String Estado) {

        String sql = "SELECT vt.*, cl.Nombre1,cl.Apellido1, em.Nombre1, em.Apellido1 FROM ventas vt INNER JOIN clientes cl ON cl.IdCliente = vt.Cliente INNER JOIN empleado em ON em.IdEmpleado = vt.Usuario_Registra WHERE vt.Estado='"+Estado+"'";

        List<Ventas> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Ventas vts = new Ventas();

                vts.setIdVentas(rs.getInt("vt.IdVentas"));
                vts.setNumero_Serie(rs.getString("vt.Numero_Serie"));
                vts.setFecha_Solicitud(rs.getString("vt.Fecha_Solicitud"));
                vts.setFecha_Entrega(rs.getString("vt.Fecha_Entrega"));
                vts.setValor_Venta(rs.getDouble("vt.Valor_Venta"));
                vts.setEstado(rs.getString("vt.Estado"));
                vts.setNombreCliente(rs.getString("cl.Nombre1")+" "+rs.getString("cl.Apellido1"));
                vts.setNombreUsuario(rs.getString("em.Nombre1")+" "+rs.getString("em.Apellido1"));
               
                lista.add(vts);

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }
    
    public List listarfactura() {

        String sql = "SELECT vt.*, cl.Nombre1,cl.Apellido1,cl em.Nombre1, em.Apellido1 FROM ventas vt INNER JOIN clientes cl ON cl.IdCliente = vt.Cliente INNER JOIN empleado em ON em.IdEmpleado = vt.Usuario_Registra";

        List<Ventas> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Ventas vts = new Ventas();

                vts.setIdVentas(rs.getInt("vt.IdVentas"));
                vts.setNumero_Serie(rs.getString("vt.Numero_Serie"));
                vts.setFecha_Solicitud(rs.getString("vt.Fecha_Solicitud"));
                vts.setFecha_Entrega(rs.getString("vt.Fecha_Entrega"));
                vts.setValor_Venta(rs.getDouble("vt.Valor_Venta"));
                vts.setEstado(rs.getString("vt.Estado"));
                vts.setNombreCliente(rs.getString("cl.Nombre1")+" "+rs.getString("cl.Apellido1"));
                vts.setNombreUsuario(rs.getString("em.Nombre1")+" "+rs.getString("em.Apellido1"));
               
                lista.add(vts);

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }
    
        public Ventas ListarId(int Id) {
        Ventas vts = new Ventas();
        String sql = " SELECT vt.*, cl.Nombre1,cl.Apellido1, em.Nombre1, em.Apellido1 FROM ventas vt INNER JOIN clientes cl ON cl.IdCliente = vt.Cliente INNER JOIN empleado em ON em.IdEmpleado = vt.Usuario_Registra where IdVentas="+Id;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                vts.setIdVentas(rs.getInt("vt.IdVentas"));
                vts.setNumero_Serie(rs.getString("vt.Numero_Serie"));
                vts.setFecha_Solicitud(rs.getString("vt.Fecha_Solicitud"));
                vts.setFecha_Entrega(rs.getString("vt.Fecha_Entrega"));
                vts.setValor_Venta(rs.getDouble("vt.Valor_Venta"));
                vts.setEstado(rs.getString("vt.Estado"));
                vts.setNombreCliente(rs.getString("cl.Nombre1")+" "+rs.getString("cl.Apellido1"));
                vts.setNombreUsuario(rs.getString("em.Nombre1")+" "+rs.getString("em.Apellido1"));
                vts.setCliente(rs.getInt("vt.Cliente"));
                vts.setUsuario_Registra(rs.getInt("vt.Usuario_Registra"));

                con.close();
            }
        } catch (Exception e) {
        }
        return vts;
    }
          public int actualizarEstado(Ventas vt) {
        int r = 0;
        String sql = "update ventas set Estado=? where IdVentas=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, vt.getEstado());
            ps.setInt(2, vt.getIdVentas());
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return r;
    }
}
     

