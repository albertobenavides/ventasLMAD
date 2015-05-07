/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.UsuarioDao;
import edu.uanl.fcfm.lmad.papw.model.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Alberto
 */
@WebServlet(name = "RegistroUsuarioServlet", urlPatterns = {"/RegistroUsuario"})
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15 // 15 MB
)
public class RegistroUsuarioServlet extends HttpServlet {

    private String extractExtension(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String filename = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return filename.substring(filename.indexOf(".") - 1, filename.length());
            }
        }
        return "";
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Part filePart = request.getPart("imagen"); 
            String contentType = filePart.getContentType();
            Usuario u = new Usuario();
            u.setNickname(request.getParameter("nickname"));
            u.setContrasenia(request.getParameter("contrasenia"));
            u.setCorreoElectronico(request.getParameter("correoElectronico"));
            u.setNombre(request.getParameter("nombre"));
            u.setApellidoPaterno(request.getParameter("apellidoPaterno"));
            u.setApellidoMaterno(request.getParameter("apellidoMaterno"));
            u.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            u.setSexo(request.getParameter("sexo"));
            u.setTelefono(request.getParameter("telefono"));
            u.setTipo(contentType);
            
            String nombreArchivo = String.valueOf(System.currentTimeMillis());
            nombreArchivo += extractExtension(filePart);
            
            InputStream inputStream = filePart.getInputStream();
            u.setStream(inputStream);
                      
            RequestDispatcher disp;
            
            String message;
            if (UsuarioDao.insertar(u) == true)
            {   
                int id = UsuarioDao.insertarImagen(u);
                request.setAttribute("id", id);
                message = "Usuario registrado con éxito.";
                request.setAttribute("message", message);
                disp = getServletContext()
                        .getRequestDispatcher("/index.jsp");
                disp.forward(request, response);
            }
            else
            {
                message = "Usuario existente.";
                request.setAttribute("message", message);
                disp = getServletContext()
                        .getRequestDispatcher("/signup.jsp");
                disp.forward(request, response);
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
