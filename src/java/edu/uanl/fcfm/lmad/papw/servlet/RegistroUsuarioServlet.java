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
import javax.servlet.http.HttpSession;
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
            
            HttpSession session = request.getSession();
            
            if (session.getAttribute("idUsuario") != null)
                u.setIdUsuario((Integer)session.getAttribute("idUsuario"));
            u.setNickname(request.getParameter("nickname"));
            u.setContrasenia(request.getParameter("contrasenia"));
            u.setCorreoElectronico(request.getParameter("correoElectronico"));
            u.setNombre(
                    new String (
                            request.getParameter("nombre").getBytes ("iso-8859-1"), "UTF-8"));
            u.setApellidoPaterno(
                    new String (
                            request.getParameter("apellidoPaterno").getBytes ("iso-8859-1"), "UTF-8"));
            u.setApellidoMaterno(
                    new String (
                            request.getParameter("apellidoMaterno").getBytes ("iso-8859-1"), "UTF-8"));
            u.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            u.setSexo(request.getParameter("sexo"));
            u.setTelefono(request.getParameter("telefono"));
            u.setTipo(contentType);
            
            InputStream inputStream = filePart.getInputStream();
            u.setStream(inputStream);
                      
            RequestDispatcher disp;
            
            String message;
            
            String action = request.getParameter("action");
            
            if (action.equals("setUsuario"))
            {
                if (UsuarioDao.setUsuario(u) == true)
                {   
                    UsuarioDao.insertarImagen(u);
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
                            .getRequestDispatcher("/registro.jsp");
                    disp.forward(request, response);
                }
            }
            else
            {
                UsuarioDao.insertarImagen(u);
                UsuarioDao.updateUsuario(u);
                message = "Tus datos se han actualizado.";
                    request.setAttribute("message", message);
                    disp = getServletContext()
                            .getRequestDispatcher("/index.jsp");
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
