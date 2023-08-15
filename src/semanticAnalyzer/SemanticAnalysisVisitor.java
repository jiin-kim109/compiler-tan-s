package semanticAnalyzer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

import asmCodeGenerator.operators.LengthCodeGenerator;
import asmCodeGenerator.operators.TypeCastCodeGenerator;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Punctuator;
import logging.TanLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.FunctionSignature;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.signatures.PromotedSignature;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;
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
	public void visitEnter(ProgramNode node) {}
	public void visitLeave(ProgramNode node) {
		leaveScope(node);
	}

	///////////////////////////////////////////////////////////////////////////
	// Subroutine Code
	public void visitEnter(SubroutineNode node) {
		enterSubroutine(node);
	}
	public void visitLeave(SubroutineNode node) {
		leaveScope(node);
	}

	public void visitEnter(ParameterDefinitionNode node) {
		Scope subroutineScope = node.getLocalScope();

		// Move SP down about the total size of parameters
		List<ParameterNode> parameters = node.parameters();
		for (ParameterNode parameter : parameters) {
			IdentifierNode identifier = parameter.identifier();
			TypeNode type = parameter.paramType();

			Binding binding = subroutineScope.createBinding(identifier, type.getType(), Constancy.IS_VARIABLE);
			identifier.setBinding(binding);
		}
		// Move SP down 4 bytes for FP direct link and 4 bytes for return address
		subroutineScope.allocateEmpty(4 + 4);
	}
	public void visitLeave(ParameterDefinitionNode node) {
		/*
		List<Type> parameterTypes = node.parameterTypes();
		Scope subroutineScope = node.getLocalScope();

		// Move SP up about the total size of parameters
		parameterTypes.forEach(ty -> subroutineScope.allocateEmpty(-ty.getSize()));
		// Move SP up 4 bytes for FP direct link and 4 bytes for return address
		subroutineScope.allocateEmpty(-(4 + 4));
		 */
	}

	public void visitEnter(ParameterNode node) {}
	public void visitLeave(ParameterNode node) {}

	///////////////////////////////////////////////////////////////////////////

	public void visitEnter(ReturnStatementNode node) {}
	public void visitLeave(ReturnStatementNode node) {
		ParseNode returnExpression = node.child(0);
		Type returnType = returnExpression.getType();
		node.setType(returnType);

		ParseNode subroutine = node.getParent();
		while (!(subroutine instanceof SubroutineNode)) {
			if (subroutine == ParseNode.NO_PARENT) {
				semanticError("return statement must be placed within a function");
				return;
			}
			subroutine = subroutine.getParent();
		}
		if (!returnType.equivalent(subroutine.getType())) {
			for (Promotion promotion : Promotion.values()) {
				if (promotion.appliesTo(returnType) && promotion.apply(returnType).equivalent(subroutine.getType())) {
					node.setPromotion(promotion);
					return;
				}
			}
			semanticError("return type does not match with the function definition");
		}
	}

	public void visitEnter(CallStatementNode node) {}
	public void visitLeave(CallStatementNode node) {}

	public void visitEnter(FunctionInvocationNode node) {
		ParseNode parent = node.getParent();
		while (!(parent instanceof SubroutineNode)) {
			if (parent == ParseNode.NO_PARENT) {
				node.setStackOffset(0);
				return;
			}
			parent = parent.getParent();
		}
		Scope subroutineScope = parent.getScope();
		node.setStackOffset(subroutineScope.getAllocatedSize());

		node.resetPromotions();
	}

	public void visitLeave(FunctionInvocationNode node) {
		IdentifierNode functionIdentifier = (IdentifierNode) node.child(0);
		List<Type> argumentTypes = IntStream.range(1, node.nChildren()).mapToObj(i -> node.child(i).getType()).toList();
		List<Type> paramDefinition = SubroutineNode.getSubroutineParamTypes(functionIdentifier);

		if (argumentTypes.size() != paramDefinition.size()) {
			semanticError("number of arguments given does not match with the function definition");
			return;
		}
		else {
			for (int i=0; i<argumentTypes.size(); i++) {
				if (!argumentTypes.get(i).equivalent(paramDefinition.get(i))) {
					boolean promotable = false;
					for (Promotion promotion : Promotion.values()) {
						if (promotion.appliesTo(argumentTypes.get(i)) && promotion.apply(argumentTypes.get(i)).equivalent(paramDefinition.get(i))) {
							node.setPromotion(i, promotion);
							promotable = true;
							break;
						}
					}
					if (!promotable) {
						semanticError("arguments passed to function do not match with the parameter definition");
					}
				}
			}
		}
		node.setType(functionIdentifier.getType());
	}
	///////////////////////////////////////////////////////////////////////////

	public void visitEnter(BlockNode node) { enterSubscope(node); }
	public void visitLeave(BlockNode node) { leaveScope(node); }
	public void visitEnter(IfNode node) { }
	public void visitLeave(IfNode node) {
		ParseNode conditionNode = node.getConditionNode();
		assert conditionNode.getType() == PrimitiveType.BOOLEAN;
	}
	public void visitEnter(WhileNode node) { }
	public void visitLeave(WhileNode node) {
		ParseNode conditionNode = node.getConditionNode();
		assert conditionNode.getType() == PrimitiveType.BOOLEAN;
	}

	public void visitEnter(ForNode node) { }
	public void visitLeave(ForNode node) {
		ParseNode identifierDeclaration = node.identifierDeclaration();
		ParseNode otherIdentifierDeclaration = node.otherIdentifierDeclaration();

		if (identifierDeclaration.getType() != PrimitiveType.INTEGER || otherIdentifierDeclaration.getType() != PrimitiveType.INTEGER) {
			semanticError("for loop bounds should have integer primitive type");
			return;
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// statements and declarations
	public void visit(BreakStatementNode node) {
		ParseNode parent = node.getParent();
		while (!(parent instanceof LoopNode)) {
			parent = parent.getParent();
			if (parent == ParseNode.NO_PARENT) {
				semanticError("break must be used within a loop");
				return;
			}
		}
		node.setParentLoop(parent);
	}

	public void visit(ContinueStatementNode node) {
		ParseNode parent = node.getParent();
		while (!(parent instanceof LoopNode)) {
			parent = parent.getParent();
			if (parent == ParseNode.NO_PARENT) {
				semanticError("continue must be used within a loop");
				return;
			}
		}
		node.setParentLoop(parent);
	}

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

		Constancy constancy = (node.getToken().isLextant(Keyword.CONST) || node.getParent() instanceof ForNode) ?
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

		ParseNode identifier = node.child(0);
		assert identifier instanceof IdentifierNode || identifier instanceof ArrayIndexNode;
		ParseNode expression = node.child(1);

		Type expressionType = expression.getType();
		Type identifierType = identifier.getType();

		if (identifier instanceof IdentifierNode && ((IdentifierNode) identifier).getBinding().isConstant()) {
			semanticError("reassignment to const identifier");
			return;
		}

		if (expressionType.equivalent(identifierType)) {
			node.setType(identifierType);
			return;
		}
		else {
			for (Promotion promotion : Promotion.allPromotions()) {
				if (promotion.appliesTo(expressionType)) {
					Type promotedType = promotion.apply(expressionType);
					if (promotedType.equivalent(identifierType)) {
						node.setType(identifierType);
						node.setExpressionPromotion(promotion);
						return;
					}
				}
			}
		}
		semanticError("types don't match in assignment statement");
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

		if (node.getOperator() == Punctuator.TYPE_CAST && node.child(0).getType() instanceof Array) {
			typecastBetweenArrays(node, childTypes);
			return;
		}
		if (node.getOperator() == Punctuator.LENGTH) {
			computeArrayLength(node);
			return;
		}

		PromotedSignature signature = selectPromotedSignature(node, childTypes);

		if(signature.accepts(childTypes)) {
			node.setType(signature.resultType().concreteType());
			node.setSignature(signature);
			FunctionSignatures.resetTypeVariables();
		}
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}

	public void typecastBetweenArrays(OperatorNode node, List<Type> childTypes){
		if (node.child(0).getType().equivalent(node.child(1).getType())) {
			node.setType(node.child(0).getType());
			TypeVariable T = new TypeVariable("T");
			node.setSignature(new PromotedSignature(new FunctionSignature(new TypeCastCodeGenerator(), new Array(T), new Array(T), new Array(T)), new ArrayList<>()));
			FunctionSignatures.resetTypeVariables();
		}
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	public void computeArrayLength(OperatorNode node) {
		assert node.child(0).getType() instanceof Array;
		node.setType(PrimitiveType.INTEGER);
		TypeVariable T = new TypeVariable("T");
		node.setSignature(new PromotedSignature(new FunctionSignature(new LengthCodeGenerator(), new Array(T), PrimitiveType.INTEGER), new ArrayList<>()));
		FunctionSignatures.resetTypeVariables();
	}

	@Override
	public void visitLeave(ArrayIndexNode node) {
		ParseNode identifier = node.identifier();
		ParseNode index = node.index();
		assert identifier.getType() instanceof Array;
		assert index.getType() == PrimitiveType.INTEGER;
		node.setType(((Array) identifier.getType()).getSubType());
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
				node.setType(new Array(node.first().getType()));
			}
			else if (node.checkChildrenHaveTheSameType()) { // children have the same type, no promotion needed
				node.setType(new Array(node.first().getType()));
			}
			else { // promote to the nearest primitive
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