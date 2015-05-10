/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Compra;
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
public class CompraDAO {
    public static void setCompra(int idUsuario, int cantidadCompra,
            String metodoPagoCompra, int idAnuncio)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call insertarCompra(?,?,?,?) }");
            cs.setInt(1, idUsuario);
            cs.setInt(2, cantidadCompra);
            cs.setString(3, metodoPagoCompra);
            cs.setInt(4, idAnuncio);
            cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static List<Compra> getListaCompras
        (int idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call getCompras(?) }");
            cs.setInt(1, idUsuario);
            rs = cs.executeQuery();
            List<Compra> compras = new ArrayList<Compra>();
            while (rs.next()) 
            {
                Compra c = new Compra();
                c.setCantidadCompra(rs.getInt("cantidadCompra"));
                c.setTotalCompra(rs.getFloat("totalCompra"));
                c.setFechaCompra(rs.getString("fechaCompra"));
                c.setMetodoPagoCompra(rs.getString("metodoPagoCompra"));
                c.setVentaRealizada(rs.getInt("ventaRealizada"));
                c.setNombreProducto(rs.getString("nombreProducto"));
                c.setIdAnuncio(rs.getInt("idAnuncio"));
                c.setIdCompra(rs.getInt("idCompra"));
                
                compras.add(c);
            }
            return compras;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
  
    public static List<Compra> getListaVentas (int idUsuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call getVentas(?) }");
            cs.setInt(1, idUsuario);
            rs = cs.executeQuery();
            List<Compra> ventas = new ArrayList<Compra>();
            while (rs.next()) 
            {
                Compra v = new Compra();
                v.setFechaCompra(rs.getString("fechaCompra"));
                v.setNombreProducto(rs.getString("descripcionCortaProducto"));
                v.setIdCompra(rs.getInt("idCompra"));
                v.setCantidadCompra(rs.getInt("cantidadCompra"));
                v.setTotalCompra(rs.getFloat("totalCompra"));
                v.setMetodoPagoCompra(rs.getString("metodoPagoCompra"));
                v.setVentaRealizada(rs.getInt("ventaRealizada"));
                v.setIdAnuncio(rs.getInt("idAnuncio"));
                v.setUsuarioComprador(rs.getString("comprador.nickUsuario"));
                
                ventas.add(v);
            }
            return ventas;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static void confirmarVenta(int idCompra)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call confirmarVenta(?) }");
            cs.setInt(1, idCompra);
            cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static void cancelarCompra(int idCompra)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call cancelarCompra(?) }");
            cs.setInt(1, idCompra);
            cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
