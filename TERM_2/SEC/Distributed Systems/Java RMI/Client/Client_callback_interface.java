/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client3;

import java.rmi.Remote;

/**
 *
 * @author sara
 */
public interface Client_callback_interface extends Remote{
    public void notify_me (String message) throws Exception;
}
