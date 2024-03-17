/* Producer.java: A producer that generates messages and put into a given
message queue. */
public class Producer extends Thread {
    private static int count = 0;
    private MessageQueue queue = null;

    public Producer(MessageQueue queue) {
        this.queue = queue;
    }

    public void run() {
        for (int i = 0; i < 10; i++) {
            queue.put(generateMessage());
        }
    }

    private synchronized String generateMessage() {
        String msg = "MSG#" + count;
        count++;
        return msg;
    }
} // end Producer class