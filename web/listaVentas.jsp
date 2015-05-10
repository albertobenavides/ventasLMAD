<%-- 
    Document   : listaVentas
    Created on : 08-may-2015, 11:14:07
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.CompraDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Compra"%>
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
            <h1>Listado de ventas</h1>
            <div id="new_item_list">
            <%
                int idUsuario = (Integer)session.getAttribute("idUsuario");
                List<Compra> ventas = new ArrayList<Compra>
                    (CompraDAO.getListaVentas(idUsuario));
            %>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>Fecha</th>
                        <th>Usuario</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Total (MXN)</th>
                        <th>Método de pago</th>
                        <th>Estado</th>
                        <th></th>
                    </tr>
            <%
            for (Compra v : ventas)
            {
            %>
                    <tr>
                        <td><%= v.getFechaCompra().substring(0,10)%></td>
                        <td><%= v.getUsuarioComprador() %></td>
                        <td><a href="anuncioCompleto.jsp?idAnuncio=<%= v.getIdAnuncio() %>">
                                <%= v.getNombreProducto() %></a></td>
                        <td><%= v.getCantidadCompra() %></td>
                        <td><%= String.format(Locale.US, "%.2f", v.getTotalCompra()) %></td>
                        <td><%= v.getMetodoPagoCompra() %></td>
                        <% if (v.getVentaRealizada() == 1){ %>
                        <td style="color: green">Confirmada</td>
                        <% }else if(v.getVentaRealizada() == 0){ %>
                        <td>Pendiente</td>
                        <% }else{ %>
                        <td style="color: red">Cancelada</td>
                        <% } %>
                        <td><% if (v.getVentaRealizada() != 2){ %>
                        <a href="ConfirmarVenta?idCompra=<%= v.getIdCompra() %>">Vender</a>
                        <% } %></td>
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