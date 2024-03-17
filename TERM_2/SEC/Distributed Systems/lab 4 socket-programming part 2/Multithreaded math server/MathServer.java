import java.io.*;
import java.net.*;

public class MathServer {
    protected MathService mathService;
    protected Socket socket;

    public void setMathService(MathService mathService) {
        this.mathService = mathService;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }

    public void execute() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            // read the message from client and parse the execution
            String line = reader.readLine();
            double result = parseExecution(line);
            // write the result back to the client
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
            writer.write("" + result);
            writer.newLine();
            writer.flush();
            // close the stream
            reader.close();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // the predefined protocol for the math operation is
    // operator:first value:second value
    protected double parseExecution(String line) throws IllegalArgumentException {
        double result = Double.MAX_VALUE;
        String[] elements = line.split(":");
        if (elements.length != 3)
            throw new IllegalArgumentException("parsing error!");
        double firstValue = 0;
        double secondValue = 0;
        try {
            firstValue = Double.parseDouble(elements[1]);
            secondValue = Double.parseDouble(elements[2]);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid arguments!");
        }
        switch (elements[0].charAt(0)) {
            case '+':
                result = mathService.add(firstValue, secondValue);
                break;
            case '-':
                result = mathService.sub(firstValue, secondValue);
                break;
            case '*':
                result = mathService.mul(firstValue, secondValue);
                break;
            case '/':
                result = mathService.div(firstValue, secondValue);
                break;
            default:
                throw new IllegalArgumentException("Invalid math operation!");
        }
        return result;
    }
    

    public static void main(String[] args) throws Exception {
        int port = 1534;
        if (args.length == 1) {
            try {
                port = Integer.parseInt(args[0]);
            } catch (Exception e) {
            }
        }
        System.out.println("Math Server is running...");
        // create a server socket and wait for client’s connection
        ServerSocket serverSocket = new ServerSocket(port);
        Socket socket = serverSocket.accept();
        // run a math server that talks to the client
        MathServer mathServer = new MathServer();
        mathServer.setMathService(new PlainMathService());
        mathServer.setSocket(socket);
        mathServer.execute();
        System.out.println("Math Server is closed...");
    }
}
