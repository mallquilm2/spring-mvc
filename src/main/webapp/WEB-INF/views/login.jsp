<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Login Usuario</title>
    </head>
    <body>

        <br/>

        <div class="container">

            <div class="row d-flex justify-content-center mx-auto">
                <h1>Login Usuario</h1>
                <div class="col-md-6 col-xs-12">
                    <form action="loginAccion.do" method="post">
                        <div class="form-group">
                            Usuario: <input type="text" name="usuario" required placeholder="Usuario" class="form-control"><br/>
                        </div>
                        <div class="form-group">
                            Clave: <input type="password" name="clave" required placeholder="Clave" class="form-control"><br/> 
                        </div>

                        <div class="form-group justify-content-center">
                            <input type="submit" value="Ingresar" class="btn btn-primary button-submit"/>
                        </div>
                    </form>
                </div>
            </div>

             <% if (request.getAttribute("msgError") != null) { %>
            <div class="alert alert-danger">
                <strong>Error!</strong> <%= request.getAttribute("msgError") %>
            </div>
            <% } %>
            
        </div>
        
    </body>
</html>
