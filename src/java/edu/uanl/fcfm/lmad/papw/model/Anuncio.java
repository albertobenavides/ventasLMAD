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
    int idProducto;
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
    boolean anuncioPublico;
    String idSubcategoria;
    
    public Anuncio(){}

    public Anuncio(int idProducto, String nombre, Double precio, Integer existencias, String fecha, boolean anuncioPublico) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.existencias = existencias;
        this.fecha = fecha;
        this.anuncioPublico = anuncioPublico;
    }
    
    public Anuncio(String nombre, double precio, String caracteristicas, String vigencia, 
            int existencias, int idUsuario, Blob image1, Blob video1, boolean anuncioPublico,
            String idSubcategoria) {
        this.nombre = nombre;
        this.precio = precio;
        this.caracteristicas = caracteristicas;
        this.vigencia = vigencia;
        this.existencias = existencias;
        this.idUsuario = idUsuario;
        this.image1 = image1;
        this.video1 = video1;
        this.anuncioPublico = anuncioPublico;
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
        this.existencias = a.existencias;
        this.vigencia = a.vigencia;
        this.telefono = a.telefono;
        this.nombreUsuario = a.nombreUsuario;
        this.fecha = a.fecha;
        this.anuncioPublico = a.anuncioPublico;
    }

    public int getIdProducto() {
        return idProducto;
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

    public boolean isAnuncioPublico() {
        return anuncioPublico;
    }

    public String getIdSubcategoria() {
        return idSubcategoria;
    }

}
