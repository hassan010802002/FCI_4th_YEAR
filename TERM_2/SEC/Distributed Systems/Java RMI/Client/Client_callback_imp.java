/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client3;

import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author sara
 */
public class Client_callback_imp extends UnicastRemoteObject implements Client_callback_interface{
  
    public Client_callback_imp() throws Exception{
        super();
    }

    @Override
    public void notify_me(String message) throws Exception {
        System.out.println(message);
    }
    
    
}
