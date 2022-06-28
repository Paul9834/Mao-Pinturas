/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Detalle_Ventas {

    private int IdDetalle_Ventas;
    private String Codigo_Producto;
    private String Nombre_Producto;
    private int Cantidad_Producto;
    private double Subtotal;
    private double Valor_unitario;
    private double Valor_Productos;
    private int Productos;
    private int item;
    private int Venta;
    private double IVA;
    private int porcentajeIVA;
    
    
    public Detalle_Ventas() {
    }

    public Detalle_Ventas(int IdDetalle_Ventas, String Codigo_Producto, String Nombre_Producto, int Cantidad_Producto, double Subtotal, double Valor_Productos, int Productos, int Venta) {
        this.IdDetalle_Ventas = IdDetalle_Ventas;
        this.Codigo_Producto = Codigo_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
        this.Subtotal = Subtotal;
        this.Valor_Productos = Valor_Productos;
        this.Productos = Productos;
        this.Venta = Venta;
    }

    public double getIVA() {
        return IVA;
    }

    public int getPorcentajeIVA() {
        return porcentajeIVA;
    }

    public void setPorcentajeIVA(int porcentajeIVA) {
        this.porcentajeIVA = porcentajeIVA;
    }

    public void setIVA(double IVA) {
        this.IVA = IVA;
    }

    public double getValor_unitario() {
        return Valor_unitario;
    }

    public void setValor_unitario(double Valor_unitario) {
        this.Valor_unitario = Valor_unitario;
    }

    /**
     * @return the IdDetalle_Ventas
     */
    public int getIdDetalle_Ventas() {
        return IdDetalle_Ventas;
    }

    /**
     * @param IdDetalle_Ventas the IdDetalle_Ventas to set
     */
    public void setIdDetalle_Ventas(int IdDetalle_Ventas) {
        this.IdDetalle_Ventas = IdDetalle_Ventas;
    }

    /**
     * @return the Codigo_Producto
     */
    public String getCodigo_Producto() {
        return Codigo_Producto;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getItem() {
        return item;
    }

    /**
     * @param Codigo_Producto the Codigo_Producto to set
     */
    public void setCodigo_Producto(String Codigo_Producto) {
        this.Codigo_Producto = Codigo_Producto;
    }

    /**
     * @return the Nombre_Producto
     */
    public String getNombre_Producto() {
        return Nombre_Producto;
    }

    /**
     * @param Nombre_Producto the Nombre_Producto to set
     */
    public void setNombre_Producto(String Nombre_Producto) {
        this.Nombre_Producto = Nombre_Producto;
    }

    /**
     * @return the Cantidad_Producto
     */
    public int getCantidad_Producto() {
        return Cantidad_Producto;
    }

    /**
     * @param Cantidad_Producto the Cantidad_Producto to set
     */
    public void setCantidad_Producto(int Cantidad_Producto) {
        this.Cantidad_Producto = Cantidad_Producto;
    }

    /**
     * @return the Subtotal
     */
    public double getSubtotal() {
        return Subtotal;
    }

    /**
     * @param Subtotal the Subtotal to set
     */
    public void setSubtotal(double Subtotal) {
        this.Subtotal = Subtotal;
    }

    /**
     * @return the Valor_Productos
     */
    public double getValor_Productos() {
        return Valor_Productos;
    }

    /**
     * @param Valor_Productos the Valor_Productos to set
     */
    public void setValor_Productos(double Valor_Productos) {
        this.Valor_Productos = Valor_Productos;
    }

    /**
     * @return the Productos
     */
    public int getProductos() {
        return Productos;
    }

    /**
     * @param Productos the Productos to set
     */
    public void setProductos(int Productos) {
        this.Productos = Productos;
    }

    /**
     * @return the Venta
     */
    public int getVenta() {
        return Venta;
    }

    /**
     * @param Venta the Venta to set
     */
    public void setVenta(int Venta) {
        this.Venta = Venta;
    }

    
}