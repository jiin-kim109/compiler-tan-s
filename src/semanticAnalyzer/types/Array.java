package semanticAnalyzer.types;

import java.util.Set;

public class Array implements Type{

    private Type subtype;

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public String infoString() {
        return null;
    }

    @Override
    public boolean equivalent(Type otherType) {
        return false;
    }

    @Override
    public void addTypeVariables(Set<TypeVariable> typeVariables) {
        // passes argument to subtype
    }

    @Override
    public Type concreteType() {
        return null;
    }
}
