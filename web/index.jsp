<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

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
                        <li><a href="#">Account Wish</a></li>
                        <li><a href="#">List Order</a></li>
                        <li><a href="#">Status</a></li>
                        <li class="last"><a href="#">Shopping Cart</a></li>
                    </ul>
                </div>
                <div id="page_headersearch">
                    <h3>Search:</h3>
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
            <!-- Start of Page Menu -->
            <div id="page_menu">
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Servicios</a></li>
                    <li><a href="#">Promociones</a></li>
                    <li class="last"><a href="#">Contacto</a></li>
                </ul>
            </div>
            <!-- End of Page Menu -->
            <!-- Start of Left Sidebar -->
            <div id="left_sidebar">
                <!-- Start of Newsletter Signup Form -->
                <div id="newsletter">
                    <h2>Iniciar sesión</h2>
                    <form method="post" action="login">
                        <div>
                            <input type="text" name="nickname" value="usuario"/>
                            <input type="password" name="password" value="contraseña"/>
                            <input type="image" src="images/button_ok.gif" class="button" />
                            <div class="clearthis">&nbsp;</div>
                        </div>
                    </form>
                    <div id="link_cancel"> <a href="#">Cancel Subscription</a> </div>
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
                                for (String cat : categorias) 
                                {
                                    if (categorias.indexOf(cat) != categorias.size())
                                    {
                        %>
                                        <li><a href="#"><%= cat %></li>
                        <%          }
                                    else
                                    {
                        %>
                                        <li class="last"><a href="#"><%= cat %></a></li>
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
                <div id="new_item">
                    <div id="new_item_header">
                        <h1>Flat Monitor</h1>
                        <h2>Model 123-E7</h2>
                    </div>
                    <div id="new_item_image"> <img src="images/item_new.gif" width="242" height="180" alt="New Item Name" /> </div>
                    <div id="new_item_text">
                        <p>Don't forgot to check free website templates every day, because we add at least one free website template daily.</p>
                        <p>This is a template designed by free website templates for you for free you can replace all the text by your own 
                            text. This is just a place holder so you can see how the site would look like.</p>
                        <p>You can remove any link to our websites from this template you're  free to use the template without linking 
                            back to us.</p>
                    </div>
                    <div id="new_item_link"> <a href="#">.....Read More</a> </div>
                    <div class="clearthis">&nbsp;</div>
                </div>
                <!-- End of New Item Description -->
                <div class="h_divider">&nbsp;</div>
                <!-- Start of Sub Item Descriptions -->
                <div class="sub_items">
                    <!-- Start Left Sub Item -->
                    <div class="sub_left">
                        <div class="sub_items_header">
                            <h1>Laser Printer</h1>
                            <h2>Model 34-07-L</h2>
                        </div>
                        <div class="sub_items_image"> <img src="images/item_printer.gif" width="167" height="164" alt="Sub Item Name" /> </div>
                        <div class="sub_items_text">
                            <p>If you're looking for beautiful and professionally made templates you can find them at Template Beauty.com.</p>
                            <p> <strong> Super performance <br />
                                    3 year warranty <br />
                                    1 year  free servicing </strong> </p>
                        </div>
                        <div class="sub_items_cartinfo">
                            <div class="price">
                                <h2>$45.99</h2>
                            </div>
                            <div class="addtocart"> <a href="#"><span>Add to Cart</span></a> </div>
                            <div class="clearthis">&nbsp;</div>
                        </div>
                        <div class="clearthis">&nbsp;</div>
                    </div>
                    <!-- End of Left Sub Item -->
                    <!-- Start Right Sub Item -->
                    <div class="sub_right">
                        <div class="sub_items_header">
                            <h1>Scanner</h1>
                            <h2>Model 66-0l-X</h2>
                        </div>
                        <div class="sub_items_image"> <img src="images/item_scanner.gif" width="175" height="170" alt="Sub Item Name" /> </div>
                        <div class="sub_items_text">
                            <p>To find great hosting providers visit Web Hosting Zoom</p>
                            <p> <strong> Super performance <br />
                                    3 year warranty <br />
                                    1 year  free servicing </strong> </p>
                        </div>
                        <div class="sub_items_cartinfo">
                            <div class="price">
                                <h2>$45.99</h2>
                            </div>
                            <div class="addtocart"> <a href="#"><span>Add to Cart</span></a> </div>
                            <div class="clearthis">&nbsp;</div>
                        </div>
                        <div class="clearthis">&nbsp;</div>
                    </div>
                    <!-- End of Right Sub Item -->
                    <div class="clearthis">&nbsp;</div>
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
                <div id="powered_by"> Powered by <a href="http://www.freewebsitetemplates.com">Free Website Templates</a> </div>
                <div class="clearthis">&nbsp;</div>
            </div>
            <!-- End of Page Footer -->
        </div>
    </body>
</html>