package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.PrimitiveType;
import tokens.LextantToken;
import tokens.Token;

import java.util.Optional;
import java.util.Stack;

public class CastingScanner extends TokenScanner {
    private LocatedChar startingCharacter;
    private PushbackCharStream input;

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        CastingScanner scanner = new CastingScanner(startingCharacter, input);
        if (!scanner.isStartingSymbol(startingCharacter))
            return Optional.empty();
        return scanner.scanTypeCasting(startingCharacter, input);
    }

    public boolean isStartingSymbol(LocatedChar lc) {
        return Punctuator.SMALLER.equals(lc.getCharacter());
    }

    private CastingScanner(LocatedChar startingCharacter, PushbackCharStream input) {
        this.startingCharacter = startingCharacter;
        this.input = input;
    }

    private Optional<Token> scanTypeCasting(LocatedChar startingCharacter, PushbackCharStream input) {
        Stack<LocatedChar> backupPrefix = new Stack<>();

        StringBuffer buffer = new StringBuffer();
        LocatedChar next = input.nextNonWhitespaceChar();

        buffer.append(startingCharacter.getCharacter());
        buffer.append(next.getCharacter());
        backupPrefix.push(next);
        while (next.isLowerCase()) {
            next = input.nextNonWhitespaceChar();
            backupPrefix.push(next);
            buffer.append(next.getCharacter());
        }

        Keyword typeKeyword = Keyword.forLexeme(buffer.substring(1, buffer.length()-1));
        PrimitiveType type = Keyword.toPrimitive(typeKeyword);

        if (type != PrimitiveType.NO_TYPE && Punctuator.GREATER.equals(next.getCharacter())) {
            return Optional.of(LextantToken.make(startingCharacter, buffer.toString(), Punctuator.TYPE_CAST));
        }
        else {
            while (!backupPrefix.isEmpty()) {
                input.pushback(backupPrefix.pop());
            }
        }
        return Optional.empty();
    }
}
