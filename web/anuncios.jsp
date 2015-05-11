<%-- 
    Document   : anunciosCategoria
    Created on : 15-abr-2015, 17:53:03
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
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
        <script src="list.js"></script>
        <script src="list.pagination.min.js"></script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <div id="anuncios">
                <div id="searcher">
                    Ordenar por: 
                    <button class="sort" data-sort="nombre">
                        Producto
                    </button>
                    <button class="sort" data-sort="precio">
                        Precio
                    </button>
                    <button class="sort" data-sort="fecha">
                        Fecha
                    </button>
                    <button class="sort" data-sort="usuario">
                        Usuario
                    </button>
                </div>
                <%  String categoria = request.getParameter("categoria");
                    String subcategoria = request.getParameter("subcategoria");
                    String criterio = request.getParameter("criterio");
                    String fechaInicio = request.getParameter("fechaInicio");
                    String fechaFin = request.getParameter("fechaFin");
                    int order;
                    if (request.getParameter("orden") != null) {
                        order = Integer.parseInt(request.getParameter("orden"));
                    } else {
                        order = 1;
                    }

                    if (criterio == null) {
                        criterio = "";
                    }
                    String parametro = request.getParameter("parametro");
                    List<Anuncio> anuncios;

                    if (criterio.equals("todos")) {
                        anuncios = AnuncioDAO.getAnunciosBusqueda(parametro,
                                parametro, null, null);
                    } else if (criterio.equals("productos")) {
                        anuncios = AnuncioDAO.getAnunciosBusqueda(parametro,
                                null, null, null);
                    } else if (criterio.equals("usuarios")) {
                        anuncios = AnuncioDAO.getAnunciosBusqueda(null,
                                parametro, null, null);
                    } else if (fechaInicio != null) {
                        anuncios = AnuncioDAO.getAnunciosBusqueda(null,
                                null, fechaInicio, fechaFin);
                    } else if (subcategoria != null && categoria == null) {
                        anuncios = AnuncioDAO.getAnunciosCortos(null, subcategoria, order);
                    } else if (categoria != null || subcategoria != null) {
                        anuncios = AnuncioDAO.getAnunciosCortos(categoria, subcategoria, order);
                    } else {
                        anuncios = AnuncioDAO.getAnunciosCortos(null, null, order);
                    }%>
                <ul class="list">
                    <%
                        for (int i = 0; i < anuncios.size(); i++) {
                    %>
                    <li class="item" style="width: 180px; height: 250px; text-align: center; vertical-align: top;
                        margin-bottom: 20px;">
                        <a href="anuncioCompleto.jsp?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                            <h2 class="nombre"><%= anuncios.get(i).getNombre()%></h2>
                            <div style="width: 180px; height: 170px; text-align: center; vertical-align: middle;
                                 margin-bottom: 15px;">
                                <img src="<%= request.getServletContext().getContextPath()
                                        + "/MostrarImagenProducto?idProducto="
                                        + anuncios.get(i).getIdProducto()%>&imagen=<%= anuncios.get(i).getThumbnailAnuncio()%>"
                                     style="max-width: 180px; max-height: 170px;
                                     width: auto; height: auto;"/>
                            </div>
                        </a>
                        <p class="usuario">Por: <%= anuncios.get(i).getNickUsuario().toLowerCase()%></p>
                        <p class="precio">$<%= String.format(Locale.US, "%.2f", anuncios.get(i).getPrecio())%></p>
                        <p class="fecha"><%= anuncios.get(i).getFecha().toString().substring(0, 10)%></p>
                    </li>
                    <%
                        }
                    %>
                </ul>
                <div class="pages">
                    <p>Página: </p>
                    <ul class="pagination"></ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        var userList = new List
                (
                        'anuncios',
                        {
                            valueNames: ['nombre', 'usuario', 'precio', 'fecha'],
                            page: 6,
                            plugins: [ListPagination({})]
                        }
                );
    </script>
</body>
</html>