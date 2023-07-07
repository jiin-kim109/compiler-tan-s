package lexicalAnalyzer;

import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import tokens.LextantToken;
import tokens.Token;


public enum TypeLiteral implements Lextant {
	INT_TYPE("int"),
	FLOATING_TYPE("float"),
	BOOLEAN_TYPE("bool"),
	CHARACTER_TYPE("char"),
	STRING_TYPE("string"),
	NULL_TYPE("");

	private String lexeme;
	private Token prototype;


	private TypeLiteral(String lexeme) {
		this.lexeme = lexeme;
		this.prototype = LextantToken.make(TextLocation.nullInstance(), lexeme, this);
	}
	public String getLexeme() {
		return lexeme;
	}
	public Token prototype() {
		return prototype;
	}
	
	public static TypeLiteral forLexeme(String lexeme) {
		for(TypeLiteral literal: values()) {
			if(literal.lexeme.equals(lexeme)) {
				return literal;
			}
		}
		return NULL_TYPE;
	}

	public static PrimitiveType toPrimitive(TypeLiteral literal) {
		return switch (literal.lexeme) {
			case "int" -> PrimitiveType.INTEGER;
			case "char" -> PrimitiveType.CHARACTER;
			case "bool" -> PrimitiveType.BOOLEAN;
			case "float" -> PrimitiveType.FLOATING;
			case "string" -> PrimitiveType.STRING;
			default -> PrimitiveType.NO_TYPE;
		};
	}

	public static boolean isATypeLiteral(String lexeme) {
		return forLexeme(lexeme) != NULL_TYPE;
	}
}
