package semanticAnalyzer.signatures;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import static semanticAnalyzer.types.PrimitiveType.*;

public enum Promotion {
    CHAR_TO_INT(CHARACTER, INTEGER, ASMOpcode.Nop),
    CHAR_TO_FLOAT(CHARACTER, FLOATING, ASMOpcode.ConvertF),
    INT_TO_FLOAT(INTEGER, FLOATING, ASMOpcode.ConvertF),
    NONE(NO_TYPE, NO_TYPE, ASMOpcode.Nop) {
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
    private ASMOpcode opcode;

    Promotion(PrimitiveType fromType, PrimitiveType toType, ASMOpcode opcode) {
        this.fromType = fromType;
        this.toType = toType;
        this.opcode = opcode;
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

    public ASMCodeFragment codeFor() {
        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        result.add(opcode);
        return result;
    }
}
