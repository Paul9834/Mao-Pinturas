/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author brayan.daza
 */
public class DatosEmpresaDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    public DatosEmpresa Listardatosempresa() {
        DatosEmpresa datosemp = new DatosEmpresa();
        String sql = "Select *from Datos_empresa";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                datosemp.setIdDatos_empresa(rs.getInt(1));
                datosemp.setTipo_Documento(rs.getString(2));
                datosemp.setDocumento(rs.getString(3));
                datosemp.setNombre(rs.getString(4));
                datosemp.setDireccion(rs.getString(5));
                datosemp.setTelefono(rs.getString(6));
                datosemp.setEmail(rs.getString(7));
                datosemp.setPorcentaje_Impuesto(rs.getInt(8));
                datosemp.setNombre_Impuesto(rs.getString(9));
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return datosemp;
    }
     public DatosEmpresa ListarId(int Id) {
        DatosEmpresa datosemp = new DatosEmpresa();
        String sql = "Select *from Datos_empresa";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                datosemp.setIdDatos_empresa(rs.getInt(1));
                datosemp.setTipo_Documento(rs.getString(2));
                datosemp.setDocumento(rs.getString(3));
                datosemp.setNombre(rs.getString(4));
                datosemp.setDireccion(rs.getString(5));
                datosemp.setTelefono(rs.getString(6));
                datosemp.setEmail(rs.getString(7));
                datosemp.setPorcentaje_Impuesto(rs.getInt(8));
                datosemp.setNombre_Impuesto(rs.getString(9));
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return datosemp;
    }
      public int actualizar(DatosEmpresa empresa) {
        int r = 0;
        String sql = "update datos_empresa set Tipo_Documento=?, Documento=? , Nombre=? , Direccion=? , Telefono=? , Email=? , Porcentaje_Impuesto=? , Nombre_Impuesto=? where idDatos_empresa=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, empresa.getTipo_Documento());
            ps.setString(2, empresa.getDocumento());
            ps.setString(3, empresa.getNombre());
            ps.setString(4, empresa.getDireccion());
            ps.setString(5, empresa.getTelefono());
            ps.setString(6, empresa.getEmail());
            ps.setInt(7, empresa.getPorcentaje_Impuesto());
            ps.setString(8, empresa.getNombre_Impuesto());
            ps.setInt(9, empresa.getIdDatos_empresa());
            r = ps.executeUpdate();
            
            if (r == 1) {
                System.out.println(r);
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
