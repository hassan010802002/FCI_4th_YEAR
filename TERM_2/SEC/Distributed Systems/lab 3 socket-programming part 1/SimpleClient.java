// SimpleClient.java: A simple client program.
import java.net.*;
import java.io.*;
public class SimpleClient {
    public static void main(String args[]) throws IOException {
    // Open your connection to a server, at port 1254
    Socket s1 = new Socket("localhost",3500);
    // Get an input file handle from the socket and read the input
    InputStream s1In = s1.getInputStream();
    DataInputStream dis = new DataInputStream(s1In);
    // The java.io.DataInputStream.readUTF() method reads in a string that has been encoded using a modified UTF-8 format.
    // The string of character is decoded from the UTF and returned as String.
    String st = new String (dis.readUTF());
    System.out.println(st);
    // When done, just close the connection and exit
    dis.close();
    s1In.close();
    s1.close();
    }
}

