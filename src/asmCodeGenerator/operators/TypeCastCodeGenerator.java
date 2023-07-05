package asmCodeGenerator.operators;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import parseTree.ParseNode;
import parseTree.nodeTypes.TypeNode;
import semanticAnalyzer.types.PrimitiveType;

import java.util.List;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class TypeCastCodeGenerator extends ComparisonCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        assert(node.child(0) instanceof TypeNode);
        assert(((TypeNode) node.child(0)).primitiveType() != PrimitiveType.NO_TYPE);

        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        for (ASMCodeFragment arg : args) {
            result.append(arg);
        }

        result.add(Exchange);
        result.add(Pop);

        if (node.getType() == PrimitiveType.FLOATING && node.child(1).getType() != PrimitiveType.FLOATING) {
            result.add(ConvertF);
        }
        else if (node.getType() == PrimitiveType.INTEGER) {
            if (node.child(1).getType() == PrimitiveType.FLOATING)
                result.add(ConvertI);
        }
        else if (node.getType() == PrimitiveType.BOOLEAN) {
            Labeller labeller = new Labeller("compare");
            String trueLabel  = labeller.newLabel("true");
            String falseLabel = labeller.newLabel("false");
            String joinLabel  = labeller.newLabel("join");
            result.add(ASMOpcode.JumpPos, trueLabel);
            result.add(ASMOpcode.Jump, falseLabel);

            result.add(Label, trueLabel);
            result.add(PushI, 1);
            result.add(Jump, joinLabel);
            result.add(Label, falseLabel);
            result.add(PushI, 0);
            result.add(Jump, joinLabel);
            result.add(Label, joinLabel);
        }
        else if (node.getType() == PrimitiveType.CHARACTER) {
        }

        return result;
    }
}
