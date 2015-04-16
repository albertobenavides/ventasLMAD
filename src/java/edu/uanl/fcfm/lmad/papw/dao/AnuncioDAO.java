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
import java.sql.Blob;

/**
 *
 * @author Alberto
 */
public class AnuncioDAO {
    public static List<Anuncio> getAnunciosCortos
        (String categoria, String subcategoria, Integer orden) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call anuncioCorto(?, ?, ?) }");
            cs.setString(1, categoria);
            cs.setString(2, subcategoria);
            cs.setInt(3, orden);
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
    
    public static void setAnuncioCompleto(Anuncio a)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call insertarProducto(?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
            cs.setString(1, a.getNombre());
            cs.setFloat(2, Float.parseFloat(a.getPrecio()));
            cs.setString(3, a.getExistencias());
            cs.setString(4, a.getVigencia());
            cs.setString(5, a.getCaracteristicas());
            cs.setBlob(6, a.getImage1());
            cs.setBlob(7, a.getImage1());
            cs.setBlob(8, a.getImage1());
            cs.setBlob(9, a.getVideo1());
            cs.setBlob(10, a.getVideo1());
            cs.setBlob(11, a.getVideo1());
            cs.setBoolean(12, false);
            cs.setInt(13, Integer.parseInt(a.getIdUsuario()));
            cs.setInt(14, Integer.parseInt(a.getIdSubcategoria()));
            
            rs = cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
