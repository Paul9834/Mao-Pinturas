/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Empleado {

    private int IdEmpleado;
    private String TipoDocumento;
    private String Documento;
    private String Nombre1;
    private String Nombre2;
    private String Apellido1;
    private String Apellido2;
    private String Estado;
    private String Genero;
    private String TipoEmpleado;
    private String Usuario;
    private String Password;
    private String Indicativo_Tel1;
    private String Telefono1;
    private String Tipo_Tel1;
    private String Indicativo_Tel2;
    private String Telefono2;
    private String Tipo_Tel2;
    private String Direccion;
    private String Email;
    private String Fecha_Creacion;
    private int Ciudad;
    private String NombreCiudad;

    public Empleado() {
    }

    public Empleado(int IdEmpleado, String TipoDocumento, String Documento, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Estado, String Genero, String TipoEmpleado, String Usuario, String Password, String Indicativo_Tel1, String Telefono1, String Tipo_Tel1, String Indicativo_Tel2, String Telefono2, String Tipo_Tel2, String Direccion, String Email, String Fecha_Creacion, int Ciudad) {
        this.IdEmpleado = IdEmpleado;
        this.TipoDocumento = TipoDocumento;
        this.Documento = Documento;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Estado = Estado;
        this.Genero = Genero;
        this.TipoEmpleado = TipoEmpleado;
        this.Usuario = Usuario;
        this.Password = Password;
        this.Indicativo_Tel1 = Indicativo_Tel1;
        this.Telefono1 = Telefono1;
        this.Tipo_Tel1 = Tipo_Tel1;
        this.Indicativo_Tel2 = Indicativo_Tel2;
        this.Telefono2 = Telefono2;
        this.Tipo_Tel2 = Tipo_Tel2;
        this.Direccion = Direccion;
        this.Email = Email;
        this.Fecha_Creacion = Fecha_Creacion;
        this.Ciudad = Ciudad;
    }

    public String getNombreCiudad() {
        return NombreCiudad;
    }

    public void setNombreCiudad(String NombreCiudad) {
        this.NombreCiudad = NombreCiudad;
    }

    public int getIdEmpleado() {
        return IdEmpleado;
    }

    public void setIdEmpleado(int IdEmpleado) {
        this.IdEmpleado = IdEmpleado;
    }

    public String getTipoDocumento() {
        return TipoDocumento;
    }

    public void setTipoDocumento(String TipoDocumento) {
        this.TipoDocumento = TipoDocumento;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getNombre1() {
        return Nombre1;
    }

    public void setNombre1(String Nombre1) {
        this.Nombre1 = Nombre1;
    }

    public String getNombre2() {
        return Nombre2;
    }

    public void setNombre2(String Nombre2) {
        this.Nombre2 = Nombre2;
    }

    public String getApellido1() {
        return Apellido1;
    }

    public void setApellido1(String Apellido1) {
        this.Apellido1 = Apellido1;
    }

    public String getApellido2() {
        return Apellido2;
    }

    public void setApellido2(String Apellido2) {
        this.Apellido2 = Apellido2;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getTipoEmpleado() {
        return TipoEmpleado;
    }

    public void setTipoEmpleado(String TipoEmpleado) {
        this.TipoEmpleado = TipoEmpleado;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getIndicativo_Tel1() {
        return Indicativo_Tel1;
    }

    public void setIndicativo_Tel1(String Indicativo_Tel1) {
        this.Indicativo_Tel1 = Indicativo_Tel1;
    }

    public String getTelefono1() {
        return Telefono1;
    }

    public void setTelefono1(String Telefono1) {
        this.Telefono1 = Telefono1;
    }

    public String getTipo_Tel1() {
        return Tipo_Tel1;
    }

    public void setTipo_Tel1(String Tipo_Tel1) {
        this.Tipo_Tel1 = Tipo_Tel1;
    }

    public String getIndicativo_Tel2() {
        return Indicativo_Tel2;
    }

    public void setIndicativo_Tel2(String Indicativo_Tel2) {
        this.Indicativo_Tel2 = Indicativo_Tel2;
    }

    public String getTelefono2() {
        return Telefono2;
    }

    public void setTelefono2(String Telefono2) {
        this.Telefono2 = Telefono2;
    }

    public String getTipo_Tel2() {
        return Tipo_Tel2;
    }

    public void setTipo_Tel2(String Tipo_Tel2) {
        this.Tipo_Tel2 = Tipo_Tel2;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFecha_Creacion() {
        return Fecha_Creacion;
    }

    public void setFecha_Creacion(String Fecha_Creacion) {
        this.Fecha_Creacion = Fecha_Creacion;
    }

    public int getCiudad() {
        return Ciudad;
    }

    public void setCiudad(int Ciudad) {
        this.Ciudad = Ciudad;
    }

}