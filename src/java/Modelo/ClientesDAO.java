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
public class ClientesDAO {
     
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
   public List listar() {
          

    
        String sql = "select cli.*, ciu.Nombre from clientes cli INNER JOIN ciudad ciu ON cli.Ciudad = ciu.idCiudad";
        
        List<Clientes> lista = new ArrayList<>();
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Clientes clie = new Clientes();

                clie.setIdCliente(rs.getInt("cli.IdCliente"));
                clie.setTipoDocumento(rs.getString("cli.TipoDocumento"));
                clie.setDocumento(rs.getString("cli.Documento"));
                clie.setNombre1(rs.getString("cli.Nombre1"));
                clie.setNombre2(rs.getString("cli.Nombre2"));
                clie.setApellido1(rs.getString("cli.Apellido1"));
                clie.setApellido2(rs.getString("cli.Apellido2"));
                 clie.setDireccion_Domicilio(rs.getString("cli.Direccion_Domicilio"));
                clie.setEmail(rs.getString("cli.Email"));
                clie.setIndicativo_Tel1(rs.getString("cli.Indicativo_Tel1"));
                clie.setTelefono1(rs.getString("cli.Telefono1"));
                clie.setTipo_Tel1(rs.getString("cli.Tipo_Tel1"));
                clie.setIndicativo_Tel2(rs.getString("cli.Indicativo_Tel2"));
                clie.setTelefono2(rs.getString("cli.Telefono2"));
                clie.setTipo_Tel2(rs.getString("cli.Tipo_Tel2"));
                clie.setIndicativo_Tel3(rs.getString("cli.Indicativo_Tel3"));
                clie.setTelefono3(rs.getString("cli.Telefono3"));
                clie.setTipo_Tel3(rs.getString("cli.Tipo_Tel3"));
                clie.setDireccion_Empresa(rs.getString("cli.Direccion_Empresa"));
                clie.setNombre_Empresa(rs.getString("cli.Nombre_Empresa"));
                clie.setEstado(rs.getString("cli.Estado"));
                clie.setFecha_Creado(rs.getString("cli.Fecha_Creado"));
                clie.setNombreCiudad(rs.getString("ciu.Nombre"));
                
                lista.add(clie);
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
      
       public int agregar(Clientes clien) {
        String sql = "insert into clientes (TipoDocumento, Documento, Nombre1,Nombre2, Apellido1,Apellido2, Direccion_Domicilio, Email, Indicativo_Tel1, Telefono1, Tipo_Tel1, Indicativo_Tel2, Telefono2, Tipo_Tel2, Indicativo_Tel3,Telefono3, Tipo_Tel3,Direccion_Empresa, Nombre_Empresa ,Estado ,Fecha_Creado, Ciudad)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, clien.getTipoDocumento());
            ps.setString(2, clien.getDocumento());
            ps.setString(3, clien.getNombre1());
            ps.setString(4, clien.getNombre2());
            ps.setString(5, clien.getApellido1());
            ps.setString(6, clien.getApellido2());
            ps.setString(7, clien.getDireccion_Domicilio());
            ps.setString(8, clien.getEmail());
            ps.setString(9, clien.getIndicativo_Tel1());
            ps.setString(10, clien.getTelefono1());
            ps.setString(11, clien.getTipo_Tel1());
            ps.setString(12, clien.getIndicativo_Tel2());
            ps.setString(13, clien.getTelefono2());
            ps.setString(14, clien.getTipo_Tel2());
            ps.setString(15, clien.getIndicativo_Tel3());
            ps.setString(16, clien.getTelefono3());
            ps.setString(17, clien.getTipo_Tel3());
            ps.setString(18, clien.getDireccion_Empresa());
            ps.setString(19, clien.getNombre_Empresa());
            ps.setString(20, clien.getEstado());
            ps.setString(21, clien.getFecha_Creado());
            ps.setInt(22, clien.getCiudad());
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
       
    public Clientes ListarId(int Id) {
        Clientes clien = new Clientes();
        String sql = "Select *from clientes cli where cli.IdCliente=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clien.setIdCliente(rs.getInt("cli.IdCliente"));
                clien.setTipoDocumento(rs.getString("cli.TipoDocumento"));
                clien.setDocumento(rs.getString("cli.Documento"));
                clien.setNombre1(rs.getString("cli.Nombre1"));
                clien.setNombre2(rs.getString("cli.Nombre2"));
                clien.setApellido1(rs.getString("cli.Apellido1"));
                clien.setApellido2(rs.getString("cli.Apellido2"));
                clien.setDireccion_Domicilio(rs.getString("cli.Direccion_Domicilio"));
                clien.setEmail(rs.getString("cli.Email"));
                clien.setIndicativo_Tel1(rs.getString("cli.Indicativo_Tel1"));
                clien.setTelefono1(rs.getString("cli.Telefono1"));
                clien.setTipo_Tel1(rs.getString("cli.Tipo_Tel1"));
                clien.setIndicativo_Tel2(rs.getString("cli.Indicativo_Tel2"));
                clien.setTelefono2(rs.getString("cli.Telefono2"));
                clien.setTipo_Tel2(rs.getString("cli.Tipo_Tel2"));
                clien.setIndicativo_Tel3(rs.getString("cli.Indicativo_Tel3"));
                clien.setTelefono3(rs.getString("cli.Telefono3"));
                clien.setTipo_Tel3(rs.getString("cli.Tipo_Tel3"));
                clien.setDireccion_Empresa(rs.getString("Direccion_Empresa"));
                clien.setNombre_Empresa(rs.getString("Nombre_Empresa"));            
                clien.setEstado(rs.getString("cli.Estado"));
                clien.setFecha_Creado(rs.getString("cli.Fecha_Creado"));
                clien.setCiudad(rs.getInt("cli.Ciudad"));

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return clien;
    }
    public Clientes ListarIdTablas(int Id) {
        Clientes clien = new Clientes();
        String sql = "select cli.*, ciu.Nombre from clientes cli INNER JOIN ciudad ciu ON cli.Ciudad = ciu.idCiudad  where IdCliente=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clien.setIdCliente(rs.getInt("IdCliente"));
                clien.setTipoDocumento(rs.getString("TipoDocumento"));
                clien.setDocumento(rs.getString("Documento"));
                clien.setNombre1(rs.getString("cli.Nombre1"));
                clien.setNombre2(rs.getString("cli.Nombre2"));
                clien.setApellido1(rs.getString("cli.Apellido1"));
                clien.setApellido2(rs.getString("cli.Apellido2"));
                clien.setDireccion_Domicilio(rs.getString("Direccion_Domicilio"));
                clien.setEmail(rs.getString("Email"));
                clien.setIndicativo_Tel1(rs.getString("cli.Indicativo_Tel1"));
                clien.setTelefono1(rs.getString("cli.Telefono1"));
                clien.setTipo_Tel1(rs.getString("cli.Tipo_Tel1"));
                clien.setIndicativo_Tel2(rs.getString("cli.Indicativo_Tel2"));
                clien.setTelefono2(rs.getString("cli.Telefono2"));
                clien.setTipo_Tel2(rs.getString("cli.Tipo_Tel2"));
                clien.setIndicativo_Tel3(rs.getString("cli.Indicativo_Tel3"));
                clien.setTelefono3(rs.getString("cli.Telefono3"));
                clien.setTipo_Tel3(rs.getString("cli.Tipo_Tel3"));
                clien.setDireccion_Empresa(rs.getString("Direccion_Empresa"));
                clien.setNombre_Empresa(rs.getString("Nombre_Empresa"));            
                clien.setEstado(rs.getString("Estado"));
                clien.setFecha_Creado(rs.getString("Fecha_Creado"));
               clien.setNombreCiudad(rs.getString("ciu.Nombre"));

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return clien;
    }
    
    public Clientes ListarDocumento(String documento) {
        Clientes clien = new Clientes();
        String sql = "Select *from clientes where Documento=" + documento;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clien.setIdCliente(rs.getInt("IdCliente"));
                clien.setTipoDocumento(rs.getString("TipoDocumento"));
                clien.setDocumento(rs.getString("Documento"));
                clien.setNombre1(rs.getString("Nombre1"));
                clien.setNombre2(rs.getString("Nombre2"));
                clien.setApellido1(rs.getString("Apellido1"));
                clien.setApellido2(rs.getString("Apellido2"));
                clien.setDireccion_Domicilio(rs.getString("Direccion_Domicilio"));
                clien.setEmail(rs.getString("Email"));
                clien.setIndicativo_Tel1(rs.getString("Indicativo_Tel1"));
                clien.setTelefono1(rs.getString("Telefono1"));
                clien.setTipo_Tel1(rs.getString("Tipo_Tel1"));
                clien.setIndicativo_Tel2(rs.getString("Indicativo_Tel2"));
                clien.setTelefono2(rs.getString("Telefono2"));
                clien.setTipo_Tel2(rs.getString("Tipo_Tel2"));
                clien.setIndicativo_Tel3(rs.getString("Indicativo_Tel3"));
                clien.setTelefono3(rs.getString("Telefono3"));
                clien.setTipo_Tel3(rs.getString("Tipo_Tel3"));
                clien.setDireccion_Empresa(rs.getString("Direccion_Empresa"));
                clien.setNombre_Empresa(rs.getString("Nombre_Empresa"));            
                clien.setEstado(rs.getString("Estado"));
                clien.setFecha_Creado(rs.getString("Fecha_Creado"));
                clien.setCiudad(rs.getInt("Ciudad"));

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return clien;
    }
    
    public int actualizar(Clientes clien) {
        int r = 0;
        String sql = "update clientes set TipoDocumento=?, Documento=?, Nombre1=?, Nombre2=?, Apellido1=? ,Apellido2=?, Direccion_Domicilio=?, Email=?,Indicativo_Tel1=?, Telefono1=?, Tipo_Tel1=?, Indicativo_Tel2=?,  Telefono2=? ,Tipo_Tel2=?, Indicativo_Tel3=?, Telefono3=?,Tipo_Tel3=?,  Direccion_Empresa=?, Nombre_Empresa=? ,Estado=? ,Ciudad=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, clien.getTipoDocumento());
            ps.setString(2, clien.getDocumento());
            ps.setString(3, clien.getNombre1());
            ps.setString(4, clien.getNombre2());
            ps.setString(5, clien.getApellido1());
            ps.setString(6, clien.getApellido2());
            ps.setString(7, clien.getDireccion_Domicilio());
            ps.setString(8, clien.getEmail());
            ps.setString(9, clien.getIndicativo_Tel1());
            ps.setString(10, clien.getTelefono1());
            ps.setString(11, clien.getTipo_Tel1());
            ps.setString(12, clien.getIndicativo_Tel2());
            ps.setString(13, clien.getTelefono2());
            ps.setString(14, clien.getTipo_Tel2());
            ps.setString(15, clien.getIndicativo_Tel3());
            ps.setString(16, clien.getTelefono3());
            ps.setString(17, clien.getTipo_Tel3());
            ps.setString(18, clien.getDireccion_Empresa());
            ps.setString(19, clien.getNombre_Empresa());
            ps.setString(20, clien.getEstado());
            ps.setInt(21, clien.getCiudad());
            ps.setInt(22, clien.getIdCliente());
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
      
//       public int eliminar(int id) {
//        int r = 0;
//        String sql = "delete from clientes where IdCliente=" + id;
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            r = ps.executeUpdate();
//            if (r == 1) {
//                return 1;
//            }
//        } catch (Exception e) {
//
//        }finally {
//            try {
//                     con.close();
//            } catch (Exception e) {
//            }
//        }
//        return r;
//    }
    
    public int actualizarEstado(Clientes clien) {
        int r = 0;
        String sql = "update clientes set Estado=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, clien.getEstado());
            ps.setInt(2, clien.getIdCliente());
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
      public String contarclientes() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from clientes";
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
