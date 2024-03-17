
package ir_app;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.core.KeywordAnalyzer;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.analysis.core.StopAnalyzer;
import org.apache.lucene.analysis.core.WhitespaceAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.util.Version;

public class MyAnalyzers {
    public static void main(String[] args) throws IOException, ParseException{
        System.out.println("Enter The Text Data to Analyze : --> ");
        Scanner input = new Scanner(System.in);
        String myData = input.nextLine();
        List<String> tokensResultsList = new ArrayList<>();
        
        AnalyzeData(new StandardAnalyzer(Version.LUCENE_42), myData, tokensResultsList);
        System.out.println("\nStandard_Analyzer Tokens is --> " + tokensResultsList + "\n");
        System.out.println("________________________________________________________________________________________\n");
        AnalyzeData(new SimpleAnalyzer(Version.LUCENE_42), myData, tokensResultsList);
        System.out.println("Simple_Analyzer Tokens is --> " + tokensResultsList+ "\n");
        System.out.println("________________________________________________________________________________________\n");
        AnalyzeData(new StopAnalyzer(Version.LUCENE_42), myData, tokensResultsList);
        System.out.println("Stop_Analyzer Tokens is --> " + tokensResultsList+ "\n");
        System.out.println("________________________________________________________________________________________\n");
        AnalyzeData(new WhitespaceAnalyzer(Version.LUCENE_42), myData, tokensResultsList);
        System.out.println("Whitespace_Analyzer Tokens is --> " + tokensResultsList+ "\n");
        System.out.println("________________________________________________________________________________________\n");
        AnalyzeData(new KeywordAnalyzer(), myData, tokensResultsList);
        System.out.println("Keyword_Analyzer Tokens is --> " + tokensResultsList+ "\n");
    }
    
    public static void AnalyzeData(Analyzer currentAnalyzer , String textData , List<String> tokensResultsList) throws IOException {
        tokensResultsList.clear();
        TokenStream analyzerStream = currentAnalyzer.tokenStream("body", new StringReader(textData));
        CharTermAttribute charTerm = analyzerStream.addAttribute(CharTermAttribute.class);
        analyzerStream.reset();
        while (analyzerStream.incrementToken()) {            
            tokensResultsList.add(charTerm.toString());
        }
    }
}
