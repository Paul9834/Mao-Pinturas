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
public class ProveedoresDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List listar() {

        String sql = " SELECT prov.*, ciu.Nombre FROM proveedores prov INNER JOIN ciudad ciu ON prov.Ciudad = ciu.idCiudad";

        List<Proveedores> lista = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Proveedores prov = new Proveedores();

                prov.setIdProveedores(rs.getInt("idProveedores"));
                prov.setNombres(rs.getString("Nombres"));
                prov.setIndicativo_Tel1(rs.getString("Indicativo_Tel1"));
                prov.setTelefono1(rs.getString("Telefono1"));
                prov.setTipo_Tel1(rs.getString("Tipo_Tel1"));
                prov.setIndicativo_Tel2(rs.getString("Indicativo_Tel2"));
                prov.setTelefono2(rs.getString("Telefono2"));
                prov.setTipo_Tel2(rs.getString("Tipo_Tel2"));
                prov.setDireccion(rs.getString("Direccion"));
                prov.setEmail(rs.getString("Email"));
                prov.setNombreCiudad(rs.getString("ciu.Nombre"));
                prov.setEstado(rs.getString("Estado"));

                lista.add(prov);

       
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

    public int agregar(Proveedores prov) {
        String sql = "insert into proveedores (Nombres, Indicativo_Tel1, Telefono1, Tipo_Tel1 ,Indicativo_Tel2, Telefono2, Tipo_Tel2, Direccion,Email,Ciudad,Estado)values(?,?,?,?,?,?,?,?,?,?,?)";
        int res = 0;
        try {

            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, prov.getNombres());
            ps.setString(2, prov.getIndicativo_Tel1());
            ps.setString(3, prov.getTelefono1());
            ps.setString(4, prov.getTipo_Tel1());
            ps.setString(5, prov.getIndicativo_Tel2());
            ps.setString(6, prov.getTelefono2());
            ps.setString(7, prov.getTipo_Tel2());
            ps.setString(8, prov.getDireccion());
            ps.setString(9, prov.getEmail());
            ps.setInt(10, prov.getCiudad());
            ps.setString(11, prov.getEstado());
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

    public Proveedores ListarId(int Id) {
        Proveedores prov = new Proveedores();
        String sql = "Select *from proveedores where idProveedores=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setIdProveedores(rs.getInt("idProveedores"));
                prov.setNombres(rs.getString("Nombres"));
                 prov.setIndicativo_Tel1(rs.getString("Indicativo_Tel1"));
                prov.setTelefono1(rs.getString("Telefono1"));
                prov.setTipo_Tel1(rs.getString("Tipo_Tel1"));
                prov.setIndicativo_Tel2(rs.getString("Indicativo_Tel2"));
                prov.setTelefono2(rs.getString("Telefono2"));
                prov.setTipo_Tel2(rs.getString("Tipo_Tel2"));
                prov.setDireccion(rs.getString("Direccion"));
                prov.setEmail(rs.getString("Email"));
                prov.setCiudad(rs.getInt("Ciudad"));
                prov.setEstado(rs.getString("Estado"));
                con.close();
            }
        } catch (Exception e) {
        }
        return prov;
    }
    public Proveedores ListarIdTablas(int Id) {
        Proveedores prov = new Proveedores();
        String sql = "Select prov.*, ciu.Nombre from proveedores prov INNER JOIN ciudad ciu ON prov.Ciudad= ciu.idCiudad where idProveedores=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setIdProveedores(rs.getInt("idProveedores"));
                prov.setNombres(rs.getString("Nombres"));
              prov.setIndicativo_Tel1(rs.getString("Indicativo_Tel1"));
                prov.setTelefono1(rs.getString("Telefono1"));
                prov.setTipo_Tel1(rs.getString("Tipo_Tel1"));
                prov.setIndicativo_Tel2(rs.getString("Indicativo_Tel2"));
                prov.setTelefono2(rs.getString("Telefono2"));
                prov.setTipo_Tel2(rs.getString("Tipo_Tel2"));
                prov.setDireccion(rs.getString("Direccion"));
                prov.setDireccion(rs.getString("Email"));
                prov.setNombreCiudad(rs.getString("ciu.Nombre"));
                  prov.setEstado("Estado");
                con.close();
            }
        } catch (Exception e) {
        }
        return prov;
    }

    public int actualizar(Proveedores prov) {
        int r = 0;
        String sql = "update proveedores set Nombres=?, Indicativo_Tel1=?, Telefono1=?,Tipo_Tel1=?,Indicativo_Tel2=?, Telefono2=?,Tipo_Tel2=?, Direccion=?, Email=?,Ciudad=?, Estado=? where idProveedores=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, prov.getNombres());
            ps.setString(2, prov.getIndicativo_Tel1());
            ps.setString(3, prov.getTelefono1());
            ps.setString(4, prov.getTipo_Tel1());
            ps.setString(5, prov.getIndicativo_Tel2());
            ps.setString(6, prov.getTelefono2());
            ps.setString(7, prov.getTipo_Tel2());
            ps.setString(8, prov.getDireccion());
            ps.setString(9, prov.getEmail());
            ps.setInt(10, prov.getCiudad());
            ps.setString(11, prov.getEstado());
            ps.setInt(12, prov.getIdProveedores());
            r = ps.executeUpdate();
            if (r == 1) {
                return 1;
            }
            con.close();
        } catch (Exception e) {
        }
        return r;
    }

//    public int eliminar(int id) {
//        int r = 0;
//        String sql = "delete from proveedores where idProveedores=" + id;
//        try {
//            con = cn.Conexion();
//            ps = con.prepareStatement(sql);
//            r = ps.executeUpdate();
//            if (r == 1) {
//                return 1;
//            }
//            con.close();
//        } catch (Exception e) {
//
//        }
//        return r;
//    }

     public int actualizarEstado(Proveedores prov) {
        int r = 0;
        String sql = "update proveedores set Estado=? where idProveedores=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, prov.getEstado());
            ps.setInt(2, prov.getIdProveedores());
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
    
    public String contarproveedoress() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from proveedores";
        String Can = null;
        try {
            con = cn.Conexion();
            Statement consulta = con.createStatement();
            cantidad = consulta.executeQuery(sql);

            if (cantidad.next()) {
                Can = cantidad.getString("CANTIDAD");

            }
            con.close();
        } catch (Exception e) {

        }
        return Can;
    }

}
