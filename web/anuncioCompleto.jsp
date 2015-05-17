<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.PreguntaDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.AnuncioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="ImageSlider/ideal-image-slider.css">
        <link rel="stylesheet" href="ImageSlider/themes/default/default.css">

        <script src="videoSlider/jquery.min.js"></script>
        <script src="videoSlider/plugins/jquery.fitvids.js"></script>
        <script src="videoSlider/jquery.bxslider.js"></script>
        <link href="videoSlider/jquery.bxslider.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%            String emailVendedor;
            int idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
            Anuncio a = new Anuncio(AnuncioDAO.getAnuncioCompleto(idAnuncio));
        %>
        <div id="content" class="inline_block">
            <div class="ads">
                <div style="display: inline-block; margin-right: 20px; width: 250px;
                     text-align: center">
                    <div id="slider">
                        <img src="<%= request.getServletContext().getContextPath()
                                + "/MostrarImagenProducto?idProducto="
                                + a.getIdProducto()%>&imagen=1" 
                             style="height: 180px; width: auto; max-width: 250px"/>
                        <% if (a.getImagen2() != null) {%>
                        <img src="<%= request.getServletContext().getContextPath()
                                + "/MostrarImagenProducto?idProducto="
                                + a.getIdProducto()%>&imagen=2"
                             style="height: 180px; width: auto; max-width: 250px"/>
                        <% } %>
                        <% if (a.getImagen3() != null) {%>
                        <img src="<%= request.getServletContext().getContextPath()
                                + "/MostrarImagenProducto?idProducto="
                                + a.getIdProducto()%>&imagen=3"
                             style="height: 180px; width: auto; max-width: 250px"/>
                        <% }%>
                    </div>
                </div>
                <div style="display: inline-block; vertical-align: top; width: 330px;">
                    <h1><%= a.getNombre()%></h1>
                    <h2>$<%= String.format(Locale.US, "%.2f", a.getPrecio())%></h2>
                    <h2>Existencias: <%= a.getExistencias()%></h2>
                </div>

                <%
                    if (session.getAttribute("username") == null) {
                %>
                <p>
                    Sólo los usuarios registrados pueden hacer compras. 
                    Regístrate <a href="registro.jsp">aquí</a>.
                </p>
                <%
                } else if (!a.getNickUsuario().equalsIgnoreCase((String) session.getAttribute("username"))) {
                %>
                <div style="text-align: right;">
                    <form action="Comprar" method="post">
                        <div style="display: inline-block">
                            <p>Cantidad:</p>
                            <p>Método de pago:</p>
                        </div>
                        <div style="display: inline-block; text-align: left">
                            <p>
                                <input type="number" name="cantidadCompra" value="1"
                                       max="<%= a.getExistencias()%>"
                                       min="1">
                            </p>
                            <p>
                                <select name="metodoPagoCompra">
                                    <%
                                        String[] metodoPago = a.getMetodoPago().split(",");
                                        for (String s : metodoPago) {
                                    %>
                                    <option value="<%= s%>"><%= s%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </p>
                        </div>
                        <div style="display: inline-block; vertical-align: middle;">
                            <input type="hidden" name="idAnuncio" value="<%= idAnuncio%>">
                            <input type="hidden" name="correoAnuncio" value="<%= a.getCorreoElectronico()%>">
                            <input type="submit" value="Comprar">
                        </div>
                    </form>
                </div>
                <%
                    }
                %>

                <div style="border-bottom-style: dotted; border-bottom-width: 1px;
                     text-align: center; width: 270px; margin: 10px auto 20px auto;
                     border-bottom-style: dotted; border-bottom-width: 1px">
                    <% if (a.getVideo1() != "" || a.getVideo2() != "" || a.getVideo3() != "") { %>
                    <ul class="bxslider">
                        <% if (a.getVideo1() != "") {%>
                        <li>
                            <video controls="controls" style="max-width: 270px;
                                   width: auto; height: 150px"> 
                                <source src="<%=request.getServletContext().getContextPath() + "/" + a.getVideo1()%>" >
                            </video>
                        </li>
                        <% } %>
                        <% if (a.getVideo2() != "") {%>
                        <li>
                            <video controls="controls" style="max-width: 270px;
                                   width: auto; height: 150px"> 
                                <source src="<%=request.getServletContext().getContextPath() + "/" + a.getVideo2()%>" >
                            </video>
                        </li>
                        <% } %>
                        <% if (a.getVideo3() != "") {%>
                        <li>
                            <video controls="controls" style="max-width: 270px;
                                   width: auto; height: 150px"> 
                                <source src="<%=request.getServletContext().getContextPath() + "/" + a.getVideo3()%>" >
                            </video>
                        </li>
                        <% }%>
                    </ul>
                    <% } %>
                </div>
                
                    <script type="text/javascript">
                    $(document).ready(function () {

                        $('.bxslider').bxSlider({
                            video: true,
                            useCSS: true
                        });
                    });
                </script>

                <div style="border-bottom-style: dotted; border-bottom-width: 1px">
                    <h2>Descripción</h2>
                    <p><%= a.getCaracteristicas()%></p>
                </div>
                <div style="border-bottom-style: dotted; border-bottom-width: 1px">
                    <h2>Publicado por</h2>
                    <div style="display: inline-block; margin-right: 20px; width: 100px;
                         text-align: center">
                        <img 
                            src="<%= request.getServletContext().getContextPath()
                                    + "/mostrarImagen?id=" + a.getIdUsuario()%>"
                            height="130px" style="max-width: 100%;
                            border-radius: 5px;"/></div>
                    <div style="display: inline-block; vertical-align: bottom;">
                        <%= a.getNombreUsuario()%><br>
                        <%= emailVendedor = a.getCorreoElectronico()%><br>
                        <%= a.getTelefono()%><br>
                        Fecha de publicación: <%= a.getFecha().toString().substring(0, 10)%><br><br>
                        <% request.setAttribute("emailVendedor", emailVendedor); %>
                    </div>
                </div>
            </div>
            <div class="questions">
                <h1>PREGUNTAS DE USUARIOS</h1><a name="preguntas"></a>
                <%
                    List<Pregunta> preguntas = new ArrayList<Pregunta>(PreguntaDAO.getPregunta(idAnuncio));
                    int counter = 0;
                    for (Pregunta p : preguntas) {
                        counter++;
                %>
                <div>
                    <div class="derecha"><%= p.getFechaPublicacion().substring(0, 10)%></div>
                    <span style="width: 50px; height: 50px; overflow: hidden;
                          border-radius: 5px; margin: 10px; padding: 0">
                         <img src="<%= request.getServletContext().getContextPath()
                                + "/mostrarImagen?id=" + p.getIdUsuario()%>"
                         align="middle" style="width: 50px; max-height: 100%;
                         padding: 0; margin: 0"/>
                    </span>
                    <span><%= p.getNombreUsuario()%></span>

                    <p style="margin-bottom: 5px;"><%= p.getTextoPregunta()%></p>
                    <%
                        if (p.getTextoRespuesta() != null) {
                    %>
                    <div class="response">
                        <p style="margin: 0; padding: 5px 0 0 0">
                            <%= p.getTextoRespuesta()%>
                        </p>
                    </div>
                </div>
                <div>
                    <%
                    } else if (a.getNickUsuario().equalsIgnoreCase((String) session.getAttribute("username"))) {
                    %>
                    <form action="PreguntasServlet" method="post" id="forma<%=counter%>">
                        <textarea name="respuesta<%=counter%>" form="forma<%=counter%>"
                                  maxlength="500" rows="2" cols="65"></textarea><br>
                        <input type="hidden" name="idPregunta" value="<%= p.getIdPregunta()%>">
                        <input type="hidden" name="idAnuncio" value="<%= idAnuncio%>">
                        <input type="hidden" name="counter" value="<%= counter%>">
                        <input type="submit" value="Responder">
                    </form>
                    <%
                        }
                    %>
                </div>
                <% }
                    if (session.getAttribute("username") == null) { %>
                <p>
                    Sólo los usuarios registrados pueden hacer preguntas. 
                    Regístrate <a href="registro.jsp">aquí</a>.
                </p>
                <%
                } else if (!a.getNickUsuario().equalsIgnoreCase(
                        (String) session.getAttribute("username"))) {
                %>
                <form action="PreguntasServlet" method="post" id="forma">
                    <textarea name="pregunta" form="forma"
                              maxlength="500" rows="4" cols="65"></textarea><br>
                    <input type="hidden" name="idAnuncio" value="<%= idAnuncio%>">
                    <input type="hidden" name="correoVendedor" value="<%= a.getCorreoElectronico()%>">
                    <input type="submit" value="Preguntar">
                </form>
                <%
                    }
                %>
            </div>
        </div>

        <script src="ImageSlider/ideal-image-slider.js"></script>
        <script>
                        var slider = new IdealImageSlider.Slider({
                            selector: '#slider',
                            height: 180
                        });
                        slider.start();
        </script>
    </body>
</html>