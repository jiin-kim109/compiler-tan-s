package semanticAnalyzer.types;


import java.util.Set;

public class TypeVariable implements Type {
	String name;
	Type constraint;

	public Type getConstraint() {
		return this.constraint;
	}

	public void setContraint(Type constraint) {
		this.constraint = constraint;
	}

	public TypeVariable(String name){
		this.name = name;
		reset();
	}

	public void reset() {
		this.constraint = PrimitiveType.NO_TYPE;
	}

	@Override
	public int getSize() {
		return constraint.getSize();
	}

	@Override
	public String infoString() {
		return null;
	}

	@Override
	public boolean equivalent(Type otherType) {
		if (constraint == PrimitiveType.NO_TYPE) {
			setContraint(otherType);
			return true;
		}
		return constraint.equivalent(otherType);
	}

	@Override
	public void addTypeVariables(Set<TypeVariable> typeVariables) {
		typeVariables.add(this);
	}

	@Override
	public Type concreteType() {
		return constraint.concreteType();
	}
}
