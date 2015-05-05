<%-- 
    Document   : anunciosCategoria
    Created on : 15-abr-2015, 17:53:03
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
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
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <div id='searcher'>
                Ordenar por: 
                <select>
                    <option>Fecha</option>
                    <option>Ventas</option>
                    <option>Precio</option>
                </select>
                <select>
                    <option>Descendente</option>
                    <option>Ascendente</option>
                </select>
                <select id="cantidad">
                    <option>5</option>
                    <option>10</option>
                    <option>15</option>
                </select>
                por página
            </div>
            <%
                String categoria = request.getParameter("categoria");
                String subcategoria = request.getParameter("subcategoria");
                String criterio = request.getParameter("criterio");
                int order;
                if(request.getParameter("orden") != null)
                    order = Integer.parseInt(request.getParameter("orden"));
                else
                    order = 1;
                
                if (criterio == null)
                    criterio = "";
                String parametro = request.getParameter("parametro");
                List<Anuncio> anuncios;
                
                if (criterio.equals("todos"))
                    anuncios = AnuncioDAO.getAnunciosBusqueda(parametro, 
                                parametro, null, null);
                else if (criterio.equals("productos"))
                    anuncios = AnuncioDAO.getAnunciosBusqueda(parametro, 
                                null, null, null);
                else if (criterio.equals("usuarios"))
                    anuncios = AnuncioDAO.getAnunciosBusqueda(null, 
                                parametro, null, null);
                
                else if (categoria != null || subcategoria != null)
                    anuncios = AnuncioDAO.getAnunciosCortos(categoria, subcategoria, order);
                else
                    anuncios = AnuncioDAO.getAnunciosCortos(null, null, order);
                for (int i = 0; i < anuncios.size(); i++)
                {
            %>
            <div class="item">
                <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                    <h2><%= anuncios.get(i).getNombre() %></h2>
                    <img src="images/noImage.jpg" width="180" height="170" alt="Sub Item Name" />
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
    </body>
</html>