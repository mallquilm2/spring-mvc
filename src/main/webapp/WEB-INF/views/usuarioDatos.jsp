<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos del usuario</title>
        <style type="text/css">
            .formFieldError{background-color: #FFC;}
        </style>
    </head>
    <body>
        <h1>Datos del usuario</h1>
        <br/>
    <mvc:form modelAttribute="usuarioBean" action="usuarioGrabar.do">
        <table>
            <tr>
                <td><mvc:label path="usuario">Usuario:</mvc:label></td>
                <td><mvc:errors path="usuario"></mvc:errors></td>
                <td><mvc:input path="usuario" cssErrorClass="formFieldError"></mvc:input></td>
            </tr>
            <tr>
                <td><mvc:label path="clave">Clave:</mvc:label></td>
                <td><mvc:errors path="clave"></mvc:errors></td>
                <td><mvc:input path="clave" cssErrorClass="formFieldError"></mvc:input></td>
            </tr>
            <tr>
                <td><mvc:label path="nombreCompleto">Nombre Completo</mvc:label></td>
                <td><mvc:errors path="nombreCompleto"></mvc:errors></td>
                <td><mvc:input path="nombreCompleto" cssErrorClass="formFieldError"></mvc:input></td>
            </tr>
            <tr>
                <td colspan="1">
                    <input type="submit" value="Insertar"/>
                </td>
            </tr>
        </table>
    </mvc:form>
    </body>
</html>
