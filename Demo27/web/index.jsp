
<!DOCTYPE html>
<html>
    <head>
        <title>
            GTI
        </title>
        <!--Made with love by Mutiullah Samim -->

        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ----------> 
        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->

    </head>
    <body>
       
        <%
            if (request.getParameter("login") != null) {
                String user = request.getParameter("user");
                String password = request.getParameter("password");

                HttpSession sesion = request.getSession();

                if (user.equals("administrador") && password.equals("12345")) {
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("user", user);
                    response.sendRedirect("/Demo27/pagina1.jsp");
                } else {

        %>
        <div class="alert alert-primary" role="alert">
            Contraseña Usuario/Incorrecta
        </div>
        <%          }
            }
        %>
        <div class="container mt-5 col-lg-4 ">
            <div class="card col-ms-10">
                <div class="card-body text-center ">
                    <form>
                        <div class="form-group ">
                            <h1><img  class="rounded-circle" src="Img\123.jpg" class="d-block w-100" alt="..." width="300" height="300"></h1>
                            <label>Software para el control de presupuestos y costos</label>
                        </div>
                        <div class="input-group form-group mt-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" name="user" placeholder="username">

                        </div>
                        <div class="input-group form-group mt-5">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name="password" placeholder="password">
                        </div>

                        <div class="form-group mt-5">
                            <input type="submit" value="INGRESAR A LA APP" name="login" class="btn btn-primary login_btn">
                        </div>
                    </form>
                </div>
                <div>
                    <div class="row">
                        <div class="col-12">
                            <jsp:include page="pieDePagina.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


