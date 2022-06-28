/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author brayan.daza
 */
public class Ventas {
    
   int IdVentas;
   String Numero_Serie;
   String Fecha_Solicitud;
   String Fecha_Entrega;
   double Valor_Venta;
   String Estado;
   int Cliente;
   int Usuario_Registra;
   String NombreCliente;
   String NombreUsuario;

    public Ventas() {
    }

    public Ventas(int IdVentas, String Numero_Serie, String Fecha_Solicitud, String Fecha_Entrega, double Valor_Venta, String Estado, int Cliente, int Usuario_Registra, String NombreCliente, String NombreUsuario) {
        this.IdVentas = IdVentas;
        this.Numero_Serie = Numero_Serie;
        this.Fecha_Solicitud = Fecha_Solicitud;
        this.Fecha_Entrega = Fecha_Entrega;
        this.Valor_Venta = Valor_Venta;
        this.Estado = Estado;
        this.Cliente = Cliente;
        this.Usuario_Registra = Usuario_Registra;
        this.NombreCliente = NombreCliente;
        this.NombreUsuario = NombreUsuario;
    }

    public int getIdVentas() {
        return IdVentas;
    }

    public void setIdVentas(int IdVentas) {
        this.IdVentas = IdVentas;
    }

    public String getNumero_Serie() {
        return Numero_Serie;
    }

    public void setNumero_Serie(String Numero_Serie) {
        this.Numero_Serie = Numero_Serie;
    }

    public String getFecha_Solicitud() {
        return Fecha_Solicitud;
    }

    public void setFecha_Solicitud(String Fecha_Solicitud) {
        this.Fecha_Solicitud = Fecha_Solicitud;
    }

    public String getFecha_Entrega() {
        return Fecha_Entrega;
    }

    public void setFecha_Entrega(String Fecha_Entrega) {
        this.Fecha_Entrega = Fecha_Entrega;
    }

    public double getValor_Venta() {
        return Valor_Venta;
    }

    public void setValor_Venta(double Valor_Venta) {
        this.Valor_Venta = Valor_Venta;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public int getCliente() {
        return Cliente;
    }

    public void setCliente(int Cliente) {
        this.Cliente = Cliente;
    }

    public int getUsuario_Registra() {
        return Usuario_Registra;
    }

    public void setUsuario_Registra(int Usuario_Registra) {
        this.Usuario_Registra = Usuario_Registra;
    }

    public String getNombreCliente() {
        return NombreCliente;
    }

    public void setNombreCliente(String NombreCliente) {
        this.NombreCliente = NombreCliente;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

   
}
