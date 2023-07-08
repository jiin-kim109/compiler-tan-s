package asmCodeGenerator;

import asmCodeGenerator.codeStorage.ASMOpcode;
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

	private static int arrayAddressCounter = 0;

	public static String createArrayAddress() { return "printArrayAddress" + arrayAddressCounter++; }
	
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
		convertToStringIfBoolean(node.getType());
	}
	private void convertToStringIfBoolean(Type type) {
		if (type != PrimitiveType.BOOLEAN) {
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
		shiftAddressIfString(node.getType());
	}
	private void shiftAddressIfString(Type type) {
		if (type != PrimitiveType.STRING) {
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
		assert node.getType() instanceof Array;
		Type arraySubType = ((Array) node.getType()).getSubType();

		code.append(visitor.removeValueCode(node));
		printArrayRecursive(arraySubType);
	}

	private void printArrayRecursive(Type arraySubType) {
		/*
		Expects address at the top of the stack [addr]
		*/
		code.add(PushI, 91);
		code.add(PushD, printFormat(PrimitiveType.CHARACTER));
		code.add(Printf);

		String arrayPointerAddressLabel = createArrayAddress();

		Labeller labeller = new Labeller("arrayPrintLoop");
		String arrayPrintLoopStart  = labeller.newLabel("arrayPrintLoopStart" + arrayPointerAddressLabel);
		String arrayPrintLoopEnd  = labeller.newLabel("arrayPrintLoopEnd" + arrayPointerAddressLabel);
		String arrayPrintNoComma  = labeller.newLabel("arrayPrintLoopNoComma" + arrayPointerAddressLabel);

		// save address to temporary memory
		code.add(DLabel, arrayPointerAddressLabel);
		code.add(DataZ, 4);
		code.add(PushD, arrayPointerAddressLabel);
		code.add(Exchange);
		code.add(StoreI); // save address to label

		code.add(PushD, arrayPointerAddressLabel);
		code.add(LoadI); // -> [addr]

		// array length
		code.add(PushI, 12);
		code.add(Add);
		code.add(LoadI); // -> [length]

		// index counter
		code.add(PushI, 0);
		code.add(Exchange); // -> [index, length]

		// loop start
		code.add(Label, arrayPrintLoopStart); // -> [index, length]
		code.add(Duplicate);
		code.add(JumpFalse, arrayPrintLoopEnd); // jump to end if length falls to zero
		// ========= Comma =========
		code.add(Exchange); // -> [length, index]
		code.add(Duplicate);
		code.add(JumpFalse, arrayPrintNoComma);
		code.add(PushI, 44);
		code.add(PushD, printFormat(PrimitiveType.CHARACTER));
		code.add(Printf);
		code.add(Label, arrayPrintNoComma);
		code.add(Exchange); // -> [index, length]
		// =========       =========
		code.add(PushI, 1);
		code.add(Subtract); // -1 to length, [index, length]
		code.add(Exchange); // -> [length, index]
		code.add(Duplicate); // -> [length, index, index]
		code.add(PushI, arraySubType.getSize());
		code.add(Multiply); // -> [length, index, index * typeSize]

		code.add(PushD, arrayPointerAddressLabel);
		code.add(LoadI); // -> [length, index, index * typeSize, addr]
		code.add(Add); // -> [length, index, addr + index * typeSize]
		code.add(PushI, 16);
		code.add(Add); // -> [length, index, addr + index * typeSize + 16]

		if (arraySubType instanceof Array) {
			code.add(LoadI);
			printArrayRecursive(((Array) arraySubType).getSubType()); // -> [length, index, a[i]]
		}
		else {
			code.add(visitor.opcodeForAddress(arraySubType)); // load element, -> [length, index, element]
			convertToStringIfBoolean(arraySubType);
			shiftAddressIfString(arraySubType);
			code.add(PushD, printFormat(arraySubType)); // load element, -> [length, index, element, prtfmt]
			code.add(Printf); // -> [length, index]
		}
		code.add(PushI, 1);
		code.add(Add); // -> [length, index+1]
		code.add(Exchange); // -> [index, length]
		code.add(Jump, arrayPrintLoopStart);

		// loop end
		code.add(Label, arrayPrintLoopEnd);
		code.add(Pop); // pop array length
		code.add(Pop); // pop index

		code.add(PushI, 93);
		code.add(PushD, printFormat(PrimitiveType.CHARACTER));
		code.add(Printf);
	}
}
