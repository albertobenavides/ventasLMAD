<%-- 
    Document   : detalleProducto
    Created on : 23-abr-2015, 10:31:59
    Author     : Alberto
--%>

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
            <%@include file="header.jsp"%>
            <div id="content" class="inline_block">
                <%
                    String idProducto = request.getParameter("idProducto");
                    Producto producto = new Producto
                        (ProductoDAO.getProducto(idProducto));
                %>
                <h1>Editar producto</h1>
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
                            Descripción:<br>
                            <textarea name="descripcionProducto"
                                maxlength="500" form="forma"
                                rows="5" cols="40"></textarea><br>
                            Existencia:<br>
                            <input type="number" name="existenciaProducto"
                                   value="<%= producto.getExistencia()%>"><br>
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
        </div>
    </body>
</html>