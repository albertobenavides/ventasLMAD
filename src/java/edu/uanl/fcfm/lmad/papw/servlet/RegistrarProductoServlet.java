/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.ProductoDAO;
import edu.uanl.fcfm.lmad.papw.model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "RegistrarProductoServlet", urlPatterns = {"/nuevoProducto"})
public class RegistrarProductoServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            
            request.setCharacterEncoding("UTF-8");
            String nombreProducto = (String)request.getParameter("nombreProducto");
            String precioProducto = (String)request.getParameter("precioProducto");
            String descripcionProducto = (String)request.getParameter("descripcionProducto");
            String existenciaProducto = (String)request.getParameter("existenciaProducto");
            String idSubcategoria = (String)request.getParameter("idSubcategoria");
            String idUsuario = (String)session.getAttribute("idUsuario").toString();
            boolean anuncioPublico = Boolean.parseBoolean(request.getParameter("publicarAnuncio"));
            
            Producto p = new Producto();
            p.setNombre(nombreProducto);
            p.setPrecio(Float.parseFloat(precioProducto));
            p.setExistencia(Integer.parseInt(existenciaProducto));
            p.setDescripcionLarga(descripcionProducto);
            p.setImagen1("");
            p.setImagen2("");
            p.setImagen3("");
            p.setVideo1("");
            p.setVideo2("");
            p.setVideo3("");
            p.setAnuncioPublico(anuncioPublico);
            p.setIdSubcategoria(Integer.parseInt(idSubcategoria));
            p.setIdUsuario(Integer.parseInt(idUsuario));
            
            ProductoDAO.setAnuncioCompleto(p);
            
            RequestDispatcher disp = getServletContext()
                    .getRequestDispatcher("/listaProductos.jsp");
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
