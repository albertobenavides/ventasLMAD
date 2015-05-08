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
public class Compra {
    int idCompra;
    int cantidadCompra;
    float totalCompra;
    String fechaCompra;
    String metodoPagoCompra;
    boolean ventaRealizada;
    String usuarioComprador;
    String nombreAnuncio;

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getCantidadCompra() {
        return cantidadCompra;
    }

    public void setCantidadCompra(int cantidadCompra) {
        this.cantidadCompra = cantidadCompra;
    }

    public float getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(float totalCompra) {
        this.totalCompra = totalCompra;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getMetodoPagoCompra() {
        return metodoPagoCompra;
    }

    public void setMetodoPagoCompra(String metodoPagoCompra) {
        this.metodoPagoCompra = metodoPagoCompra;
    }

    public boolean isVentaRealizada() {
        return ventaRealizada;
    }

    public void setVentaRealizada(boolean ventaRealizada) {
        this.ventaRealizada = ventaRealizada;
    }

    public String getUsuarioComprador() {
        return usuarioComprador;
    }

    public void setUsuarioComprador(String usuarioComprador) {
        this.usuarioComprador = usuarioComprador;
    }

    public String getNombreAnuncio() {
        return nombreAnuncio;
    }

    public void setNombreAnuncio(String nombreAnuncio) {
        this.nombreAnuncio = nombreAnuncio;
    }
    
}
