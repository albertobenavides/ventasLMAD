<%-- 
    Document   : editarUsuario
    Created on : 07-may-2015, 21:33:23
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.UsuarioDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Usuario"%>
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
            <h1>Registro de usuario</h1>
            <%                int idUsuario = (Integer) session.getAttribute("idUsuario");
                Usuario u = new Usuario(UsuarioDAO.getUsuario(idUsuario));
            %>
            <form action="RegistroUsuario" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>Información de registro</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Nombre de usuario:</p>
                        <p>Contraseña:</p>
                        <p>Confirma correo:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p><input type="text" name="nickname" 
                                  value="<%= u.getNickname()%>"
                                  disabled></p>
                        <p><input type="password" name="contrasenia"
                                  value="<%= u.getContrasenia()%>"></p>
                        <p><input type="email" name="correoElectronico"
                                  value="<%= u.getCorreoElectronico()%>"
                                  disabled></p>
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
                        <p><input type="text" name="nombre"
                                  value="<%= u.getNombre()%>"></p>
                        <p><input type="text" name="apellidoPaterno"
                                  value="<%= u.getApellidoPaterno()%>"></p>
                        <p><input type="text" name="apellidoMaterno"
                                  value="<%= u.getApellidoMaterno()%>"></p>
                        <p><input type="date" name="fechaNacimiento"
                                  value="<%= u.getFechaNacimiento()%>"></p>
                    </div>
                    <br>
                    <div style="display: inline-block; text-align: left; vertical-align: middle;
                         margin-left: 110px">
                        <p>Sexo:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <%
                            if (u.getSexo().equalsIgnoreCase("m")) {
                        %>
                        <p>
                            <input type="radio" name="sexo" value="m" checked/>Hombre<br>
                            <input type="radio" name="sexo" value="f"/>Mujer
                        </p>
                        <%
                        } else {
                        %>
                        <p>
                            <input type="radio" name="sexo" value="m"/>Hombre<br>
                            <input type="radio" name="sexo" value="f" checked/>Mujer
                        </p>
                        <%
                            }
                        %>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Datos de contacto</legend>
                    <div style="display: inline-block; text-align: right; vertical-align: middle">
                        <p>Teléfono:</p>
                        <p>Imagen de perfil:</p>
                    </div>
                    <div style="display: inline-block; text-align: left; vertical-align: middle">
                        <p>
                            <input type="tel" name="telefono" value="<%= u.getTelefono()%>">
                        </p>
                        <p>
                            <input type="file" name="imagen">
                        </p>
                    </div>
                    <div>
                         <img src="<%= request.getServletContext().getContextPath()
                                + "/mostrarImagen?id=" + idUsuario%>"
                                style="max-height: 130px; max-width: 100px;
                                width: auto; height: auto"/>
                    </div>
                </fieldset>
                <fieldset>
                    <legend style="color: red;">Eliminar cuenta</legend>
                    <p><input type="button" id="delete" value="Click aquí para eliminar"
                              onclick="eliminar();"></p>
                    <div id="info" style="display: none; margin-top: -50px;">
                        <p>Eliminar una cuenta es un proceso irreversible.</p>
                        <p>Al hacerlo se perderán <strong>todos</strong> sus datos.</p>
                        <p>Si está seguro de que desea eliminar su cuenta, pulse 
                            <a href="EliminarUsuario">aquí</a>.</p>
                    </div>
                </fieldset>
                <script>
                    function eliminar()
                    {
                        document.getElementById('delete').style.visibility = 'hidden';
                        document.getElementById('info').style.display = 'block';
                    }
                </script>
                <input type="hidden" name="action" value="editUsuario">
                <input type="reset"><input type="submit">
            </form>
        </div>
    </body>
</html>