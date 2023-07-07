package lexicalAnalyzer;


import inputHandler.LocatedCharStream;
import lexicalAnalyzer.scanner.*;
import logging.TanLogger;

import inputHandler.InputHandler;
import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import tokens.*;

import java.util.*;


public class LexicalAnalyzer extends ScannerImp implements Scanner {

	public static LexicalAnalyzer make(String filename) {
		InputHandler handler = InputHandler.fromFilename(filename);
		PushbackCharStream charStream = PushbackCharStream.make(handler);
		return new LexicalAnalyzer(charStream);
	}

	public LexicalAnalyzer(PushbackCharStream input) {
		super(input);
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// Token-finding main dispatch

	@Override
	protected Token findNextToken() {
		LocatedChar ch = input.nextNonWhitespaceChar();
		CommentSkipper.skipComment(ch, input);
		if (LocatedCharStream.isEndOfInput(input.peek()))
			return NullToken.make(input.next());

		Optional<Token> token = Optional.ofNullable(
				DigitScanner.scan(ch, input).orElse(
						CharacterScanner.scan(ch, input).orElse(
							StringScanner.scan(ch, input).orElse(
								IdentifierScanner.scan(ch, input).orElse(
										CastingScanner.scan(ch, input).orElse(
												PunctuatorScanner.scan(ch, input).orElse(
														null
												)
										)
								)
						)
				)));

		Token nextToken = token.orElseGet(() -> {
			lexicalError(ch);
			return findNextToken();
		});
		return nextToken;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Error-reporting	

	private void lexicalError(LocatedChar ch) {
		TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character " + ch);
	}
}
