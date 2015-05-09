/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.ProductoDAO;
import edu.uanl.fcfm.lmad.papw.model.Producto;
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
@WebServlet(name = "RegistrarProductoServlet", urlPatterns = {"/nuevoProducto"})
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15 // 15 MB
)
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
            
            Part filePart1 = request.getPart("imagenProducto1"); 
            String contentType1 = filePart1.getContentType();
            
            Part filePart2 = request.getPart("imagenProducto2"); 
            String contentType2 = filePart2.getContentType();
            
            Part filePart3 = request.getPart("imagenProducto3"); 
            String contentType3 = filePart3.getContentType();
            
            InputStream inputStream1 = filePart1.getInputStream();
            InputStream inputStream2 = filePart2.getInputStream();
            InputStream inputStream3 = filePart3.getInputStream();
            
            request.setCharacterEncoding("UTF-8");
            String precioProducto = (String)request.getParameter("precioProducto");
            String existenciaProducto = (String)request.getParameter("existenciaProducto");
            String idSubcategoria = (String)request.getParameter("idSubcategoria");
            String idUsuario = (String)session.getAttribute("idUsuario").toString();
            
            Producto p = new Producto();
            p.setNombre(new String (
                            request.getParameter("nombreProducto").getBytes ("iso-8859-1"), "UTF-8"));
            p.setPrecio(Float.parseFloat(precioProducto));
            p.setExistencia(Integer.parseInt(existenciaProducto));
            p.setDescripcionLarga(new String (
                            request.getParameter("descripcionProducto").getBytes ("iso-8859-1"), "UTF-8"));
            p.setImagen1(inputStream1);
            p.setImagen2(inputStream2);
            p.setImagen3(inputStream3);
            p.setVideo1("");
            p.setVideo2("");
            p.setVideo3("");
            p.setIdSubcategoria(Integer.parseInt(idSubcategoria));
            p.setIdUsuario(Integer.parseInt(idUsuario));
            
            ProductoDAO.setProducto(p);
            
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
