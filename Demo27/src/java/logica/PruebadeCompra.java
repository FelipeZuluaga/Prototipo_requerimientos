/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.List;
import java.util.Scanner;

/**
 *
 * @author black
 */
public class PruebadeCompra {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        int cantidadAcomprar;

        System.out.println("escriba la cantidad a comprar");
        cantidadAcomprar = scanner.nextInt();

        Producto p = new Producto();
        p.setCantidadProducto(cantidadAcomprar);
        
        System.out.println(p);
    }
}
