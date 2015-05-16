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
            if (session.getAttribute("username") == null) {
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
            <h1>Registrar nuevo producto</h1>
            <form action="nuevoProducto" method="post" id="forma" enctype="multipart/form-data">
                <fieldset>
                    <legend>Campos requeridos</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Nombre del producto:</p>
                        <p>Precio:</p>
                        <p>Categoría:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="text" name="nombreProducto" 
                                  maxlength="50" required></p>
                        <p><input type="number" name="precioProducto"
                                  step="any" required></p>
                        <p>
                            <select name="idSubcategoria" form="forma">
                                <%                        List<String> subcategorias = CategoriaDAO.listaSubcategorias();
                                    for (int i = 0; i < subcategorias.size(); i++) {
                                %>
                                <option value="<%= i + 1%>"><%= subcategorias.get(i)%></option>
                                <%
                                    }
                                %>
                            </select>
                        </p>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Información adicional</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle;
                         margin-left: 67px;">
                        <p>Descripción:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p>
                            <textarea name="descripcionProducto"
                                      maxlength="500" form="forma"
                                      rows="5" cols="40"></textarea>
                        </p>
                    </div>
                    <div style="display: inline-block; text-align: right; vertical-align: middle;
                         margin-left: 78px;">
                        <p>Existencias:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="number" name="existenciaProducto"></p>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Multimedia</legend>
                    <p>Cargar imágenes:</p>
                    <div style="margin-bottom: 20px; border-bottom-style: dotted; border-width: 1px;">
                        <div style="display: inline-block; width: auto; height: auto;">
                            <img id="target1" style="width: auto; height: auto; 
                                 max-height: 200px; max-width: 200px; margin: 0; padding: 0;"/>
                        </div>
                        <p><input type="file" name="imagenProducto1" id="src1"></p>
                    </div>
                    
                    <div style="margin-bottom: 20px; border-bottom-style: dotted; border-width: 1px;">
                        <div style="display: inline-block; width: auto; height: auto;">
                            <img id="target2" style="width: auto; height: auto;
                                 max-height: 200px; max-width: 200px; margin: 0; padding: 0"/>
                        </div>
                        <p><input type="file" name="imagenProducto2" id="src2"></p>
                    </div>
                    
                    <div style="margin-bottom: 20px; border-bottom-style: double; border-width: 1px;">
                        <div style="display: inline-block; width: auto; height: auto;">
                            <img id="target3" style="width: auto; height: auto;
                                 max-height: 200px; max-width: 200px; margin: 0; padding: 0"/>
                        </div>
                        <p><input type="file" name="imagenProducto3" id="src3"></p>
                    </div>
                    <script>
                        function showImage(src, target)
                        {
                            var fr = new FileReader();
                            fr.onload = function (e) {
                                target.src = this.result;
                            };
                            src.addEventListener("change", function ()
                            {
                                // fill fr with image data    
                                fr.readAsDataURL(src.files[0]);

                            });
                        }
                       
                        var src1 = document.getElementById("src1");
                        var target1 = document.getElementById("target1");
                        showImage(src1, target1);

                        var src2 = document.getElementById("src2");
                        var target2 = document.getElementById("target2");
                        showImage(src2, target2);

                        var src3 = document.getElementById("src3");
                        var target3 = document.getElementById("target3");
                        showImage(src3, target3);
                    </script>

                    <p>Cargar videos:</p>
                    <div style="margin-bottom: 20px;">
                        <p><input type="file" name="videoProducto1"></p>
                    </div>
                    
                    <div style="margin-bottom: 20px;">
                        <p><input type="file" name="videoProducto2"></p>
                    </div>
                    
                    <div style="margin-bottom: 20px;">
                        <p><input type="file" name="videoProducto3"></p>
                    </div>
                </fieldset>
                <input type="reset"><input type="submit">
            </form>
        </div>
    </body>
</html>