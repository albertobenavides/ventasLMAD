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
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <div class="ads">
            <%
                Anuncio a = new Anuncio((Anuncio)request.getAttribute("anuncioCompleto"));
            %>
            <h1><%= a.getNombre() %></h1>
            <h2>$<%= a.getPrecio() %></h2>
            <img src="images/item_new.gif" width="242" height="180" alt="New Item Name" />
            <br>
            <h2>Descripción</h2>
            <p><%= a.getCaracteristicas()%></p>
            <h2>Publicado por</h2>
            <p><%= a.getNombreUsuario()%></p>
            <p><%= a.getCorreoElectronico()%></p>
            <p><%= a.getTelefono()%></p>
            <p>Fecha de publicación: <%= a.getFecha().toString().substring(0, 10) %></p>
            </div>
            <div class="questions">
                <h1>Preguntas de usuarios</h1>
                <p>"Pregunta"</p>
                <p>Respuesta</p>
                <form action="nuevaPregunta" method="post" id="forma">
                    <textarea name="pregunta" form="forma"
                              maxlength="500" rows="4" cols="60"></textarea><br>
                    <input type="reset"><input type="submit">
                </form>
            </div>
        </div>
    </body>
</html>