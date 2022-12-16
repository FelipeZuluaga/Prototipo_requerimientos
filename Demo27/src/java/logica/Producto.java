/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ConexionBD;

/**
 *
 * @author black
 */
public class Producto {
    
    private String codigo;
    private String nombreProducto;
    private int cantidadProducto;
    private int precioCompra;
    private int precioVenta;
    private String nombreProvedorFk;
    
    public Producto() {
    }
    public Producto(String codigo) {
        this.codigo = codigo;
    }
    //controtuctor
    public Producto(String codigo, String nombreProducto, int cantidadProducto, int precioCompra, int precioVenta, String nombreProvedorFk) {
        this.codigo = codigo;
        this.nombreProducto = nombreProducto;
        this.cantidadProducto = cantidadProducto;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.nombreProvedorFk = nombreProvedorFk;
    }
    //Encapsulamiento
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public int getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(int precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getNombreProvedorFk() {
        return nombreProvedorFk;
    }

    public void setNombreProvedorFk(String nombreProvedorFk) {
        this.nombreProvedorFk = nombreProvedorFk;
    }
    
    //metodo to String
    @Override
    public String toString() {
        return "Producto{" + "codigo=" + codigo + ", nombreProducto=" + nombreProducto + ", cantidadProducto=" + cantidadProducto + ", precioCompra=" + precioCompra + ", precioVenta=" + precioVenta + ", nombreProvedorFk=" + nombreProvedorFk + '}';
    }
    

    //Metodo de listar
    public List<Producto> consultarProductos(){
        ConexionBD conexion = new ConexionBD();
        List<Producto> consultarProductos = new ArrayList<>();
        String sql ="SELECT * FROM producto;";
        ResultSet rs = conexion.consultarBD(sql);
        
        try { 
            Producto p;
            while(rs.next()){
                p = new Producto();
            
                p.setCodigo(rs.getString("codigo"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setCantidadProducto(rs.getInt("cantidadProducto"));
                p.setPrecioCompra(rs.getInt("precioCompra"));
                p.setPrecioVenta(rs.getInt("precioVenta"));
                p.setNombreProvedorFk(rs.getString("nombreProvedorFk"));
                
                consultarProductos.add(p);
                
            } 
        }catch (SQLException ex) {
                Logger.getLogger(Provedor.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                conexion.cerrarConexion();
            }
    return consultarProductos;
    }
    //Metodo de consulta individual 
    public Producto consultarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sql ="SELECT * FROM producto WHERE codigo='"+ this.codigo +"';";
        ResultSet rs = conexion.consultarBD(sql);
        try { 
            if(rs.next()){
                this.nombreProducto = rs.getString("nombreProducto");
                this.cantidadProducto = rs.getInt("cantidadProducto");
                this.precioCompra = rs.getInt("precioCompra");
                this.precioVenta= rs.getInt("precioVenta");
                this.nombreProvedorFk = rs.getString("nombreProvedorFk");
            }    
            else{
                return null;     
            } 
        }catch (SQLException ex) {
                Logger.getLogger(Provedor.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                conexion.cerrarConexion();
            }
        return this;
    }
    
    
    //Metodo de crear 
    public boolean guardarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO producto\n"
                    + "( codigo,nombreProducto,cantidadProducto,precioCompra,precioVenta,nombreProvedorFk)\n"
                    + " VALUES ('"+ this.codigo +"','"+ this.nombreProducto +"','"+ this.cantidadProducto +"','"+ this.precioCompra  +"','"+ this.precioVenta +"','"+ this.nombreProvedorFk+"');";
        if(conexion.setAutoCommitBD(false)){
            
            if(conexion.insertarBD(sql)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }    
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
    //metodo de actulizar 
    public boolean actulizarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE producto SET "+ 
                
                         " nombreProducto = '"+ this.nombreProducto +"', "+
                         " cantidadProducto = '"+ this.cantidadProducto+"', "+
                         " precioCompra = '"+ this.precioCompra +"', "+
                         " precioVenta = '"+ this.precioVenta +"', "+
                         " nombreProvedorFk = '"+ this.nombreProvedorFk +"' "+
                         " WHERE codigo = '"+ this.codigo +"'; ";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
               conexion.rollbackBD();
               conexion.cerrarConexion();
               return false;
            }   
        }
        else{
            conexion.cerrarConexion();
            return false;
        }
    }
    //MEtodo de eliminar Producto 
     public boolean eliminarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sql ="DELETE FROM producto WHERE codigo ='"+ this.codigo +"';";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sql)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
               conexion.rollbackBD();
               conexion.cerrarConexion();
               return false;
            }   
            
            
        }
        else{
            conexion.cerrarConexion();
            return false;
        }
    }
     
    
}
