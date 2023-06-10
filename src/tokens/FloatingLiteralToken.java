package tokens;

import inputHandler.Locator;

public class FloatingLiteralToken extends TokenImp {
	protected double value;

	protected FloatingLiteralToken(Locator locator, String lexeme) {
		super(locator, lexeme);
	}
	protected void setValue(double value) {
		this.value = value;
	}
	public double getValue() {
		return value;
	}
	
	public static FloatingLiteralToken make(Locator locator, String lexeme) throws NumberFormatException {
		FloatingLiteralToken result = new FloatingLiteralToken(locator, lexeme);
		checkNumberOutOfBound(lexeme);
		result.setValue(Double.parseDouble(lexeme));
		return result;
	}
	
	@Override
	protected String rawString() {
		return "floating number, " + value;
	}

	private static void checkNumberOutOfBound(String lexeme) throws NumberFormatException {
		double parsed = Double.parseDouble(lexeme);
		if (parsed == Double.POSITIVE_INFINITY) {
			throw new NumberFormatException("number is too large " + lexeme);
		}
		else if (parsed == Double.NEGATIVE_INFINITY) {
			throw new NumberFormatException("number is too small " + lexeme);
		}
	}
}
