package lucene_for_txt_files;

import java.io.File;
import java.io.IOException;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class Searcher {
  public static void main(String[] args) throws IOException, ParseException {
    Directory indexDirct = FSDirectory.open(new File("indx")); // index directory
    IndexReader reader = DirectoryReader.open(indexDirct);// Open index
    IndexSearcher is = new IndexSearcher(reader);
    // build & parse the query then run it
    QueryParser parser = new QueryParser(Version.LUCENE_41, "contents", new SimpleAnalyzer(Version.LUCENE_41));
    String q = "promote";
    Query query = parser.parse(q);

    TopDocs hits = is.search(query, 10); // Search index

    // display the query result
    System.out.println("Found " + hits.totalHits +
        " document(s) that matched query '" + q + "':");

    for (ScoreDoc scoreDoc : hits.scoreDocs) {
      Document doc = is.doc(scoreDoc.doc); // Retrieve matching document
      System.out.println(doc.get("fullpath")); // Display filename
    }

    reader.close(); // Close IndexReader
  }
}
