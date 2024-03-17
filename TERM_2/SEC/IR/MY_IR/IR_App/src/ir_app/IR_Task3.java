/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ir_app;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.util.Version;

/**
 *
 * @author Hassan
 */
public class IR_Task3 {

    public static String doc1 = "breakthrough drug for schizophrenia";
    public static String doc2 = "new schizophrenia drug";
    public static String doc3 = "new approach for treatment of schizophrenia";
    public static String doc4 = "new hopes for schizophrenia patients";

    public static void main(String[] args) throws IOException {
        SimpleAnalyzer analyzer = new SimpleAnalyzer(Version.LUCENE_42);
        List<String> tokensResultsList = new ArrayList<>();
        Tokenization(analyzer, doc1, tokensResultsList);
        Tokenization(analyzer, doc2, tokensResultsList);
        Tokenization(analyzer, doc3, tokensResultsList);
        Tokenization(analyzer, doc4, tokensResultsList);
        Collections.sort(tokensResultsList);
        System.out.println("Tokens is --> " + tokensResultsList + "\n");

        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        System.out.println("____________________________Inverted Index____________________________\n");
        System.out.println("Term[Doc (Freq)]\t-------->\tPosting List");

        BuildingInvertedIndex(tokensResultsList);

        /////////////////////////////////////////////////////////////////////////////////////////////////////////
        System.out.println("\n____________________________Incidence Matrices____________________________\n");
        System.out.println("Token\t\t-------->\tDoc1\tDoc2\tDoc3\tDoc4");

        BuildingIncidenceMatrix(tokensResultsList);

        /////////////////////////////////////////////////////////////////////////////////////////////////////////
        System.out.println("\n____________________________Boolean Query____________________________\n");
        Scanner input = new Scanner(System.in);
        System.out.println("Enter The First Token :");
        String token1 = input.nextLine().toLowerCase();
        System.out.println("Enter The Second Token :");
        String token2 = input.nextLine().toLowerCase();
        BooleanAndQuery(token1, token2);
        BooleanOrQuery(token1, token2);
        
    }

    public static void Tokenization(SimpleAnalyzer analyzer, String textDoc, List<String> tokensResultsList) throws IOException {
        TokenStream analyzerStream = analyzer.tokenStream("body", new StringReader(textDoc));
        CharTermAttribute charTerm = analyzerStream.addAttribute(CharTermAttribute.class);
        analyzerStream.reset();
        while (analyzerStream.incrementToken()) {
            if (!tokensResultsList.contains(charTerm.toString())) {
                tokensResultsList.add(charTerm.toString());
            }
        }
    }

    public static void BuildingInvertedIndex(List<String> tokensResultsList) {
        tokensResultsList.forEach((token) -> {
            int docCounter = 0;
            StringBuilder tokenDocs = new StringBuilder();

            if (doc1.contains(token)) {
                docCounter++;
                tokenDocs.append("1 ");
            }
            if (doc2.contains(token)) {
                docCounter++;
                tokenDocs.append("2 ");
            }
            if (doc3.contains(token)) {
                docCounter++;
                tokenDocs.append("3 ");
            }
            if (doc4.contains(token)) {
                docCounter++;
                tokenDocs.append("4");
            }

            if (token.equals("breakthrough") || token.equals("schizophrenia")) {
                System.out.println("'" + token + "' (" + docCounter + ")\t-------->\t" + tokenDocs.toString());
            } else {
                System.out.println("'" + token + "' (" + docCounter + ")\t\t-------->\t" + tokenDocs.toString());
            }
        });
    }

    public static void BuildingIncidenceMatrix(List<String> tokensResultsList) {
        tokensResultsList.forEach((token) -> {
            StringBuilder tokenDocs = new StringBuilder();

            if (doc1.contains(token)) {
                tokenDocs.append("1\t");
            } else {
                tokenDocs.append("0\t");
            }
            if (doc2.contains(token)) {
                tokenDocs.append("1\t");
            } else {
                tokenDocs.append("0\t");
            }
            if (doc3.contains(token)) {
                tokenDocs.append("1\t");
            } else {
                tokenDocs.append("0\t");
            }
            if (doc4.contains(token)) {
                tokenDocs.append("1");
            } else {
                tokenDocs.append("0");
            }

            if (token.equals("breakthrough") || token.equals("schizophrenia") || token.equals("patients")
                    || token.equals("treatment") || token.equals("approach")) {
                System.out.println("'" + token + "'" + "\t-------->\t" + tokenDocs.toString());
            } else {
                System.out.println("'" + token + "'" + "\t\t-------->\t" + tokenDocs.toString());
            }
        });
    }
    
    public static void BooleanAndQuery(String token1 ,String token2 ) {
        StringBuilder tokenDocs = new StringBuilder();

        if (doc1.contains(token1) && doc1.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc2.contains(token1) && doc2.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc3.contains(token1) && doc3.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc4.contains(token1) && doc4.contains(token2)) {
            tokenDocs.append("1");
        } else {
            tokenDocs.append("0");
        }
        
        System.out.println("'" + token1 + "' AND '"+token2+"'" + "\t\t-------->\t" + tokenDocs.toString());
    }
    
    public static void BooleanOrQuery(String token1 ,String token2 ) {
        StringBuilder tokenDocs = new StringBuilder();

        if (doc1.contains(token1) || doc1.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc2.contains(token1) || doc2.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc3.contains(token1) || doc3.contains(token2)) {
            tokenDocs.append("1\t");
        } else {
            tokenDocs.append("0\t");
        }
        if (doc4.contains(token1) || doc4.contains(token2)) {
            tokenDocs.append("1");
        } else {
            tokenDocs.append("0");
        }
        
        System.out.println("'" + token1 + "' OR '"+token2+"'" + "\t\t-------->\t" + tokenDocs.toString());
    }
}
