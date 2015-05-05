<%-- 
    Document   : listaProductos
    Created on : 22-abr-2015, 17:16:50
    Author     : Alberto
--%>

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
            <h1>Registrar nuevo producto</h1>
            <div id="new_item_list">
            <%
                String idUsuario = session.getAttribute("idUsuario").toString();
                List<Producto> productos = new ArrayList<Producto>
                    (ProductoDAO.getListaProductos(idUsuario));
            %>
                <table cellspacing="3px">
                    <tr>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Existencia</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
            <%
            for (Producto producto : productos)
            {
            %>
                    <tr>
                        <td><%= producto.getFecha() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getPrecio() %></td>
                        <td><%= producto.getExistencia() %></td>
                        <td><a href="detalleProducto.jsp?idProducto=<%= producto.getIdProducto()%>">Editar</a></td>
                        <td><a href="nuevoAnuncio.jsp?idProducto=<%= producto.getIdProducto() %>">Anunciar</a></td>
                        <td><a href="#?idProducto=<%= producto.getIdProducto() %>">Eliminar</a></td>
                    </tr>
            <%
            }
            %>
            </table>
        </div>
    </body>
</html>