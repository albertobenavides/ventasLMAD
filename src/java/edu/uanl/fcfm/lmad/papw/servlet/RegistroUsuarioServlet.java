/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.UsuarioDAO;
import edu.uanl.fcfm.lmad.papw.model.Usuario;
import edu.uanl.fcfm.lmad.papw.utils.EmailUtility;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
    
    private String host;
    private String port;
    private String user;
    private String pass;
    
    @Override
    public void init() {
        // Lee la configuacion del servidor SMTP desde el archivo web.xml
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
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
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String email = request.getParameter("correoElectronico");
            String verificationCode = UUID.randomUUID().toString();
            
            Part filePart = request.getPart("imagen"); 
           // String contentType = filePart.getContentType();
            
            Usuario u = new Usuario();
            
            HttpSession session = request.getSession();
            
            if (session.getAttribute("idUsuario") != null)
                u.setIdUsuario((Integer)session.getAttribute("idUsuario"));
            u.setNickname(request.getParameter("nickname"));
            u.setContrasenia(verificationCode);
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
            //u.setTipo(contentType);
            
            InputStream inputStream = filePart.getInputStream();
            u.setStream(inputStream);
                      
            RequestDispatcher disp;
            
            String message;
            
            boolean setImagen = true;
            if (filePart.getSize() == 0)
                setImagen = false;
            
            String action = request.getParameter("action");
            
            if (action.equals("setUsuario"))
            {
                if (UsuarioDAO.setUsuario(u) == true)
                {
                    if (setImagen)
                        UsuarioDAO.insertarImagen(u);
                    String emailMessage;
                    emailMessage = "Ingresa el siguiente código de verificacion para activar la cuenta: " + verificationCode;
                    EmailUtility.sendEmail(host, port, user, pass, email, "Código de acceso a VentasLMAD", emailMessage);
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
                if (setImagen)
                    UsuarioDAO.insertarImagen(u);
                UsuarioDAO.updateUsuario(u);
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            ex.printStackTrace();
            //Logger.getLogger(RegistroUsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
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
