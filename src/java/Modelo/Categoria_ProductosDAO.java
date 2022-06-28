/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import com.sun.net.httpserver.HttpServer;
import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author brayan.daza
 */
public class Categoria_ProductosDAO {
       Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
     public List listar() {
              
        String sql = " SELECT * FROM categoria_productos";
      
        List<Categoria_Productos> lista = new ArrayList<>();
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Categoria_Productos cp = new Categoria_Productos();

                cp.setIdCategoriaProductos(rs.getInt("IdCategoriaProductos"));
                cp.setCategoria(rs.getString("Categoria"));
                cp.setImagen(rs.getBinaryStream("Imagen"));
                cp.setTipo_IVA(rs.getString("Tipo_IVA"));
                cp.setIVA(rs.getInt("IVA"));

                lista.add(cp);
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }      
     
     public void ListarImg (int id, HttpServletResponse response){
        String sql = " SELECT * FROM categoria_productos where IdCategoriaProductos="+id;
           InputStream inputstream = null;
           OutputStream outstream = null;
           BufferedInputStream bufferedinputstream=null;
           BufferedOutputStream bufferedoutstream=null;
           response.setContentType("image/*");
           
        try {
            outstream=response.getOutputStream();
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
           if(rs.next()) {            
              inputstream = rs.getBinaryStream("Imagen");
            }
           bufferedinputstream =new BufferedInputStream(inputstream);
           bufferedoutstream =new BufferedOutputStream(outstream);
           int r=0;
           
            while ((r=bufferedinputstream.read())!=-1) {                
                bufferedoutstream.write(r);
            }
           
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
     }
    
       public int agregar(Categoria_Productos cp) {
        String sql = "insert into categoria_productos (Categoria, Imagen,Tipo_IVA,IVA)values(?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, cp.getCategoria());
            ps.setBlob(2, cp.getImagen());
            ps.setString(3, cp.getTipo_IVA());
            ps.setInt(4, cp.getIVA());

            res = ps.executeUpdate();

            if (res == 1) {
                return res;
            } else {
                return res;
            }

        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return res;
    }
       
    public Categoria_Productos ListarId(int Id) {
        Categoria_Productos cp = new Categoria_Productos();
        String sql = "Select *from categoria_productos where IdCategoriaProductos=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 cp.setIdCategoriaProductos(rs.getInt("IdCategoriaProductos"));
                 cp.setCategoria(rs.getString("Categoria"));
                 cp.setImagen(rs.getBinaryStream("Imagen"));
                 cp.setTipo_IVA(rs.getString("Tipo_IVA"));
                 cp.setIVA(rs.getInt("IVA"));

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return cp;
    }
    
    public int actualizar(Categoria_Productos cp) {
        int r = 0;
        String sql = "update categoria_productos set Categoria=?, Imagen=?, Tipo_IVA=?,IVA=? where IdCategoriaProductos=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
          ps.setString(1, cp.getCategoria());
            ps.setBlob(2, cp.getImagen());
             ps.setString(3, cp.getTipo_IVA());
            ps.setInt(4, cp.getIVA());
             ps.setInt(5, cp.getIdCategoriaProductos());
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
    public int actualizarSinImagen(Categoria_Productos cp) {
        int r = 0;
        String sql = "update categoria_productos set Categoria=?, Tipo_IVA=?,IVA=? where IdCategoriaProductos=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
          ps.setString(1, cp.getCategoria());
             ps.setString(2, cp.getTipo_IVA());
            ps.setInt(3, cp.getIVA());
             ps.setInt(4, cp.getIdCategoriaProductos());
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
      
       public int eliminar(int id) {
        int r = 0;
        String sql = "delete from categoria_productos where IdCategoriaProductos=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
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
     public String contarcategoria_productos() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from categoria_productos";
        String Can = null;
        try {
            con = cn.Conexion();
            Statement consulta = con.createStatement();
            cantidad = consulta.executeQuery(sql);

            if (cantidad.next()) {
                Can = cantidad.getString("CANTIDAD");

            }
        } catch (Exception e) {

        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return Can;
    }
     
}
