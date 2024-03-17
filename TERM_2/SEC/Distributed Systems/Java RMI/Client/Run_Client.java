/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client3;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.Scanner;
import server3.Server_callback_interface;

/**
 *
 * @author sara
 */
public class Run_Client {

    public static void main(String[] args) throws Exception {

        //1- search for server object in Registry
        Registry registry = LocateRegistry.getRegistry("localhost", 5000);
        Server_callback_interface server_object = (Server_callback_interface) registry.lookup("Server_object1");

        // client registration 
        Client_callback_interface client_object = new Client_callback_imp();
        server_object.registration(client_object);

    }
}
