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
public class Producto {
    int idProducto;
    String nombre;
    float precio;
    int existencia;
    String fecha;
    String descripcionLarga;
    Blob imagen1;
    Blob imagen2;
    Blob imagen3;
    Blob video1;
    Blob video2;
    Blob video3;
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

    public Blob getImagen1() {
        return imagen1;
    }

    public void setImagen1(Blob imagen1) {
        this.imagen1 = imagen1;
    }

    public Blob getImagen2() {
        return imagen2;
    }

    public void setImagen2(Blob imagen2) {
        this.imagen2 = imagen2;
    }

    public Blob getImagen3() {
        return imagen3;
    }

    public void setImagen3(Blob imagen3) {
        this.imagen3 = imagen3;
    }

    public Blob getVideo1() {
        return video1;
    }

    public void setVideo1(Blob video1) {
        this.video1 = video1;
    }

    public Blob getVideo2() {
        return video2;
    }

    public void setVideo2(Blob video2) {
        this.video2 = video2;
    }

    public Blob getVideo3() {
        return video3;
    }

    public void setVideo3(Blob video3) {
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
