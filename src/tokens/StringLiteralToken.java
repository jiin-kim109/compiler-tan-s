package tokens;

import inputHandler.Locator;

public class StringLiteralToken extends TokenImp {
	protected String value;

	protected StringLiteralToken(Locator locator, String lexeme) {
		super(locator, lexeme);
	}
	protected void setValue(String value) {
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
	public static StringLiteralToken make(Locator locator, String lexeme) {
		StringLiteralToken result = new StringLiteralToken(locator, lexeme);
		result.setValue(lexeme);
		return result;
	}
	
	@Override
	protected String rawString() {
		return "string, " + value;
	}
}
