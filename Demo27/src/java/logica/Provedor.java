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
public class Provedor {
    
    //atributos
    private String nombreProvedor;
    private int  telefono;

    
    // contructor
    public Provedor() {
    }

    public Provedor(String nombreProvedor) {
        this.nombreProvedor = nombreProvedor;
    }

    public Provedor(String nombreProvedor, int telefono) {
        this.nombreProvedor = nombreProvedor;
        this.telefono = telefono;
    }

    public String getNombreProvedor() {
        return nombreProvedor;
    }

    public void setNombreProvedor(String nombreProvedor) {
        this.nombreProvedor = nombreProvedor;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
    //Metodo toString
    @Override
    public String toString() {
        return "Provedor{" + "nombreProvedor=" + nombreProvedor + ", telefono=" + telefono + '}';
    }
    //Metodo para consultar 
    public List<Provedor> consultarProvedores(){
       
       
            List<Provedor> listaProvedores = new ArrayList<>();
            ConexionBD conexion = new ConexionBD();
            String sql = "SELECT * FROM provedor;";
            ResultSet rs = conexion.consultarBD(sql);
        try { 
            Provedor pro;
            while(rs.next()){
                pro = new Provedor();
                
                pro.setNombreProvedor(rs.getString("nombreProvedorPk"));
                pro.setTelefono(rs.getInt("telefono"));
                
                listaProvedores.add(pro);  
            }
       
            }catch (SQLException ex) {
                Logger.getLogger(Provedor.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                conexion.cerrarConexion();
            }
            return listaProvedores;
    }
    //Metodo de consulta individual 
    public Provedor consultarProvedor(){
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM provedor WHERE nombreProvedorPk='"+ this.nombreProvedor +"';";
        ResultSet rs = conexion.consultarBD(sql);
        
        try { 
            if(rs.next()){
                this.telefono = rs.getInt("telefono");
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
    
    
    //Metodo de crear provedores
    public boolean guardarProvedor(){
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO provedor\n"
                    + "(nombreProvedorPk,telefono)\n"
                    + " VALUES ('"+ this.nombreProvedor +"','"+ this.telefono +"');";
        
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
    //Metodo de Actulizar Provedores
    public boolean actulizarProvedor(){
        ConexionBD conexion = new ConexionBD();
        String sql =  "UPDATE  provedor\n"
                    + "SET telefono='"+this.telefono+"'\n"
                    + "WHERE nombreProvedorPk='"+ this.nombreProvedor +"';";
        
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
        }else{
            conexion.cerrarConexion();
            return false;
        }

    }
    //metodo de eliminar Provedores 
    public boolean eliminarProvedor(){
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM  provedor\n"
                    + "WHERE nombreProvedorPk='"+ this.nombreProvedor +"';";
        
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
        }else{
            conexion.cerrarConexion();
            return false;
        }

    }
    
    
  
}
    