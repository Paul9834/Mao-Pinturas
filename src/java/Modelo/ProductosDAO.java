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
public class ProductosDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List listar() {

        String sql = " SELECT pro.*, emp.Nombre1, emp.Apellido1 ,cate.* FROM inventario_productos pro INNER JOIN categoria_productos cate ON cate.IdCategoriaProductos = pro.Categoria_Productos INNER JOIN empleado emp ON emp.IdEmpleado = pro.Usuario_Registra";

        List<Productos> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Productos prod = new Productos();

                prod.setIdProductos(rs.getInt("pro.IdProductos"));
                prod.setNombre(rs.getString("pro.Nombre"));
                prod.setDescripcion(rs.getString("pro.Descripcion"));
                prod.setMarca(rs.getString("pro.Marca"));
                prod.setCantidad(rs.getInt("pro.Cantidad"));
                prod.setTope_Min(rs.getInt("pro.Tope_Min"));
                prod.setTope_Max(rs.getInt("pro.Tope_Max"));
                prod.setCodigo_Barras(rs.getString("pro.Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("pro.Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("pro.Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("pro.Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("pro.Fecha_Vencimiento"));
                prod.setEstado(rs.getString("pro.Estado"));
                prod.setUsuario(rs.getString("emp.Nombre1") + " " + rs.getString("emp.Apellido1"));
                prod.setCategoria(rs.getString("cate.Categoria"));
                prod.setCategoria_Productos(rs.getInt("pro.Categoria_Productos"));
                prod.setTipo_IVA(rs.getString("cate.Tipo_IVA"));
                prod.setIVA(rs.getInt("cate.IVA"));


                lista.add(prod);
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
    public List listarStock() {

        String sql = " SELECT pro.*, emp.Nombre1, emp.Apellido1 ,cate.* FROM inventario_productos pro INNER JOIN categoria_productos cate ON cate.IdCategoriaProductos = pro.Categoria_Productos INNER JOIN empleado emp ON emp.IdEmpleado = pro.Usuario_Registra where pro.Tope_Min>=pro.Cantidad";

        List<Productos> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Productos prod = new Productos();

                prod.setIdProductos(rs.getInt("pro.IdProductos"));
                prod.setNombre(rs.getString("pro.Nombre"));
                prod.setDescripcion(rs.getString("pro.Descripcion"));
                prod.setMarca(rs.getString("pro.Marca"));
                prod.setCantidad(rs.getInt("pro.Cantidad"));
                prod.setTope_Min(rs.getInt("pro.Tope_Min"));
                prod.setTope_Max(rs.getInt("pro.Tope_Max"));
                prod.setCodigo_Barras(rs.getString("pro.Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("pro.Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("pro.Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("pro.Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("pro.Fecha_Vencimiento"));
                prod.setEstado(rs.getString("pro.Estado"));
                prod.setUsuario(rs.getString("emp.Nombre1") + " " + rs.getString("emp.Apellido1"));
                prod.setCategoria(rs.getString("cate.Categoria"));
                prod.setCategoria_Productos(rs.getInt("pro.Categoria_Productos"));
                prod.setTipo_IVA(rs.getString("cate.Tipo_IVA"));
                prod.setIVA(rs.getInt("cate.IVA"));


                lista.add(prod);
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

    public int agregar(Productos pro) {
        String sql = "insert into inventario_productos (Nombre, Descripcion, Marca, Cantidad, Tope_Min, Tope_Max, Codigo_Barras, Precio_Compra, Precio_Venta, Fecha_Registrado, Fecha_Vencimiento, Estado, Usuario_Registra, Categoria_Productos)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, pro.getNombre());
            ps.setString(2, pro.getDescripcion());
            ps.setString(3, pro.getMarca());
            ps.setInt(4, pro.getCantidad());
            ps.setInt(5, pro.getTope_Min());
            ps.setInt(6, pro.getTope_Max());
            ps.setString(7, pro.getCodigo_Barras());
            ps.setDouble(8, pro.getPrecio_Compra());
            ps.setDouble(9, pro.getPrecio_Venta());
            ps.setString(10, pro.getFecha_Registrado());
            ps.setString(11, pro.getFecha_Vencimiento());
            ps.setString(12, pro.getEstado());
            ps.setInt(13, pro.getUsuario_Registra());
            ps.setInt(14, pro.getCategoria_Productos());

            res = ps.executeUpdate();

            if (res == 1) {
                return res;
            } else {
                return res;
            }

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return res;
    }

    public Productos ListarId(int Id) {
        Productos prod = new Productos();
        String sql = "Select *from inventario_productos where IdProductos=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                prod.setIdProductos(rs.getInt("IdProductos"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setMarca(rs.getString("Marca"));
                prod.setCantidad(rs.getInt("Cantidad"));
                prod.setTope_Min(rs.getInt("Tope_Min"));
                prod.setTope_Max(rs.getInt("Tope_Max"));
                prod.setCodigo_Barras(rs.getString("Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("Fecha_Vencimiento"));
                prod.setEstado(rs.getString("Estado"));
                prod.setUsuario_Registra(rs.getInt("Usuario_Registra"));
                prod.setCategoria_Productos(rs.getInt("Categoria_Productos"));
                
            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return prod;
    }
    public Productos ListarIdTablas(int Id) {
        Productos prod = new Productos();
        String sql = "Select pro.*, emp.Nombre1,emp.Apellido1, cate.* from inventario_productos pro INNER JOIN empleado emp ON pro.Usuario_Registra=emp.IdEmpleado INNER JOIN categoria_productos cate ON pro.Categoria_Productos=cate.IdCategoriaProductos  where IdProductos=" + Id;
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                prod.setIdProductos(rs.getInt("IdProductos"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setMarca(rs.getString("Marca"));
                prod.setCantidad(rs.getInt("Cantidad"));
                prod.setTope_Min(rs.getInt("Tope_Min"));
                prod.setTope_Max(rs.getInt("Tope_Max"));
                prod.setCodigo_Barras(rs.getString("Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("Fecha_Vencimiento"));
                prod.setEstado(rs.getString("Estado"));
                prod.setUsuario(rs.getString("emp.Nombre1") +" "+ rs.getString("emp.Apellido1"));
                prod.setCategoria(rs.getString("cate.Categoria"));
                prod.setCategoria_Productos(rs.getInt("Categoria_Productos"));
                prod.setTipo_IVA(rs.getString("cate.Tipo_IVA"));
                prod.setIVA(rs.getInt("cate.IVA"));
            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return prod;
    }

    public Productos ListarCodigo_Barras(String Codigo_Barras) {
        Productos prod = new Productos();
String sql = "Select pro.*, emp.Nombre1,emp.Apellido1, cate.* from inventario_productos pro INNER JOIN empleado emp ON pro.Usuario_Registra=emp.IdEmpleado INNER JOIN categoria_productos cate ON pro.Categoria_Productos=cate.IdCategoriaProductos  where Codigo_Barras=" + Codigo_Barras;
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                prod.setIdProductos(rs.getInt("IdProductos"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setMarca(rs.getString("Marca"));
                prod.setCantidad(rs.getInt("Cantidad"));
                prod.setTope_Min(rs.getInt("Tope_Min"));
                prod.setTope_Max(rs.getInt("Tope_Max"));
                prod.setCodigo_Barras(rs.getString("Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("Fecha_Vencimiento"));
                prod.setEstado(rs.getString("Estado"));
                prod.setUsuario(rs.getString("emp.Nombre1") +" "+ rs.getString("emp.Apellido1"));
                prod.setCategoria(rs.getString("cate.Categoria"));
                prod.setCategoria_Productos(rs.getInt("Categoria_Productos"));
                prod.setTipo_IVA(rs.getString("cate.Tipo_IVA"));
                prod.setIVA(rs.getInt("cate.IVA"));
            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return prod;
    }

    public int actualizar(Productos pro) {
        int r = 0;
        String sql = "update inventario_productos set Nombre=?, Descripcion=?, Marca=?, Cantidad=?, Tope_Min=?, Tope_Max=?, Codigo_Barras=?, Precio_Compra=?, Precio_Venta=?, Fecha_Vencimiento=?, Estado=?, Usuario_Registra=?, Categoria_Productos=? where IdProductos=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, pro.getNombre());
            ps.setString(2, pro.getDescripcion());
            ps.setString(3, pro.getMarca());
            ps.setInt(4, pro.getCantidad());
            ps.setInt(5, pro.getTope_Min());
            ps.setInt(6, pro.getTope_Max());
            ps.setString(7, pro.getCodigo_Barras());
            ps.setDouble(8, pro.getPrecio_Compra());
            ps.setDouble(9, pro.getPrecio_Venta());
            ps.setString(10, pro.getFecha_Vencimiento());
            ps.setString(11, pro.getEstado());
            ps.setInt(12, pro.getUsuario_Registra());
            ps.setInt(13, pro.getCategoria_Productos());
            ps.setInt(14, pro.getIdProductos());

            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            }

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return r;
    }

    public int eliminar(int id) {
        int r = 0;
        String sql = "delete from inventario_productos where IdProductos=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            }
        } catch (Exception e) {

        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return r;
    }

    public String contarProductos() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from inventario_productos";
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

    public Productos BuscarId(int id) {
        Productos prod = new Productos();
        String sql = "Select * from inventario_productos where IdProductos=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                prod.setIdProductos(rs.getInt("IdProductos"));
                prod.setNombre(rs.getString("Nombre"));
                prod.setDescripcion(rs.getString("Descripcion"));
                prod.setMarca(rs.getString("Marca"));
                prod.setCantidad(rs.getInt("Cantidad"));
                prod.setTope_Min(rs.getInt("Tope_Min"));
                prod.setTope_Max(rs.getInt("Tope_Max"));
                prod.setCodigo_Barras(rs.getString("Codigo_Barras"));
                prod.setPrecio_Compra(rs.getDouble("Precio_Compra"));
                prod.setPrecio_Venta(rs.getDouble("Precio_Venta"));
                prod.setFecha_Registrado(rs.getString("Fecha_Registrado"));
                prod.setFecha_Vencimiento(rs.getString("Fecha_Vencimiento"));
                prod.setEstado(rs.getString("Estado"));
                prod.setUsuario_Registra(rs.getInt("Usuario_Registra"));
                prod.setCategoria_Productos(rs.getInt("Categoria_Productos"));

            }
        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return prod;
    }

    public int actualizarStock(int id, int Stock) {
        int r = 0;
        String sql = "update inventario_productos set Cantidad=? where IdProductos=?";

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setInt(1, Stock);
            ps.setInt(2, id);

            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            }

        } catch (Exception e) {
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
        return r;
    }
}
