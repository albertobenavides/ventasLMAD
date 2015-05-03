<%-- 
    Document   : nuevoProducto
    Created on : 16-abr-2015, 10:36:11
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.CategoriaDAO"%>
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
                <form action="nuevoProducto" method="post" id="forma"
                      enctype="multipart/form-data">
                    <fieldset>
                        <legend>Datos necesarios</legend>
                        <div>
                            Nombre del producto:<br>
                            <input type="text" name="nombreProducto" 
                                   maxlength="50" required><br>
                            Precio:<br>
                            <input type="number" name="precioProducto"
                                   required><br>
                            Categoría:
                            <select name="idSubcategoria" form="forma">
                        <%
                                List<String> subcategorias = CategoriaDAO.listaSubcategorias();
                                for (int i = 0; i < subcategorias.size(); i++)
                                {
                        %>
                        <option value="<%= i + 1%>"><%= subcategorias.get(i) %></option>
                        <%            
                                }
                        %>
                            </select>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Información adicional</legend>
                        <div>
                            Descripción: [Cambiar por TEXTAREA]<br>
                            <input type="text" name="descripcionProducto"
                                   maxlength="500"><br>
                            Existencia:<br>
                            <input type="number" name="existenciaProducto"><br>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Multimedia</legend>
                        <div>
                            Cargar imágenes:<br>
                            <input type="file" name="imagenProducto"><br>
                            Cargar Video:<br>
                            <input type="file" name="videoProducto"><br>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Anunciar</legend>
                        <div>
                            ¿Desea publicar su producto?<br>
                            No: <input type="radio" name="publicarAnuncio" value="false"><br>
                            Sí: <input type="radio" name="publicarAnuncio" value="true"><br>
                        </div>
                    </fieldset>
                    <input type="reset"><input type="submit">
                </form>
            </div>
        </div>
    </body>
</html>