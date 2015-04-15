/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Usuario;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alberto
 */
public class UsuarioDao {
    
    public static boolean insertar(Usuario u) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{ call insertarUsuario(?,?,?,?,?,?,?,?,?,?) }");
            cs.setString(1, u.getNickname());
            cs.setString(2, u.getContrasenia());
            cs.setString(3, u.getCorreoElectronico());
            cs.setString(4, u.getNombre());
            cs.setString(5, u.getApellidoPaterno());
            cs.setString(6, u.getApellidoMaterno());
            cs.setString(7, u.getFechaNacimiento());
            cs.setString(8, u.getSexo());
            cs.setString(9, u.getTelefono());
            cs.setBlob(10, u.getImagen());
            rs = cs.executeQuery();
            
            rs.first();
            return rs.getString(1).equals("1");
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
        return false;
    }
}
