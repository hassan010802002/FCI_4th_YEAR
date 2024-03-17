package lucene_for_txt_files;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class Indexer {

  public static void main(String[] args) throws IOException {
    // index directory
    // Directory indexDirct = FSDirectory.open(new File("indexDir"));
    Directory indexDictory = FSDirectory.open(new File("indx"));
    SimpleAnalyzer sa = new SimpleAnalyzer(Version.LUCENE_42);
    // configure index with the analyzer instance
    IndexWriterConfig analyzerConfig = new IndexWriterConfig(Version.LUCENE_42, sa);
    IndexWriter writer = new IndexWriter(indexDictory, analyzerConfig);

    String dataDir = "dataset"; // Index *.txt files from this directory
    File[] files = new File(dataDir).listFiles();

    for (File f : files) { // for each file in the directory
      if (!f.isDirectory() && !f.isHidden() && f.exists() && f.canRead()) {
        System.out.println("Indexing " + f.getCanonicalPath());
        Document doc = new Document(); //
        doc.add(new Field("contents", new FileReader(f))); // Index file content
        // Index file name
        doc.add(new Field("filename", f.getName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        // Index file full path
        doc.add(new Field("fullpath", f.getCanonicalPath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        writer.addDocument(doc); // Add document to Lucene index
      }
    }
    System.out.println("# of Docs indexed = " + writer.numDocs());
    System.out.println("Lucene Index Built Successfully.");
    writer.close(); // close the writer
  }
}
