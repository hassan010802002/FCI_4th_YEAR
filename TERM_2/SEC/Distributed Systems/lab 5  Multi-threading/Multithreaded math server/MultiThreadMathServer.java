
/* MultiThreadMathServer.java: A program extending MathServer which
allows concurrent client requests and opens a new thread for each socket
connection. */
import java.net.ServerSocket;
import java.net.Socket;

public class MultiThreadMathServer extends MathServer implements Runnable {
    public void run() {
        execute();
    }

    public static void main(String[] args) throws Exception {
        int port = 1534;
        if (args.length == 1) {
            try {
                port = Integer.parseInt(args[0]);
            } catch (Exception e) {
            }
        }
        ServerSocket serverSocket = new ServerSocket(port);
        while (true) {
            // waiting for client connection
            Socket socket = serverSocket.accept();
            socket.setSoTimeout(2000);
            /**
             * enables or disables the SO_TIMEOUT option with the given timeout value, in milliseconds.
             * The timeout value should be greater than 0 otherwise, it will throw an error.
             * With this option set to a non-zero timeout, 
             * a read() call on the InputStream associated with this Socket will block for only this amount of time.
             * If the timeout expires, a java.net.SocketTimeoutException is raised, though the Socket is still valid.
             * The option must be enabled prior to entering the blocking operation to have effect.
             * A timeout of zero is interpreted as an infinite timeout.
             * If you want to block forever put this option to zero (the default value),
             * then the read() call will block until at least 1 byte could be read.
             */
            MultiThreadMathServer server = new MultiThreadMathServer();
            server.setMathService(new PlainMathService());
            server.setSocket(socket);
            // start a new server thread...
            new Thread(server).start();
        }
    }
}