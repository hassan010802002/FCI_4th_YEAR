
// SimpleServer.java: A simple server program.
import java.net.*;
import java.io.*;

public class SimpleServer {
    public static void main(String args[]) throws IOException {
        // Register service on port 1254
        ServerSocket s = new ServerSocket(3500);
        Socket s1 = s.accept(); // Wait and accept a connection
        // Get a communication stream associated with the socket
        OutputStream s1out = s1.getOutputStream();
        DataOutputStream dos = new DataOutputStream(s1out);
        // Send a string!
        dos.writeUTF("Hello\n");
        dos.writeUTF("Hi there from server :)");
        // Close the connection, but not the server socket
        // Send to client:

        dos.close();
        s1out.close();
        s1.close();
    }
}