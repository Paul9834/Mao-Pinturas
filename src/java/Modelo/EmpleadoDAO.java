/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.math.BigInteger;
import java.security.MessageDigest;
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
public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
     public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public Empleado validar(String user, String Pass) {

        Empleado em = new Empleado();
        String sql = "select * from empleado where Usuario=? and Password=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, getMD5(Pass));
            System.out.println(user);
            System.out.println(getMD5(Pass));
            rs = ps.executeQuery();

            while (rs.next()) {

                em.setIdEmpleado(rs.getInt("IdEmpleado"));
                em.setTipoDocumento(rs.getString("TipoDocumento"));
                em.setDocumento(rs.getString("Documento"));
                em.setNombre1(rs.getString("Nombre1"));
                em.setApellido1(rs.getString("Apellido1"));
                em.setNombre2(rs.getString("Nombre2"));
                em.setApellido2(rs.getString("Apellido2"));
                em.setTelefono1(rs.getString("Telefono1"));
                em.setEstado(rs.getString("Estado"));
                em.setGenero(rs.getString("Genero"));
                em.setUsuario(rs.getString("Usuario"));
                em.setTipoEmpleado(rs.getString("TipoEmpleado"));
            }

        } catch (Exception e) {

        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return em;
    }

    //Operaciones Crud
    public List listar() {
        String sql = "select emple.*,ciu.Nombre from empleado emple INNER JOIN ciudad ciu ON emple.Ciudad = ciu.idCiudad where emple.Estado='Activo' OR  emple.Estado='Inactivo'";
             
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Empleado em = new Empleado();

                em.setIdEmpleado(rs.getInt("emple.IdEmpleado"));
                em.setTipoDocumento(rs.getString("emple.TipoDocumento"));
                em.setDocumento(rs.getString("emple.Documento"));
                em.setNombre1(rs.getString("emple.Nombre1"));
                em.setNombre2(rs.getString("emple.Nombre2"));
                em.setApellido1(rs.getString("emple.Apellido1"));
                em.setApellido2(rs.getString("emple.Apellido2"));
                em.setIndicativo_Tel1(rs.getString("emple.Indicativo_Tel1"));
                em.setTelefono1(rs.getString("emple.Telefono1"));
                em.setTipo_Tel1(rs.getString("emple.Tipo_Tel1"));
                em.setIndicativo_Tel2(rs.getString("emple.Indicativo_Tel2"));
                em.setTelefono2(rs.getString("emple.Telefono2"));
                em.setTipo_Tel2(rs.getString("emple.Tipo_Tel2"));
                em.setEstado(rs.getString("emple.Estado"));
                em.setGenero(rs.getString("emple.Genero"));
                em.setTipoEmpleado(rs.getString("emple.TipoEmpleado"));
                em.setDireccion(rs.getString("emple.Direccion"));
                em.setEmail(rs.getString("emple.Email"));
                em.setFecha_Creacion(rs.getString("emple.Fecha_Creacion"));
                em.setNombreCiudad(rs.getString("ciu.Nombre"));
                lista.add(em);
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
    public List listarempleados() {
        String sql = "select emple.*,ciu.Nombre from empleado emple INNER JOIN ciudad ciu ON emple.Ciudad = ciu.idCiudad where emple.TipoEmpleado='Almacenista' AND emple.Estado='Activo'";
             
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Empleado em = new Empleado();

                    em.setIdEmpleado(rs.getInt("emple.IdEmpleado"));
                em.setTipoDocumento(rs.getString("emple.TipoDocumento"));
                em.setDocumento(rs.getString("emple.Documento"));
                em.setNombre1(rs.getString("emple.Nombre1"));
                em.setNombre2(rs.getString("emple.Nombre2"));
                em.setApellido1(rs.getString("emple.Apellido1"));
                em.setApellido2(rs.getString("emple.Apellido2"));
                em.setIndicativo_Tel1(rs.getString("emple.Indicativo_Tel1"));
                em.setTelefono1(rs.getString("emple.Telefono1"));
                em.setTipo_Tel1(rs.getString("emple.Tipo_Tel1"));
                em.setIndicativo_Tel1(rs.getString("emple.Indicativo_Tel2"));
                em.setTelefono1(rs.getString("emple.Telefono2"));
                em.setTipo_Tel1(rs.getString("emple.Tipo_Tel2"));
                em.setEstado(rs.getString("emple.Estado"));
                em.setGenero(rs.getString("emple.Genero"));
                em.setTipoEmpleado(rs.getString("emple.TipoEmpleado"));
                em.setDireccion(rs.getString("emple.Direccion"));
                em.setDireccion(rs.getString("emple.Email"));
                em.setFecha_Creacion(rs.getString("emple.Fecha_Creacion"));
                em.setNombreCiudad(rs.getString("ciu.Nombre"));
                lista.add(em);
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

    public List listarTipoUser() {
        String sql = "select emple.*,ciu.Nombre from empleado emple INNER JOIN ciudad ciu ON emple.Ciudad = ciu.idCiudad where Estado='Pendiente'";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Empleado em = new Empleado();

                em.setIdEmpleado(rs.getInt("emple.IdEmpleado"));
                em.setTipoDocumento(rs.getString("emple.TipoDocumento"));
                em.setDocumento(rs.getString("emple.Documento"));
                em.setNombre1(rs.getString("emple.Nombre1"));
                em.setNombre2(rs.getString("emple.Nombre2"));
                em.setApellido1(rs.getString("emple.Apellido1"));
                em.setApellido2(rs.getString("emple.Apellido2"));
                em.setIndicativo_Tel1(rs.getString("emple.Indicativo_Tel1"));
                em.setTelefono1(rs.getString("emple.Telefono1"));
                em.setTipo_Tel1(rs.getString("emple.Tipo_Tel1"));
                em.setIndicativo_Tel1(rs.getString("emple.Indicativo_Tel2"));
                em.setTelefono1(rs.getString("emple.Telefono2"));
                em.setTipo_Tel1(rs.getString("emple.Tipo_Tel2"));
                em.setEstado(rs.getString("emple.Estado"));
                em.setGenero(rs.getString("emple.Genero"));
                em.setTipoEmpleado(rs.getString("emple.TipoEmpleado"));
                em.setDireccion(rs.getString("emple.Direccion"));
                em.setEmail(rs.getString("emple.Email"));
                em.setFecha_Creacion(rs.getString("emple.Fecha_Creacion"));
                em.setNombreCiudad(rs.getString("ciu.Nombre"));
                lista.add(em);

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

    public int agregar(Empleado em) {
        String sql = "insert into empleado(TipoDocumento,Documento,Nombre1,Nombre2,Apellido1,Apellido2,Estado,Genero,TipoEmpleado,Usuario,Password,Indicativo_Tel1,Telefono1,Tipo_Tel1,Indicativo_Tel2,Telefono2,Tipo_Tel2,Direccion,Email,Fecha_Creacion,Ciudad)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int res = 0;
        try {
           
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, em.getTipoDocumento());
            ps.setString(2, em.getDocumento());
            ps.setString(3, em.getNombre1());
            ps.setString(4, em.getNombre2());
            ps.setString(5, em.getApellido1());
            ps.setString(6, em.getApellido2());
            ps.setString(7, em.getEstado());
            ps.setString(8, em.getGenero());
            ps.setString(9, em.getTipoEmpleado());
            ps.setString(10, em.getUsuario());
            ps.setString(11, getMD5( em.getPassword()));
            ps.setString(12, em.getIndicativo_Tel1());
            ps.setString(13, em.getTelefono1());
            ps.setString(14, em.getTipo_Tel1());
            ps.setString(15, em.getIndicativo_Tel2());
            ps.setString(16, em.getTelefono2());
            ps.setString(17, em.getTipo_Tel2());
            ps.setString(18, em.getDireccion());
            ps.setString(19, em.getEmail());
            ps.setString(20, em.getFecha_Creacion());
            ps.setInt(21, em.getCiudad());
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
 
    public Empleado ListarId(int Id) {
        Empleado emp = new Empleado();
        String sql = "Select *from empleado where IdEmpleado=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdEmpleado(rs.getInt("IdEmpleado"));
                emp.setTipoDocumento(rs.getString("TipoDocumento"));
                emp.setDocumento(rs.getString("Documento"));
                emp.setNombre1(rs.getString("Nombre1"));
                emp.setApellido1(rs.getString("Apellido1"));
                emp.setNombre2(rs.getString("Nombre2"));
                emp.setApellido2(rs.getString("Apellido2"));
                emp.setIndicativo_Tel1(rs.getString("Indicativo_Tel1"));
                emp.setTelefono1(rs.getString("Telefono1"));
                emp.setTipo_Tel1(rs.getString("Tipo_Tel1"));
                emp.setIndicativo_Tel2(rs.getString("Indicativo_Tel2"));
                emp.setTelefono2(rs.getString("Telefono2"));
                emp.setTipo_Tel2(rs.getString("Tipo_Tel2"));
                emp.setTipoEmpleado(rs.getString("TipoEmpleado"));
                emp.setEstado(rs.getString("Estado"));
                emp.setGenero(rs.getString("Genero"));
                emp.setEmail(rs.getString("Email"));
                emp.setDireccion(rs.getString("Direccion"));
                emp.setCiudad(rs.getInt("Ciudad"));
                

            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return emp;
    }
    public int ListarDocumento(String Documento) {
        Empleado emp = new Empleado();
        int r=0;
        String sql = "Select *from empleado where Documento=" + Documento;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdEmpleado(rs.getInt("IdEmpleado"));
                emp.setTipoDocumento(rs.getString("TipoDocumento"));
                emp.setDocumento(rs.getString("Documento"));
                emp.setNombre1(rs.getString("Nombre1"));

                if (emp.getNombre1()!=null) {
                    r=1;
                    return r;
                }
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
    public Empleado ListarIdtablas(int Id) {

        Empleado emp = new Empleado();
        String sql = "Select emp.*,ciu.Nombre from empleado emp INNER JOIN ciudad ciu ON emp.Ciudad = ciu.idCiudad where emp.IdEmpleado=" + Id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdEmpleado(rs.getInt("emp.IdEmpleado"));
                emp.setTipoDocumento(rs.getString("emp.TipoDocumento"));
                emp.setDocumento(rs.getString("emp.Documento"));
                emp.setNombre1(rs.getString("emp.Nombre1"));
                emp.setApellido1(rs.getString("emp.Apellido1"));
                emp.setNombre2(rs.getString("emp.Nombre2"));
                emp.setApellido2(rs.getString("emp.Apellido2"));
                emp.setIndicativo_Tel1(rs.getString("emp.Indicativo_Tel1"));
                emp.setTelefono1(rs.getString("emp.Telefono1"));
                emp.setTipo_Tel1(rs.getString("emp.Tipo_Tel1"));
                emp.setIndicativo_Tel2(rs.getString("emp.Indicativo_Tel2"));
                emp.setTelefono2(rs.getString("emp.Telefono2"));
                emp.setTipo_Tel2(rs.getString("emp.Tipo_Tel2"));
                emp.setEstado(rs.getString("emp.Estado"));
                emp.setTipoEmpleado(rs.getString("emp.TipoEmpleado"));
                emp.setGenero(rs.getString("emp.Genero"));
                emp.setEmail(rs.getString("emp.Email"));
                emp.setDireccion(rs.getString("emp.Direccion"));
                emp.setFecha_Creacion(rs.getString("Fecha_Creacion"));
                emp.setNombreCiudad(rs.getString("ciu.Nombre"));
            }
        } catch (Exception e) {
        }finally {
            try {
                     con.close();
            } catch (Exception e) {
            }
        }
        return emp;
    }

    public int actualizar(Empleado em) {
        int r = 0;
        String sql = "update empleado set TipoDocumento=?, Documento=?, Nombre1=?, Nombre2=?, Apellido1=?, Apellido2=?,Estado=?,Genero=?,TipoEmpleado=?,Indicativo_Tel1=?,Telefono1=?,Tipo_Tel1=?,Indicativo_Tel2=?,Telefono2=?,Tipo_Tel2=?,Direccion=?,Email=?,Ciudad=? where IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getTipoDocumento());
            ps.setString(2, em.getDocumento());
            ps.setString(3, em.getNombre1());
            ps.setString(4, em.getNombre2());
            ps.setString(5, em.getApellido1());
            ps.setString(6, em.getApellido2());
            ps.setString(7, em.getEstado());
            ps.setString(8, em.getGenero());
            ps.setString(9, em.getTipoEmpleado());
            ps.setString(10, em.getIndicativo_Tel1());
            ps.setString(11, em.getTelefono1());
            ps.setString(12, em.getTipo_Tel1());
            ps.setString(13, em.getIndicativo_Tel2());
            ps.setString(14, em.getTelefono2());
            ps.setString(15, em.getTipo_Tel2());
            ps.setString(16, em.getDireccion());
            ps.setString(17, em.getEmail());
            ps.setInt(18, em.getCiudad());
            ps.setInt(19, em.getIdEmpleado());
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

    public int actualizarEstado(Empleado em) {
        int r = 0;
        String sql = "update empleado set Estado=? where IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, em.getEstado());
            ps.setInt(2, em.getIdEmpleado());
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
        String sql = "delete from empleado where IdEmpleado=" + id;
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
    public String contarempleados() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from empleado where TipoEmpleado='Cajero'";
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

    public String contaradmin() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from empleado where TipoEmpleado='Administrador'";
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

    public String contarAlmacenista() {

        ResultSet cantidad = null;
        String sql = "select count(*)AS CANTIDAD from empleado where TipoEmpleado='Almacenista'";
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
