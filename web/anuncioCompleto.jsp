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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1>PREGUNTAS DE USUARIOS</h1>
                <%
                List<Pregunta> preguntas = new ArrayList<Pregunta>(PreguntaDAO.getPregunta(idAnuncio));
                int counter = 0;
                for(Pregunta p : preguntas)
                {
                    counter++;
                %>
                <div>
                    <h2><strong><%= p.getNombreUsuario()%></strong> (<%= p.getFechaPublicacion().substring(0,10) %>):</h2>
                    <p><%= p.getTextoPregunta() %></p>
                    <%
                    if(p.getTextoRespuesta() != null)
                    {
                    %>
                        <h3><strong><%= a.getNickUsuario()%></strong>: <%= p.getTextoRespuesta() %></h3>
                    <%
                    }
                    else if(a.getNickUsuario().equalsIgnoreCase((String)session.getAttribute("username")))
                    {
                    %>
                            <form action="PreguntasServlet" method="post" id="forma<%=counter%>">
                                <textarea name="respuesta<%=counter%>" form="forma<%=counter%>"
                                          maxlength="500" rows="2" cols="65"></textarea><br>
                                <input type="hidden" name="idPregunta" value="<%= p.getIdPregunta() %>">
                                <input type="hidden" name="idAnuncio" value="<%= idAnuncio %>">
                                <input type="hidden" name="counter" value="<%= counter %>">
                                <input type="reset"><input type="submit" value="Responder">
                            </form>
                    <%
                        }
                    %>
                </div>
                <%
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