package asmCodeGenerator;

import parseTree.ParseNode;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import asmCodeGenerator.ASMCodeGenerator.CodeVisitor;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class PrintStatementGenerator {
	ASMCodeFragment code;
	ASMCodeGenerator.CodeVisitor visitor;
	
	
	public PrintStatementGenerator(ASMCodeFragment code, CodeVisitor visitor) {
		super();
		this.code = code;
		this.visitor = visitor;
	}

	public void generate(PrintStatementNode node) {
		for(ParseNode child : node.getChildren()) {
			if(isPrintFormatNode(child)) {
				ASMCodeFragment childCode = visitor.removeVoidCode(child);
				code.append(childCode);
			}
			else {
				appendPrintCode(child);
			}
		}
	}

	private boolean isPrintFormatNode(ParseNode node) {
		return node instanceof NewlineNode || node instanceof SpaceNode || node instanceof HorizontalTabNode;
	}

	private void appendPrintCode(ParseNode node) {
		if (node.getType() instanceof Array) {
			printArray(node);
			return;
		}
		String format = printFormat(node.getType());

		code.append(visitor.removeValueCode(node));
		convertToStringIfBoolean(node);
		shiftAddressIfString(node);
		code.add(PushD, format);
		code.add(Printf);
	}
	private void convertToStringIfBoolean(ParseNode node) {
		if(node.getType() != PrimitiveType.BOOLEAN) {
			return;
		}
		
		Labeller labeller = new Labeller("print-boolean");
		String trueLabel = labeller.newLabel("true");
		String endLabel = labeller.newLabel("join");

		code.add(JumpTrue, trueLabel);
		code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
		code.add(Jump, endLabel);
		code.add(Label, trueLabel);
		code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
		code.add(Label, endLabel);
	}

	private void shiftAddressIfString(ParseNode node) {
		if(node.getType() != PrimitiveType.STRING) {
			return;
		}
		int bytesToShift = 12;
		code.add(PushI, bytesToShift);
		code.add(Add);
	}


	private String printFormat(Type type) {
		assert type instanceof PrimitiveType;

		switch((PrimitiveType)type) {
		case INTEGER:	return RunTime.INTEGER_PRINT_FORMAT;
		case FLOATING:	return RunTime.FLOATING_PRINT_FORMAT;
		case BOOLEAN:	return RunTime.BOOLEAN_PRINT_FORMAT;
		case CHARACTER: return RunTime.CHARACTER_PRINT_FORMAT;
		case STRING:	return RunTime.STRING_PRINT_FORMAT;
		default:		
			assert false : "Type " + type + " unimplemented in PrintStatementGenerator.printFormat()";
			return "";
		}
	}

	private void printArray(ParseNode node) {
		assert node instanceof ExpressionListNode;
		assert node.getType() instanceof Array;
		code.add(PushI, 91);
		code.add(PushD, RunTime.CHARACTER_PRINT_FORMAT);
		code.add(Printf);
		for(ParseNode child : ((ExpressionListNode) node).getElements()) {
			appendPrintCode(node);
			code.add(PushI, 44);
			code.add(PushD, RunTime.CHARACTER_PRINT_FORMAT);
			code.add(Printf);
		}
		code.add(PushI, 93);
		code.add(PushD, RunTime.CHARACTER_PRINT_FORMAT);
		code.add(Printf);
	}
}
