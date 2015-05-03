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
        <div id="header">
            <%@include file="header.jsp"%>
            <div id="content" class="inline_block">
                <h1>Registro de usuario</h1>
                <form action="RegistroUsuario" method="post">
                    <fieldset>
                        <legend>Informaci�n de registro</legend>
                        <div>
                            Nombre de usuario:<br>
                            <input type="text" name="nickname"><br>
                            Contrase�a:<br>
                            <input type="password" name="contrasenia"><br>
                            Correo electr�nico:<br>
                            <input type="email" name="correoElectronico"><br>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Datos personales</legend>
                        <table>
                            <tr>
                                <td>
                                    Nombre:<br>
                                    <input type="text" name="nombre"><br>
                                </td>
                                <td>
                                    Apellido paterno:<br>
                                    <input type="text" name="apellidoPaterno"><br>
                                </td>
                                <td>
                                    Apellido materno:<br>
                                    <input type="text" name="apellidoMaterno"><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Fecha de nacimiento:<br>
                                    <input type="date" name="fechaNacimiento"><br>
                                </td>
                                <td>
                                    <input type="radio" name="sexo" value="m">Hombre<br>
                                    <input type="radio" name="sexo" value="f">Mujer<br>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend>Datos de contacto</legend>
                        <table>
                            <tr>
                                <td>
                                    Tel�fono:<br>
                                    <input type="tel" name="telefono">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="file" name="imagen">
                                </td>
                            </tr>
                        </table>
                    </fieldset>

                    <input type="hidden" name="logInTry" value="1">
                    <input type="reset"><input type="submit">
                </form>
            </div>
        </div>
    </body>
</html>