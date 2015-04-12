/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.model;

/**
 *
 * @author Alberto
 */
public class Anuncio {
    String nombre;
    double precio;
    String caracteristicas;
    String nickUsuario;
    String correoElectronico;
    String telefono;
    String nombreUsuario;
    String fecha;
    int id;
    
    public Anuncio(){}
    
    public Anuncio(String nombre, String precio, String nickUsuario,
            String fecha, String id)
    {
        this.nombre = nombre;
        this.precio = Double.parseDouble(precio);
        this.nickUsuario = nickUsuario;
        this.fecha = fecha;
        this.id = Integer.parseInt(id);
    }

    public Anuncio(String nombre, String precio, String caracteristicas, 
            String correoElectronico, String telefono, String nombreUsuario, 
            String fecha) {
        this.nombre = nombre;
        this.precio = Double.parseDouble(precio);
        this.caracteristicas = caracteristicas;
        this.correoElectronico = correoElectronico;
        this.telefono = telefono;
        this.nombreUsuario = nombreUsuario;
        this.fecha = fecha;
    }
    
    public Anuncio (Anuncio a)
    {
        this.nombre = a.nombre;
        this.precio = a.precio;
        this.caracteristicas = a.caracteristicas;
        this.correoElectronico = a.correoElectronico;
        this.telefono = a.telefono;
        this.nombreUsuario = a.nombreUsuario;
        this.fecha = a.fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public String getNickUsuario() {
        return nickUsuario;
    }

    public String getFecha() {
        return fecha;
    }

    public int getId() {
        return id;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }
    
    
}
