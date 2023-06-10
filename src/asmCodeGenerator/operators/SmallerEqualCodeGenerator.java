package asmCodeGenerator.operators;

import asmCodeGenerator.Labeller;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

import java.util.List;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class SmallerEqualCodeGenerator extends ComparisonCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        for (ASMCodeFragment arg : args) {
            result.append(arg);
        }
        Labeller labeller = new Labeller("compare");
        String trueLabel  = labeller.newLabel("true");
        String falseLabel = labeller.newLabel("false");
        String joinLabel  = labeller.newLabel("join");

        Type operandType = operandType(node);
        if (operandType == PrimitiveType.INTEGER || operandType == PrimitiveType.CHARACTER) {
            result.add(ASMOpcode.Subtract);
            result.add(ASMOpcode.JumpPos, falseLabel);
            result.add(ASMOpcode.Jump, trueLabel);
        }
        else if (operandType == PrimitiveType.FLOATING) {
            result.add(ASMOpcode.FSubtract);
            result.add(ASMOpcode.JumpFPos, falseLabel);
            result.add(ASMOpcode.Jump, trueLabel);
        }
        else {
            result.add(ASMOpcode.Jump, RunTime.BAD_COMPARISON_OPERAND_RUNTIME_ERROR);
        }

        result.add(Label, trueLabel);
        result.add(PushI, 1);
        result.add(Jump, joinLabel);
        result.add(Label, falseLabel);
        result.add(PushI, 0);
        result.add(Jump, joinLabel);
        result.add(Label, joinLabel);
        return result;
    }
}
