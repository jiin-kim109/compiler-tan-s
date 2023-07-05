package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import tokens.FloatingLiteralToken;
import tokens.IntegerLiteralToken;
import tokens.Token;

import java.util.Optional;

public class DigitScanner extends TokenScanner {
    private static final Character DECIMAL_POINT = '.';
    private LocatedChar startingCharacter;
    private PushbackCharStream input;

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        DigitScanner scanner = new DigitScanner(startingCharacter, input);
        if (!startingCharacter.isDigit())
            return Optional.empty();
        return scanner.scanNumber(startingCharacter, input);
    }

    private DigitScanner(LocatedChar startingCharacter, PushbackCharStream input) {
        this.startingCharacter = startingCharacter;
        this.input = input;
    }

    private Optional<Token> scanNumber(LocatedChar startingCharacter, PushbackCharStream input) {
        StringBuffer buffer = new StringBuffer();
        buffer.append(startingCharacter.getCharacter());
        appendSubsequentDigits(buffer);

        try {
            if (input.peek().getCharacter() == DECIMAL_POINT) {
                return scanFloatingNumber(startingCharacter, buffer);
            } else {
                return Optional.of(IntegerLiteralToken.make(startingCharacter, buffer.toString()));
            }
        }
        catch (NumberFormatException e) {
            lexicalError("Numeric literal parsing exception", input.peek(), e.toString());
            return Optional.empty();
        }
    }

    private Optional<Token> scanFloatingNumber(LocatedChar firstChar, StringBuffer buffer) {
        LocatedChar decimal = input.next();
        if (decimal.getCharacter() != DECIMAL_POINT || !input.peek().isDigit()) {
            lexicalError("Malformed floating-point literal", input.peek());
            return Optional.empty();
        }

        buffer.append(DECIMAL_POINT);
        buffer.append(input.next().getCharacter());
        appendSubsequentDigits(buffer);

        LocatedChar next = input.next();
        if (next.getCharacter() == 'e' || next.getCharacter() == 'E') {
            buffer.append(next.getCharacter());
            LocatedChar sign = input.next();
            if (sign.getCharacter() == '+' || sign.getCharacter() == '-') {
                buffer.append(sign.getCharacter());
            }
            else if (sign.isDigit()) {
                buffer.append('+');
                buffer.append(sign.getCharacter());
            }
            else {
                lexicalError("Malformed floating-point literal", decimal);
                return Optional.empty();
            }
            appendSubsequentDigits(buffer);
        }
        else {
            input.pushback(next);
        }
        return Optional.of(FloatingLiteralToken.make(firstChar, buffer.toString()));
    }

    private void appendSubsequentDigits(StringBuffer buffer) {
        LocatedChar c = input.next();
        while(c.isDigit()) {
            buffer.append(c.getCharacter());
            c = input.next();
        }
        input.pushback(c);
    }
}
