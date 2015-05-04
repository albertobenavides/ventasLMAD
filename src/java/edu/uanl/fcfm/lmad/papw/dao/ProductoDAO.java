/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Producto;
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
public class ProductoDAO {
    
    public static Producto getProducto(String i) {
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection conn = pool.getConnection();
    CallableStatement cs = null;
    ResultSet rs = null;
    try {
        cs = conn.prepareCall("{ call getProducto(?) }");
        cs.setString(1, i);
        rs = cs.executeQuery();

        Producto p = new Producto();
        while (rs.next()) 
        {
            boolean anuncioPublico;
            anuncioPublico = "1".equals(rs.getString("anuncioPublico"));
            p.setNombre(rs.getString("nombreProducto"));
            p.setPrecio(rs.getFloat("precioProducto"));
            p.setExistencia(rs.getInt("existenciaProducto"));
            p.setDescripcionLarga(rs.getString("caracteristicas"));
            p.setImagen1(null);
            p.setImagen2(null);
            p.setImagen3(null);
            p.setVideo1(null);
            p.setVideo2(null);
            p.setVideo3(null);
            p.setAnuncioPublico(anuncioPublico);
            p.setIdSubcategoria(rs.getInt("idSubCategoria"));
            p.setIdUsuario(0);
        }
        return p;
    } catch (SQLException ex) {
        ex.printStackTrace();
        return null;
    } finally {
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatement(cs);
        pool.freeConnection(conn);
    }
}
    
    public static void setAnuncioCompleto(Producto p)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call insertarProducto(?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
            cs.setString(1, p.getNombre());
            cs.setFloat(2, p.getPrecio());
            cs.setInt(3, p.getExistencia());
            cs.setString(4, p.getDescripcionLarga());
            cs.setString(5, p.getImagen1());
            cs.setString(6, p.getImagen2());
            cs.setString(7, p.getImagen3());
            cs.setString(8, p.getVideo1());
            cs.setString(9, p.getVideo2());
            cs.setString(10, p.getVideo3());
            cs.setBoolean(11, p.isAnuncioPublico());
            cs.setInt(12, p.getIdUsuario());
            cs.setInt(13, p.getIdSubcategoria());
            
            rs = cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static List<Producto> getListaProductos
        (String idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call listadoProductos(?) }");
            cs.setString(1, idUsuario);
            rs = cs.executeQuery();
            List<Producto> productos = new ArrayList<Producto>();
            while (rs.next()) 
            {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setNombre(rs.getString("nombreProducto"));
                p.setPrecio(rs.getFloat("precioProducto"));
                p.setExistencia(rs.getInt("existenciaProducto"));
                p.setFecha(rs.getString("date(creacionProducto)"));
                p.setAnuncioPublico(rs.getBoolean("anuncioPublico"));
                
                productos.add(p);
            }
            return productos;
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
