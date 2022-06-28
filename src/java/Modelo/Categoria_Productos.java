/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.InputStream;

/**
 *
 * @author brayan.daza
 */
public class Categoria_Productos {

    private int IdCategoriaProductos;
    private String Categoria;
    private InputStream Imagen;
    private String Tipo_IVA;
    private int IVA;

    public Categoria_Productos() {
    }

    public Categoria_Productos(int IdCategoriaProductos, String Categoria, InputStream Imagen, String Tipo_IVA, int IVA) {
        this.IdCategoriaProductos = IdCategoriaProductos;
        this.Categoria = Categoria;
        this.Imagen = Imagen;
        this.Tipo_IVA = Tipo_IVA;
        this.IVA = IVA;
    }

    public String getTipo_IVA() {
        return Tipo_IVA;
    }

    public void setTipo_IVA(String Tipo_IVA) {
        this.Tipo_IVA = Tipo_IVA;
    }

    public int getIVA() {
        return IVA;
    }

    public void setIVA(int IVA) {
        this.IVA = IVA;
    }

 

    /**
     * @return the IdCategoriaProductos
     */
    public int getIdCategoriaProductos() {
        return IdCategoriaProductos;
    }

    /**
     * @param IdCategoriaProductos the IdCategoriaProductos to set
     */
    public void setIdCategoriaProductos(int IdCategoriaProductos) {
        this.IdCategoriaProductos = IdCategoriaProductos;
    }

    /**
     * @return the Categoria
     */
    public String getCategoria() {
        return Categoria;
    }

    /**
     * @param Categoria the Categoria to set
     */
    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    /**
     * @return the Imagen
     */
    public InputStream getImagen() {
        return Imagen;
    }

    /**
     * @param Imagen the Imagen to set
     */
    public void setImagen(InputStream Imagen) {
        this.Imagen = Imagen;
    }

}
