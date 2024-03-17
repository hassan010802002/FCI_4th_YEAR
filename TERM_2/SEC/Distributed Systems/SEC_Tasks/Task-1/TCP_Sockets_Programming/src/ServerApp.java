import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerApp {
    private int socketPort;
    private ServerSocket myServerSocket;
    private Socket mySocket;
    private BufferedReader serverInputReader;
    private PrintWriter serverOutputWriter;

    public ServerApp(int socketPort) throws IOException {
        this.socketPort = socketPort;
        this.myServerSocket = new ServerSocket(this.socketPort);
        System.out.println("Connection Intialized  ....... Watting for Clients Requests .......!!!!!!!");
        this.mySocket = this.myServerSocket.accept();
        System.out.println("Client Connected ....... Connection Established .......!!!!!!!");
        this.serverInputReader = new BufferedReader(new InputStreamReader(mySocket.getInputStream()));
        this.serverOutputWriter = new PrintWriter(this.mySocket.getOutputStream(),true);
    }

    public void sendingClientData() throws IOException {
        while (true) {
            String clientRequest = getClientRequest();
            System.out.println("Client Request ---> " + clientRequest);

            if (clientRequest.equals("exit")) {
                System.out.println("!!!!!!!......... Terminating Connection .........!!!!!!!!");
                this.serverOutputWriter.println("Exitting .......");
                break;
            } else {
                System.out.println("!!!!!!!!..... Sending Client Request Data .....!!!!!!!!");
                this.serverOutputWriter.println(clientRequest);
            }
        }
        this.serverInputReader.close();
        this.serverOutputWriter.close();
        this.mySocket.close();
        this.myServerSocket.close();
    }

    public String getClientRequest() throws IOException {
        return this.serverInputReader.readLine();
    }
    
    public static void main(String[] args) throws IOException {
        ServerApp myServer = new ServerApp(5500);
        myServer.sendingClientData();
    }
}
