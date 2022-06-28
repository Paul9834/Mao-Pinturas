/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class DatosEmpresa {
    
    private int idDatos_empresa;
    private String Tipo_Documento;
    private String Documento;
    private String Nombre;
    private String Direccion;
    private String Telefono;
    private String Email;
    private int Porcentaje_Impuesto;
    private String Nombre_Impuesto;

    public DatosEmpresa() {
    }

    public DatosEmpresa(int idDatos_empresa, String Tipo_Documento, String Documento, String Nombre, String Direccion, String Telefono, String Email, int Porcentaje_Impuesto, String Nombre_Impuesto) {
        this.idDatos_empresa = idDatos_empresa;
        this.Tipo_Documento = Tipo_Documento;
        this.Documento = Documento;
        this.Nombre = Nombre;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Email = Email;
        this.Porcentaje_Impuesto = Porcentaje_Impuesto;
        this.Nombre_Impuesto = Nombre_Impuesto;
    }

    /**
     * @return the idDatos_empresa
     */
    public int getIdDatos_empresa() {
        return idDatos_empresa;
    }

    /**
     * @param idDatos_empresa the idDatos_empresa to set
     */
    public void setIdDatos_empresa(int idDatos_empresa) {
        this.idDatos_empresa = idDatos_empresa;
    }

    /**
     * @return the Tipo_Documento
     */
    public String getTipo_Documento() {
        return Tipo_Documento;
    }

    /**
     * @param Tipo_Documento the Tipo_Documento to set
     */
    public void setTipo_Documento(String Tipo_Documento) {
        this.Tipo_Documento = Tipo_Documento;
    }

    /**
     * @return the Documento
     */
    public String getDocumento() {
        return Documento;
    }

    /**
     * @param Documento the Documento to set
     */
    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Direccion
     */
    public String getDireccion() {
        return Direccion;
    }

    /**
     * @param Direccion the Direccion to set
     */
    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    /**
     * @return the Telefono
     */
    public String getTelefono() {
        return Telefono;
    }

    /**
     * @param Telefono the Telefono to set
     */
    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return the Porcentaje_Impuesto
     */
    public int getPorcentaje_Impuesto() {
        return Porcentaje_Impuesto;
    }

    /**
     * @param Porcentaje_Impuesto the Porcentaje_Impuesto to set
     */
    public void setPorcentaje_Impuesto(int Porcentaje_Impuesto) {
        this.Porcentaje_Impuesto = Porcentaje_Impuesto;
    }

    /**
     * @return the Nombre_Impuesto
     */
    public String getNombre_Impuesto() {
        return Nombre_Impuesto;
    }

    /**
     * @param Nombre_Impuesto the Nombre_Impuesto to set
     */
    public void setNombre_Impuesto(String Nombre_Impuesto) {
        this.Nombre_Impuesto = Nombre_Impuesto;
    }
    
}