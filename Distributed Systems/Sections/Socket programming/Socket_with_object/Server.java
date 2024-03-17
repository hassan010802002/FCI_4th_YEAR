import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Server {

    public static void main(String[] args) throws IOException, ClassNotFoundException {
        // don't need to specify a hostname, it will be the current machine
        ServerSocket serverSocket = new ServerSocket(5500);

        // ServerSocket waiting connections..."
        Socket socket = serverSocket.accept();

        // get the input stream from the connected socket
        InputStream inputStream = socket.getInputStream();

        // create a DataInputStream so we can read data from it.
        ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);

        Message received_object = (Message) objectInputStream.readObject();

        System.out.println(received_object.getMessage());

    }
}
