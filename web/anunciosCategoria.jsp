<%-- 
    Document   : anunciosCategoria
    Created on : 15-abr-2015, 17:53:03
    Author     : Alberto
--%>

<%@page import="java.util.List"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
            <div id="content" class="inline_block">
                <div class="content">
                    <%
                        List<Anuncio> anuncios = (List<Anuncio>)
                                    request.getAttribute("anuncios");
                        for (int i = 0; i < anuncios.size(); i++)
                        {
                    %>
                    <div class="item">
                        <a href="anuncio?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                            <h1><%= anuncios.get(i).getNombre() %></a></h1>
                            <img src="images/item_printer.gif" width="167" height="164" alt="Sub Item Name" />
                        </a>
                        <p class="footer">Publicado por: <%= anuncios.get(i).getNickUsuario() %> <br />
                        <%= anuncios.get(i).getFecha().toString().substring(0, 10)%> <br />
                        $<%= anuncios.get(i).getPrecio() %><br>
                        <a href="#">Add to Cart</a></p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>