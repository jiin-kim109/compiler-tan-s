package symbolTable;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class Binding {
	private Type type;
	private TextLocation textLocation;
	private MemoryLocation memoryLocation;
	private String lexeme;
	public enum Constancy {
		IS_CONSTANT,
		IS_VARIABLE
	}
	private Constancy constancy;
	
	public Binding(Type type, TextLocation location, MemoryLocation memoryLocation, String lexeme, Constancy constancy) {
		super();
		this.type = type;
		this.textLocation = location;
		this.memoryLocation = memoryLocation;
		this.lexeme = lexeme;
		this.constancy = constancy;
	}
	

	public String toString() {
		return "[" + lexeme +
				" " + type +  // " " + textLocation +	
				" " + memoryLocation +
				"]";
	}	
	public String getLexeme() {
		return lexeme;
	}
	public Type getType() {
		return type;
	}
	public TextLocation getLocation() {
		return textLocation;
	}
	public MemoryLocation getMemoryLocation() {
		return memoryLocation;
	}
	public void generateAddress(ASMCodeFragment code) {
		memoryLocation.generateAddress(code, "%% " + lexeme);
	}
	
////////////////////////////////////////////////////////////////////////////////////
//Null Binding object
////////////////////////////////////////////////////////////////////////////////////

	public static Binding nullInstance() {
		return NullBinding.getInstance();
	}
	private static class NullBinding extends Binding {
		private static NullBinding instance=null;
		private NullBinding() {
			super(PrimitiveType.ERROR,
					TextLocation.nullInstance(),
					MemoryLocation.nullInstance(),
					"the-null-binding",
					Constancy.IS_CONSTANT);
		}
		public static NullBinding getInstance() {
			if(instance==null)
				instance = new NullBinding();
			return instance;
		}
	}
	public Boolean isConstant() {
		return constancy == Constancy.IS_CONSTANT;
	}
}
