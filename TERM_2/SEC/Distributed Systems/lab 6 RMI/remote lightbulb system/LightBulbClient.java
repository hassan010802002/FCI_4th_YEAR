import java.rmi.*;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class LightBulbClient {
    public static void main(String args[]) {
        System.out.println("Looking for light bulb service");
        try {

            // get the registry
            Registry registry = LocateRegistry.getRegistry(null);

            // Lookup the service in the registry, and obtain a remote service
            Remote remoteService = registry.lookup("bulb");
            // Cast to a RMILightBulb interface
            RMILightBulb bulbService = (RMILightBulb) remoteService;

            // Turn it on
            System.out.println("Invoking bulbservice.on()");
            bulbService.on();
            // See if bulb has changed
            System.out.println("Bulb state : " + bulbService.isOn());
            // Conserve power
            System.out.println("Invoking bulbservice.off()");
            bulbService.off();
            // See if bulb has changed
            System.out.println("Bulb state : " + bulbService.isOn());

        } catch (NotBoundException nbe) {
            System.out.println("No light bulb service available in registry!");
        } catch (RemoteException re) {
            System.out.println("RMI Error - " + re);
        } catch (Exception e) {
            System.out.println("Error - " + e);
        }
    }
}
