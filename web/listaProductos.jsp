<%-- 
    Document   : listaProductos
    Created on : 22-abr-2015, 17:16:50
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.ProductoDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Producto"%>
<%@page import="java.util.ArrayList"%>
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
        <%
            if (session.getAttribute("username") == null)
            {
                request.setAttribute("message", "Inicio de sesión requerido.");
                RequestDispatcher disp = getServletContext()
                    .getRequestDispatcher("/Index");
                disp.forward(request, response);
            }
        %>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <h1>Listado de productos</h1>
            <div id="new_item_list">
            <%
                int idUsuario = (Integer)session.getAttribute("idUsuario");
                List<Producto> productos = new ArrayList<Producto>
                    (ProductoDAO.getListaProductos(idUsuario));
            %>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>Producto</th>
                        <th>Precio (MXN)</th>
                        <th>Existencia</th>
                        <th>Preguntas pendientes</th>
                        <th>Compras pendientes</th>
                        <th>Anunciado</th>
                        <th>Editar</th>
                    </tr>
            <%
            for (Producto producto : productos)
            {
            %>
                    <tr>
                        <td><%= producto.getNombre() %></td>
                        <td><%= String.format(Locale.US, "%.2f", producto.getPrecio()) %></td>
                        <td><%= producto.getExistencia() %></td>
                        <td><a href="anuncioCompleto.jsp?idAnuncio=<%= producto.getIdProducto() %>#preguntas">
                                <%= producto.getPreguntasPendientes() %></a></td>
                        <td><a href="listaVentas.jsp"><%= producto.getComprasPendientes()%></a></td>
                        <%
                        if (AnuncioDAO.getIdAnuncio(producto.getIdProducto()) != 0)
                        {
                        %>
                        <td>Sí</td>
                        <%
                        }
                        else
                        {
                        %>
                        <td style="color: red">No</td>
                        <%
                        }
                        %>
                        <td><a href="detalleProducto.jsp?idProducto=<%= producto.getIdProducto()%>">Editar</a></td>
                    </tr>
            <%
            }
            %>
            </table>
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