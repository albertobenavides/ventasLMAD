/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.dao;

import edu.uanl.fcfm.lmad.papw.model.Pregunta;
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
public class PreguntaDAO {
    public static List<Pregunta> getPregunta(int idAnuncio) 
    {
    ConnectionPool pool = ConnectionPool.getInstance();
    Connection conn = pool.getConnection();
    CallableStatement cs = null;
    ResultSet rs = null;
    try {
        cs = conn.prepareCall("{ call preguntaRespuesta(?) }");
        cs.setInt(1, idAnuncio);
        rs = cs.executeQuery();

        List<Pregunta> preguntas = new ArrayList<Pregunta>();
        while (rs.next()) 
        {
            Pregunta p = new Pregunta();
            p.setTextoPregunta(rs.getString("textoPregunta"));
            p.setTextoRespuesta(rs.getString("textoRespuesta"));
            p.setFechaPublicacion(rs.getString("fechaPublicacionPregunta"));
            p.setNombreUsuario(rs.getString("nickUsuario"));
            p.setIdPregunta(rs.getInt("idPregunta"));
            p.setIdUsuario(rs.getInt("idUsuario"));
            preguntas.add(p);
        }
        return preguntas;
    } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
    } finally {
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatement(cs);
        pool.freeConnection(conn);
    }
    }
    public static void setPregunta(String textoPregunta, int idUsuario,
            int idAnuncio)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call insertarPregunta(?,?,?) }");
            cs.setString(1, textoPregunta);
            cs.setInt(2, idUsuario);
            cs.setInt(3, idAnuncio);
            cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
    
    public static void setRespuesta(String textoRespuesta, int idPregunta)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conn = pool.getConnection();
        CallableStatement cs = null;
        try {
            cs = conn.prepareCall("{ call insertarRespuesta(?,?) }");
            cs.setString(1, textoRespuesta);
            cs.setInt(2, idPregunta);
            cs.executeQuery();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            DBUtil.closeStatement(cs);
            pool.freeConnection(conn);
        }
    }
}
