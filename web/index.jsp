<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="slideshow.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="themes/alertify.core.css" />
        <link rel="stylesheet" href="themes/alertify.default.css" />
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
            <div id="content" class="inline_block">
                <%
                    List<Anuncio> anuncios = (List<Anuncio>)
                            request.getAttribute("anuncios");
                %>
                <div class="css-slideshow"> 
                    <figure>
                        <img src="images/noImage.jpg"/>
                        <figcaption><strong>CSS3:</strong> CSS3 delivers a...</figcaption> 
                    </figure>
                    <figure>
                        <img src="images/test.jpg"/>
                        <figcaption><strong>Semantics:</strong> Giving meaning to...</figcaption> 
                    </figure>
                    <figure>
                        <img src="images/test2.jpg"/>
                        <figcaption><strong>Semantics:</strong> Giving meaning to...</figcaption> 
                    </figure>
                </div>
                
                <div id="newest_item">
                    <div class="item">
                        <a href="anuncio?idAnuncio=<%= anuncios.get(0).getIdAnuncio()%>">
                            <h1><%= anuncios.get(0).getNombre() %></h1>
                            <img src="images/item_new.gif" width="180" height="170" alt="New Item Name">
                        </a>
                        <p class="footer">$<%= anuncios.get(0).getPrecio() %><br>
                        <%= anuncios.get(0).getFecha().toString().substring(0, 10) %></p>
                    </div>
                </div>

                <div id="newests_items">
                    <div class="item">
                        <a href="anuncio?idAnuncio=<%= anuncios.get(1).getIdAnuncio()%>">
                            <h1><%= anuncios.get(1).getNombre() %></h1>
                            <img src="images/item_printer.gif" width="180" height="170" alt="Sub Item Name" />
                        </a>

                        <p class="footer">$<%= anuncios.get(1).getPrecio() %><br>
                        <%= anuncios.get(1).getFecha().toString().substring(0, 10) %></p>
                    </div>

                    <div class="item">
                    <a href="anuncio?idAnuncio=<%= anuncios.get(2).getIdAnuncio()%>">
                        <h1><%= anuncios.get(2).getNombre() %></h1>
                        <img src="images/item_printer.gif" width="180" height="170" alt="Sub Item Name" />
                    </a>

                    <p class="footer">$<%= anuncios.get(2).getPrecio() %><br>
                    <%= anuncios.get(2).getFecha().toString().substring(0, 10) %></p>
                    </div>
                </div>
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