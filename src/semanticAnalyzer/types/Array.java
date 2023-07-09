package semanticAnalyzer.types;

import java.util.Set;

public class Array implements Type{

    private Type subType;

    public Array(Type subType) {
        this.subType = subType;
    }

    public void setSubType(Type type) {
        subType = type;
    }

    @Override
    public int getSize() {
        return PrimitiveType.INTEGER.getSize();
    }

    @Override
    public String infoString() {
        return "ARRAY[" + subType.infoString() + "]";
    }

    @Override
    public boolean equivalent(Type otherType) {
        if (otherType instanceof Array) {
            return getSubType().concreteType().equivalent(((Array) otherType).getSubType());
        }
        else if (otherType instanceof TypeVariable) {
            return getSubType().concreteType().equivalent(otherType.concreteType());
        }
        return false;
    }

    @Override
    public Type concreteType() {
        return this;
    }

    public Type getSubType() {
        return subType;
    }
}
