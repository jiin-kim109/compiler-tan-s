package inputHandler;

/** Value object for holding a character and its location in the input text.
 *  Contains delegates to select character operations.
 *
 */
public class LocatedChar implements Locator {
	Character character;
	TextLocation location;
	
	public LocatedChar(Character character, TextLocation location) {
		super();
		this.character = character;
		this.location = location;
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// getters
	
	public Character getCharacter() {
		return character;
	}
	public TextLocation getLocation() {
		return location;
	}
	public boolean isChar(char c) {
		return character == c;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	// toString
	
	public String toString() {
		return "(" + charString() + ", " + location + ")";
	}
	private String charString() {
		if(Character.isWhitespace(character)) {
			int i = character;
			return String.format("'\\%d'", i);
		}
		else {
			return character.toString();
		}
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// delegates
	
	public boolean isLowerCase() {
		return Character.isLowerCase(character);
	}

	public boolean isUpperCase() {
		return Character.isUpperCase(character);
	}

	public boolean isDigit() {
		return Character.isDigit(character);
	}
	public boolean isOctalDigit() {
		if (!isDigit())
			return false;
		int value = Character.getNumericValue(character);
		if (value < 0 || value > 7)
			return false;
		return true;
	}
	public boolean isWhitespace() {
		return Character.isWhitespace(character);
	}
}
