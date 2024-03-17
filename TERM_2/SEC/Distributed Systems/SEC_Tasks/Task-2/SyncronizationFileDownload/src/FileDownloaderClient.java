public class FileDownloaderClient implements Runnable {
    SyncronousDownload downloader;

    public FileDownloaderClient(SyncronousDownload downloader) {
        this.downloader = downloader;
    }

    @Override
    public void run() {
        try {
            this.downloader.fileDownloader();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
