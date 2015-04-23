<%-- 
    Document   : detalleProducto
    Created on : 23-abr-2015, 10:31:59
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
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
        <div id="container">
            <!-- Start of Page Header -->
            <div id="page_header">
                <div id="page_heading">
                    <h1><span>Ventas LMAD</span></h1>
                    <h2><span>Juegos y más juegos para los frikis de hoy y siempre</span></h2>
                </div>
                <div id="page_headerlinks">
                    <ul>
                        <li><a href="Index">Inicio</a></li>
                        <li><a href="#">Status</a></li>
                        <li class="last"><a href="#">Contacto</a></li>
                    </ul>
                </div>
                <div id="page_headersearch">
                    <h3>Buscar</h3>
                    <form action="#">
                        <div>
                            <input type="text" />
                            <input type="image" src="images/button_go.gif" class="button" />
                            <div class="clearthis">&nbsp;</div>
                        </div>
                    </form>
                </div>
                <div class="clearthis">&nbsp;</div>
            </div>
            <!-- End of Page Header -->
            <!-- Start of Left Sidebar -->
            <div id="left_sidebar">
                <!-- Start of Newsletter Signup Form -->
                <div id="newsletter">
                    <h2>Bienvenido, <%= (String)session.getAttribute("username") %></h2>
                    <ul>
                        <li><a href="#">Registrar producto</a></li>
                        <li><a href="#">Detalles</a></li>
                        <li><a href="Index?logout=true">Cerrar sesión</a></li>
                    </ul>
                </div>
                <!-- End of Newsletter Signup Form -->
                <!-- Start of Categories Box -->
                <div id="categories">
                    <div id="categories_header">
                        <h2>Categorías</h2>
                    </div>
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
                    <div class="clearthis">&nbsp;</div>
                </div>
                <!-- End of Categories Box -->
                <!-- Start of Special Offer Box -->
                <div id="specialoffer">
                    <div id="specialoffer_text">
                        <h2><span>Get Special Offer <strong>Up to 25% off</strong></span></h2>
                    </div>
                    <div id="specialoffer_link"> <a href="#">...Go</a> </div>
                    <div class="clearthis">&nbsp;</div>
                </div>
                <!-- End of Special Offer Box -->
            </div>
            <!-- End of Left Sidebar -->
            <!-- Start of Main Content Area -->
            <div id="main_content">                
                <!-- Start of New Item Description -->
                <%
                    String idProducto = request.getParameter("idProducto");
                    Anuncio producto = new Anuncio
                        (AnuncioDAO.getProducto(idProducto));
                %>
                <div id="new_item">
                    <div id="new_item_header">
                        <h1>Editar producto</h1>
                    </div>
                    <div id="new_item_text">
                        <form action="nuevoProducto" method="post" id="forma">
                            <fieldset>
                                <legend>Datos necesarios</legend>
                                <div>
                                    Nombre del producto:<br>
                                    <input type="text" name="nombreProducto" 
                                           maxlength="50" required
                                           value="<%= producto.getNombre() %>"><br>
                                    Precio:<br>
                                    <input type="number" name="precioProducto"
                                           required value="<%= producto.getPrecio() %>"><br>
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
                                    </select> FALTA SELECCIONAR ELEMENTO
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Información adicional</legend>
                                <div>
                                    Descripción: [Cambiar por TEXTAREA]<br>
                                    <input type="text" name="descripcionProducto"
                                           maxlength="500"
                                           value="<%= producto.getCaracteristicas() %>"><br>
                                    Existencia:<br>
                                    <input type="number" name="existenciaProducto"
                                           value="<%= producto.getExistencias()%>"><br>
                                    Vigencia:<br>
                                    <input type="date" name="vigenciaProducto"
                                           value="<%= producto.getVigencia()%>"><br>
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
                                    <%
                                    if (producto.isAnuncioPublico())
                                    {
                                    %>
                                    No: <input type="radio" name="publicarAnuncio" 
                                               value="false"><br>
                                    Sí: <input type="radio" name="publicarAnuncio" 
                                               value="true" checked><br>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    No: <input type="radio" name="publicarAnuncio" 
                                               value="false" checked><br>
                                    Sí: <input type="radio" name="publicarAnuncio" 
                                               value="true"><br>
                                    <%
                                    }
                                    %>
                                </div>
                            </fieldset>
                            <input type="reset"><input type="submit">
                        </form>
                    </div>
                <!-- End of New Item Description -->
                <div class="h_divider">&nbsp;</div>
            </div>
            <!-- End of Main Content Area -->
            <div class="clearthis">&nbsp;</div>
            <!-- Start of Page Footer -->
            
            
            <div id="page_footer">
                <div id="product_brands">
                    <ul>
                        <li class="zalcom"><span>Zalcom</span></li>
                        <li class="digital"><span>Digital</span></li>
                        <li class="adept"><span>Adept</span></li>
                        <li class="simtel"><span>Simtel</span></li>
                    </ul>
                </div>
                <div id="powered_by"> Screemo </div>
                <div class="clearthis">&nbsp;</div>
            </div>
            <!-- End of Page Footer -->
        </div>
    </body>
</html>