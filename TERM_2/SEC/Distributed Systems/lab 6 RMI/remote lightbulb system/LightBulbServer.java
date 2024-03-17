import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;


public class LightBulbServer{
    public LightBulbServer() {}
    public static void main(String args[]) {
        System.out.println("Loading RMI service");
        try {
            // Load the service
            RMILightBulbImpl bulbService = new RMILightBulbImpl();
            
            // Exporting the object of implementation class
            // (here we are exporting the remote object to the stub)
            RMILightBulb stub = (RMILightBulb) UnicastRemoteObject.exportObject(bulbService, 0);

            // get the registry
            Registry registry = LocateRegistry.getRegistry();


            // Register with service so that clients can find us
            registry.rebind("bulb", stub);

            

        } catch (RemoteException re) {
            System.err.println("Remote Error - " + re);
        } catch (Exception e) {
            System.err.println("Error - " + e);
        }
    }
}
