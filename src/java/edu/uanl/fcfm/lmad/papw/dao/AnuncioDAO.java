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
            a.setExistencias(rs.getInt("existenciaProducto"));
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
    
    public static void bajaAnuncio(int idAnuncio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs;
        try {
            cs = conn.prepareCall("{ call bajaAnuncio(?) }");
            cs.setInt(1, idAnuncio);
            cs.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            pool.freeConnection(conn);
        }
    }
    
    public static int getIdAnuncio(int idProducto) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call getIdAnuncio(?) }");
            cs.setInt(1, idProducto);
            rs = cs.executeQuery();
            int idAnuncio = 0;
            while (rs.next()) 
            {
                idAnuncio = rs.getInt("idAnuncio");
                return idAnuncio;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
        return 0;
    }

    public static void updateAnuncio
        (int idAnuncio, int metodoPago, String miniatura, String vigencia) 
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call editarAnuncio(?, ?, ?, ?) }");
            cs.setInt(1, idAnuncio);
            cs.setInt(2, metodoPago);
            cs.setString(3, miniatura);
            cs.setString(4, vigencia);
            cs.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
