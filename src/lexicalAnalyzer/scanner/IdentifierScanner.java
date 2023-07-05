package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import lexicalAnalyzer.Keyword;
import tokens.IdentifierToken;
import tokens.LextantToken;
import tokens.Token;

import java.util.Optional;

public class IdentifierScanner extends TokenScanner {

    private PushbackCharStream input;

    private LocatedChar startingCharacter;

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        IdentifierScanner scanner = new IdentifierScanner(startingCharacter, input);
        if (!scanner.isStartingSymbol(startingCharacter))
            return Optional.empty();
        return scanner.scanIdentifier(startingCharacter, input);
    }

    public boolean isStartingSymbol(LocatedChar lc) {
        return lc.isLowerCase() || lc.isUpperCase() || lc.getCharacter() == '_' || lc.getCharacter() == '@';
    }

    private IdentifierScanner(LocatedChar startingCharacter, PushbackCharStream input) {
        this.startingCharacter = startingCharacter;
        this.input = input;
    }

    private Optional<Token> scanIdentifier(LocatedChar startingCharacter, PushbackCharStream input) {
        StringBuffer buffer = new StringBuffer();
        buffer.append(startingCharacter.getCharacter());
        appendSubsequentIdentifierCharacters(buffer);

        String lexeme = buffer.toString();
        if(Keyword.isAKeyword(lexeme)) {
            return Optional.of(LextantToken.make(startingCharacter, lexeme, Keyword.forLexeme(lexeme)));
        }
        else {
            return Optional.of(IdentifierToken.make(startingCharacter, lexeme));
        }
    }

    private void appendSubsequentIdentifierCharacters(StringBuffer buffer) {
        LocatedChar c = input.next();
        while(c.isLowerCase() ||
                c.isUpperCase() ||
                c.isDigit() ||
                c.getCharacter() == '_' ||
                c.getCharacter() == '@') {
            buffer.append(c.getCharacter());
            c = input.next();
        }
        input.pushback(c);
    }
}
