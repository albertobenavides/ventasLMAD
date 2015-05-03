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
        <link rel="stylesheet" href="themes/alertify.core.css" />
        <link rel="stylesheet" href="themes/alertify.default.css" />
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
                                   { this.value='contraseña'; this.type='text'}"/>
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
            <%
                List<Anuncio> anuncios = (List<Anuncio>)
                                request.getAttribute("anuncios");
            %>

                <div id="newest_item">
                    <a href="anuncio?idAnuncio=<%= anuncios.get(0).getIdAnuncio()%>">
                        <h1><%= anuncios.get(0).getNombre() %></h1>
                        <img src="images/item_new.gif" width="180" height="170" alt="New Item Name">
                    </a>
                    <p class="footer">$<%= anuncios.get(0).getPrecio() %><br>
                    <%= anuncios.get(0).getFecha().toString().substring(0, 10) %></p>
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