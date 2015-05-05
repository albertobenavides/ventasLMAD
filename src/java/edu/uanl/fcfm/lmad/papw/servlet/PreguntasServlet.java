/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uanl.fcfm.lmad.papw.servlet;

import edu.uanl.fcfm.lmad.papw.dao.PreguntaDAO;
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
@WebServlet(name = "PreguntasServlet", urlPatterns = {"/PreguntasServlet"})
public class PreguntasServlet extends HttpServlet {

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
            String pregunta = request.getParameter("pregunta");
            String respuesta = request.getParameter("respuesta" + request.getParameter("counter"));
            int idUsuario;
            if(session.getAttribute("idUsuario") != null)
                idUsuario = (Integer)session.getAttribute("idUsuario");
            else
                idUsuario = 0;
            int idAnuncio;
            if (request.getParameter("idAnuncio") != null)
                idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
            else
                idAnuncio = 0;
            int idPregunta;
            if (request.getParameter("idPregunta") != null)
                idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
            else
                idPregunta = 0;
            
            if (pregunta != null)
            {
                PreguntaDAO.setPregunta(pregunta, idUsuario, idAnuncio);
            }
            else
            {
                PreguntaDAO.setRespuesta(respuesta, idPregunta);
            }
            
            RequestDispatcher disp = getServletContext()
                    .getRequestDispatcher("/anuncioCompleto.jsp?idAnuncio=" + idAnuncio);
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
