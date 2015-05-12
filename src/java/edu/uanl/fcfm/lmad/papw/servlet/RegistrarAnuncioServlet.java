/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO;
import edu.uanl.fcfm.lmad.papw.dao.ProductoDAO;
import edu.uanl.fcfm.lmad.papw.model.Producto;
import java.io.File;
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
@WebServlet(name = "RegistrarAnuncioServlet", urlPatterns = {"/detalleProducto"})
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 * 1,  // 1 MB
        maxFileSize         = 1024 * 1024 * 10, // 10 MB
        maxRequestSize      = 1024 * 1024 * 15 // 15 MB
)
public class RegistrarAnuncioServlet extends HttpServlet {

     private final String directorio = "archivos";
    
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
        
        String uploadPath = getServletContext().getRealPath("/" + directorio + "/");
        
        File fdir = new File(uploadPath);
        if (!fdir.exists()) {
            fdir.mkdir();
        }
        
        try {
            
            Part filePart1 = request.getPart("imagenProducto1");
           
            Part filePart2 = request.getPart("imagenProducto2"); 
            
            Part filePart3 = request.getPart("imagenProducto3"); 
            
            InputStream inputStream1 = filePart1.getInputStream();
            InputStream inputStream2 = filePart2.getInputStream();
            InputStream inputStream3 = filePart3.getInputStream();
            
            String videoPath1;
            String videoPath2;
            String videoPath3;
            
            Part filePart4 = request.getPart("videoProducto1");
            if(filePart4.getContentType().equals("video/mp4")){
                String nombreArchivo = String.valueOf(System.currentTimeMillis());
                nombreArchivo += extractExtension(filePart4);
                videoPath1 = directorio + "/" + nombreArchivo;
                filePart4.write(uploadPath + "/" + nombreArchivo);
            }
            else{
                videoPath1 = "";
            }
            
            Part filePart5 = request.getPart("videoProducto2");
            if(filePart5.getContentType().equals("video/mp4")){
                String nombreArchivo = String.valueOf(System.currentTimeMillis());
                nombreArchivo += extractExtension(filePart5);
                videoPath2 = directorio + "/" + nombreArchivo;
                filePart5.write(uploadPath + "/" + nombreArchivo);
            }
            else{
                videoPath2 = "";
            }
            
            Part filePart6 = request.getPart("videoProducto3");
            if(filePart6.getContentType().equals("video/mp4")){
                String nombreArchivo = String.valueOf(System.currentTimeMillis());
                nombreArchivo += extractExtension(filePart6);
                videoPath3 = directorio + "/" + nombreArchivo;
                filePart6.write(uploadPath + "/" + nombreArchivo);
            }
            else{
                videoPath3 = "";
            }
            
            boolean setImagen1 = true;
            boolean setImagen2 = true;
            boolean setImagen3 = true;
            
            if (filePart1.getSize() == 0)
                setImagen1 = false;
            if (filePart2.getSize() == 0)
                setImagen2 = false;
            if (filePart3.getSize() == 0)
                setImagen3 = false;
            
            HttpSession session = request.getSession();
            
            request.setCharacterEncoding("UTF-8");
            
            int idProducto = Integer.parseInt((String)request.getParameter("idProducto"));
            String precioProducto = (String)request.getParameter("precioProducto");
            String existenciaProducto = (String)request.getParameter("existenciaProducto");
            String idSubcategoria = (String)request.getParameter("idSubcategoria");
            String idUsuario = (String)session.getAttribute("idUsuario").toString();
            
            Producto productoVideo = new Producto(ProductoDAO.getProducto(idProducto));
            
            if (videoPath1.equals(""))
                videoPath1 = productoVideo.getVideo1();
            
            if (videoPath2.equals(""))
                videoPath2 = productoVideo.getVideo2();
            
            if (videoPath3.equals(""))
                videoPath3 = productoVideo.getVideo3();
            
            Producto p = new Producto();
            p.setIdProducto(idProducto);
            p.setNombre(new String (
                            request.getParameter("nombreProducto").getBytes ("iso-8859-1"), "UTF-8"));
            p.setPrecio(Float.parseFloat(precioProducto));
            p.setExistencia(Integer.parseInt(existenciaProducto));
            p.setDescripcionLarga(new String (
                            request.getParameter("descripcionProducto").getBytes ("iso-8859-1"), "UTF-8"));
            p.setImagen1(inputStream1);
            p.setImagen2(inputStream2);
            p.setImagen3(inputStream3);
            p.setVideo1(videoPath1);
            p.setVideo2(videoPath2);
            p.setVideo3(videoPath3);
            p.setIdSubcategoria(Integer.parseInt(idSubcategoria));
            p.setIdUsuario(Integer.parseInt(idUsuario));
            p.setSetImagen1(setImagen1);
            p.setSetImagen2(setImagen2);
            p.setSetImagen3(setImagen3);
            
            ProductoDAO.editarProducto(p);
            
            String vigencia = request.getParameter("vigencia");
            int miniatura = 1;
            if (request.getParameter("miniatura") != null)
                miniatura = Integer.parseInt(request.getParameter("miniatura"));
            String anunciar = request.getParameter("anunciar");
            String anuncioExiste = request.getParameter("anuncioExiste");
            
            if (anunciar.equalsIgnoreCase("yes"))
            {
                int efectivo;
                if(request.getParameter("efectivo") != null)
                    efectivo = Integer.parseInt(request.getParameter("efectivo"));
                else
                    efectivo = 0;
                int tarjeta;
                if (request.getParameter("tarjeta") != null)
                    tarjeta = Integer.parseInt(request.getParameter("tarjeta"));
                else 
                    tarjeta = 0;
                int metodoPago = efectivo + tarjeta;

                if(anuncioExiste.equalsIgnoreCase("yes"))
                {
                    AnuncioDAO.updateAnuncio(Integer.parseInt(request.getParameter("idAnuncio")),
                            metodoPago, miniatura, vigencia );
                }
                else
                {
                    AnuncioDAO.setAnuncio(vigencia, miniatura, metodoPago, idProducto);
                }
            }
            else if (anunciar.equalsIgnoreCase("no") && request.getParameter("idAnuncio") != null)
            {
                    AnuncioDAO.bajaAnuncio(Integer.parseInt(request.getParameter("idAnuncio")));
            }
            
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
