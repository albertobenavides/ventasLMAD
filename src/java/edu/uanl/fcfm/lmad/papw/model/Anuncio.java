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
    String nickUsuario;
    String fecha;
    int id;
    
    public Anuncio(String nombre, String precio, String nickUsuario,
            String fecha, String id)
    {
        this.nombre = nombre;
        this.precio = Double.parseDouble(precio);
        this.nickUsuario = nickUsuario;
        this.fecha = fecha;
        this.id = Integer.parseInt(id);
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
    
    
}
