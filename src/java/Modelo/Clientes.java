/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Clientes {
    
    private int IdCliente;
    private String TipoDocumento;
    private String Documento;
    private String Nombre1;
    private String Nombre2;
    private String Apellido1;
    private String Apellido2;
    private String Direccion_Domicilio;
    private String Email;
   private String Indicativo_Tel1;
    private String Telefono1;
    private String Tipo_Tel1;
    private String Indicativo_Tel2;
    private String Telefono2;
    private String Tipo_Tel2;
    private String Indicativo_Tel3;
    private String Telefono3;
    private String Tipo_Tel3;
    private String Direccion_Empresa;
    private String Nombre_Empresa;
    private String Estado;
    private String Fecha_Creado;
    private int Ciudad;
    private String NombreCiudad;

    public Clientes() {
    }

    public Clientes(int IdCliente, String TipoDocumento, String Documento, String Nombre1, String Nombre2, String Apellido1, String Apellido2, String Direccion_Domicilio, String Email, String Indicativo_Tel1, String Telefono1, String Tipo_Tel1, String Indicativo_Tel2, String Telefono2, String Tipo_Tel2, String Indicativo_Tel3, String Telefono3, String Tipo_Tel3, String Direccion_Empresa, String Nombre_Empresa, String Estado, String Fecha_Creado, int Ciudad) {
        this.IdCliente = IdCliente;
        this.TipoDocumento = TipoDocumento;
        this.Documento = Documento;
        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
        this.Apellido1 = Apellido1;
        this.Apellido2 = Apellido2;
        this.Direccion_Domicilio = Direccion_Domicilio;
        this.Email = Email;
        this.Indicativo_Tel1 = Indicativo_Tel1;
        this.Telefono1 = Telefono1;
        this.Tipo_Tel1 = Tipo_Tel1;
        this.Indicativo_Tel2 = Indicativo_Tel2;
        this.Telefono2 = Telefono2;
        this.Tipo_Tel2 = Tipo_Tel2;
        this.Indicativo_Tel3 = Indicativo_Tel3;
        this.Telefono3 = Telefono3;
        this.Tipo_Tel3 = Tipo_Tel3;
        this.Direccion_Empresa = Direccion_Empresa;
        this.Nombre_Empresa = Nombre_Empresa;
        this.Estado = Estado;
        this.Fecha_Creado = Fecha_Creado;
        this.Ciudad = Ciudad;
        
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
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

    public String getDireccion_Domicilio() {
        return Direccion_Domicilio;
    }

    public void setDireccion_Domicilio(String Direccion_Domicilio) {
        this.Direccion_Domicilio = Direccion_Domicilio;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
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

    public String getIndicativo_Tel3() {
        return Indicativo_Tel3;
    }

    public void setIndicativo_Tel3(String Indicativo_Tel3) {
        this.Indicativo_Tel3 = Indicativo_Tel3;
    }

    public String getTelefono3() {
        return Telefono3;
    }

    public void setTelefono3(String Telefono3) {
        this.Telefono3 = Telefono3;
    }

    public String getTipo_Tel3() {
        return Tipo_Tel3;
    }

    public void setTipo_Tel3(String Tipo_Tel3) {
        this.Tipo_Tel3 = Tipo_Tel3;
    }

    public String getDireccion_Empresa() {
        return Direccion_Empresa;
    }

    public void setDireccion_Empresa(String Direccion_Empresa) {
        this.Direccion_Empresa = Direccion_Empresa;
    }

    public String getNombre_Empresa() {
        return Nombre_Empresa;
    }

    public void setNombre_Empresa(String Nombre_Empresa) {
        this.Nombre_Empresa = Nombre_Empresa;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getFecha_Creado() {
        return Fecha_Creado;
    }

    public void setFecha_Creado(String Fecha_Creado) {
        this.Fecha_Creado = Fecha_Creado;
    }

    public int getCiudad() {
        return Ciudad;
    }

    public void setCiudad(int Ciudad) {
        this.Ciudad = Ciudad;
    }

    public String getNombreCiudad() {
        return NombreCiudad;
    }

    public void setNombreCiudad(String NombreCiudad) {
        this.NombreCiudad = NombreCiudad;
    }

    
    
    
}
