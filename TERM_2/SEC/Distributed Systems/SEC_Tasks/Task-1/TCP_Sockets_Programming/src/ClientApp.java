import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientApp {
    private int socketPort;
    private Socket mySocket;
    private BufferedReader myInputReader;
    private BufferedReader serverResponseReader;
    private PrintWriter myDataOutputWriter;
    
    public ClientApp(int socketPort) throws UnknownHostException, IOException {
        this.socketPort = socketPort;
        System.out.println("Client Started ...... Waitting for Connection Initialization ........!!!!!!");
        this.mySocket = new Socket("localhost", this.socketPort);
        System.out.println("Connection Established at Port Number : #"+mySocket.getLocalPort() +" with Address :: "+mySocket.getInetAddress()+" ....... Sending Requests ........!!!!!!");
        this.myInputReader = new BufferedReader(new InputStreamReader(System.in));
        this.serverResponseReader = new BufferedReader(new InputStreamReader(this.mySocket.getInputStream()));
        this.myDataOutputWriter = new PrintWriter(this.mySocket.getOutputStream(),true);
    }

    public void requestServerData() throws IOException {
        System.out.println("Input Data to Request from Server .....");
        String myRequestData;
        while (true) {
            myRequestData = this.myInputReader.readLine();
            this.myDataOutputWriter.println(myRequestData);
            String serverResponse = getServerResponse();
            System.out.println("Server Response ---> " + serverResponse);
            if (myRequestData.equals("exit")) {
                System.out.println("!!!!!!!!!........ Connection Terminated ........!!!!!!!!!");
                break;
            }
        }
        this.myInputReader.close();
        this.myDataOutputWriter.close();
        this.serverResponseReader.close();
        this.mySocket.close();
    }

    public String getServerResponse() throws IOException {
        return this.serverResponseReader.readLine();
    }

    public static void main(String[] args) throws UnknownHostException, IOException{
        ClientApp myClient = new ClientApp(5500);
        myClient.requestServerData();
    }
}
