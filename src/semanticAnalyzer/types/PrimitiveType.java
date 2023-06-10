package semanticAnalyzer.types;


import java.util.List;

public enum PrimitiveType implements Type {
	BOOLEAN(1),
	INTEGER(4),
	FLOATING(8),
	CHARACTER(1),
	STRING(4),
	ERROR(0),			// use as a value when a syntax error has occurred
	NO_TYPE(0, "");		// use as a value when no type has been assigned.
	
	private int sizeInBytes;
	private String infoString;
	
	private PrimitiveType(int size) {
		this.sizeInBytes = size;
		this.infoString = toString();
	}
	private PrimitiveType(int size, String infoString) {
		this.sizeInBytes = size;
		this.infoString = infoString;
	}
	public int getSize() {
		return sizeInBytes;
	}
	public String infoString() {
		return infoString;
	}

	public static PrimitiveType forLexeme(String lexeme) {
		return switch (lexeme) {
			case "int" -> PrimitiveType.INTEGER;
			case "char" -> PrimitiveType.CHARACTER;
			case "bool" -> PrimitiveType.BOOLEAN;
			case "float" -> PrimitiveType.FLOATING;
			case "string" -> PrimitiveType.STRING;
			default -> PrimitiveType.NO_TYPE;
		};
	}
}
