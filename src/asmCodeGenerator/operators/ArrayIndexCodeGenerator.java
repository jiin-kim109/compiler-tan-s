package asmCodeGenerator.operators;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import parseTree.ParseNode;
import symbolTable.Binding;

import java.util.List;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_ADDRESS;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ArrayIndexCodeGenerator implements SimpleCodeGenerator {
    @Override
    public ASMCodeFragment generate(ParseNode node, List<ASMCodeFragment> args) {
        ASMCodeFragment result = new ASMCodeFragment(GENERATES_ADDRESS);
        for (ASMCodeFragment arg : args) {
            result.append(arg);
        }
        result.add(PushI, node.getType().getSize());
        result.add(Multiply);
        result.add(Add);
        return result;
    }
}
