/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server3;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

/**
 *
 * @author sara
 */
public class Run_Server {
    public static void main(String[] args) throws Exception{
         Server_callback_imp server_object = new Server_callback_imp();
        Registry registry = LocateRegistry.createRegistry(5000);
        registry.bind("Server_object1", server_object);
    }
}
