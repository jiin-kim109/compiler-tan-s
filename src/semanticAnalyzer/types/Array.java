package semanticAnalyzer.types;

import java.util.Set;

public class Array implements Type{

    private Type subType;

    public Array(Type subType) {
        this.subType = subType;
    }

    @Override
    public int getSize() {
        return PrimitiveType.INTEGER.getSize();
    }

    @Override
    public String infoString() {
        return null;
    }

    @Override
    public boolean equivalent(Type otherType) {
        if (otherType.concreteType() instanceof Array) {
            return getSubType().concreteType().equivalent(((Array) otherType.concreteType()).subType);
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
