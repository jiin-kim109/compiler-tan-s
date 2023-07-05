package lexicalAnalyzer;

import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import lexicalAnalyzer.scanner.TokenScanner;

public class CommentSkipper extends TokenScanner {
    private static final Character COMMENT_SYMBOL = '#';

    private PushbackCharStream input;

    public static void skipComment(LocatedChar startingCharacter, PushbackCharStream input) {
        CommentSkipper scanner = new CommentSkipper(input);
        if (scanner.isCommentSymbol(startingCharacter))
            scanner.skipComment(input);
    }

    public boolean isCommentSymbol(LocatedChar lc) {
        return lc.getCharacter() == COMMENT_SYMBOL;
    }

    private CommentSkipper(PushbackCharStream input) {
        this.input = input;
    }

    private void skipComment(PushbackCharStream input) {
        if (input.isEndOfLine())
            return;
        LocatedChar ch = input.next();
        while(!isCommentSymbol(ch) && !input.isEndOfLine()) {
            ch = input.next();
        }
    }
}
