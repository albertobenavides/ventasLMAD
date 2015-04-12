/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Anuncio;
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
public class AnuncioDAO {
    public static List<Anuncio> getAnunciosCortos() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call anuncioCorto(?, ?, ?) }");
            cs.setString(1, null);
            cs.setString(2, null);
            cs.setInt(3, 1);
            rs = cs.executeQuery();
            List<Anuncio> anuncios = new ArrayList<Anuncio>();
            while (rs.next()) 
            {
                Anuncio a = new Anuncio(
                        rs.getString("nombreProducto"),
                        rs.getString("precioProducto"),
                        rs.getString("nickUsuario"),
                        rs.getString("fechaPublicacionAnuncio"),
                        rs.getString("idAnuncio")
                );
                anuncios.add(a);
            }
            return anuncios;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static Anuncio getAnuncioCompleto(Integer i) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call anuncioCompleto(?) }");
            cs.setString(1, i.toString());
            rs = cs.executeQuery();
            
            Anuncio anuncioCompleto = new Anuncio();
            while (rs.next()) 
            {
            anuncioCompleto = new Anuncio(
                    rs.getString("nombreProducto"),
                    rs.getString("precioProducto"),
                    rs.getString("caracteristicas"),
                    rs.getString("correoUsuario"),
                    rs.getString("telefonoUsuario"),
                    rs.getString("nombreCompletoUsuario"),
                    rs.getString("fechaPublicacionAnuncio"));
            }
            return anuncioCompleto;
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
