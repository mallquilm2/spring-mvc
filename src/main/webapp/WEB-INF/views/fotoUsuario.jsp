<%@page import="java.util.Base64" %>
<%@page import="edu.cibertec.capitulo2.model.UsuarioDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foto usuario</title>
    </head>
    <body>
        <h1>Foto Usuario</h1>
        
        <% if(request.getAttribute("usuario")==null || ((UsuarioDTO)request.getAttribute("usuario")).getFoto()==null)  {%>
        <h2>Usuario aun sin foto</h2>
        <% } else {%>
        <img src="<%= "data:image/jpeg;base64,"+Base64.getEncoder().encodeToString(((UsuarioDTO)request.getAttribute("usuario")).getFoto())%>" />
          <% } %>      
        <br/>
        <form method="post" action="fotoGrabar.do" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Seleccione foto:</td>
                    <td><input type="file" name="archivo"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Subir foto"></td>
                </tr>
            </table>
            
            <input type="hidden" name="codigoUsuario" value="<%=((UsuarioDTO)request.getAttribute("usuario")).getUsuario()%>">
            
        </form>
    </body>
</html>
