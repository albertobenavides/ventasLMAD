/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.model;

import java.util.List;

/**
 *
 * @author Alberto
 */
public class Categoria {
    List<String> categorias;
    
    public Categoria(List<String> l) // es una ele
    {
        categorias = l;
    }

    public List<String> getCategorias() {
        return categorias;
    }
}
