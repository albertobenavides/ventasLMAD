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
    public static void setAnuncio(String vigencia, String miniatura,
            int metodoPago, int idProducto)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call altaAnuncio(?, ?, ?, ?) }");
            cs.setString(1, vigencia);
            cs.setString(2, miniatura);
            cs.setInt(3, metodoPago);
            cs.setInt(4, idProducto);
            rs = cs.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
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
                Anuncio a = new Anuncio();
                
                a.setNombre(rs.getString("nombreProducto"));
                a.setPrecio(rs.getFloat("precioProducto"));
                a.setNickUsuario(rs.getString("nickUsuario"));
                a.setFecha(rs.getString("fechaPublicacionAnuncio"));
                a.setIdAnuncio(rs.getInt("idAnuncio"));
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
        
        public static List<Anuncio> getAnunciosBusqueda (String producto, 
                String usuario, String fechaInicial, String fechaFinal) 
        {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call Busqueda(?, ?, ?, ?) }");
            cs.setString(1, producto);
            cs.setString(2, usuario);
            cs.setString(3, fechaInicial);
            cs.setString(4, fechaFinal);
            
            rs = cs.executeQuery();
            List<Anuncio> anuncios = new ArrayList<Anuncio>();
            while (rs.next()) 
            {
                Anuncio a = new Anuncio();
                
                a.setNombre(rs.getString("nombreProducto"));
                a.setPrecio(rs.getFloat("precioProducto"));
                a.setNickUsuario(rs.getString("nickUsuario"));
                a.setFecha(rs.getString("fechaPublicacionAnuncio"));
                a.setIdAnuncio(rs.getInt("idAnuncio"));
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
    
    public static Anuncio getAnuncioCompleto(int idAnuncio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call anuncioCompleto(?) }");
            cs.setInt(1, idAnuncio);
            rs = cs.executeQuery();
            
            Anuncio a = new Anuncio();
            while (rs.next()) 
            {
            a.setNombre(rs.getString("nombreProducto"));
            a.setPrecio(rs.getFloat("precioProducto"));
            a.setCaracteristicas(rs.getString("caracteristicas"));
            a.setCorreoElectronico(rs.getString("correoUsuario"));
            a.setTelefono(rs.getString("telefonoUsuario"));
            a.setNombreUsuario(rs.getString("nombreCompletoUsuario"));
            a.setFecha(rs.getString("fechaPublicacionAnuncio"));
            a.setNickUsuario(rs.getString("nickUsuario"));
            a.setMetodoPago(rs.getString("metodoPagoAnuncio"));
            a.setIdUsuario(rs.getInt("idUsuario"));
            }
            return a;
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
