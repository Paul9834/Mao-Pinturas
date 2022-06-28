/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class DetallePedidosProveedor {

    int idDetallePedidos;
    int PedidosProveedor;
    int Productos;
    double Valor_Unitario;
    double Valor_Productos;
    int Cantidad_Productos;
    String CodigoProducto;
    String NombreProducto;
    double Subtotal;
    double IVA;
    int porcentajeIVA;
    int item;

    public DetallePedidosProveedor() {
    }

    public DetallePedidosProveedor(int idDetallePedidos, int PedidosProveedor, int Productos, double Valor_Productos, int Cantidad_Productos) {
        this.idDetallePedidos = idDetallePedidos;
        this.PedidosProveedor = PedidosProveedor;
        this.Productos = Productos;
        this.Valor_Productos = Valor_Productos;
        this.Cantidad_Productos = Cantidad_Productos;
    }

    public int getIdDetallePedidos() {
        return idDetallePedidos;
    }

    public void setIdDetallePedidos(int idDetallePedidos) {
        this.idDetallePedidos = idDetallePedidos;
    }

    public int getPedidosProveedor() {
        return PedidosProveedor;
    }

    public void setPedidosProveedor(int PedidosProveedor) {
        this.PedidosProveedor = PedidosProveedor;
    }

    public int getProductos() {
        return Productos;
    }

    public void setProductos(int Productos) {
        this.Productos = Productos;
    }

    public double getValor_Productos() {
        return Valor_Productos;
    }

    public int getItem() {
        return item;
    }

    public double getValor_Unitario() {
        return Valor_Unitario;
    }

    public void setValor_Unitario(double Valor_Unitario) {
        this.Valor_Unitario = Valor_Unitario;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public void setValor_Productos(double Valor_Productos) {
        this.Valor_Productos = Valor_Productos;
    }

    public int getPorcentajeIVA() {
        return porcentajeIVA;
    }

    public void setPorcentajeIVA(int porcentajeIVA) {
        this.porcentajeIVA = porcentajeIVA;
    }

    public int getCantidad_Productos() {
        return Cantidad_Productos;
    }

    public void setCantidad_Productos(int Cantidad_Productos) {
        this.Cantidad_Productos = Cantidad_Productos;
    }

    public String getCodigoProducto() {
        return CodigoProducto;
    }

    public void setCodigoProducto(String CodigoProducto) {
        this.CodigoProducto = CodigoProducto;
    }

    public String getNombreProducto() {
        return NombreProducto;
    }

    public void setNombreProducto(String NombreProducto) {
        this.NombreProducto = NombreProducto;
    }

    public double getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(double Subtotal) {
        this.Subtotal = Subtotal;
    }

    public double getIVA() {
        return IVA;
    }

    public void setIVA(double IVA) {
        this.IVA = IVA;
    }

}
