/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Proveedores {
    private int idProveedores;
    private String Nombres;
    private String Indicativo_Tel1;
    private String Telefono1;
    private String Tipo_Tel1;
    private String Indicativo_Tel2;
    private String Telefono2;
    private String Tipo_Tel2;
    private String Direccion;
    private String Email;
    private String Estado;
    private int Ciudad;
    private String NombreCiudad;

    public Proveedores() {
    }

    public Proveedores(int idProveedores, String Nombres, String Indicativo_Tel1, String Telefono1, String Tipo_Tel1, String Indicativo_Tel2, String Telefono2, String Tipo_Tel2, String Direccion, String Email, String Estado, int Ciudad, String NombreCiudad) {
        this.idProveedores = idProveedores;
        this.Nombres = Nombres;
        this.Indicativo_Tel1 = Indicativo_Tel1;
        this.Telefono1 = Telefono1;
        this.Tipo_Tel1 = Tipo_Tel1;
        this.Indicativo_Tel2 = Indicativo_Tel2;
        this.Telefono2 = Telefono2;
        this.Tipo_Tel2 = Tipo_Tel2;
        this.Direccion = Direccion;
        this.Email = Email;
        this.Estado = Estado;
        this.Ciudad = Ciudad;
        this.NombreCiudad = NombreCiudad;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }




    public int getIdProveedores() {
        return idProveedores;
    }

    public void setIdProveedores(int idProveedores) {
        this.idProveedores = idProveedores;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
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

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
}
