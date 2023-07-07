package lexicalAnalyzer.scanner;

import inputHandler.LocatedChar;
import inputHandler.LocatedCharStream;
import inputHandler.PushbackCharStream;
import logging.TanLogger;
import tokens.Token;

import java.util.Optional;

public abstract class TokenScanner {

    public static Optional<Token> scan(LocatedChar startingCharacter, PushbackCharStream input) {
        return Optional.empty();
    }

    protected boolean isStartingSymbol(LocatedChar ch) {
        return false;
    }

    protected void lexicalError(String errorMsg, LocatedChar decimal) {
        TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
        log.severe("Lexical error: " + errorMsg + " at " + decimal.getLocation());
    }

    protected void lexicalError(String errorMsg, LocatedChar ch, String lexeme) {
        TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
        log.severe("Lexical error: " + errorMsg + " at " + ch.getLocation() + ", while reading " + lexeme);
    }
}
