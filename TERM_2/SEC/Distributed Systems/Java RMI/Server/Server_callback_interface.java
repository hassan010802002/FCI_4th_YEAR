/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server3;

import client3.Client_callback_interface;
import java.rmi.*;

/**
 *
 * @author sara
 */
public interface Server_callback_interface extends Remote{
    public void registration (Client_callback_interface client_callback_object) throws Exception;
    public void unregistration (Client_callback_interface client_callback_object) throws Exception;
   


}
