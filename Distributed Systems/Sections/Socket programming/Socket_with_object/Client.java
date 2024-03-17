import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;

public class Client {
    public static void main(String[] args) throws IOException {

        System.out.println("Cleint started");

        // need host and port, we want to connect to the ServerSocket at port 7777
        Socket socket = new Socket("localhost", 5500);

        // get the output stream from the socket.
        OutputStream outputStream = socket.getOutputStream();

        // create an object output stream from the output stream so we can send an
        // object through it
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);

        objectOutputStream.writeObject(new Message("This is a first message from cilent to server"));
        socket.close();
    }

}
