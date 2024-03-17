public class SyncronousDownload {
    private int fileDownloadCounter = 0;

    public SyncronousDownload() throws InterruptedException {
        fileDownloader();
    }

    public synchronized void fileDownloader() throws InterruptedException {
        fileDownloadCounter++;
        Thread.sleep(100);
        System.out.println("File Downloaded Successfully (Download Counts) ------------> "+fileDownloadCounter);
    }

    public void getFileDownloadsCounter() {
        System.out.println("\n___________________________Download Completed___________________________");
        System.out.println("\n"+this.fileDownloadCounter + " Client(s) Downloaded the File");
    }
}
