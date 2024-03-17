import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class App {
    public static void main(String[] args) throws Exception {
        SyncronousDownload downloader = new SyncronousDownload();
        ExecutorService myService = Executors.newCachedThreadPool();
        for (int i = 0; i < 49; i++) {
            myService.execute(new FileDownloaderClient(downloader));
        }
        myService.shutdown();
        while (!myService.isTerminated()) {}
        if (myService.isTerminated()) {
            downloader.getFileDownloadsCounter();
        }
    }
}
