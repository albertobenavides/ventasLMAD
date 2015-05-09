<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="themes/alertify.core.css" />
        <link rel="stylesheet" href="themes/alertify.default.css" />
    </head>
    <body>
        <%
        String logout = request.getParameter("logout");
        
        if (logout == null)
            logout = (String)request.getAttribute("logout");
        
        if (logout != null) 
        {
            session = request.getSession();
            session.invalidate();
        }
        
        session = request.getSession(); // Revisar
        %>
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <%
                List<Anuncio> anuncios = AnuncioDAO.getAnunciosCortos(null, null, 1);
            %>

            <div id="trending_items">
                <h1>NOVEDADES</h1>
                <%
                int total = 3;
                if (anuncios.size() < 3)
                    total = anuncios.size();
                if (anuncios.size() > 0)
                {
                for (int i = 0; i < total; i++)
                {
                %>
                <div class="item">
                    <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                        <h2><%= anuncios.get(i).getNombre() %></h2>
                        <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + 
                                anuncios.get(i).getIdProducto()%>&imagen=<%= anuncios.get(i).getThumbnailAnuncio() %>"
                                width="180px" height="170px"/>
                    </a>

                    <p class="footer">
                        Por: <%= anuncios.get(i).getNickUsuario() %> <br>
                        $<%= String.format(Locale.US, "%.2f", anuncios.get(i).getPrecio()) %><br>
                        <%= anuncios.get(i).getFecha().toString().substring(0, 10) %>
                    </p>
                </div>
                <%
                }
                }
                %>
                <p class="see_more"><a href="anuncios.jsp?orden=1">Ver más...</a></p>
            </div>

            <div id="trending_items">
                <h1>MÁS BARATOS</h1>
                <%
                anuncios = AnuncioDAO.getAnunciosCortos(null, null, 2);
                if (anuncios.size() < 3)
                    total = anuncios.size();
                if (anuncios.size() > 0)
                {
                for (int i = 0; i < total; i++)
                {
                %>
                <div class="item">
                    <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                        <h2><%= anuncios.get(i).getNombre() %></h2>
                        <img src="images/item_printer.gif" width="180" height="170" 
                             alt="<%= anuncios.get(i).getNombre() %>" />
                    </a>

                    <p class="footer">
                        Por: <%= anuncios.get(i).getNickUsuario() %> <br>
                        $<%= String.format(Locale.US, "%.2f", anuncios.get(i).getPrecio()) %><br>
                        <%= anuncios.get(i).getFecha().toString().substring(0, 10) %>
                    </p>
                </div>
                <%
                }
                }
                %>
                <p class="see_more"><a href="anuncios.jsp?orden=2">Ver más...</a></p>
            </div>
        </div>                    
        <%                        
            String message = (String)request.getAttribute("message");

            if (message != null)
            {
        %>
        <script src="lib/alertify.min.js"></script>
        <script>alertify.log("<%= message %>");</script>
        <%
            }
        %>
    </div>
    </body>
</html>