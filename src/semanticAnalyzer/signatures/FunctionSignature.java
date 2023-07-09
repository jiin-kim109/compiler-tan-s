package semanticAnalyzer.signatures;

import java.util.*;

import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.TypeVariable;

//immutable
public class FunctionSignature {
	private static final boolean ALL_TYPES_ACCEPT_ERROR_TYPES = true;
	private Type resultType;
	private Type[] paramTypes;
	Object whichVariant;
	
	
	///////////////////////////////////////////////////////////////
	// construction
	
	public FunctionSignature(Object whichVariant, Type ...types) {
		assert(types.length >= 1);
		storeParamTypes(types);
		resultType = types[types.length-1];
		this.whichVariant = whichVariant;
	}

	private void storeParamTypes(Type[] types) {
		paramTypes = new Type[types.length-1];
		for(int i=0; i<types.length-1; i++) {
			paramTypes[i] = types[i];
		}
	}

	///////////////////////////////////////////////////////////////
	// accessors
	
	public Object getVariant() {
		return whichVariant;
	}
	public List<Type> paramTypes() { return Arrays.stream(paramTypes).toList(); }
	public Type resultType() {
		return resultType;
	}
	public boolean isNull() {
		return false;
	}

	public int numTypes() {
		return paramTypes.length + 1; // # of param types + result type
	}
	
	
	///////////////////////////////////////////////////////////////
	// main query

	public boolean accepts(List<Type> types) {
		if (types.size() != paramTypes.length) {
			return false;
		}

		for (int i=0; i<paramTypes.length; i++) {
			if (!assignableTo(paramTypes[i], types.get(i))) {
				return false;
			}
		}
		return true;
	}

	private boolean assignableTo(Type formalType, Type actualType) {
		if(actualType == PrimitiveType.ERROR && ALL_TYPES_ACCEPT_ERROR_TYPES) {
			return true;
		}
		return formalType.equivalent(actualType);
	}
	
	// Null object pattern
	private static FunctionSignature neverMatchedSignature = new FunctionSignature(1, PrimitiveType.ERROR) {
		public boolean accepts(List<Type> types) {
			return false;
		}
		public boolean isNull() {
			return true;
		}
	};
	public static FunctionSignature nullInstance() {
		return neverMatchedSignature;
	}
}