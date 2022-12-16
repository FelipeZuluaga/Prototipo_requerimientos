<%-- 
    Document   : pagina2
    Created on : 8/11/2021, 10:47:16 PM
    Author     : black
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <jsp:include page="menu.jsp"/>

        <div class="jumbotron text-center" style="background-image: url(/prueba7/imagenes/img28.gif);">
            <h1 style=" font-family:  serif; color:  #0082ca" class=" mt-5">MONTAR PLANO</h1>
            <p><h6 style="color: white">Control de Productos</h6></p>
        <figure class="text-center mt-5">
            <blockquote class="blockquote" >
                <p>CASA / EDIFICIO / APARTAMENTO / MUCHOS MAS</p>
            </blockquote>
            <figcaption class="blockquote-footer" style="color: white">
                Gestor de inventarios <cite title="Source Title">THE MARKET</cite>
            </figcaption>
        </figure>
    </div>
    <div class="container-fluid mt-5" ng-app="pagina2" ng-controller="productoController as pr">
         <div class="row">
            <div class="col-5 text-center">
                <button  type="button" class="btn btn-primary">
                    Ingresar Plano
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <img  class="rounded-circle,container" src="Img\plano1.webp" class="d-block w-100" alt="..." width="500" height="500" >
                <h2 class="text-center mt-4">Plano Edificio</h2>
            </div>
            
        </div>
</body>
</html>
