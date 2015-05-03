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
        <div id="header">
            <ul class="inline">
                <li><input type="text" value="Buscar..." onclick="this.value=''"
                           onblur="if(this.value === '') { this.value='Buscar...';}"/></li>
                <li><input type="submit" /></li>
            </ul>
        </div>
        
        <div id="main_content">
        
            <div id="menu" class="inline_block">

                <div id="logo">
                    <h1><a href="Index">VENTASLMAD</a></h1>
                    <h2>Juegos y más juegos para los frikis de hoy y siempre</h2>
                </div>

                <div id="session">
                <%
                    if (session.getAttribute("username") == null)
                    {
                %>
                    <h2>Iniciar sesión</h2>
                    <form method="post" action="login">
                        <input type="text" name="nickname" value="usuario"
                               onclick="this.value=''" onblur="if(this.value === '') { this.value='usuario';}"/>
                        <input type="text" name="password" value="contraseña"
                               onclick="this.value=''; this.type='password'" 
                               onblur="if(this.value === '') 
                                   { this.value='contraseña'; this.type='text';}"/>
                        <input type="submit">
                        <input type="reset">
                    </form>
                <%
                    }
                    else
                    {
                %>
                    <h2>Bienvenido, <%= (String)session.getAttribute("username") %></h2>
                    <ul>
                        <li><a href="listaProductos.jsp">Mis productos</a></li>
                        <li><a href="nuevoProducto.jsp">Registrar producto</a></li>
                        <li><a href="#">Detalles</a></li>
                        <li><a href="Index?logout=true">Cerrar sesión</a></li>
                    </ul>
                <%
                    }
                %>                
                </div>

                <div id="categories">
                    <h2>Categorías</h2>
                    <ul>
                    <%
                        List<String> categorias = (List<String>)
                            session.getAttribute("categorias");
                        if (categorias != null) 
                        {
                            String categoriaTemp = null;
                            for (String cat : categorias)
                            {
                                String subcategoria = cat.substring(cat.indexOf(",") + 1);
                                String categoriaString = cat.substring(0, cat.indexOf(","));
                                if(!categoriaString.equals(categoriaTemp))
                                {
                                    categoriaTemp = categoriaString;
                    %>
                        <li class="titulo"><a href="categoria?categoria=<%= categoriaTemp %>">
                                <%= categoriaTemp %></a></li>
                        <li><a href="categoria?subcategoria=<%= subcategoria %>"><%= subcategoria %></a></li>
                    <%
                                }
                                else
                                {
                    %>
                        <li><a href="categoria?subcategoria=<%= subcategoria %>"><%= subcategoria %></a></li>
                    <%
                                }
                            }
                        }
                    %>
                    </ul>
                </div>
            </div>

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
                            <td><a href="#?idProducto=<%= producto.getIdProducto() %>">Anunciar</a></td>
                            <td><a href="#?idProducto=<%= producto.getIdProducto() %>">Eliminar</a></td>
                        </tr>
                <%
                }
                %>
                </table>
            </div>
        </div>
    </body>
</html>