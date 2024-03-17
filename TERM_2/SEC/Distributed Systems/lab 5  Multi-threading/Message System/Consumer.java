/* Consumer.java: A consumer that consumes messages from the queue. */
public class Consumer extends Thread {
    private MessageQueue queue = null;

    public Consumer(MessageQueue queue) {
        this.queue = queue;
    }

    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println("Consumer downloads " + queue.get() + " from the queue.");
        }
    }
} // end Consumer class