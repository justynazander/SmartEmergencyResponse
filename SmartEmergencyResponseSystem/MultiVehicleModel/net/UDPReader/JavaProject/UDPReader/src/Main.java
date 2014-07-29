/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author descobar
 */
import netaux.*;
public class Main {
    public static void main(String[] args){
        System.out.println( (int)'\r'  );
        UDPServer_1 udpServ = new netaux.UDPServer_1(5556, 12222) ; 
        udpServ.start() ;
    }
    
}

