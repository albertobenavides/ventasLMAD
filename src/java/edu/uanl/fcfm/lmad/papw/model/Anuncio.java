/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.model;

import java.sql.Blob;

/**
 *
 * @author Alberto
 */
public class Anuncio {
    String nombre;
    Double precio;
    String caracteristicas;
    String vigencia;
    Integer existencias;
    String nickUsuario;
    String correoElectronico;
    String telefono;
    String nombreUsuario;
    String fecha;
    Integer idUsuario;
    Blob image1;
    Blob video1;
    String idSubcategoria;
    
    public Anuncio(){}

    public Anuncio(String nombre, double precio, String caracteristicas, String vigencia, 
            int existencias, int idUsuario, Blob image1, Blob video1, String idSubcategoria) {
        this.nombre = nombre;
        this.precio = precio;
        this.caracteristicas = caracteristicas;
        this.vigencia = vigencia;
        this.existencias = existencias;
        this.idUsuario = idUsuario;
        this.image1 = image1;
        this.video1 = video1;
        this.idSubcategoria = idSubcategoria;
    }

    public Anuncio(String nombre, String precio, String nickUsuario,
            String fecha, String id)
    {
        this.nombre = nombre;
        this.precio = Double.parseDouble(precio);
        this.nickUsuario = nickUsuario;
        this.fecha = fecha;
        this.idUsuario = Integer.parseInt(id);
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

    public String getPrecio() {
        return precio.toString();
    }

    public String getNickUsuario() {
        return nickUsuario;
    }

    public String getFecha() {
        return fecha;
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

    public String getVigencia() {
        return vigencia;
    }

    public String getExistencias() {
        return existencias.toString();
    }

    public String getIdUsuario() {
        return idUsuario.toString();
    }

    public Blob getImage1() {
        return image1;
    }

    public Blob getVideo1() {
        return video1;
    }

    public String getIdSubcategoria() {
        return idSubcategoria;
    }

}
