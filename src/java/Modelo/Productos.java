/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Productos {

    private int IdProductos;
    private String Nombre;
    private String Descripcion;
    private String Marca;
    private int Cantidad;
    private int Tope_Min;
    private int Tope_Max;
    private String Codigo_Barras;
    private double Precio_Compra;
    private double Precio_Venta;
    private String Fecha_Registrado;
    private String Fecha_Vencimiento;
    private String Estado;
    private int Usuario_Registra;
    private int Categoria_Productos;
    private String Usuario;
    private String Categoria;
    private String Tipo_IVA;
    private int IVA;

    public Productos() {
    }

    public Productos(int IdProductos, String Nombre, String Descripcion, String Marca, int Cantidad, int Tope_Min, int Tope_Max, String Codigo_Barras, double Precio_Compra, double Precio_Venta, String Fecha_Registrado, String Fecha_Vencimiento, String Estado, int Usuario_Registra, int Categoria_Productos, String Usuario, String Categoria) {
        this.IdProductos = IdProductos;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Marca = Marca;
        this.Cantidad = Cantidad;
        this.Tope_Min = Tope_Min;
        this.Tope_Max = Tope_Max;
        this.Codigo_Barras = Codigo_Barras;
        this.Precio_Compra = Precio_Compra;
        this.Precio_Venta = Precio_Venta;
        this.Fecha_Registrado = Fecha_Registrado;
        this.Fecha_Vencimiento = Fecha_Vencimiento;
        this.Estado = Estado;
        this.Usuario_Registra = Usuario_Registra;
        this.Categoria_Productos = Categoria_Productos;
        this.Usuario = Usuario;
        this.Categoria = Categoria;
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

    
    public int getIdProductos() {
        return IdProductos;
    }

    public void setIdProductos(int IdProductos) {
        this.IdProductos = IdProductos;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getTope_Min() {
        return Tope_Min;
    }

    public void setTope_Min(int Tope_Min) {
        this.Tope_Min = Tope_Min;
    }

    public int getTope_Max() {
        return Tope_Max;
    }

    public void setTope_Max(int Tope_Max) {
        this.Tope_Max = Tope_Max;
    }

    public String getCodigo_Barras() {
        return Codigo_Barras;
    }

    public void setCodigo_Barras(String Codigo_Barras) {
        this.Codigo_Barras = Codigo_Barras;
    }

    public double getPrecio_Compra() {
        return Precio_Compra;
    }

    public void setPrecio_Compra(double Precio_Compra) {
        this.Precio_Compra = Precio_Compra;
    }

    public double getPrecio_Venta() {
        return Precio_Venta;
    }

    public void setPrecio_Venta(double Precio_Venta) {
        this.Precio_Venta = Precio_Venta;
    }

    public String getFecha_Registrado() {
        return Fecha_Registrado;
    }

    public void setFecha_Registrado(String Fecha_Registrado) {
        this.Fecha_Registrado = Fecha_Registrado;
    }

    public String getFecha_Vencimiento() {
        return Fecha_Vencimiento;
    }

    public void setFecha_Vencimiento(String Fecha_Vencimiento) {
        this.Fecha_Vencimiento = Fecha_Vencimiento;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public int getUsuario_Registra() {
        return Usuario_Registra;
    }

    public void setUsuario_Registra(int Usuario_Registra) {
        this.Usuario_Registra = Usuario_Registra;
    }

    public int getCategoria_Productos() {
        return Categoria_Productos;
    }

    public void setCategoria_Productos(int Categoria_Productos) {
        this.Categoria_Productos = Categoria_Productos;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

}