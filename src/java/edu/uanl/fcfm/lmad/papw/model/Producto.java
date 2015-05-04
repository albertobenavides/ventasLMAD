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
public class Producto {
    int idProducto;
    String nombre;
    float precio;
    int existencia;
    String fecha;
    String descripcionLarga;
    String imagen1;
    String imagen2;
    String imagen3;
    String video1;
    String video2;
    String video3;
    boolean anuncioPublico;
    int idSubcategoria;
    int idUsuario;

    public Producto() {}

    public Producto(Producto p) {
        this.idProducto = p.idProducto;
        this.nombre = p.nombre;
        this.precio = p.precio;
        this.fecha = p.fecha;
        this.descripcionLarga = p.descripcionLarga;
        this.idSubcategoria = p.idSubcategoria;
        this.existencia = p.existencia;
        this.anuncioPublico = p.anuncioPublico;
        this.imagen1 = p.imagen1;
        this.imagen2 = p.imagen2;
        this.imagen3 = p.imagen3;
        this.video1 = p.video1;
        this.video2 = p.video2;
        this.video3 = p.video3;
    }

    
    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcionLarga() {
        return descripcionLarga;
    }

    public void setDescripcionLarga(String descripcionLarga) {
        this.descripcionLarga = descripcionLarga;
    }

    public String getImagen1() {
        return imagen1;
    }

    public void setImagen1(String imagen1) {
        this.imagen1 = imagen1;
    }

    public String getImagen2() {
        return imagen2;
    }

    public void setImagen2(String imagen2) {
        this.imagen2 = imagen2;
    }

    public String getImagen3() {
        return imagen3;
    }

    public void setImagen3(String imagen3) {
        this.imagen3 = imagen3;
    }

    public String getVideo1() {
        return video1;
    }

    public void setVideo1(String video1) {
        this.video1 = video1;
    }

    public String getVideo2() {
        return video2;
    }

    public void setVideo2(String video2) {
        this.video2 = video2;
    }

    public String getVideo3() {
        return video3;
    }

    public void setVideo3(String video3) {
        this.video3 = video3;
    }
    
    

    public boolean isAnuncioPublico() {
        return anuncioPublico;
    }

    public void setAnuncioPublico(boolean anuncioPublico) {
        this.anuncioPublico = anuncioPublico;
    }

    public int getIdSubcategoria() {
        return idSubcategoria;
    }

    public void setIdSubcategoria(int idSubcategoria) {
        this.idSubcategoria = idSubcategoria;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
