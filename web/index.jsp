<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <%
                List<Anuncio> anuncios = AnuncioDAO.getAnunciosCortos(null, null, 1);
            %>

            <div id="trending_items">
                <h1>NOVEDADES</h1>
                <%
                for (int i = 0; i < 3; i++)
                {
                %>
                <div class="item">
                    <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                        <h2><%= anuncios.get(i).getNombre() %></h2>
                        <img src="images/item_printer.gif" width="180" height="170" alt="Sub Item Name" />
                    </a>

                    <p class="footer">
                        Por: <%= anuncios.get(i).getNickUsuario() %> <br>
                        $<%= anuncios.get(i).getPrecio() %><br>
                        <%= anuncios.get(i).getFecha().toString().substring(0, 10) %>
                    </p>
                </div>
                <%
                }
                %>
                <p class="see_more"><a href="#">Ver más...</a></p>
            </div>

            <div id="trending_items">
                <h1>MÁS BARATOS</h1>
                <%
                anuncios = AnuncioDAO.getAnunciosCortos(null, null, 2);
                for (int i = 0; i < 3; i++)
                {
                %>
                <div class="item">
                    <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                        <h2><%= anuncios.get(i).getNombre() %></h2>
                        <img src="images/item_printer.gif" width="180" height="170" alt="Sub Item Name" />
                    </a>

                    <p class="footer">
                        Por: <%= anuncios.get(i).getNickUsuario() %> <br>
                        $<%= anuncios.get(i).getPrecio() %><br>
                        <%= anuncios.get(i).getFecha().toString().substring(0, 10) %>
                    </p>
                </div>
                <%
                }
                %>
                <p class="see_more"><a href="#">Ver más...</a></p>
            </div>

            <div id='users'>


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
    </body>
</html>