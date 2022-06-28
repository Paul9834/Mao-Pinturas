/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author brayan.daza
 */
public class Conexion {
    
    Connection con;
    String url="jdbc:mysql://localhost:3306/bd_maopinturas";
    
    public Connection Conexion(){
    try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con=DriverManager.getConnection(url,"root","");
    }catch(Exception e){
    
    }
    return con;
    }
    
}
