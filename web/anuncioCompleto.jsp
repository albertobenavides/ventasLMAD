<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
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
                String emailVendedor;
                int idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
                Anuncio a = new Anuncio(AnuncioDAO.getAnuncioCompleto(idAnuncio));
                %>
                <div style="display: inline-block; margin-right: 20px; width: 250px;
                     text-align: center">
                    <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + 
                                a.getIdProducto()%>&imagen=<%= a.getThumbnailAnuncio() %>"
                                height="180px" style="max-width:100%;"/>
                </div>
                <div style="display: inline-block; vertical-align: top; width: 330px;">
                    <h1><%= a.getNombre() %></h1>
                    <h2>$<%= String.format(Locale.US, "%.2f", a.getPrecio()) %></h2>
                    <h2>Existencias: <%= a.getExistencias()%></h2>
                </div>
                <%
                if (session.getAttribute("username") == null)
                {
                %>
                <p>
                    Sólo los usuarios registrados pueden hacer compras. 
                    Regístrate <a href="registro.jsp">aquí</a>.
                </p>
                <%
                }
                else if (!a.getNickUsuario().equalsIgnoreCase((String)session.getAttribute("username")))
                {
                %>
                <div style="text-align: right;">
                <form action="Comprar" method="post">
                    <div style="display: inline-block">
                        Cantidad: <br>
                        Método de pago:
                    </div>
                    <div style="display: inline-block; text-align: left">
                        <input type="number" name="cantidadCompra" value="1"
                                     max="<%= a.getExistencias()%>"
                                     min="1"><br>
                        <select name="metodoPagoCompra">
                            <%
                            String[] metodoPago = a.getMetodoPago().split(",");
                            for(String s : metodoPago)
                            {
                            %>
                            <option value="<%= s %>"><%= s %></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                    <div style="display: inline-block; vertical-align: middle;">
                        <input type="hidden" name="idAnuncio" value="<%= idAnuncio %>">
                        <input type="hidden" name="correoAnuncio" value="<%= a.getCorreoElectronico() %>">
                    <input type="submit" value="Comprar">
                    </div>
                </form>
                </div>
                <%
                }
                %>
                <h2>Descripción</h2>
                <p><%= a.getCaracteristicas()%></p>
                
                <h2>Publicado por</h2>
                <div style="display: inline-block; margin-right: 20px; width: 100px;
                     text-align: center">
                    <img 
                    src="<%= request.getServletContext().getContextPath() 
                                + "/mostrarImagen?id=" +  a.getIdUsuario() %>"
                                 height="130px" style="max-width: 100%;
                                 border-radius: 5px;"/></div>
                <div style="display: inline-block; vertical-align: bottom;">
                    <%= a.getNombreUsuario()%><br>
                    <%= emailVendedor = a.getCorreoElectronico()%><br>
                    <%= a.getTelefono()%><br>
                    Fecha de publicación: <%= a.getFecha().toString().substring(0, 10) %><br><br>
                    <% request.setAttribute("emailVendedor", emailVendedor); %>
                </div>
            </div>
            <div class="questions">
                <h1>PREGUNTAS DE USUARIOS</h1><a name="preguntas"></a>
                <%
                List<Pregunta> preguntas = new ArrayList<Pregunta>(PreguntaDAO.getPregunta(idAnuncio));
                int counter = 0;
                for(Pregunta p : preguntas)
                {
                    counter++;
                %>
                <div>
                    <div class="derecha"><%= p.getFechaPublicacion().substring(0,10) %></div>
                    <img src="<%= request.getServletContext().getContextPath() 
                            + "/mostrarImagen?id=" +  p.getIdUsuario() %>"
                            width="30px" height="40px"
                            style="max-width: 100%; max-height: 100%;
                            border-radius: 5px;"
                            align="middle"/>
                    <span><%= p.getNombreUsuario()%></span>
                    
                    <p><%= p.getTextoPregunta() %></p>
                    <%
                    if(p.getTextoRespuesta() != null)
                    {
                    %>
                    <h3><%= p.getTextoRespuesta() %></h3>
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
                                <input type="submit" value="Responder">
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
                    Sólo los usuarios registrados pueden hacer preguntas. 
                    Regístrate <a href="registro.jsp">aquí</a>.
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
                    <input type="hidden" name="correoVendedor" value="<%= (String)request.getAttribute("emailVendedor") %>">
                    <input type="submit" value="Preguntar">
                </form>
                <%
                }
                %>
            </div>
        </div>
    </body>
</html>