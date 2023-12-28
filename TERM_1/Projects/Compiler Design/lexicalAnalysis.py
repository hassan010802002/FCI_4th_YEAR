programCode = '''public class Test {

   public static void main(String args[]) {
      int [] numbers = {10, 20, 30, 40, 50};
      // printing !
      for(int x : numbers ) {
         System.out.print( x );
         System.out.print(",");
      }
      System.out.print("\n");
      String [] names = {"James", "Larry", "Tom", "Lacy"};
      /*
      looping over 
      */
      for( String name : names ) {
         System.out.print( name );
         System.out.print(",");
      }
   }
}'''

symbols = ['{' , '}' , '(' , ')' , '[' , ']' , '.' , '"' , '*' , '\n' , ':' , ',' , ';']

specialSymbols = ['\\' , '/*' , '*/']

specialKeywords = ["public" , "class","void" , "main" , "if" , "String" , "int" , "System" , "println"]

MAINKEYWORDS = symbols + specialSymbols + specialKeywords

emptySpace = " "

lexemeToken = ''

for i,char in enumerate(programCode):
    if char == '*':
        if programCode[i-1] == '/':
            lexemeToken += '/*'
        elif programCode[i+1] == '/':
            lexemeToken += '*/'
        else:
            lexemeToken += '*'
    elif char == '/':
        if programCode[i+1] != '*' and programCode[i-1] != '*' :
            lexemeToken += '/'
        else:
            continue
    else:
        if char != emptySpace:
            lexemeToken += char
    if (i+1 < len(programCode)):
        if programCode[i+1] == emptySpace or programCode[i+1] in MAINKEYWORDS or lexemeToken in MAINKEYWORDS:
            if lexemeToken != '':
                print(lexemeToken.replace('\n','<newLine>'))
                lexemeToken =''