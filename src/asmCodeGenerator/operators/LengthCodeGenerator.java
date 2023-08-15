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

public class LengthCodeGenerator extends ComparisonCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        ASMCodeFragment result = new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
        for (ASMCodeFragment arg : args) {
            result.append(arg);
        }
        result.add(PushI, 12);
        result.add(Add);
        result.add(LoadI);
        return result;
    }
}
