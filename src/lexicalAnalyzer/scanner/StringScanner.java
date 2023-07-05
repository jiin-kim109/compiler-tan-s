package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.LocatedCharStream;
import inputHandler.PushbackCharStream;
import tokens.StringLiteralToken;
import tokens.Token;

import java.util.Optional;

public class StringScanner extends TokenScanner {
    private static final Character DOUBLE_QUOTATION = '\"';
    private LocatedChar startingCharacter;
    private PushbackCharStream input;

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        StringScanner scanner = new StringScanner(startingCharacter, input);
        if (!scanner.isStartingSymbol(startingCharacter))
            return Optional.empty();
        return scanner.scanString(startingCharacter, input);
    }

    public boolean isStartingSymbol(LocatedChar lc) {
        return lc.getCharacter() == DOUBLE_QUOTATION;
    }

    private StringScanner(LocatedChar startingCharacter, PushbackCharStream input) {
        this.startingCharacter = startingCharacter;
        this.input = input;
    }

    private Optional<Token> scanString(LocatedChar startingCharacter, PushbackCharStream input) {
        StringBuffer buffer = new StringBuffer();
        buffer.append(input.next().getCharacter());
        while(input.peek().getCharacter() != DOUBLE_QUOTATION) {
            if (LocatedCharStream.isEndOfInput(input.peek())) {
                lexicalError("Malformed string literal, expecting closing double quotation", input.peek());
                return Optional.empty();
            }
            buffer.append(input.next().getCharacter());
        }
        input.next();
        return Optional.of(StringLiteralToken.make(startingCharacter, buffer.toString()));
    }
}
