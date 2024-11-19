<%@page import="edu.cibertec.capitulo2.model.UsuarioDTO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de usuarios</title>
    </head>
    <body>
        
        <h1>Listado usuarios</h1>
        <br/>
        <% List<UsuarioDTO> lista = (List<UsuarioDTO>)request.getAttribute("lista"); %>
        <table border="1">
            <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Clave</th>
                    <th>Nombre Completo</th>
                    <th>Foto</th>
                </tr>
            </thead>
            <tbody>
                <% for(UsuarioDTO usuario:lista) {%>
                <tr>
                    <td> <%= usuario.getUsuario() %> </td>
                    <td> <%= usuario.getClave() %> </td>
                    <td> <%= usuario.getNombreCompleto() %> </td>
                    <td><a href="fotoMostar.do?codigoUsuario=<%= usuario.getUsuario() %>">foto</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <a href="usuarioCrear.do">Crear usuario</a>
    </body>
</html>
