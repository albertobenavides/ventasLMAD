/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.CompraDAO;
import edu.uanl.fcfm.lmad.papw.utils.EmailUtility;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alberto
 */
@WebServlet(name = "CompraServlet", urlPatterns = {"/Comprar"})
public class CompraServlet extends HttpServlet {
    
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
            HttpSession session = request.getSession();
            String emailVendedor = request.getParameter("correoAnuncio");
            int idUsuario = (Integer)session.getAttribute("idUsuario");
            int cantidadCompra = Integer.parseInt(request.getParameter("cantidadCompra"));
            String metodoPagoCompra = (new String (request.getParameter("metodoPagoCompra").getBytes ("iso-8859-1"), "UTF-8"));
            int idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
            
            CompraDAO.setCompra(idUsuario, cantidadCompra, metodoPagoCompra, idAnuncio);
                String emailMessage;
                emailMessage = "<h1>VENTASLMAD</h1>"
                        + "<p>Se ha realizado la compra de uno de tus productos.</p>"
                        + "<p>Entra <a href='http://52.24.191.29:8080/ventasLMAD/anuncioCompleto.jsp?idAnuncio="+ idAnuncio 
                        + "'>aquí</a> para revisarlo.</p>";
                EmailUtility.sendEmail(host, port, user, pass, emailVendedor, ""
                        + "Compra de producto", emailMessage);
            
            request.setAttribute("message", "Compra realizada con éxito.");
            
            RequestDispatcher disp = getServletContext()
                    .getRequestDispatcher("/listaCompras.jsp");
                    disp.forward(request, response);
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
            //Logger.getLogger(CompraServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            //Logger.getLogger(CompraServlet.class.getName()).log(Level.SEVERE, null, ex);
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
