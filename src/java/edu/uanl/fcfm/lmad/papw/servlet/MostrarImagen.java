
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.UsuarioDao;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "MostrarImagen", urlPatterns = {"/mostrarImagen"})
public class MostrarImagen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion");
            if ("download".equals(accion))
                response.addHeader("Content-Disposition", "attachment; filename=imagen.jpeg");
            
            String strId = request.getParameter("id");
            int id = 0;
            if (strId != null && !strId.equals("")) {
                id = Integer.parseInt(strId);
            }

            InputStream archivo = UsuarioDao.obtenerImagen(id);
            OutputStream out = response.getOutputStream();
            byte[] byteArray = new byte[1000000];
            int tamanio;

            while ((tamanio = archivo.read(byteArray)) != -1) {
                out.write(byteArray, 0, tamanio);
            }
            out.flush();
            out.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}