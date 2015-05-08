/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

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
}
