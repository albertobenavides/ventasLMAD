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
                                    request.getAttribute("categorias");
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
                                            <li class="titulo"><%= categoriaTemp %></li>
                                            <li><a href="#">- <%= subcategoria %></a></li>
                        <%
                                    }
                                    else
                                    {
                        %>
                                           <li><a href="#">- <%= subcategoria %></a></li> 
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
                
                <%
                    Anuncio a = new Anuncio((Anuncio)request.getAttribute("anuncioCompleto"));
                %>
                
                <!-- Start of New Item Description -->
                <div id="new_item">
                    <div id="new_item_header">
                        <h1><%= a.getNombre() %></h1>
                        <h2>$<%= a.getPrecio() %></h2>
                    </div>
                    <div id="new_item_image"> <img src="images/item_new.gif" width="242" height="180" alt="New Item Name" /> </div>
                    <div id="new_item_text">
                        <br>
                        <h2>Descripción</h2>
                        <p><%= a.getCaracteristicas()%></p>
                        <h2>Publicado por</h2>
                        <p><%= a.getNombreUsuario()%></p>
                        <p><%= a.getCorreoElectronico()%></p>
                        <p><%= a.getTelefono()%></p>
                        <p>Fecha de publicación: <%= a.getFecha().toString().substring(0, 10) %></p>
                    </div>
                    <div class="clearthis">&nbsp;</div>
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