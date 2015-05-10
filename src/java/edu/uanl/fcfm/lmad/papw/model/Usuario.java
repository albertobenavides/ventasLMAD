/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.model;

import java.io.InputStream;
import java.sql.Blob;

/**
 *
 * @author Carlos
 */
public class Usuario {
    int idUsuario;
    String nickname;
    String contrasenia;
    String correoElectronico;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    String fechaNacimiento;
    String sexo;
    String telefono;
    
    String tipo;
    InputStream stream;
    
    Blob imagenUsuario;
    
    

    public Usuario(Usuario u)
    {
        this.idUsuario = u.getIdUsuario();
        this.nickname = u.getNickname();
        this.correoElectronico = u.getCorreoElectronico();
        
        this.contrasenia = u.contrasenia;
        this.nombre = u.nombre;
        this.apellidoPaterno = u.apellidoPaterno;
        this.apellidoMaterno = u.apellidoMaterno;
        this.fechaNacimiento = u.fechaNacimiento;
        this.sexo = u.sexo;
        this.telefono = u.telefono;
    }
    
    public Usuario() {}    

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
     public InputStream getStream() {
        return stream;
    }

    public void setStream(InputStream stream) {
        this.stream = stream;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Blob getImagenUsuario() {
        return imagenUsuario;
    }

    public void setImagenUsuario(Blob imagenUsuario) {
        this.imagenUsuario = imagenUsuario;
    }
    
}
