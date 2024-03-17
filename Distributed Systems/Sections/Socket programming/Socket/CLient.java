
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class CLient {

    public static void main(String[] args) throws IOException {

        System.out.println("Cleint started");
        Socket clientSocket = new Socket("localhost",5500);

        // read data from user
        BufferedReader user_input = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Input Data to Request from Server .....");
        PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
        BufferedReader bufferedReader;

        while (true) {
            String input_string = user_input.readLine();

            // sending data to server
            out.println(input_string);

            // receiving data
            bufferedReader = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            String received_string = bufferedReader.readLine();
            System.out.println("Server Response ---> " + received_string);
            if (input_string.equals("exit")) {
                System.out.println("Connection Terminated");
                break;
            }
        }

        out.close();
        user_input.close();
        clientSocket.close();
    }
}
