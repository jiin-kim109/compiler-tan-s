package lexicalAnalyzer;

import inputHandler.TextLocation;
import tokens.LextantToken;
import tokens.Token;


public enum Punctuator implements Lextant {
	ADD("+"), 
	SUBTRACT("-"),
	MULTIPLY("*"),
	DIVIDE("/"),
	GREATER(">"),
	GREATER_OR_EQUAL(">="),
	SMALLER("<"),
	SMALLER_OR_EQUAL("<="),
	EQUAL("=="),
	NOT_EQUAL("!="),
	ASSIGN(":="),
	PRINT_SEPARATOR("\\"),
	PRINT_SPACE("\\s"),
	PRINT_NEWLINE("\\n"),
	PRINT_HORIZONTAL_TAB("\\t"),
	TERMINATOR(";"),
	OPEN_BRACE("{"),
	CLOSE_BRACE("}"),
	OPEN_PARENTHESIS("("),
	CLOSE_PARENTHESIS(")"),
	TYPE_CAST(""),
	INDEXING(":"),
	NULL_PUNCTUATOR("");

	private String lexeme;
	private Token prototype;
	
	private Punctuator(String lexeme) {
		this.lexeme = lexeme;
		this.prototype = LextantToken.make(TextLocation.nullInstance(), lexeme, this);
	}
	public String getLexeme() {
		return lexeme;
	}
	public Token prototype() {
		return prototype;
	}


	public static Punctuator forLexeme(String lexeme) {
		for(Punctuator punctuator: values()) {
			if(punctuator.lexeme.equals(lexeme)) {
				return punctuator;
			}
		}
		return NULL_PUNCTUATOR;
	}

	public boolean equals(String lexeme) {
		return this.lexeme.equals(lexeme);
	}

	public boolean equals(Character ch) {
		return equals(ch.toString());
	}
	
/*
	//   the following hashtable lookup can replace the implementation of forLexeme above. It is faster but less clear. 
	private static LexemeMap<Punctuator> lexemeToPunctuator = new LexemeMap<Punctuator>(values(), NULL_PUNCTUATOR);
	public static Punctuator forLexeme(String lexeme) {
		   return lexemeToPunctuator.forLexeme(lexeme);
	}
*/
	
}


