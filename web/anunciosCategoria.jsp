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
                </div>
            </div>
        </div>
    </body>
</html>