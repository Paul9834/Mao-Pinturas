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
public class CiudadDAO {
    
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
     public Ciudad ListarId(int Id) {
        Ciudad ciu = new Ciudad();
        String sql = "Select *from ciudad where idCiudad=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ciu.setIdCiudad(rs.getInt(1));
                ciu.setNombre(rs.getString(2));
                ciu.setPais(rs.getInt(3));

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return ciu;
    }

    public List listarCiudades() {
        String sql = "select * from ciudad ORDER BY Nombre;";
        List<Ciudad> ciu = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
            Ciudad ciudad = new Ciudad();
              ciudad.setIdCiudad(rs.getInt("idCiudad"));
              ciudad.setNombre(rs.getNString("Nombre"));
             
            ciu.add(ciudad);
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return ciu;

    }
}
