<%-- 
    Document   : detalleProducto
    Created on : 23-abr-2015, 10:31:59
    Author     : Alberto
--%>

<%@page import="java.util.Locale"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.ProductoDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Producto"%>
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
        <link rel="stylesheet" href="themes/alertify.core.css" />
        <link rel="stylesheet" href="themes/alertify.default.css" />
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
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <%
                int idProducto = Integer.parseInt(request.getParameter("idProducto"));
                Producto producto = new Producto
                    (ProductoDAO.getProducto(idProducto));
            %>
            <h1>Editar producto</h1>
            <form action="detalleProducto" method="post" id="forma" enctype="multipart/form-data">
                <fieldset>
                    <legend>Datos necesarios</legend>
                    <div>
                        <p>Nombre del producto:<br>
                        <input type="text" name="nombreProducto" 
                               maxlength="50" required
                               value="<%= producto.getNombre() %>"></p>
                        <p>Precio: 
                        <input type="number" name="precioProducto"
                               required value="<%= String.format(Locale.US, "%.2f",producto.getPrecio()) %>"> MXN</p>
                        <p>Categoría:
                            <select name="idSubcategoria" form="forma"></p>
                    <%
                            List<String> subcategorias = CategoriaDAO.listaSubcategorias();
                            for (int i = 0; i < subcategorias.size(); i++)
                            {
                                if (i + 1 == producto.getIdSubcategoria())
                                {
                    %>
                    <option value="<%= i + 1%>" selected><%= subcategorias.get(i) %></option>
                    <%            
                                }
                                else
                                {
                    %>
                    <option value="<%= i + 1%>"><%= subcategorias.get(i) %></option>
                    <%
                                }
                            }
                    %>
                        </select>
                    </div>
                    <input type="hidden" name="idProducto" value="<%= idProducto %>">
                </fieldset>
                <fieldset>
                    <legend>Información adicional</legend>
                    <div>
                        Descripción:<br>
                        <textarea name="descripcionProducto"
                            maxlength="500" form="forma"
                            rows="5" cols="40"><%= producto.getDescripcionLarga() %></textarea><br>
                        Existencias: 
                        <input type="number" name="existenciaProducto"
                               value="<%= producto.getExistencia()%>"><br>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Multimedia</legend>
                    <div>
                        Cargar imágenes:<br>
                        <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=1"
                                width="200px" height="200px" id="target1"/>
                        <input type="file" name="imagenProducto1" id="src1"><br>
                        <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=2"
                                width="200px" height="200px" id="target2"/>
                        <input type="file" name="imagenProducto2" id="src2"><br>
                        <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=3"
                                width="200px" height="200px" id="target3"/>
                        <input type="file" name="imagenProducto3" id="src3"><br>
                        
                        <script>
                            function showImage(src,target) 
                            {
                                var fr=new FileReader();
                                fr.onload = function(e) { target.src = this.result; };
                                src.addEventListener("change",function() 
                                {
                                    // fill fr with image data    
                                    fr.readAsDataURL(src.files[0]);
                                    
                                });
                            }

                              var src1 = document.getElementById("src1");
                              var target1 = document.getElementById("target1");
                              showImage(src1,target1);
                              
                              var src2 = document.getElementById("src2");
                              var target2 = document.getElementById("target2");
                              showImage(src2,target2);
                              
                              var src3 = document.getElementById("src3");
                              var target3 = document.getElementById("target3");
                              showImage(src3,target3);
                        </script>
                        Cargar Video:<br>
                        <input type="file" name="videoProducto1"><br>
                        <input type="file" name="videoProducto2"><br>
                        <input type="file" name="videoProducto3"><br>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Anunciar</legend>
                    <div>
                        <p>¿Desea publicar su anuncio?<br>
                            <%
                            Anuncio a = new Anuncio();
                            a.setMetodoPago("");
                            int idAnuncio = AnuncioDAO.getIdAnuncio(idProducto);
                            if (idAnuncio != 0)
                            {
                                a = new Anuncio(AnuncioDAO.getAnuncioCompleto(idAnuncio));
                            %>
                            Sí: <input type="radio" name="anunciar" value="yes" id="yes" checked onchange="show()"><br>
                            No: <input type="radio" name="anunciar" value="no" id="no" onchange="show()">
                            <input type="hidden" name="anuncioExiste" value="yes">
                            <input type="hidden" name="idAnuncio" value="<%= idAnuncio %>">
                            </p>
                            <div id="anunciar" style="display: block">
                            <%
                            }
                            else
                            {
                            %>
                            Sí: <input type="radio" name="anunciar" value="yes" id="yes" onchange="show()"><br>
                            No: <input type="radio" name="anunciar" value="no" id="no" checked onchange="show()">
                            <input type="hidden" name="anuncioExiste" value="no">
                            </p>
                            <div id="anunciar" style="display: none">
                            <%
                            }
                            %>
                            <p>Vigencia: <input type="number" align="right" 
                                                name="vigencia" value="30"
                                                min="1"
                                                max="365"> días</p>
                            <p>Miniatura: <br>
                                <%if (a.getImagen1() != null){%>
                                <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=1"
                                width="100px" height="100px" id="target"/>
                                <input type="radio" name="miniatura" value="1"
                                    <%if (a.getThumbnailAnuncio() == 1){%>checked<%}%>><br>
                                
                                <%}if (a.getImagen2() != null){%>
                                <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=2"
                                width="100px" height="100px" id="target"/>
                                <input type="radio" name="miniatura" value="2"
                                       <%if (a.getThumbnailAnuncio() == 2){%>checked<%}%>><br>
                                
                                <%}if (a.getImagen3() != null){%>
                                <img src="<%= request.getServletContext().getContextPath() 
                                + "/MostrarImagenProducto?idProducto=" + idProducto %>&imagen=3"
                                width="100px" height="100px" id="target"/>
                                <input type="radio" name="miniatura" value="3"
                                       <%if (a.getThumbnailAnuncio() == 3){%>checked<%}%>><br>
                                <%}%>
                            </p>
                            <p>Método de pago:
                                <%
                            if (a.getMetodoPago().contains("Efectivo"))
                            {
                                %>
                                <input type="checkbox" name="efectivo" checked value="1" id="efectivo">Efectivo 
                                <%
                            }
                            else
                            {
                                %>
                                <input type="checkbox" name="efectivo" value="1" id="efectivo">Efectivo
                                <%
                            }
                            if (a.getMetodoPago().contains("Tarjeta"))
                            {
                                %>
                                <input type="checkbox" name="tarjeta" checked value="2" id="tarjeta">Tarjeta<br>
                                <%
                            }
                            else
                            {
                                %>
                                <input type="checkbox" name="tarjeta" value="2" id="tarjeta">Tarjeta<br>
                                <%
                            }
                                %>
                            </p>
                        </div>
                    </div>
                    <script src="lib/alertify.min.js"></script>
                    <script>
                        function show() 
                        {
                            if (document.getElementById("yes").checked)
                            {
                                document.getElementById("anunciar").style.display = 'block';
                            }
                            else if (document.getElementById("no").checked)
                            {
                                document.getElementById("anunciar").style.display = 'none';
                            }
                        }
                        function check()
                        {
                            var form = new FormData(document.forms.namedItem("forma"));
                            var url = document.getElementById("target").src.replace(/^data:image\/[^;]/, 'data:application/octet-stream');
                            form.append("imagenProducto1", url);
                            
                            var request = new XMLHttpRequest();
                            request.open("POST", "detalleProducto", false);
                            if (document.getElementById("no").checked)
                            {
                                document.getElementById("forma").submit();
                                //request.send(form);
                            }
                            else if (document.getElementById("efectivo").checked || document.getElementById("tarjeta").checked)
                            {
                                document.getElementById("forma").submit();
                                //request.send(form);
                            }
                            else
                            {
                                alertify.log("Inserte al menos un método de pago");
                            }
                        }
                    </script>
                </fieldset>
                            <fieldset>
                    <legend style="color: red;">Eliminar producto</legend>
                    <p><input type="button" id="delete" value="Click aquí para eliminar"
                              onclick="eliminar();"></p>
                    <div id="info" style="display: none; margin-top: -50px;">
                        <p>Al eliminar un producto se eliminarán también 
                            <strong>todos</strong> los datos relacionados con 
                            dicho producto.</p>
                        <p>Si está seguro de que desea eliminar su este producto, pulse 
                            <a href="EliminarProducto?idProducto=<%= idProducto %>">aquí</a>.</p>
                    </div>
                </fieldset>
                <script>
                    function eliminar()
                    {
                        document.getElementById('delete').style.visibility = 'hidden';
                        document.getElementById('info').style.display = 'block';
                    }
                </script>
                <input type="reset"><input type="button" onclick="check()" value="Enviar">
            </form>
        </div>
    </body>
</html>