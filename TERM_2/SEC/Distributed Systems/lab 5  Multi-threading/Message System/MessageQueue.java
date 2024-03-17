/* MessageQueue.java: A message queue with synchronized methods for queuing
and consuming messages. */
import java.util.ArrayList;
import java.util.List;

public class MessageQueue {
    // the size of the buffer
    private int bufferSize;
    // the buffer list of the message, assuming the string message format
    private List<String> buffer = new ArrayList<String>();

    // construct the message queue with given buffer size
    public MessageQueue(int bufferSize) {
        if (bufferSize <= 0)
            throw new IllegalArgumentException("Size is illegal.");
        this.bufferSize = bufferSize;
    }

    // check whether the buffer is full
    public synchronized boolean isFull() {
        return buffer.size() == bufferSize;
    }

    // check whether the buffer is empty
    public synchronized boolean isEmpty() {
        return buffer.isEmpty();
    }

    // put an income message into the queue, called by message producer
    public synchronized void put(String message) {
        // wait until the queue is not full
        while (isFull()) {
            System.out.println("Queue is full.");
            try {
                // set the current thread to wait
                wait();
            } catch (InterruptedException ex) {
                // someone wake me up.
            }
        }
        buffer.add(message);
        System.out.println("Queue receives message ‘" + message + "’");
        // wakeup all the waiting threads to proceed
        notifyAll();
    }

    // get a message from the queue, called by the message consumer
    public synchronized String get() {
        String message = null;
        // wait until the queue is not empty
        while (isEmpty()) {
            System.out.println("There is no message in queue.");
            try {
                // set the current thread to wait
                wait();
            } catch (InterruptedException ex) {
                // someone wake me up.
            }
        }
        // consume the first message in the queue
        message = buffer.remove(0);
        // wakeup all the waiting thread to proceed
        notifyAll();
        return message;
    }
} // end MessageQueue class