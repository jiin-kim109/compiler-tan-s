package tokens;

import inputHandler.Locator;

public class CharacterLiteralToken extends TokenImp {
	protected int value;

	protected CharacterLiteralToken(Locator locator, String lexeme) {
		super(locator, lexeme);
	}
	protected void setValue(int value) {
		this.value = value;
	}
	public int getValue() {
		return value;
	}
	
	public static CharacterLiteralToken make(Locator locator, String lexeme) throws NumberFormatException {
		CharacterLiteralToken result = new CharacterLiteralToken(locator, lexeme);
		result.setValue(Integer.parseInt(lexeme));
		return result;
	}
	
	@Override
	protected String rawString() {
		return "character, " + value;
	}
}
