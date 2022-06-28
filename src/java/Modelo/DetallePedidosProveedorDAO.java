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
public class DetallePedidosProveedorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List listar() {

        String sql = " SELECT detp.*,pro.* FROM detallepedidosproveedor detp INNER JOIN inventario_productos pro ON pro.idProveedores = detp.Productos";

        List<DetallePedidosProveedor> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                DetallePedidosProveedor dpedprov = new DetallePedidosProveedor();

                dpedprov.setPedidosProveedor(rs.getInt("detp.PedidosProveedor "));
                dpedprov.setValor_Productos(rs.getDouble("detp.Valor_Productos"));
                dpedprov.setPedidosProveedor(rs.getInt("detp.Cantidad_Productos"));
                dpedprov.setNombreProducto(rs.getString("pro.Nombre"));
                dpedprov.setCodigoProducto(rs.getString("pro.Codigo_Barras"));

                lista.add(dpedprov);

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

    public int agregar(DetallePedidosProveedor dpprov) {
        String sql = "insert into detallepedidosproveedor (PedidosProveedor, Productos , Valor_Productos, Cantidad_Productos)values(?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setInt(1, dpprov.getPedidosProveedor());
            ps.setInt(2, dpprov.getProductos());
            ps.setDouble(3, dpprov.getValor_Productos());
            ps.setInt(4, dpprov.getCantidad_Productos());

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
    
 public List  ListarId(int Id) {

       String sql = " SELECT dp.*,ct.IVA,pd.Codigo_Barras,pd.Nombre,pd.Precio_Compra FROM detallepedidosproveedor dp INNER JOIN inventario_productos pd ON pd.IdProductos = dp.Productos INNER JOIN categoria_productos ct ON ct.IdCategoriaProductos = pd.Categoria_Productos where dp.PedidosProveedor="+Id;

        List<DetallePedidosProveedor> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                DetallePedidosProveedor dpds = new DetallePedidosProveedor();

                dpds.setCodigoProducto(rs.getString("pd.Codigo_Barras"));
                dpds.setNombreProducto(rs.getString("pd.Nombre"));
                dpds.setValor_Unitario(rs.getDouble("pd.Precio_Compra"));
                dpds.setCantidad_Productos(rs.getInt("dp.Cantidad_Productos"));
                dpds.setValor_Productos(rs.getDouble("dp.Valor_Productos"));
                dpds.setPorcentajeIVA(rs.getInt("ct.IVA"));
               
                lista.add(dpds);

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
