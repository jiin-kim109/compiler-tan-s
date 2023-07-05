package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import tokens.CharacterLiteralToken;
import tokens.Token;

import java.util.Optional;

public class CharacterScanner extends TokenScanner {
    private static final Character QUOTATION = '\'';
    private static final Character ASCII_OCTAL_SYMBOL = '%';

    private LocatedChar startingCharacter;
    private PushbackCharStream input;

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        CharacterScanner scanner = new CharacterScanner(startingCharacter, input);
        if (!scanner.isStartingSymbol(startingCharacter))
            return Optional.empty();
        return scanner.scanChar(startingCharacter, input);
    }

    public boolean isStartingSymbol(LocatedChar lc) {
        return lc.getCharacter() == QUOTATION || lc.getCharacter() == ASCII_OCTAL_SYMBOL;
    }

    private CharacterScanner(LocatedChar startingCharacter, PushbackCharStream input) {
        this.startingCharacter = startingCharacter;
        this.input = input;
    }

    private Optional<Token> scanChar(LocatedChar startingCharacter, PushbackCharStream input) {
        StringBuffer buffer = new StringBuffer();
        if (startingCharacter.getCharacter() == ASCII_OCTAL_SYMBOL) {
            for (int digit=0; digit<3; digit++) {
                LocatedChar octal = input.next();
                if (!octal.isOctalDigit()) {
                    lexicalError("Malformed ascii-octal character literal", octal);
                    return Optional.empty();
                }
                buffer.append(octal.getCharacter());
            }
            int octalToDecimal = Integer.parseInt(buffer.toString(), 8);
            return Optional.of(CharacterLiteralToken.make(startingCharacter, Integer.toString(octalToDecimal)));
        }
        else {
            LocatedChar ch = input.next();
            buffer.append((int) ch.getCharacter());
            if (input.peek().getCharacter() != QUOTATION) {
                lexicalError("Malformed character literal", input.next());
                return Optional.empty();
            }
            input.next();
            return Optional.of(CharacterLiteralToken.make(startingCharacter, buffer.toString()));
        }
    }
}
