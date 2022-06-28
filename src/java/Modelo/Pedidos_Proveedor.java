/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Pedidos_Proveedor {
    
    int IdPedidosProveedor;
    String Fecha_Entrega;
    String Fecha_Solicitud;
    int Can_Total_Productos;
    double Valor_Pedido;
    int Proveedores;
    int Empleado;
    String Estado;
    String Observacion_Pedido;
    String Proveedor;
    String Usuario;

    public Pedidos_Proveedor() {
    }

    public Pedidos_Proveedor(int IdPedidosProveedor, String Fecha_Entrega, String Fecha_Solicitud, int Can_Total_Productos, double Valor_Pedido, int Proveedores, int Empleado, String Estado, String Observacion_Pedido, String Proveedor, String Usuario) {
        this.IdPedidosProveedor = IdPedidosProveedor;
        this.Fecha_Entrega = Fecha_Entrega;
        this.Fecha_Solicitud = Fecha_Solicitud;
        this.Can_Total_Productos = Can_Total_Productos;
        this.Valor_Pedido = Valor_Pedido;
        this.Proveedores = Proveedores;
        this.Empleado = Empleado;
        this.Estado = Estado;
        this.Observacion_Pedido = Observacion_Pedido;
        this.Proveedor = Proveedor;
        this.Usuario = Usuario;
    }



    public String getProveedor() {
        return Proveedor;
    }

    public void setProveedor(String Proveedor) {
        this.Proveedor = Proveedor;
    }

    public double getValor_Pedido() {
        return Valor_Pedido;
    }

    public void setValor_Pedido(double Valor_Pedido) {
        this.Valor_Pedido = Valor_Pedido;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }
    
    

    public int getIdPedidosProveedor() {
        return IdPedidosProveedor;
    }

    public void setIdPedidosProveedor(int IdPedidosProveedor) {
        this.IdPedidosProveedor = IdPedidosProveedor;
    }

    public String getFecha_Entrega() {
        return Fecha_Entrega;
    }

    public void setFecha_Entrega(String Fecha_Entrega) {
        this.Fecha_Entrega = Fecha_Entrega;
    }

    public String getFecha_Solicitud() {
        return Fecha_Solicitud;
    }

    public void setFecha_Solicitud(String Fecha_Solicitud) {
        this.Fecha_Solicitud = Fecha_Solicitud;
    }

    public int getCan_Total_Productos() {
        return Can_Total_Productos;
    }

    public void setCan_Total_Productos(int Can_Total_Productos) {
        this.Can_Total_Productos = Can_Total_Productos;
    }

    public int getProveedores() {
        return Proveedores;
    }

    public void setProveedores(int Proveedores) {
        this.Proveedores = Proveedores;
    }

    public int getEmpleado() {
        return Empleado;
    }

    public void setEmpleado(int Empleado) {
        this.Empleado = Empleado;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getObservacion_Pedido() {
        return Observacion_Pedido;
    }

    public void setObservacion_Pedido(String Observacion_Pedido) {
        this.Observacion_Pedido = Observacion_Pedido;
    }
    
    
    
    
}
