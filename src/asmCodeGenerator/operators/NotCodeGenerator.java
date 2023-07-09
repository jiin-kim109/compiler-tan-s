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

public class NotCodeGenerator extends ComparisonCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        for (ASMCodeFragment arg : args) {
            result.append(arg);
        }
        Labeller labeller = new Labeller("not");
        String addOne = labeller.newLabel("false");
        String joinLabel  = labeller.newLabel("join");

        result.add(Duplicate);
        result.add(JumpFalse, addOne);
        result.add(PushI, -1);
        result.add(Add);
        result.add(Jump, joinLabel);

        result.add(Label, addOne);
        result.add(PushI, 1);
        result.add(Add);
        result.add(Jump, joinLabel);

        result.add(Label, joinLabel);
        return result;
    }
}
