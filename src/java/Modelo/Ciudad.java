/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Ciudad {
    
    private int IdCiudad;
    private String Nombre;
    private int Pais;

    public Ciudad() {
    }

    public Ciudad(int IdCiudad, String Nombre, int Pais) {
        this.IdCiudad = IdCiudad;
        this.Nombre = Nombre;
        this.Pais = Pais;
    }

    /**
     * @return the IdCiudad
     */
    public int getIdCiudad() {
        return IdCiudad;
    }

    /**
     * @param IdCiudad the IdCiudad to set
     */
    public void setIdCiudad(int IdCiudad) {
        this.IdCiudad = IdCiudad;
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
     * @return the Pais
     */
    public int getPais() {
        return Pais;
    }

    /**
     * @param Pais the Pais to set
     */
    public void setPais(int Pais) {
        this.Pais = Pais;
    }
    
    
    
}
