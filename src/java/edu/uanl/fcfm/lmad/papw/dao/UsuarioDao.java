/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Alberto
 */
public class UsuarioDao {
    
    public static void insertar(Usuario e) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call insertarUsuario(?,?,?,?,?,?,?,?) }");
            cs.setString(1, e.getNickname());
            cs.setString(2, e.getContrasenia());
            cs.setString(3, e.getCorreoElectronico());
            cs.setString(4, e.getNombre());
            cs.setString(5, e.getApellidoPaterno());
            cs.setString(6, e.getApellidoMaterno());
            cs.setString(7, e.getFechaNacimiento());
            cs.setString(8, e.getSexo());
            cs.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
