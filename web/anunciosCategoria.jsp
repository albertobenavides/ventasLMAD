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
                    <%                        
                        if (session.getAttribute("username") == null)
                        {
                    %>
                            <h2>Iniciar sesión</h2>
                            <form method="post" action="login">
                                <div>
                                    <input type="text" name="nickname" value="usuario"/>
                                    <input type="password" name="password" value="contraseña"/>
                                    <input type="image" src="images/button_ok.gif" class="button" />
                                    <div class="clearthis">&nbsp;</div>
                                </div>
                            </form>
                            <div id="link_cancel"> <a href="signup.jsp">Crear cuenta</a> </div>
                    <%
                        }
                        else
                        {
                    %>
                    <h2>Bienvenido, <%= (String)session.getAttribute("username") %></h2>
                            <ul>
                                <li><a href="#">Registrar producto</a></li>
                                <li><a href="Index?logout=true">Cerrar sesión</a></li>
                            </ul>
                    <%
                        }
                    %>
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
                <!-- Start of Sub Item Descriptions -->
                <div class="sub_items">
                    <%
                        List<Anuncio> anuncios = (List<Anuncio>)
                                    request.getAttribute("anuncios");
                        for (int i = 0; i < anuncios.size(); i++)
                        {
                            if (i % 2 == 0)
                            {
                    %>
                    <!-- Start Left Sub Item -->
                    <div class="sub_left">
                        <div class="sub_items_header">
                            <h1><a href="anuncio?idAnuncio=<%= anuncios.get(i).getIdAnuncio()%>">
                                    <%= anuncios.get(i).getNombre() %></a></h1>
                        </div>
                        <div class="sub_items_image">  </div>
                        <div class="sub_items_text">
                            <img src="images/item_printer.gif" width="167" height="164" alt="Sub Item Name" />
                            <p> <strong> Publicado por: <%= anuncios.get(i).getNickUsuario() %> <br />
                                    <%= anuncios.get(i).getFecha().toString().substring(0, 10)%> <br /></p>
                        </div>
                        <div class="sub_items_cartinfo">
                            <div class="price">
                                <h2>$<%= anuncios.get(i).getPrecio() %></h2>
                            </div>
                            <div class="addtocart"> <a href="#"><span>Add to Cart</span></a> </div>
                            <div class="clearthis">&nbsp;</div>
                        </div>
                        <div class="clearthis">&nbsp;</div>
                    </div>
                    <!-- End of Left Sub Item -->
                    <%
                        }
                            else if (i % 2 != 0)
                        {
                    %>
                    <!-- Start Right Sub Item -->
                    <div class="sub_right">
                        <div class="sub_items_header">
                            <h1><a href="anuncio?idAnuncio=<%= anuncios.get(i).getIdAnuncio() %>">
                                    <%= anuncios.get(i).getNombre() %></a></h1>
                        </div>
                        <div class="sub_items_image">  </div>
                        <div class="sub_items_text">
                            <img src="images/item_printer.gif" width="167" height="164" alt="Sub Item Name" />
                            <p> <strong> Publicado por: <%= anuncios.get(i).getNickUsuario() %> <br />
                                    <%= anuncios.get(i).getFecha().toString().substring(0, 10)%> <br /></p>
                        </div>
                        <div class="sub_items_cartinfo">
                            <div class="price">
                                <h2>$<%= anuncios.get(i).getPrecio() %></h2>
                            </div>
                            <div class="addtocart"> <a href="#"><span>Add to Cart</span></a> </div>
                            <div class="clearthis">&nbsp;</div>
                        </div>
                        <div class="clearthis">&nbsp;</div>
                    </div>
                    <div class="clearthis">&nbsp;</div>
                    <!-- End of Right Sub Item -->
                    <%
                        }
                        }
                    %>
                </div>
                <!-- End of Sub Item Descriptions -->
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