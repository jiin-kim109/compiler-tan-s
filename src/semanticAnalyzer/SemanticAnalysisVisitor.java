package semanticAnalyzer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

import lexicalAnalyzer.Keyword;
import logging.TanLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.signatures.PromotedSignature;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Binding.Constancy;
import symbolTable.Scope;
import tokens.Token;

class SemanticAnalysisVisitor extends ParseNodeVisitor.Default {
	@Override
	public void visitLeave(ParseNode node) {
		throw new RuntimeException("Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// constructs larger than statements
	@Override
	public void visitEnter(ProgramNode node) {
		enterProgramScope(node);
	}
	public void visitLeave(ProgramNode node) {
		leaveScope(node);
	}
	public void visitEnter(BlockNode node) { enterSubscope(node); }
	public void visitLeave(BlockNode node) { leaveScope(node); }
	
	
	///////////////////////////////////////////////////////////////////////////
	// helper methods for scoping.
	private void enterProgramScope(ParseNode node) {
		Scope scope = Scope.createProgramScope();
		node.setScope(scope);
	}	
	@SuppressWarnings("unused")
	private void enterSubscope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createSubscope();
		node.setScope(scope);
	}

	private void leaveScope(ParseNode node) {
		node.getScope().leave();
	}
	
	///////////////////////////////////////////////////////////////////////////
	// statements and declarations
	@Override
	public void visitLeave(PrintStatementNode node) {
	}
	@Override
	public void visitLeave(DeclarationNode node) {
		if(node.child(0) instanceof ErrorNode) {
			node.setType(PrimitiveType.ERROR);
			return;
		}
		
		IdentifierNode identifier = (IdentifierNode) node.child(0);
		ParseNode initializer = node.child(1);
		
		Type declarationType = initializer.getType();
		node.setType(declarationType);
		
		identifier.setType(declarationType);
		Constancy constancy = (node.getToken().isLextant(Keyword.CONST)) ?
				Constancy.IS_CONSTANT :
				Constancy.IS_VARIABLE;
		addBinding(identifier, declarationType, constancy);
	}

	@Override
	public void visitLeave(AssignmentStatementNode node) {
		if(node.child(0) instanceof ErrorNode) {
			node.setType(PrimitiveType.ERROR);
			return;
		}

		IdentifierNode identifier = (IdentifierNode) node.child(0);
		ParseNode expression = node.child(1);

		Type expressionType = expression.getType();
		Type identifierType = identifier.getType();

		// Implement equivalent instead for milestone 2
		if (!expressionType.equals(identifierType)) {
			semanticError("types don't match in assignment statement");
			return;
		}
		if (identifier.getBinding().isConstant()) {
			semanticError("reassignment to const identifier");
			return;
		}
		node.setType(identifierType);
	}

	///////////////////////////////////////////////////////////////////////////
	// expressions
	@Override
	public void visitLeave(OperatorNode node) {
		List<Type> childTypes;  
		if(node.nChildren() == 1) {
			ParseNode child = node.child(0);
			childTypes = Arrays.asList(child.getType());
		}
		else {
			assert node.nChildren() == 2;
			ParseNode left  = node.child(0);
			ParseNode right = node.child(1);
			
			childTypes = Arrays.asList(left.getType(), right.getType());
		}

		PromotedSignature signature = selectPromotedSignature(node, childTypes);

		if(signature.accepts(childTypes)) {
			node.setType(signature.resultType().concreteType());
			node.setSignature(signature);
		}
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}

	private PromotedSignature selectPromotedSignature(OperatorNode node, List<Type> childTypes) {
		final int MAX_NUM_PROMOTION = 2;
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(node.getOperator());
		List<PromotedSignature> promotedSignatures = PromotedSignature.promotedSignatures(signatures, childTypes);
		List<List<PromotedSignature>> byNumPromotions = Arrays.asList(new ArrayList<>(), new ArrayList<>(), new ArrayList<>());
		for (PromotedSignature promotedSignature : promotedSignatures) {
			byNumPromotions.get(promotedSignature.numPromotions()).add(promotedSignature);
		}

		for (int i=0; i<MAX_NUM_PROMOTION; i++) {
			switch (byNumPromotions.get(i).size()) {
				case 0: break;
				case 1: return byNumPromotions.get(i).get(0);
				default:
				case 2: multipleInterpretationsError();
						return PromotedSignature.nullInstance();
			}
		}
		typeCheckError(node, childTypes);
		return PromotedSignature.nullInstance();
	}

	@Override
	public void visitLeave(ExpressionListNode node) {
		if (node.hasDefinedType()) { // has type defined
			ParseNode type = node.getTypeNode();
			assert (type instanceof TypeNode);
			node.setType(type.getType());
		}
		else if (node.containPrimitive() && node.containNonPrimitive()) { // not valid
			typeCheckError(node, node.childTypes());
			return;
		}
		else {
			if (node.containNonPrimitive()) { // if non-primitive element, all the elements should have the same type
				if (!node.checkChildrenHaveTheSameType()) {
					typeCheckError(node, node.childTypes());
					return;
				}
				node.setType(node.first().getType());
			}
			else { // promote primitive to the nearest
				node.promoteTo(Promotion.CHAR_TO_INT);
				node.setType(new Array(PrimitiveType.INTEGER));
				if (!node.checkChildrenHaveTheSameType()) {
					node.promoteTo(Promotion.INT_TO_FLOAT);
					node.setType(new Array(PrimitiveType.FLOATING));
				}
			}
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// simple leaf nodes
	@Override
	public void visit(BooleanConstantNode node) {
		node.setType(PrimitiveType.BOOLEAN);
	}
	@Override
	public void visit(ErrorNode node) {
		node.setType(PrimitiveType.ERROR);
	}
	@Override
	public void visit(IntegerConstantNode node) {
		node.setType(PrimitiveType.INTEGER);
	}
	@Override
	public void visit(FloatingConstantNode node) {
		node.setType(PrimitiveType.FLOATING);
	}
	@Override
	public void visit(CharacterConstantNode node) { node.setType(PrimitiveType.CHARACTER); }
	@Override
	public void visit(StringConstantNode node) { node.setType(PrimitiveType.STRING); }
	@Override
	public void visit(TypeNode node) {
		node.setType(node.getType());
	}
	@Override
	public void visit(NewlineNode node) {
	}
	@Override
	public void visit(SpaceNode node) {
	}

	@Override
	public void visit(HorizontalTabNode node) {
	}

	///////////////////////////////////////////////////////////////////////////
	// IdentifierNodes, with helper methods
	@Override
	public void visit(IdentifierNode node) {
		if(!isBeingDeclared(node)) {		
			Binding binding = node.findVariableBinding();
			
			node.setType(binding.getType());
			node.setBinding(binding);
		}
		// else parent DeclarationNode does the processing.
	}

	@Override
	public void visit(ArrayIndexNode node) {
		ParseNode identifier = node.identifier();
		assert identifier.getType() instanceof Array;
		node.setType(((Array) identifier.getType()).getSubType());
	}

	private boolean isBeingDeclared(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof DeclarationNode) && (node == parent.child(0));
	}
	private void addBinding(IdentifierNode identifierNode, Type type, Constancy constancy) {
		Scope scope = identifierNode.getLocalScope();
		Binding binding = scope.createBinding(identifierNode, type, constancy);
		identifierNode.setBinding(binding);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// error logging/printing

	private void multipleInterpretationsError() {
		logError("Multiple interpretations of operator possible");
	}

	private void typeCheckError(ParseNode node, List<Type> operandTypes) {
		Token token = node.getToken();
		logError("operator " + token.getLexeme() + " not defined for types " 
				 + operandTypes  + " at " + token.getLocation());	
	}

	private void typeCheckError(ParseNode node) {
		Token token = node.getToken();
		logError("type " + token.getLexeme() + " does not match with children " + " at " + token.getLocation());
	}

	private void semanticError(String errorMessage) {
		TanLogger log = TanLogger.getLogger("compiler.semanticAnalyzer");
		log.severe("Semantic Error: " + errorMessage);
	}

	private void logError(String message) {
		TanLogger log = TanLogger.getLogger("compiler.semanticAnalyzer");
		log.severe(message);
	}
}