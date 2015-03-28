
<%@page import="java.util.List"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Paises"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:::::LISTA DE EMPLEADOS:::::</title>
    </head>
    <body>
        <h1>Lista de empleados</h1>
        
        <div style="color: blue">
            Nombre usuario: PENDIENTE MODIFICAR  
        </div>
        
        <a href="">Agregar empleado</a>
        <br />
        <br />
        <table style="width: 600px;" border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Ape. Paterno</th>
                <th>Ape. Materno</th>
                <th>Departamento</th>
                <th>Borrar</th>
                <th>Editar</th>
            </tr>
            <%
                List<Empleado> empleados = (List<Empleado>) 
                        request.getAttribute("emps");
                if (empleados != null) {
                    for (Empleado emp : empleados) {
            %>            
                        <tr>
                            <td><%= emp.getId() %></td>
                            <td><%= emp.getNombre() %></td>
                            <td><%= emp.getApePaterno() %></td>
                            <td><%= emp.getApeMaterno() %></td>
                            <td><%= emp.getDepartamento().getNombre() %></td>
                            <td>
                                <a href="/demo/listado?id=<%= emp.getId() %>">
                                    Borrar
                                </a>
                            </td>
                            <td>
                                Editar
                            </td>
                        </tr>
            <%      }
                }
            %>
        </table>
        <br />
        <br />
        <a href="">Cerrar sesión</a>
    </body>
</html>