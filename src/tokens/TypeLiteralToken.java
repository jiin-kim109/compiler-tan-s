package tokens;

import inputHandler.Locator;
import lexicalAnalyzer.TypeLiteral;
import semanticAnalyzer.types.Type;

public class TypeLiteralToken extends TokenImp {
	protected TypeLiteral literal;

	protected TypeLiteralToken(Locator locator, String lexeme) {
		super(locator, lexeme);
	}
	protected void setValue(TypeLiteral literal) {
		this.literal = literal;
	}
	public TypeLiteral getValue() {
		return literal;
	}

	public Type primitive() {
		return TypeLiteral.toPrimitive(literal);
	}
	
	public static TypeLiteralToken make(Locator locator, String lexeme) {
		TypeLiteralToken result = new TypeLiteralToken(locator, lexeme);
		result.setValue(TypeLiteral.forLexeme(lexeme));
		return result;
	}

	@Override
	protected String rawString() {
		return "type literal, " + literal;
	}
}
