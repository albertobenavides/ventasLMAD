<%-- 
    Document   : index
    Created on : 06-abr-2015, 20:18:13
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.model.Anuncio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas LMAD</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <link rel="stylesheet" href="themes/alertify.core.css" />
        <link rel="stylesheet" href="themes/alertify.default.css" />
        <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div id="content" class="inline_block">
            <h1>Registro de usuario</h1>
            <form action="RegistroUsuario" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>Información de registro</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Nombre de usuario:</p>
                        <p>Correo electrónico:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="text" name="nickname"></p>
                        <p><input type="email" name="correoElectronico"></p>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Datos personales</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Nombre:</p>
                        <p>Apellido paterno:</p>
                        <p>Apellido materno:</p>
                        <p>Fecha de nacimiento:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="text" name="nombre"></p>
                        <p><input type="text" name="apellidoPaterno"></p>
                        <p><input type="text" name="apellidoMaterno"></p>
                        <p><input type="date" name="fechaNacimiento"></p>
                    </div>
                    <br>
                    <div style="display: inline-block; text-align: left; vertical-align: middle;
                         margin-left: 110px">
                        <p>Sexo:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p>
                            <input type="radio" name="sexo" value="m" checked/>Hombre<br>
                            <input type="radio" name="sexo" value="f">Mujer
                        </p>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Datos de contacto</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Teléfono:</p>
                        <p>Imagen de perfil:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="tel" name="telefono"></p>
                        <p><input type="file" name="imagen"></p>
                    </div>
                </fieldset>
                <input type="hidden" name="action" value="setUsuario">
                <input type="reset"><input type="submit">
            </form>
        </div>
        <%            String message = (String) request.getAttribute("message");

            if (message != null) {
        %>
        <script src="lib/alertify.min.js"></script>
        <script>alertify.log("<%= message%>");</script>
        <%
            }
        %>
    </body>
</html>