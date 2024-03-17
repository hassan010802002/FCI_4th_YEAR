/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server3;

import client3.Client_callback_imp;
import client3.Client_callback_interface;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sara
 */
public class Server_callback_imp extends UnicastRemoteObject implements Server_callback_interface {

    ArrayList Client_list;

    public Server_callback_imp() throws Exception {
        super();
        Client_list = new ArrayList<>();

    }

    @Override
    public synchronized void registration(Client_callback_interface client_callback_object) throws Exception {
        
        // add client object to list if it is not found in client list  
        if (!Client_list.contains(client_callback_object)) {
            Client_list.add(client_callback_object);
            System.out.println("Registered new client ");
            
            // doCallbacks
            docallbacks();
        }
    }

    @Override
    public synchronized void unregistration(Client_callback_interface client_callback_object) throws Exception {
        if (Client_list.remove(client_callback_object)) {
            System.out.println("unregistered client");
        } else {
            System.out.println("client wasn't registered");
        }
    }

    private void docallbacks() throws Exception {
        int new_client_id = Client_list.size();
        for (int i = 0; i < Client_list.size(); i++) {
            Client_callback_interface client_object = (Client_callback_interface) Client_list.get(i);
            client_object.notify_me("client with id " + new_client_id + " registered");
        }
    }

}
