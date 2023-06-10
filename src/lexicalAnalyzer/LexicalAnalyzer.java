package lexicalAnalyzer;


import inputHandler.LocatedCharStream;
import logging.TanLogger;

import inputHandler.InputHandler;
import inputHandler.LocatedChar;
import inputHandler.PushbackCharStream;
import semanticAnalyzer.types.PrimitiveType;
import tokens.*;

import java.util.*;
import java.util.stream.Stream;

import static lexicalAnalyzer.PunctuatorScanningAids.*;


public class LexicalAnalyzer extends ScannerImp implements Scanner {

	private static final Character DECIMAL_POINT = '.';
	private static final Character COMMENT_SYMBOL = '#';
	private static final Character QUOTATION = '\'';
	private static final Character DOUBLE_QUOTATION = '\"';
	private static final Character ASCII_OCTAL_SYMBOL = '%';

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
		LocatedChar ch = nextNonWhitespaceChar();
		if(ch.isDigit()) {
			return scanNumber(ch);
		}
		else if(isCharacterSymbol(ch)) {
			return scanCharacter(ch);
		}
		else if(isStringSymbol(ch)) {
			return scanString(ch);
		}
		else if(isIdentifierStart(ch)) {
			return scanIdentifier(ch);
		}
		else if(isCommentSymbol(ch)) {
			skipToEndOfComment();
			return findNextToken();
		}
		else if(isPunctuatorStart(ch)) {
			return scanPunctuator(ch);
		}
		else if(isEndOfInput(ch)) {
			return NullToken.make(ch);
		}
		else {
			lexicalError(ch);
			return findNextToken();
		}
	}


	private LocatedChar nextNonWhitespaceChar() {
		LocatedChar ch = input.next();
		while(ch.isWhitespace()) {
			ch = input.next();
		}
		return ch;
	}

	private void skipToEndOfComment() {
		if (input.isEndOfLine())
			return;
		LocatedChar ch = input.next();
		while(!isCommentSymbol(ch) && !input.isEndOfLine()) {
			ch = input.next();
		}
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Integer lexical analysis	

	private Token scanNumber(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentDigits(buffer);

		try {
			if (input.peek().getCharacter() == DECIMAL_POINT) {
				return scanFloatingNumber(firstChar, buffer);
			} else {
				return IntegerLiteralToken.make(firstChar, buffer.toString());
			}
		}
		catch (NumberFormatException e) {
			lexicalError("Numeric literal parsing exception", input.peek(), e.toString());
			return findNextToken();
		}
	}

	private Token scanFloatingNumber(LocatedChar firstChar, StringBuffer buffer) {
		LocatedChar decimal = input.next();
		if (decimal.getCharacter() != DECIMAL_POINT || !input.peek().isDigit()) {
			lexicalError("Malformed floating-point literal", input.peek());
			return findNextToken();
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
				return findNextToken();
			}
			appendSubsequentDigits(buffer);
		}
		else {
			input.pushback(next);
		}
		return FloatingLiteralToken.make(firstChar, buffer.toString());
	}

	private Token scanCharacter(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();

		if (firstChar.getCharacter() == ASCII_OCTAL_SYMBOL) {
			for (int digit=0; digit<3; digit++) {
				LocatedChar octal = input.next();
				if (!octal.isOctalDigit()) {
					lexicalError("Malformed ascii-octal character literal", octal);
					return findNextToken();
				}
				buffer.append(octal.getCharacter());
			}
			int octalToDecimal = Integer.parseInt(buffer.toString(), 8);
			return CharacterLiteralToken.make(firstChar, Integer.toString(octalToDecimal));
		}
		else {
			LocatedChar ch = input.next();
			buffer.append((int) ch.getCharacter());
			if (input.peek().getCharacter() != QUOTATION) {
				lexicalError("Malformed character literal", input.next());
				return findNextToken();
			}
			input.next();
			return CharacterLiteralToken.make(firstChar, buffer.toString());
		}
	}

	private Token scanString(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(input.next().getCharacter());
		while(input.peek().getCharacter() != DOUBLE_QUOTATION) {
			if (isEndOfInput(input.peek())) {
				lexicalError("Malformed string literal, expecting closing double quotation", input.peek());
				return findNextToken();
			}
			buffer.append(input.next().getCharacter());
		}
		input.next();
		return StringLiteralToken.make(firstChar, buffer.toString());
	}

	private void appendSubsequentDigits(StringBuffer buffer) {
		LocatedChar c = input.next();
		while(c.isDigit()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}

	private Token scanPunctuator(LocatedChar firstChar) {
		if (isTypeCastStart(firstChar)) {
			Stack<LocatedChar> backupPrefix = new Stack<>();

			StringBuffer buffer = new StringBuffer();
			LocatedChar next = nextNonWhitespaceChar();

			buffer.append(firstChar.getCharacter());
			buffer.append(next.getCharacter());
			backupPrefix.push(next);
			while (next.isLowerCase()) {
				next = nextNonWhitespaceChar();
				backupPrefix.push(next);
				buffer.append(next.getCharacter());
			}

			Keyword typeKeyword = Keyword.forLexeme(buffer.substring(1, buffer.length()-1));
			PrimitiveType type = Keyword.toPrimitive(typeKeyword);

			if (type != PrimitiveType.NO_TYPE && Punctuator.GREATER.equals(next.getCharacter())) {
				return LextantToken.make(firstChar, buffer.toString(), Punctuator.TYPE_CAST);
			}
			else {
				while (!backupPrefix.isEmpty()) {
					input.pushback(backupPrefix.pop());
				}
			}
		}
		return PunctuatorScanner.scan(firstChar, input);
	}

	private boolean isTypeCastStart(LocatedChar lc) {
		return Punctuator.SMALLER.equals(lc.getCharacter());
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Identifier and keyword lexical analysis	

	private Token scanIdentifier(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentIdentifierCharacters(buffer);

		String lexeme = buffer.toString();
		if(Keyword.isAKeyword(lexeme)) {
			return LextantToken.make(firstChar, lexeme, Keyword.forLexeme(lexeme));
		}
		else {
			return IdentifierToken.make(firstChar, lexeme);
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
	// Character-classification routines specific to tan scanning.	

	private boolean isIdentifierStart(LocatedChar lc) {
		return lc.isLowerCase() || lc.isUpperCase() || lc.getCharacter() == '_' || lc.getCharacter() == '@';
	}

	private boolean isCharacterSymbol(LocatedChar lc) {
		return lc.getCharacter() == QUOTATION || lc.getCharacter() == ASCII_OCTAL_SYMBOL;
	}

	private boolean isStringSymbol(LocatedChar lc) {
		return lc.getCharacter() == DOUBLE_QUOTATION;
	}

	private boolean isPunctuatorStart(LocatedChar lc) {
		char c = lc.getCharacter();
		return isPunctuatorStartingCharacter(c);
	}

	private boolean isCommentSymbol(LocatedChar lc) {
		return lc.getCharacter() == COMMENT_SYMBOL;
	}

	private boolean isEndOfInput(LocatedChar lc) {
		return lc == LocatedCharStream.FLAG_END_OF_INPUT;
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
