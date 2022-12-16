<%-- 
    Document   : pagina1
    Created on : 6/11/2021, 05:26:11 PM
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
        <title >CDP</title>
        <%-- 
            <style>div{border: dotted;}</style>
        --%> 

    </head>
    <body >
        <jsp:include page="menu.jsp"/>
        <div class="jumbotron text-center" style="background-image: url(/prueba7/imagenes/img28.gif);">
            <h1><img  class="rounded-circle" src="Img\123.jpg" class="d-block w-100" alt="..." width="300" height="300"></h1>
            <p><h1 style="font-family: sans-serif;color: #0d5995">Control de presupuesto</h1></p>
            <figure class="text-center mt-5">
            <blockquote class="blockquote" >
                <p style="color: white">INGRESAR / LISTAR / ACTUALIZAR / ELIMINAR  PRODUCTOS</p>
            </blockquote>
            <figcaption class="blockquote-footer" style="color: white">
                Gestor de inventarios <cite title="Source Title">THE MARKET</cite>
            </figcaption>
            </figure>
        </div>
        <style>
            .card{
                font-family: Optima, sans-serif;
                font-weight: bold;
                font-size: 35px;
                border-color: #0d5995;
                color: #0d5995;
            }
            label {
                font-family: Gill Sans, sans-serif;
                font-weight: bold;
                color: #0d5995;
            }
            jumbotron {
                background-size: 100px;
            }
            .form-control{
                border-color: #0d5995;
            }
          
        </style>
        <div class="container-fluid " ng-app="demo" ng-controller="empresasController as e">
            <div class="row mt-5">
                <div class="col-3">
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Nombre Ingeniero</label>
                            <input class="form-control" type="text" placeholder="Nombre Ingeniero" ng-model="e.nit">
                        </div>
                        <div class="col-4">
                            <label>Tipo de Obra</label>
                            <select class="form-control" type="text" ng-model="e.nombre">
                                <option>Casa</option>
                                <option>Apartamento</option>
                                <option>Edificio</option>
                                <option>Via</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <label>Valor de Material</label>
                            <input class="form-control" type="text" placeholder="Valor de Material" ng-model="e.nombreGerente">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-4">
                            <label>Numero Empleados</label>
                            <input class="form-control" type="text" placeholder="Numero Empleados" ng-model="e.direccion">
                        </div>
                        <div class="col-8">
                            <label>Materiales </label>
                            <textarea class="form-control" type="text" placeholder="Material" ng-model="e.telefono"></textarea>
                        </div>
                    </div>    
                    <div class="row mt-3">
                        <div class="col-6">
                            <label>e-mail</label>
                            <input class="form-control" type="email" placeholder="e-mail" ng-model="e.email">
                        </div>
                        <div class="col-2 mt-4" >

                        </div>
                        <div class="col-2 mt-4" >
                            <button type="button" class="btn btn-info" ng-click="e.actualizar()" style="height:46px; width: 100%;">Actualizar</button>
                        </div>
                        <div class="col-2 mt-4">
                            <button type="button" class="btn btn-primary" ng-click="e.guardar()" style="height:46px; width: 100%;">Guardar</button>
                        </div>                    
                    </div>                  
                </div>
                <div class="col-3">

                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12">
                    <table class="table" >
                        <thead class="border text-center " style=" background-color:  grey; color: white">
                            <tr >
                                <th scope="col">Ing Cargo</th>
                                <th scope="col">Tipo Obra</th>
                                <th scope="col">Valor Material</th>
                                <th scope="col">Num Empleados</th>
                                <th scope="col">Materiales</th>
                                <th scope="col">Gasto Total Obra</th>
                                <th scope="col">Acciones</th>

                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <tr ng-repeat="em in e.Empresas">
                                <td>{{em.nit}}</td>
                                <td>{{em.nombre}}</td>
                                <td>{{em.direccion}}</td>
                                <td>{{em.telefono}}</td>
                                <td>{{em.email}}</td>
                                <td>{{em.nombreGerente}}</td>
                                <td>{{em.fechaDeRegistro}}</td>
                                <td>
                                    <a  ng-click="e.editar(em.nit)">
                                        <svg style="color: #d1b811" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>
                                    </a>  
                                    <a ng-click="e.eliminar()">
                                        <svg  style="color:red " xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>
                                    </a>

                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <script>
                        var app = angular.module('demo', []);
                        app.controller('empresasController', ['$http', controladorEmpresas]);
                        function controladorEmpresas($http) {
                            var e = this;
                            listar = function () {
                                var parametros = {
                                    proceso: 'listar'
                                };
                                $http({
                                    method: 'POST',
                                    url: 'peticiones.jsp',
                                    params: parametros
                                }).then(function (res) {
                                    e.Empresas = res.data.Empresas;
                                });
                            };
                            listar();
                            e.guardar = function () {
                                var parametros = {
                                    proceso: 'guardar',

                                    nit: e.nit,
                                    fechaDeRegistro: e.fechaDeRegistro,
                                    direccion: e.direccion,
                                    nombre: e.nombre,
                                    telefono: e.telefono,
                                    email: e.email,
                                    nombreGerente: e.nombreGerente


                                };
                                $http({
                                    method: 'POST',
                                    url: 'peticiones.jsp',
                                    params: parametros
                                }).then(function (res) {
                                    if (res.data.ok === true) {
                                        if (res.data.guardar === true) {

                                            swal({
                                                title: "¡Guardó exitosamente los datos!",
                                                icon: "success"
                                            });

                                            listar();
                                        } else {
                                            swal({
                                                title: "¡Falló!",
                                                text: "Valide los datos.",
                                                icon: "error"
                                            });
                                        }
                                    } else {

                                        alert(res.data.errorMsg);

                                    }
                                });

                            };
                            e.actualizar = function () {

                                var parametros = {
                                    proceso: 'actualizar',
                                    nit: e.nit,
                                    fechaDeRegistro: e.fechaDeRegistro,
                                    direccion: e.direccion,
                                    nombre: e.nombre,
                                    telefono: e.telefono,
                                    email: e.email,
                                    nombreGerente: e.nombreGerente
                                };
                                $http({
                                    method: 'POST',
                                    url: 'peticiones.jsp',
                                    params: parametros
                                }).then(function (res) {
                                    if (res.data.ok === true) {
                                        if (res.data.actualizar === true) {

                                            swal({
                                                title: "¡Actualizó exitosamente los datos!",
                                                icon: "success"
                                            });
                                            listar();
                                        } else {

                                            swal({
                                                title: "¡Falló la actualización!",
                                                text: "Valide los datos.",
                                                icon: "error"
                                            });
                                        }
                                    } else {

                                        alert(res.data.errorMsg);

                                    }
                                });

                            };
                            e.eliminar = function () {

                                var parametros = {
                                    proceso: 'eliminar',
                                    nit: e.nit
                                };
                                $http({
                                    method: 'POST',
                                    url: 'peticiones.jsp',
                                    params: parametros
                                }).then(function (res) {
                                    if (res.data.ok === true) {
                                        if (res.data.eliminar === true) {
                                            swal({
                                                title: "¡Eliminó exitosamente los datos!",

                                                icon: "success"
                                            });
                                            listar();
                                        } else {

                                            swal({
                                                title: "¡Falló la eliminación!",
                                                text: "Valide los datos.",
                                                icon: "error"
                                            });
                                        }
                                    } else {

                                        alert(res.data.errorMsg);
                                    }
                                });

                            };
                            e.editar = function (nit) {
                                var parametros = {
                                    proceso: 'consultarIndividual',
                                    nit: nit
                                };
                                $http({
                                    method: 'POST',
                                    url: 'peticiones.jsp',
                                    params: parametros
                                }).then(function (res) {


                                    e.nit = res.data.Empresa.nit;
                                    e.nombre = res.data.Empresa.nombre;
                                    e.nombreGerente = res.data.Empresa.nombreGerente;
                                    e.direccion = res.data.Empresa.direccion;
                                    e.telefono = res.data.Empresa.telefono;
                                    e.email = res.data.Empresa.email;
                                    e.fechaDeRegistro = res.data.Empresa.fechaDeRegistro;



                                });
                            };

                        }


            </script>
    </body>
</html>
