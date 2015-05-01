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
    int idAnuncio;
    String fecha;
    String vigencia;
    Blob imagen1;
    Blob imagen2;
    Blob imagen3;
    Blob video1;
    Blob video2;
    Blob video3;
    int metodoPago;
    
    
    String nombre;
    float precio;
    String caracteristicas;
    
    int existencias;
    String nickUsuario;
    String correoElectronico;
    String telefono;
    String nombreUsuario;
    
    int idUsuario;
    
    int idSubcategoria;
    
    public Anuncio(){}
    
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
    }

    public int getIdAnuncio() {
        return idAnuncio;
    }

    public void setIdAnuncio(int idProducto) {
        this.idAnuncio = idProducto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
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

    public int getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(int metodoPago) {
        this.metodoPago = metodoPago;
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

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public String getNickUsuario() {
        return nickUsuario;
    }

    public void setNickUsuario(String nickUsuario) {
        this.nickUsuario = nickUsuario;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdSubcategoria() {
        return idSubcategoria;
    }

    public void setIdSubcategoria(int idSubcategoria) {
        this.idSubcategoria = idSubcategoria;
    }
}
