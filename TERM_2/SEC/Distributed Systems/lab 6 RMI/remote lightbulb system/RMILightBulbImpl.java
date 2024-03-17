public class RMILightBulbImpl implements RMILightBulb {
    // Extends for remote object functionality
    // Implements a light bulb RMI interface

    // Boolean flag to maintain light bulb state information
    private boolean lightOn;

    // A constructor must be provided for the remote object
    public RMILightBulbImpl() throws java.rmi.RemoteException {
        // Default value of off
        setBulb(false);
    }

    // Remotely accessible "on" method - turns on the light
    public void on() throws java.rmi.RemoteException {
        // Turn bulb on
        setBulb(true);
    }

    // Remotely accessible "off" method - turns off the light
    public void off() throws java.rmi.RemoteException {
        // Turn bulb off
        setBulb(false);
    }

    // Remotely accessible "isOn" method, returns state of bulb
    public boolean isOn() throws java.rmi.RemoteException {
        return getBulb();
    }

    // Locally accessible "setBulb" method, changes state of
    // bulb
    public void setBulb(boolean value) {
        lightOn = value;
    }

    // Locally accessible "getBulb" method, returns state of
    // bulb
    public boolean getBulb() {
        return lightOn;
    }
}