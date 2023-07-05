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
	// Punctuator lexical analysis	
	// old method left in to show a simple scanning method.
	// current method is the algorithm object PunctuatorScanner.java

	@SuppressWarnings("unused")
	private Token oldScanPunctuator(LocatedChar ch) {
		
		switch(ch.getCharacter()) {
		case '*':
			return LextantToken.make(ch, "*", Punctuator.MULTIPLY);
		case '+':
			return LextantToken.make(ch, "+", Punctuator.ADD);
		case '>':
			return LextantToken.make(ch, ">", Punctuator.GREATER);
		case ':':
			if(ch.getCharacter()=='=') {
				return LextantToken.make(ch, ":=", Punctuator.ASSIGN);
			}
			else {
				lexicalError(ch);
				return(NullToken.make(ch));
			}
		case ',':
			return LextantToken.make(ch, ",", Punctuator.PRINT_SEPARATOR);
		case ';':
			return LextantToken.make(ch, ";", Punctuator.TERMINATOR);
		default:
			lexicalError(ch);
			return(NullToken.make(ch));
		}
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Error-reporting	

	private void lexicalError(LocatedChar ch) {
		TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character " + ch);
	}

	private void lexicalError(String errorMsg, LocatedChar decimal) {
		TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: " + errorMsg + " at " + decimal.getLocation());
	}

	private void lexicalError(String errorMsg, LocatedChar ch, String lexeme) {
		TanLogger log = TanLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: " + errorMsg + " at " + ch.getLocation() + ", while reading " + lexeme);
	}
}
