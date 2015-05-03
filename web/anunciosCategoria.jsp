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