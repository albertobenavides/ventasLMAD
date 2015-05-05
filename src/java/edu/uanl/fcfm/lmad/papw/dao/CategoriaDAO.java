/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Categoria;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alberto
 */
public class CategoriaDAO {
    public static List<Categoria> getCategorias() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call anuncioCategoriasSubcategorias() }");
            rs = cs.executeQuery();
            List<Categoria> categorias = new ArrayList<Categoria>();
            while (rs.next()) 
            {
                Categoria c = new Categoria();
                c.setCategoria(rs.getString("nombreCategoria"));
                c.setSubcategoria(rs.getString("nombreSubcategoria"));
                categorias.add(c);
            }
            return categorias;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static List<String> listaSubcategorias() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call subcategoriasDisponibles() }");
            rs = cs.executeQuery();
            List<String> c = new ArrayList<String>();
            while (rs.next()) {
                c.add(rs.getString("nombreSubcategoria"));
            }
            return c;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
