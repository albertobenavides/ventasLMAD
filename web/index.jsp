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
                <li><a href="Index">Inicio</a></li>
                <li><a href="#">Status</a></li>
                <li><a href="#">Contacto</a></li>
                <li><input type="text" value="Buscar..."/></li>
                <li><input type="submit" /></li>
            </ul>
        </div>
        
        <div id="main_content">
        
            <div id="menu" class="inline_block">

                <div id="logo">
                    <h1><span>Ventas LMAD</span></h1>
                    <h2><span>Juegos y más juegos para los frikis de hoy y siempre</span></h2>
                </div>

                <div id="session">
                <%
                    if (session.getAttribute("username") == null)
                    {
                %>
                    <h2>Iniciar sesión</h2>
                    <form method="post" action="login">
                        <input type="text" name="nickname" value="usuario"/>
                        <input type="password" name="password" value="contraseña"/>
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
                        <li><a href="categoria?subcategoria=<%= subcategoria %>">- <%= subcategoria %></a></li>
                    <%
                                }
                                else
                                {
                    %>
                        <li><a href="categoria?subcategoria=<%= subcategoria %>">- <%= subcategoria %></a></li>
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

                <div id="new_item">
                    <a href="anuncio?idAnuncio=<%= anuncios.get(0).getIdAnuncio()%>">
                        <%= anuncios.get(0).getNombre() %>
                        <img src="images/item_new.gif" width="180" height="170" alt="New Item Name">
                    </a><br>
                    $<%= anuncios.get(0).getPrecio() %><br>
                    <%= anuncios.get(0).getFecha().toString().substring(0, 10) %>
                </div>

                <div id="new_item" class="inline_block">
                    <h1><a href="anuncio?idAnuncio=<%= anuncios.get(1).getIdAnuncio()%>">
                            <%= anuncios.get(1).getNombre() %></a></h1>
                    <img src="images/item_printer.gif" width="170" height="170" alt="Sub Item Name" />

                    <p>$<%= anuncios.get(1).getPrecio() %></p>
                    <p><%= anuncios.get(1).getFecha().toString().substring(0, 10)%></p>

                    <a href="#">Comprar</a>
                </div>

                <div id="new_item" class="inline_block">
                    <h1><a href="anuncio?idAnuncio=<%= anuncios.get(2).getIdAnuncio()%>">
                            <%= anuncios.get(2).getNombre() %></a></h1>
                    <img src="images/item_printer.gif" width="170" height="170" alt="Sub Item Name" />
                    
                    <p>$<%= anuncios.get(2).getPrecio() %></p>
                    <p><%= anuncios.get(2).getFecha().toString().substring(0, 10)%></p>

                    <a href="#">Comprar</a>
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