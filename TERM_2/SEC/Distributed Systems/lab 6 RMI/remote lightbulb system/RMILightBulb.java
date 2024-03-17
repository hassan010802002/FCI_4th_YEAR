import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RMILightBulb extends Remote {
    public void on() throws RemoteException;

    public void off() throws RemoteException;

    public boolean isOn() throws RemoteException;
}
