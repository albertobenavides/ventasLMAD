/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alberto
 */
public class LoginDAO {
    public static boolean login(String username, String password)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
                cs = conn.prepareCall("{ call loginUsuario(?,?) }");
                cs.setString(1, username);
                cs.setString(2, password);
                rs = cs.executeQuery();
                if (rs.next())
                    return true;
                else
                    return false;
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                DBUtil.closeResultSet(rs);
                DBUtil.closeStatement(cs);
                pool.freeConnection(conn);
            }
        return false;
    }   
}
