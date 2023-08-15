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

public class AndCodeGenerator extends ComparisonCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);

        Labeller labeller = new Labeller("and");
        String trueLabel  = labeller.newLabel("true");
        String falseLabel  = labeller.newLabel("false");
        String joinLabel = labeller.newLabel("join");

        for (ASMCodeFragment arg : args) {
            result.append(arg);
            result.add(JumpFalse, falseLabel);
        }
        result.add(Jump, trueLabel);
        result.add(Label, falseLabel);
        result.add(PushI, 0);
        result.add(Jump, joinLabel);
        result.add(Label, trueLabel);
        result.add(PushI, 1);
        result.add(Label, joinLabel);
        return result;
    }
}
