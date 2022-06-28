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
public class Pedidos_ProveedorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List listar() {

        String sql = " SELECT pd.*, pv.Nombres, em.Nombre1, em.Apellido1 FROM pedidos_proveedor pd INNER JOIN proveedores pv ON pv.idProveedores = pd.Proveedores INNER JOIN empleado em ON em.IdEmpleado = pd.Empleado";

        List<Pedidos_Proveedor> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Pedidos_Proveedor pedprov = new Pedidos_Proveedor();

                pedprov.setIdPedidosProveedor(rs.getInt("pd.IdPedidosProveedor"));
                pedprov.setFecha_Entrega(rs.getString("pd.Fecha_Entrega"));
                pedprov.setFecha_Solicitud(rs.getString("pd.Fecha_Solicitud"));
                pedprov.setCan_Total_Productos(rs.getInt("pd.Can_Total_Productos"));
                pedprov.setValor_Pedido(rs.getDouble("pd.Valor_Pedido"));
                pedprov.setProveedor(rs.getString("pv.Nombres"));
                pedprov.setUsuario(rs.getString("em.Nombre1"));
                pedprov.setEstado(rs.getString("pd.Estado"));
                pedprov.setObservacion_Pedido(rs.getString("pd.Observacion_Pedido"));

                lista.add(pedprov);

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
    public List listarEstado(String Estado) {

        String sql = " SELECT pd.*, pv.Nombres, em.Nombre1, em.Apellido1 FROM pedidos_proveedor pd INNER JOIN proveedores pv ON pv.idProveedores = pd.Proveedores INNER JOIN empleado em ON em.IdEmpleado = pd.Empleado where pd.Estado="+Estado;

        List<Pedidos_Proveedor> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Pedidos_Proveedor pedprov = new Pedidos_Proveedor();

                pedprov.setIdPedidosProveedor(rs.getInt("pd.IdPedidosProveedor"));
                pedprov.setFecha_Entrega(rs.getString("pd.Fecha_Entrega"));
                pedprov.setFecha_Solicitud(rs.getString("pd.Fecha_Solicitud"));
                pedprov.setCan_Total_Productos(rs.getInt("pd.Can_Total_Productos"));
                pedprov.setValor_Pedido(rs.getDouble("pd.Valor_Pedido"));
                pedprov.setProveedor(rs.getString("pv.Nombres"));
                pedprov.setUsuario(rs.getString("em.Nombre1"));
                pedprov.setEstado(rs.getString("pd.Estado"));
                pedprov.setObservacion_Pedido(rs.getString("pd.Observacion_Pedido"));

                lista.add(pedprov);

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

    public int agregar(Pedidos_Proveedor pprov) {
        String sql = "insert into pedidos_proveedor (Fecha_Entrega, Fecha_Solicitud, Can_Total_Productos, Valor_Pedido,	Proveedores , Empleado, Estado, Observacion_Pedido)values(?,?,?,?,?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, pprov.getFecha_Entrega());
            ps.setString(2, pprov.getFecha_Solicitud());
            ps.setInt(3, pprov.getCan_Total_Productos());
            ps.setDouble(4, pprov.getValor_Pedido());
            ps.setInt(5, pprov.getProveedores());
            ps.setInt(6, pprov.getEmpleado());
            ps.setString(7, pprov.getEstado());
            ps.setString(8, pprov.getObservacion_Pedido());
            res = ps.executeUpdate();
            con.close();
            if (res == 1) {
                return res;
            } else {
                return res;
            }

        } catch (Exception e) {
        }
        return res;

    }

    public String IddePedidos() {
        String idpedidos = "";
        String sql = "Select max(IdPedidosProveedor) from pedidos_proveedor";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                idpedidos = rs.getString(1);

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return idpedidos;
    }

         public String contarPedidos() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from pedidos_proveedor";
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
         
    public Pedidos_Proveedor ListarId(int Id) {
        Pedidos_Proveedor pd = new Pedidos_Proveedor();
        String sql = " SELECT pd.*, pv.Nombres, em.Nombre1, em.Apellido1 FROM pedidos_proveedor pd INNER JOIN proveedores pv ON pv.idProveedores = pd.Proveedores INNER JOIN empleado em ON em.IdEmpleado = pd.Empleado where IdPedidosProveedor=" + Id;;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pd.setIdPedidosProveedor(rs.getInt("pd.IdPedidosProveedor"));
                pd.setFecha_Entrega(rs.getString("pd.Fecha_Entrega"));
                pd.setFecha_Solicitud(rs.getString("pd.Fecha_Solicitud"));
                pd.setCan_Total_Productos(rs.getInt("pd.Can_Total_Productos"));
                pd.setValor_Pedido(rs.getDouble("pd.Valor_Pedido"));
                pd.setProveedor(rs.getString("pv.Nombres"));
                pd.setUsuario(rs.getString("em.Nombre1")+" "+rs.getString("em.Apellido1"));
                pd.setEstado(rs.getString("pd.Estado"));
                pd.setObservacion_Pedido(rs.getString("pd.Observacion_Pedido"));

                con.close();
            }
        } catch (Exception e) {
        }
        return pd;
    }
         
    public int actualizarEstado(Pedidos_Proveedor pd) {
        int r = 0;
        String sql = "update pedidos_proveedor set Estado=? where IdPedidosProveedor=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, pd.getEstado());
            ps.setInt(2, pd.getIdPedidosProveedor());
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
