package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.operators.*;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;
import symbolTable.Binding;

import static semanticAnalyzer.types.PrimitiveType.*;


public class FunctionSignatures extends ArrayList<FunctionSignature> {
	private static final long serialVersionUID = -4907792488209670697L;
	private static Map<Object, FunctionSignatures> signaturesForKey = new HashMap<Object, FunctionSignatures>();

	public enum Promotable {
		PROMOTABLE,
		NOT_PROMOTABLE
	}
	private Promotable promotable;
	
	Object key;
	
	public FunctionSignatures(Object key, Promotable promotable, FunctionSignature ...functionSignatures) {
		this.key = key;
		this.promotable = promotable;
		for(FunctionSignature functionSignature: functionSignatures) {
			add(functionSignature);
		}
		signaturesForKey.put(key, this);
	}
	
	public Object getKey() {
		return key;
	}
	public boolean hasKey(Object key) {
		return this.key.equals(key);
	}
	
	public FunctionSignature acceptingSignature(List<Type> types) {
		for(FunctionSignature functionSignature: this) {
			if(functionSignature.accepts(types)) {
				return functionSignature;
			}
		}
		return FunctionSignature.nullInstance();
	}
	public boolean accepts(List<Type> types) {
		return !acceptingSignature(types).isNull();
	}

	
	/////////////////////////////////////////////////////////////////////////////////
	// access to FunctionSignatures by key object.
	
	public static FunctionSignatures nullSignatures = new FunctionSignatures(0, Promotable.NOT_PROMOTABLE, FunctionSignature.nullInstance());

	public static FunctionSignatures signaturesOf(Object key) {
		if(signaturesForKey.containsKey(key)) {
			return signaturesForKey.get(key);
		}
		return nullSignatures;
	}
	public static FunctionSignature signature(Object key, List<Type> types) {
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(key);
		return signatures.acceptingSignature(types);
	}


	/////////////////////////////////////////////////////////////////////////////////
	// Put the signatures for operators in the following static block.
	
	static {
		TypeVariable T = new TypeVariable("T");
		// here's one example to get you started with FunctionSignatures: the signatures for addition.		
		// for this to work, you should statically import PrimitiveType.*

		new FunctionSignatures(Punctuator.ADD, Promotable.PROMOTABLE,
			new FunctionSignature(ASMOpcode.Nop, INTEGER, INTEGER),
			new FunctionSignature(ASMOpcode.Nop, FLOATING, FLOATING),
		    new FunctionSignature(ASMOpcode.Add, INTEGER, INTEGER, INTEGER),
		    new FunctionSignature(ASMOpcode.FAdd, FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(Punctuator.SUBTRACT, Promotable.PROMOTABLE,
				new FunctionSignature(ASMOpcode.Negate, INTEGER, INTEGER),
				new FunctionSignature(ASMOpcode.FNegate, FLOATING, FLOATING),
				new FunctionSignature(ASMOpcode.Subtract, INTEGER, INTEGER, INTEGER),
				new FunctionSignature(ASMOpcode.FSubtract, FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(Punctuator.MULTIPLY, Promotable.PROMOTABLE,
				new FunctionSignature(ASMOpcode.Multiply, INTEGER, INTEGER, INTEGER),
				new FunctionSignature(ASMOpcode.FMultiply, FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(Punctuator.DIVIDE, Promotable.PROMOTABLE,
				new FunctionSignature(new IntegerDivideCodeGenerator(), INTEGER, INTEGER, INTEGER),
				new FunctionSignature(new FloatingDivideCodeGenerator(), FLOATING, FLOATING, FLOATING)
		);

		new FunctionSignatures(Punctuator.GREATER, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new GreaterCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new GreaterCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new GreaterCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.GREATER_OR_EQUAL, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new GreaterEqualCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new GreaterEqualCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new GreaterEqualCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.SMALLER, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new SmallerCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new SmallerCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new SmallerCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.SMALLER_OR_EQUAL, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new SmallerEqualCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new SmallerEqualCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new SmallerEqualCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.EQUAL, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new EqualCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new EqualCodeGenerator(), INTEGER, BOOLEAN, BOOLEAN),
				new FunctionSignature(new EqualCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new EqualCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN),
				new FunctionSignature(new EqualCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN),
				new FunctionSignature(new EqualCodeGenerator(), STRING, STRING, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.NOT_EQUAL, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new NotEqualCodeGenerator(), INTEGER, INTEGER, BOOLEAN),
				new FunctionSignature(new NotEqualCodeGenerator(), FLOATING, FLOATING, BOOLEAN),
				new FunctionSignature(new NotEqualCodeGenerator(), CHARACTER, CHARACTER, BOOLEAN),
				new FunctionSignature(new NotEqualCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN),
				new FunctionSignature(new NotEqualCodeGenerator(), STRING, STRING, BOOLEAN)
		);

		new FunctionSignatures(Punctuator.TYPE_CAST, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new TypeCastCodeGenerator(), FLOATING, FLOATING, FLOATING),
				new FunctionSignature(new TypeCastCodeGenerator(), FLOATING, INTEGER, FLOATING),
				new FunctionSignature(new TypeCastCodeGenerator(), INTEGER, INTEGER, INTEGER),
				new FunctionSignature(new TypeCastCodeGenerator(), INTEGER, FLOATING, INTEGER),
				new FunctionSignature(new TypeCastCodeGenerator(), INTEGER, CHARACTER, INTEGER),
				new FunctionSignature(new TypeCastCodeGenerator(), CHARACTER, CHARACTER, CHARACTER),
				new FunctionSignature(new TypeCastCodeGenerator(), CHARACTER, INTEGER, CHARACTER),
				new FunctionSignature(new TypeCastCodeGenerator(), BOOLEAN, BOOLEAN, BOOLEAN),
				new FunctionSignature(new TypeCastCodeGenerator(), BOOLEAN, INTEGER, BOOLEAN),
				new FunctionSignature(new TypeCastCodeGenerator(), BOOLEAN, CHARACTER, BOOLEAN),
				new FunctionSignature(new TypeCastCodeGenerator(), STRING, STRING, STRING),
				new FunctionSignature(new TypeCastCodeGenerator(), new Array(T), new Array(T), new Array(T))
		);

		new FunctionSignatures(Punctuator.INDEXING, Promotable.NOT_PROMOTABLE,
				new FunctionSignature(new ArrayIndexCodeGenerator(), new Array(T), INTEGER, T)
		);
		
		// First, we use the operator itself (in this case the Punctuator ADD) as the key.
		// Then, we give that key two signatures: one an (INT x INT -> INT) and the other
		// a (FLOAT x FLOAT -> FLOAT).  Each signature has a "whichVariant" parameter where
		// I'm placing the instruction (ASMOpcode) that needs to be executed.
		//
		// I'll follow the convention that if a signature has an ASMOpcode for its whichVariant,
		// then to generate code for the operation, one only needs to generate the code for
		// the operands (in order) and then add to that the Opcode.  For instance, the code for
		// floating addition should look like:
		//
		//		(generate argument 1)	: may be many instructions
		//		(generate argument 2)   : ditto
		//		FAdd					: just one instruction
		//
		// If the code that an operator should generate is more complicated than this, then
		// I will not use an ASMOpcode for the whichVariant.  In these cases I typically use
		// a small object with one method (the "Command" design pattern) that generates the
		// required code.

	}

}
