package asmCodeGenerator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.operators.SimpleCodeGenerator;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.PromotedSignature;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
	ParseNode root;

	public static ASMCodeFragment generate(ParseNode syntaxTree) {
		ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
		return codeGenerator.makeASM();
	}
	public ASMCodeGenerator(ParseNode root) {
		super();
		this.root = root;
	}
	
	public ASMCodeFragment makeASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

		code.append( MemoryManager.codeForInitialization() );
		code.append( RunTime.getEnvironment() );
		code.append( globalVariableBlockASM() );
		code.append( programASM() );
		code.append( MemoryManager.codeForAfterApplication() );
		
		return code;
	}
	private ASMCodeFragment globalVariableBlockASM() {
		assert root.hasScope();
		Scope scope = root.getScope();
		int globalBlockSize = scope.getAllocatedSize();
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
		code.add(DataZ, globalBlockSize);
		return code;
	}
	private ASMCodeFragment programASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		
		code.add(    Label, RunTime.MAIN_PROGRAM_LABEL);
		code.append( programCode());
		code.add(    Halt );
		
		return code;
	}
	private ASMCodeFragment programCode() {
		CodeVisitor visitor = new CodeVisitor();
		root.accept(visitor);
		return visitor.removeRootCode(root);
	}


	protected class CodeVisitor extends ParseNodeVisitor.Default {
		private Map<ParseNode, ASMCodeFragment> codeMap;
		ASMCodeFragment code;
		
		public CodeVisitor() {
			codeMap = new HashMap<ParseNode, ASMCodeFragment>();
		}


		////////////////////////////////////////////////////////////////////
        // Make the field "code" refer to a new fragment of different sorts.
		private void newAddressCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_ADDRESS);
			codeMap.put(node, code);
		}
		private void newValueCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VALUE);
			codeMap.put(node, code);
		}
		private void newVoidCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VOID);
			codeMap.put(node, code);
		}

	    ////////////////////////////////////////////////////////////////////
        // Get code from the map.
		private ASMCodeFragment getAndRemoveCode(ParseNode node) {
			ASMCodeFragment result = codeMap.get(node);
			codeMap.remove(node);
			return result;
		}
	    public  ASMCodeFragment removeRootCode(ParseNode tree) {
			return getAndRemoveCode(tree);
		}		
		public ASMCodeFragment removeValueCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			makeFragmentValueCode(frag, node);
			return frag;
		}		
		public ASMCodeFragment removeAddressCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isAddress();
			return frag;
		}		
		public ASMCodeFragment removeVoidCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isVoid();
			return frag;
		}

		public void turnAddressIntoValue(ASMCodeFragment code, ParseNode node) {
			if(node.getType() == PrimitiveType.INTEGER) {
				code.add(LoadI);
			}
			else if(node.getType() == PrimitiveType.FLOATING) {
				code.add(LoadF);
			}
			else if(node.getType() == PrimitiveType.BOOLEAN) {
				code.add(LoadC);
			}
			else if(node.getType() == PrimitiveType.CHARACTER) {
				code.add(LoadC);
			}
			else if(node.getType() == PrimitiveType.STRING) {
				code.add(LoadI);
			}
			else if(node.getType() instanceof Array) {
				code.add(LoadI);
			}
			else {
				assert false : "node " + node;
			}
			code.markAsValue();
		}

		public ASMOpcode opcodeForAddress(Type type) {
			if(type == PrimitiveType.INTEGER) {
				return LoadI;
			}
			else if(type == PrimitiveType.FLOATING) {
				return LoadF;
			}
			else if(type == PrimitiveType.BOOLEAN) {
				return LoadC;
			}
			else if(type == PrimitiveType.CHARACTER) {
				return LoadC;
			}
			else if(type == PrimitiveType.STRING) {
				return LoadI;
			}
			else {
				assert false : "type " + type;
			}
			return null;
		}
		
	    ////////////////////////////////////////////////////////////////////
        // convert code to value-generating code.
		private void makeFragmentValueCode(ASMCodeFragment code, ParseNode node) {
			assert !code.isVoid();
			
			if(code.isAddress()) {
				turnAddressIntoValue(code, node);
			}	
		}
		
	    ////////////////////////////////////////////////////////////////////
        // ensures all types of ParseNode in given AST have at least a visitLeave	
		public void visitLeave(ParseNode node) {
			assert false : "node " + node + " not handled in ASMCodeGenerator";
		}
		
		
		
		///////////////////////////////////////////////////////////////////////////
		// constructs larger than statements
		public void visitLeave(ProgramNode node) {
			newVoidCode(node);
			for(ParseNode child : node.getChildren()) {
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
			}
		}
		public void visitLeave(BlockNode node) {
			newVoidCode(node);
			for(ParseNode child : node.getChildren()) {
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
			}
		}

		///////////////////////////////////////////////////////////////////////////
		// statements and declarations

		public void visitLeave(PrintStatementNode node) {
			newVoidCode(node);
			new PrintStatementGenerator(code, this).generate(node);	
		}
		public void visit(NewlineNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.NEWLINE_PRINT_FORMAT);
			code.add(Printf);
		}
		public void visit(SpaceNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
			code.add(Printf);
		}
		public void visit(HorizontalTabNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.HORIZONTAL_TAB_PRINT_FORMAT);
			code.add(Printf);
		}

		public void visitLeave(DeclarationNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));

			code.append(lvalue);
			code.append(rvalue);
			
			Type type = node.getType();
			code.add(opcodeForStore(type));
		}
		public void visitLeave(AssignmentStatementNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));
			ASMCodeFragment rvalue = removeValueCode(node.child(1));

			code.append(lvalue);
			code.append(rvalue);

			Type type = node.getType();
			code.add(opcodeForStore(type));
		}

		private ASMOpcode opcodeForStore(Type type) {
			if(type == PrimitiveType.INTEGER) {
				return StoreI;
			}
			if(type == PrimitiveType.FLOATING) {
				return StoreF;
			}
			if(type == PrimitiveType.CHARACTER) {
				return StoreC;
			}
			if(type == PrimitiveType.STRING) {
				return StoreI;
			}
			if(type == PrimitiveType.BOOLEAN) {
				return StoreC;
			}
			if(type instanceof Array) {
				return StoreI;
			}
			assert false: "Type " + type + " unimplemented in opcodeForStore()";
			return null;
		}


		///////////////////////////////////////////////////////////////////////////
		// expressions
		public void visitLeave(ExpressionListNode node) {
			code.add(PushI, 12);
			code.add(PushI, 0);
			code.add(StoreI);

			newValueCode(node);
			assert node.getType() instanceof Array;
			Type arraySubType = ((Array) node.getType()).getSubType();

			code.add(PushI, 16); // 4 * 4 header blocks
			String arrayLengthLabel = "arrayLength" + ExpressionListNode.addressCounter();
			code.add(DLabel, arrayLengthLabel);
			code.add(DataZ, 4);
			if (node.getListSize() >= 0) { // Array length
				code.add(PushI, node.getListSize());
				code.add(Duplicate);
				code.add(PushD, arrayLengthLabel);
				code.add(Exchange);
				code.add(StoreI);
				code.add(PushI, arraySubType.getSize());
				code.add(Multiply);
			}
			else {
				code.append(removeValueCode(node.getSizeNode()));
				code.add(Duplicate);
				code.add(PushD, arrayLengthLabel);
				code.add(Exchange);
				code.add(StoreI);
				code.add(PushI, arraySubType.getSize());
				code.add(Multiply);
			}
			code.add(Add);
			code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
			String arrayAddressLabel = "arrayAddressLabel" + ExpressionListNode.addressCounter();
			code.add(DLabel, arrayAddressLabel);
			code.add(DataZ, 4);
			code.add(Duplicate);
			code.add(PushD, arrayAddressLabel);
			code.add(Exchange);
			code.add(StoreI);

			code.add(Duplicate); // [header1]: Type Identifier
			code.add(PushI, 0);
			code.add(Add);
			code.add(PushI, 5);
			code.add(StoreI);

			code.add(Duplicate); // [header2]: Array Status
			code.add(PushI, 4);
			code.add(Add);
			if (arraySubType instanceof PrimitiveType && arraySubType != PrimitiveType.STRING) {
				code.add(PushI, 0);
				code.add(StoreI);
			}
			else {
				code.add(PushI, 2);
				code.add(StoreI);
			}

			code.add(Duplicate); // [header3]: Subtype Size
			code.add(PushI, 8);
			code.add(Add);
			code.add(PushI, arraySubType.getSize());
			code.add(StoreI); // Subtype Size

			code.add(Duplicate); // [header4]: Array length
			code.add(PushI, 12);
			code.add(Add);
			code.add(PushD, arrayLengthLabel);
			code.add(LoadI);
			code.add(StoreI);

			code.add(PushD, arrayLengthLabel); // set default values
			code.add(LoadI);
			Labeller labeller = new Labeller("arrayDefaultValue" + ExpressionListNode.addressCounter());
			String defaultValueLoopStart  = labeller.newLabel("loopStart");
			String defaultValueLoopEnd  = labeller.newLabel("loopEnd");
			code.add(Label, defaultValueLoopStart);
			code.add(Duplicate);
			code.add(JumpFalse, defaultValueLoopEnd);
			code.add(PushI, 1);
			code.add(Subtract);
			code.add(Duplicate);
			code.add(PushI, arraySubType.getSize());
			code.add(Multiply);
			code.add(PushI, 16);
			code.add(Add);
			code.add(PushD, arrayAddressLabel);
			code.add(LoadI);
			code.add(Add);
			code.add(PushI, 0);
			code.add(StoreI);
			code.add(Jump, defaultValueLoopStart);
			code.add(Label, defaultValueLoopEnd);
			code.add(Pop);

			int index = 0;
			for (ParseNode element : node.getElements()) { // Array elements
				code.add(Duplicate); // [Element]
				code.add(PushI, 16 + index * arraySubType.getSize());
				code.add(Add);
				code.append(removeValueCode(element));
				if (node.numPromotions() > index) {
					code.append(node.promotion(index).codeFor());
				}
				code.add(opcodeForStore(arraySubType));
				index += 1;
			}
		}

		public void visitLeave(OperatorNode node) {
			Lextant operator = node.getOperator();
			PromotedSignature signature = node.getSignature();
			Object variant = signature.getVariant();

			if (variant instanceof ASMOpcode) {
				Labeller labeller = new Labeller("Operator");
				String startLabel = labeller.newLabel("args");
				String opLabel = labeller.newLabel("op");

				newValueCode(node);
				code.add(Label, startLabel);
				int i=0;
				for (ParseNode child: node.getChildren()) {
					code.append(removeValueCode(child));
					code.append(signature.promotion(i).codeFor());
					i += 1;
				}
				code.add((ASMOpcode)variant);
			}
			else if (variant instanceof SimpleCodeGenerator) {
				SimpleCodeGenerator generator = (SimpleCodeGenerator)variant;
				ASMCodeFragment fragment = generator.generate(node, childValueCode(node));
				codeMap.put(node, fragment);
			}
		}

		private List<ASMCodeFragment> childValueCode(OperatorNode node) {
			List<ASMCodeFragment> result = new ArrayList<>();
			for (int i=0; i<node.getChildren().size(); i++) {
				ParseNode child = node.getChildren().get(i);
				ASMCodeFragment code = removeValueCode(child);
				code.append(node.getSignature().promotion(i).codeFor());
				result.add(code);
			}
			return result;
		}

		public void visitLeave(ArrayIndexNode node) {
			newAddressCode(node);

			ParseNode identifier = node.identifier();
			ParseNode index = node.index();

			ASMCodeFragment arrayAddress = removeValueCode(identifier); // value of identifier = array address
			ASMCodeFragment indexValue = removeValueCode(index);

			String indexLabel = "arrayIndex" + ArrayIndexNode.addressCounter();
			code.add(DLabel, indexLabel);
			code.add(DataZ, 4);
			code.add(PushD, indexLabel);
			code.append(indexValue); // [addr, length, index]
			code.add(StoreI);

			code.append(arrayAddress);
			code.add(Duplicate); // [addr, addr]
			code.add(PushI, 12);
			code.add(Add);
			code.add(LoadI); // [addr, length]
			code.add(PushD, indexLabel);
			code.add(LoadI); // [addr, length, index]
			code.add(Duplicate);
			code.add(JumpNeg, RunTime.INDEX_OUT_OF_BOUND_ERROR);
			code.add(Subtract);
			code.add(Duplicate);
			code.add(JumpNeg, RunTime.INDEX_OUT_OF_BOUND_ERROR);
			code.add(JumpFalse, RunTime.INDEX_OUT_OF_BOUND_ERROR);
			code.add(Duplicate);

			code.add(PushI, 8);
			code.add(Add);
			code.add(LoadI); // [addr, typeSize]

			code.add(PushD, indexLabel);
			code.add(LoadI); // [addr, typeSize, index]
			code.add(Multiply); // [addr, index*typeSize]
			code.add(Add); // [addr + index*typeSize]
			code.add(PushI, 16); // [addr + 16 + index*typeSize]
			code.add(Add);
		}

		private ASMOpcode opcodeForOperator(Lextant lextant) {
			assert(lextant instanceof Punctuator);
			Punctuator punctuator = (Punctuator)lextant;
			switch(punctuator) {
			case ADD: 	   		return Add;				// type-dependent!
			case SUBTRACT:		return Negate;			// (unary subtract only) type-dependent!
			case MULTIPLY: 		return Multiply;		// type-dependent!
			default:
				assert false : "unimplemented operator in opcodeForOperator";
			}
			return null;
		}

		///////////////////////////////////////////////////////////////////////////
		// leaf nodes (ErrorNode not necessary)
		public void visit(BooleanConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue() ? 1 : 0);
		}
		public void visit(IdentifierNode node) {
			newAddressCode(node);
			Binding binding = node.getBinding();
			
			binding.generateAddress(code);
		}		
		public void visit(IntegerConstantNode node) {
			newValueCode(node);

			code.add(PushI, node.getValue());
		}

		public void visit(CharacterConstantNode node) {
			newValueCode(node);

			code.add(PushI, node.getValue());
		}

		public void visit(StringConstantNode node) {
			newValueCode(node);
			String address = StringConstantNode.addressCounter();

			code.add(DLabel, address);
			code.add(DataI, 3);
			code.add(DataI, 9);
			code.add(DataI, node.getValue().length());
			node.getValue().chars().forEach(ch -> code.add(DataC, ch));
			code.add(DataC, 0);

			code.add(PushD, address);
		}

		public void visit(FloatingConstantNode node) {
			newValueCode(node);

			code.add(PushF, node.getValue());
		}

		public void visit(TypeNode node) {
			newValueCode(node);

			code.add(PushI, 0);
		}
	}

}
