<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.PreguntaDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <div class="ads">
                <%
                int idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
                Anuncio a = new Anuncio(AnuncioDAO.getAnuncioCompleto(idAnuncio));
                %>
                <h1><%= a.getNombre() %></h1>
                <h2>$<%= a.getPrecio() %></h2>
                <img src="images/item_new.gif" width="242" height="180" alt="New Item Name" />
                <br>
                <h2>Descripción</h2>
                <p><%= a.getCaracteristicas()%></p>
                <h2>Publicado por</h2>
                <p><%= a.getNombreUsuario()%></p>
                <p><%= a.getCorreoElectronico()%></p>
                <p><%= a.getTelefono()%></p>
                <p>Fecha de publicación: <%= a.getFecha().toString().substring(0, 10) %></p>
            </div>
            <div class="questions">
                <h1>Preguntas de usuarios</h1>
                <%
                List<Pregunta> preguntas = new ArrayList<Pregunta>(PreguntaDAO.getPregunta(idAnuncio));
                for(Pregunta p : preguntas)
                {
                %>
                <h2><%= p.getNombreUsuario() %> en <%= p.getFechaPublicacion().substring(0,10) %></h2>
                    <h3><%= p.getTextoPregunta() %></h3>
                <%
                if(p.getTextoRespuesta() != null)
                {
                %>
                    <h4><%= a.getNickUsuario()%>: <%= p.getTextoRespuesta() %></h4>
                <%
                }
                else if(a.getNickUsuario().equalsIgnoreCase((String)session.getAttribute("username")))
                    {
                %>
                        <form action="PreguntasServlet" method="post" id="forma">
                            <textarea name="respuesta" form="forma"
                                      maxlength="500" rows="2" cols="65"></textarea><br>
                            <input type="hidden" name="idPregunta" value="<%= p.getIdPregunta() %>">
                            <input type="hidden" name="idAnuncio" value="<%= idAnuncio %>">
                            <input type="reset"><input type="submit" value="Responder">
                        </form>
                <%
                    }
                }
                %>
                <%
                if (session.getAttribute("username") == null)
                {
                %>
                <p>
                    Requieres ser un usuario registrado para hacer preguntas. 
                    Regístrate <a href="signup.jsp">aquí</a>.
                </p>
                <%
                }
                else if (!a.getNickUsuario().equalsIgnoreCase((String)session.getAttribute("username")))
                {
                %>
                <form action="PreguntasServlet" method="post" id="forma">
                    <textarea name="pregunta" form="forma"
                              maxlength="500" rows="4" cols="65"></textarea><br>
                    <input type="hidden" name="idAnuncio" value="<%= idAnuncio %>">
                    <input type="reset"><input type="submit" value="Preguntar">
                </form>
                <%
                }
                %>
            </div>
        </div>
    </body>
</html>