
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GameMarket - Registro de Usuario</title>
    </head>
    <body>
        <h1>Registro de usuario</h1>
        <form action="detalle" method="post">
            <fieldset>
                <legend>Información de registro</legend>
                <div>
                    Nombre de usuario:<br>
                    <input type="text" name="nickname"><br>
                    Contraseña:<br>
                    <input type="password" name="contrasenia"><br>
                    Correo electrónico:<br>
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
            <!-- <fieldset>
                <legend>Datos de contacto</legend>
                <table>
                    <tr>
                        <td>
                            País:<br>
                            <select form="signup" name="country">
                                <option value="mexico">México</option>
                            </select><br>
                        </td>
                        <td>
                            Estado:<br>
                            <select form="signup" name="country">
                                <option value="nuevoLeon">Nuevo León</option>
                            </select><br>
                        </td>
                        <td>
                            Ciudad:<br>
                            <select form="signup" name="country">
                                <option value="mexico">San Nicolás</option>
                            </select><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Teléfono:<br>
                            <input type="tel" value="telephone">
                        </td>
                        <td>
                            Celular:<br>
                            <input type="tel" value="cellphone">
                        </td>
                    </tr>
                </table>
            </fieldset> -->
            <input type="reset"><input type="submit">
        </form>

        <br />
        <br />
        <a href="">Regresar a la lista</a>
    </body>
</html>