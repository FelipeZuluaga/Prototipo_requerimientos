<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Producto"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "consultarIndividual",
        "listar"
    });
    
    String proceso = "" + request.getParameter("proceso");
    
    // Validaci�n de par�metros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creaci�n de objeto y llamado a m�todo guardar 
            String codigo = request.getParameter("codigo");
            String nombreProducto = request.getParameter("nombreProducto");
            int cantidadProducto = Integer.parseInt(request.getParameter("cantidadProducto"));
            int precioCompra = Integer.parseInt(request.getParameter("precioCompra"));
            int precioVenta = Integer.parseInt(request.getParameter("precioVenta"));
            String nombreProvedorFk = request.getParameter("nombreProvedorFk");
            
            Producto p = new Producto();
            p.setNombreProducto(nombreProducto);
            p.setCantidadProducto(cantidadProducto);
            p.setPrecioCompra(precioCompra);
            p.setPrecioVenta(precioVenta);
            p.setNombreProvedorFk(nombreProvedorFk);
            p.setCodigo(codigo);
            
            if (p.guardarProducto()) { 
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
        //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creaci�n de objeto y llamado a m�todo eliminar
            String codigo = request.getParameter("codigo");
            Producto p = new Producto();
            p.setCodigo(codigo);
            if (p.eliminarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
        //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
           //creaci�n de objeto y llamado al metodo listar
            try {
                List<Producto> lista = new Producto().consultarProductos();
                respuesta += "\"" + proceso + "\": true,\"Producto\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Producto\":[]";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (proceso.equals("consultarIndividual")) {
            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creaci�n de objeto y llamado al metodo consultarIndividual
            try {
                String codigo = request.getParameter("codigo");
                Producto obj = new Producto(codigo).consultarProducto();
                respuesta += "\"" + proceso + "\": true,\"Producto\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\" Producto\":null";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }else if (proceso.equals("actualizar")) {
            //creaci�n de objeto y llamado al metodo actualizar
            String codigo = request.getParameter("codigo");
            String nombreProducto = request.getParameter("nombreProducto");
            int cantidadProducto = Integer.parseInt(request.getParameter("cantidadProducto"));
            int precioCompra = Integer.parseInt(request.getParameter("precioCompra"));
            int precioVenta = Integer.parseInt(request.getParameter("precioVenta"));
            String nombreProvedorFk = request.getParameter("nombreProvedorFk");
            
            Producto p = new Producto();
            p.setCodigo(codigo);
            p.setNombreProducto(nombreProducto);
            p.setCantidadProducto(cantidadProducto);
            p.setPrecioCompra(precioCompra);
            p.setPrecioVenta(precioVenta);
            p.setNombreProvedorFk(nombreProvedorFk);
            
            if (p.actulizarProducto()) {                     
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }
        

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inv�lidos. Corrijalos y vuelva a intentar por favor.\"";
    }    
    // Responder como objeto JSON codificaci�n ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
