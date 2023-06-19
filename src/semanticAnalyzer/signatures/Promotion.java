package semanticAnalyzer.types;

import static semanticAnalyzer.types.PrimitiveType.*;

public enum Promotion {
    CHAR_TO_INT(CHARACTER, INTEGER),
    CHAR_TO_FLOAT(CHARACTER, FLOATING),
    INT_TO_FLOAT(INTEGER, FLOATING),
    NONE(NO_TYPE, NO_TYPE) {
        public boolean appliesTo(Type type) {
            return true;
        }
        public Type apply(Type type) {
            return type;
        }
        boolean isNull() {
            return true;
        }
    },
    ;

    private Type fromType;
    private Type toType;

    Promotion(PrimitiveType fromType, PrimitiveType toType) {
        this.fromType = fromType;
        this.toType = toType;
    }

    public boolean appliesTo(Type type) {
        return fromType == type;
    }

    public Type apply(Type type) {
        assert (appliesTo(type));
        return toType;
    }

    boolean isNull() {
        return false;
    }
}
