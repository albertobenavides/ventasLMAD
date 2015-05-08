<%-- 
    Document   : editarUsuario
    Created on : 07-may-2015, 21:33:23
    Author     : Alberto
--%>

<%@page import="edu.uanl.fcfm.lmad.papw.dao.UsuarioDao"%>
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
            <h1>Registro de usuario</h1>
            <%
            int idUsuario = (Integer)session.getAttribute("idUsuario");
            Usuario u = new Usuario(UsuarioDao.getUsuario(idUsuario));
            %>
            <form action="RegistroUsuario" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend>Información de registro</legend>
                    <div>
                        Nombre de usuario:<br>
                        <input type="text" name="nickname" 
                               value="<%= u.getNickname() %>"><br>
                        Contraseña:<br>
                        <input type="password" name="contrasenia"
                               value="<%= u.getContrasenia()%>"><br>
                        Correo electrónico:<br>
                        <input type="email" name="correoElectronico"
                               value="<%= u.getCorreoElectronico()%>"><br>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Datos personales</legend>
                    <table>
                        <tr>
                            <td>
                                Nombre:<br>
                                <input type="text" name="nombre"
                                       value="<%= u.getNombre()%>"><br>
                            </td>
                            <td>
                                Apellido paterno:<br>
                                <input type="text" name="apellidoPaterno"
                                       value="<%= u.getApellidoPaterno()%>"><br>
                            </td>
                            <td>
                                Apellido materno:<br>
                                <input type="text" name="apellidoMaterno"
                                       value="<%= u.getApellidoMaterno()%>"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Fecha de nacimiento:<br>
                                <input type="date" name="fechaNacimiento"
                                       value="<%= u.getFechaNacimiento()%>"><br>
                            </td>
                            <td>
                                <%
                                if (u.getSexo().equalsIgnoreCase("m"))
                                {
                                %>
                                <input type="radio" name="sexo" value="m" checked/>Hombre<br>
                                <input type="radio" name="sexo" value="f"/>Mujer<br>
                                <%
                                }
                                else
                                {
                                %>
                                <input type="radio" name="sexo" value="m"/>Hombre<br>
                                <input type="radio" name="sexo" value="f" checked/>Mujer<br>
                                <%
                                }
                                %>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Datos de contacto</legend>
                    <table>
                        <tr>
                            <td>
                                Teléfono:<br>
                                <input type="tel" name="telefono"
                                       value="<%= u.getTelefono()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img 
                    src="<%= request.getServletContext().getContextPath() 
                                + "/mostrarImagen?id=" +  idUsuario %>"
                                width="100px" height="130px"/></div><input type="file" name="imagen">
                            </td>
                        </tr>
                    </table>
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