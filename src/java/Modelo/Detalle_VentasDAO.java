/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author brayan.daza
 */
public class Detalle_VentasDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    public int guardarDetalleVentas(Detalle_Ventas dtve) {
        String sql = "insert into detalle_ventas(Codigo_Producto, Nombre_Producto, Cantidad_Producto, Valor_Productos, Subtotal, Productos, Venta)values(?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, dtve.getCodigo_Producto());
            ps.setString(2, dtve.getNombre_Producto());
            ps.setInt(3, dtve.getCantidad_Producto());
            ps.setDouble(4, dtve.getValor_Productos());
            ps.setDouble(5, dtve.getSubtotal());
            ps.setInt(6, dtve.getProductos());
            ps.setInt(7, dtve.getVenta());
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

 
        
    public List  ListarId(int Id) {

       String sql = " SELECT dvt.*,ct.IVA FROM detalle_ventas dvt INNER JOIN inventario_productos pd ON pd.IdProductos = dvt.Productos INNER JOIN categoria_productos ct ON ct.IdCategoriaProductos = pd.Categoria_Productos where dvt.Venta="+Id;

        List<Detalle_Ventas> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Detalle_Ventas dvts = new Detalle_Ventas();

                 dvts.setCodigo_Producto(rs.getString("dvt.Codigo_Producto"));
                dvts.setNombre_Producto(rs.getString("dvt.Nombre_Producto"));
                dvts.setCantidad_Producto(rs.getInt("dvt.Cantidad_Producto"));
                dvts.setValor_Productos(rs.getDouble("dvt.Valor_Productos"));
                dvts.setSubtotal(rs.getDouble("dvt.Subtotal"));
                dvts.setPorcentajeIVA(rs.getInt("ct.IVA"));
               
                lista.add(dvts);

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
}
