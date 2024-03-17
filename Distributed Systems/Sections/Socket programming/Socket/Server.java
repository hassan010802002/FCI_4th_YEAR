import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public static void main(String[] args) throws IOException {

        System.out.println("waiting for clients");
        ServerSocket serverSocket = new ServerSocket(5500);

        Socket socket = serverSocket.accept();
        System.out.println("Connection established");
        PrintWriter out;

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        while (true) {
            String received_string = bufferedReader.readLine();
            System.out.println("Client Request ---> " + received_string);

            // sending data back to client
            
            if (received_string.equals("exit")) {
                System.out.println("Terminating Connection .....!!!!");
                out = new PrintWriter(socket.getOutputStream(), true);
                out.println("Exitting .....");
                break;
            } else {
                System.out.println("Sending Client Request Data Back .....");
                out = new PrintWriter(socket.getOutputStream(), true);
                out.println(received_string);
            }
        }
        bufferedReader.close();
        out.close();
        socket.close();
        serverSocket.close();

    }
}
