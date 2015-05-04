<%-- 
    Document   : nuevoAnuncio
    Created on : 03-may-2015, 18:37:52
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="edu.uanl.fcfm.lmad.papw.dao.ProductoDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Producto"%>
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
                <h1>Anunciar producto</h1>
                <form action="RegistrarAnuncio" method="get" id="forma">
                    <fieldset>
                        <legend>Información del producto</legend>
                            Nombre: <%= producto.getNombre() %><br>
                            Precio: <%= producto.getPrecio() %><br>
                            Categoría:
                            <%
                                List<String> subcategorias = CategoriaDAO.listaSubcategorias();
                                for (int i = 0; i < subcategorias.size(); i++)
                                {
                                    if (i == producto.getIdSubcategoria() - 1)
                                    {
                            %>
                            <%= subcategorias.get(i) %>
                            <%       
                                    }
                                }
                            %>
                            <br>
                            Descripción: <%= producto.getDescripcionLarga()%><br>
                            Existencia: <%= producto.getExistencia()%><br>
                    </fieldset>
                    <fieldset>
                        <legend>Datos del anuncio</legend>
                        Vigencia: <input type="number" name="vigencia" > días<br>
                        Miniatura: <input type="text" name="miniatura"><br>
                        Método de pago: 
                        <input type="checkbox" name="efectivo" value="1" id="efectivo">Efectivo 
                        <input type="checkbox" name="tarjeta" value="2" id="tarjeta">Tarjeta<br>
                        <input type="hidden" name="idProducto" value="<%= idProducto %>">
                    </fieldset>
                    <script>
                        function check()
                        {
                        if (document.getElementById("efectivo").checked || document.getElementById("tarjeta").checked)
                            document.getElementById("forma").submit();
                        else
                            alert("nomames");
                        }
                    </script>
                    <input type="reset"><input type="button" onclick="check()" value="Enviar">
                </form>
            </div>
        </div>
    </body>
</html>