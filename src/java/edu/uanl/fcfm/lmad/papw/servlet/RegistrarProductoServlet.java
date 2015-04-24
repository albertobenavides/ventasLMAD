/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO;
import edu.uanl.fcfm.lmad.papw.model.Anuncio;
import java.io.File;
import java.io.IOException;
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
@MultipartConfig(fileSizeThreshold = 1048576, maxFileSize = 2097152, maxRequestSize = 52428800)
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
    private final String directory = "files"; // Para imágenes
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            // Manejo de Imágenes
            String uploadPath = getServletContext().getRealPath("/" + directory
                + "/");
            System.out.println("PATH:" + uploadPath);
            File fdir = new File(uploadPath);
            if (!fdir.exists())
            {
                fdir.mkdir();
            }
            
            Part part = request.getPart("videoProducto");// Para recuperar el archivo (?)
            
            if (part != null && part.getSize() > 0)
            {
                String contentType = part.getContentType(); // Regresa el MIME
                if (contentType.equals("video/mp4") || contentType.equals("image/jpeg"))
                {
                    String nombreArchivo = System.currentTimeMillis() + "";
                    if (contentType.equals("video/mp4"))
                    {
                        part.write(uploadPath + nombreArchivo + ".mp4"); // Guarda en archivo y borra de memoria
                        
                        String path = directory + "/" + nombreArchivo + ".mp4";
                        
                        /*
                        setUbicacionArchivo(path); // tal tal tal
                        */
                    }
                    else // ¡Es de otro tipo de archivo! (Imagen, en este caso)
                    {
                        // Agregar en el archivo un
                        // InputStream archivoAlgo... Y añadir los getters y setters del mismo.
                        
                        // El inputStream regresa un inputStream :C
                        
                        part.getInputStream(); // Se utiliza para pasar el InputStream que recibe el setBlob del DAO
                        
                    }
                }
                else // Si es otra cosa, excepción...
                {}
                
            }
            else // Si hay error en los tipos...
            {}
            /* Agregar validaciones (nulo, tipo de archivo, etcétera)*/
            
            // Fin de manejo de imágenes
            
            
            /* Mostrar videos:
             *
             *  <video width="" height="" controls="controls">
             *      <source src="<%= request.ServletContext().getContextPath() + "/" + attributePath">
             *  </video>
             *
             * Fin mostrar videos
             */
            
            /*
             * Hola Iván, qué metiche :c
             */
            
            /* Mostrar imágenes
                <img src="<%= request.getServletContext().getContextPath() + 
                    unServletQueMuestraDibujos?yElAtributo= + 
                    request.getAttribute("idImagen")%>">
            
            // Desde el Dao se utiliza un rs.getBinaryStream(); // Para recuperar los Blobs
            */
            HttpSession session = request.getSession();
            
            String nombreProducto = request.getParameter("nombreProducto");
            String precioProducto = request.getParameter("precioProducto");
            String descripcionProducto = request.getParameter("descripcionProducto");
            String existenciaProducto = request.getParameter("existenciaProducto");
            String vigenciaProducto = request.getParameter("vigenciaProducto");
            if (vigenciaProducto.equals(""))
                vigenciaProducto = null;
            String idSubcategoria = (String)request.getParameter("idSubcategoria");
            String idUsuario = session.getAttribute("idUsuario").toString();
            boolean anuncioPublico = Boolean.parseBoolean(request.getParameter("publicarAnuncio"));
            
            Anuncio a = new Anuncio (nombreProducto, Double.parseDouble(precioProducto),
                    descripcionProducto, vigenciaProducto, Integer.parseInt(existenciaProducto),
                    Integer.parseInt(idUsuario), null, null, anuncioPublico, idSubcategoria);
            
            AnuncioDAO.setAnuncioCompleto(a);
            
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
