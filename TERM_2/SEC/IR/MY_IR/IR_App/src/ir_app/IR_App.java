package ir_app;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

/**
 *
 * @author Hassan
 */
public class IR_App {

    public static void main(String[] args) throws IOException, ParseException {

        StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_42);
        Directory indexesDirectory = FSDirectory.open(new File("IndexDir"));
        IndexWriterConfig indexWriterConfig = new IndexWriterConfig(Version.LUCENE_42, analyzer);
        try (IndexWriter indexWriter = new IndexWriter(indexesDirectory, indexWriterConfig)) {
            File[] myDataFiles = new File("MyDataset").listFiles();
            List<File> mainDataFiles = new ArrayList<>();
            
            for (File myDataFile : myDataFiles) {
                if (!myDataFile.isDirectory() && !myDataFile.isHidden() && myDataFile.exists() && myDataFile.canRead()) {
                    mainDataFiles.add(myDataFile);
                } else {
                    mainDataFiles.addAll(Arrays.asList(myDataFile.listFiles()));
                }
            }
            
            for (File mySubFile : mainDataFiles) {
                addIdxDoc(indexWriter, mySubFile);
            }
            
            System.out.println("# Number of Indexed Docs => " + indexWriter.numDocs());
        }

        System.out.println("Indexing DataSet Files Finished Successfully .....!!!! \n");

        /////////////////////////////////////////////////////////////////////////////
        
        Scanner input =  new Scanner(System.in);
        System.out.println("Enter Your Search KeyWord : ");
        String textQuery = input.nextLine();

        Query query = new QueryParser(Version.LUCENE_42, "fileContent", analyzer).parse(textQuery);
        try (IndexReader indexReader = DirectoryReader.open(indexesDirectory)) {
            IndexSearcher indexSearcher = new IndexSearcher(indexReader);
            TopDocs hitsDocs = indexSearcher.search(query, 10);
            
            System.err.println("Found " + hitsDocs.totalHits + " document(s) That Matched The Searching Text Query '" + textQuery + "':");
            System.out.println("Searching Finished Successfully ........ !!!! \n");
            
            /////////////////////////////////////////////////////////////////////////////
            
            System.out.println("Display Results : ");
            for (ScoreDoc scoreDoc : hitsDocs.scoreDocs) {
                int docID = scoreDoc.doc;
                Document doc = indexSearcher.doc(docID);
                System.out.println("\n\tFile Path --> "+ doc.get("filePath") + "\t File Name --> " + doc.get("fileName")+ "\n");
                System.out.println("_________________________________________________________________________________________");
            }
        }
    }

    public static void addIdxDoc(IndexWriter iw, File dataFile) throws IOException {
        Document idxDoc = new Document();
        idxDoc.add(new Field("fileContent", new FileReader(dataFile)));
        idxDoc.add(new Field("fileName", dataFile.getName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        idxDoc.add(new Field("filePath", dataFile.getCanonicalPath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
        iw.addDocument(idxDoc);
    }

}
