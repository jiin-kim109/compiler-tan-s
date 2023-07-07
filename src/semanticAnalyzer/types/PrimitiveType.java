package semanticAnalyzer.types;


import java.util.List;
import java.util.Set;

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

	@Override
	public boolean equivalent(Type otherType) {
		return this==otherType;
	}

	@Override
	public Type concreteType() {
		return this;
	}
}
