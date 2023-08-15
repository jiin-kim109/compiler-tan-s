package parseTree;

import parseTree.nodeTypes.*;
import symbolTable.Scope;

// Visitor pattern with pre- and post-order visits
public interface ParseNodeVisitor {
	
	// non-leaf nodes: visitEnter and visitLeave
	void visitEnter(OperatorNode node);
	void visitLeave(OperatorNode node);
	
	void visitEnter(BlockNode node);
	void visitLeave(BlockNode node);

	void visitEnter(IfNode node);
	void visitLeave(IfNode node);
	void visitEnter(WhileNode node);
	void visitLeave(WhileNode node);
	void visitEnter(ForNode node);
	void visitLeave(ForNode node);

	void visitEnter(DeclarationNode node);
	void visitLeave(DeclarationNode node);

	void visitEnter(AssignmentStatementNode node);
	void visitLeave(AssignmentStatementNode node);

	
	void visitEnter(ParseNode node);
	void visitLeave(ParseNode node);
	
	void visitEnter(PrintStatementNode node);
	void visitLeave(PrintStatementNode node);
	
	void visitEnter(ProgramNode node);
	void visitLeave(ProgramNode node);

	void visitEnter(ExpressionListNode node);
	void visitLeave(ExpressionListNode node);

	void visitEnter(ArrayIndexNode node);
	void visitLeave(ArrayIndexNode node);


	// leaf nodes: visitLeaf only
	void visit(BooleanConstantNode node);
	void visit(ErrorNode node);
	void visit(IdentifierNode node);
	void visit(IntegerConstantNode node);
	void visit(FloatingConstantNode node);
	void visit(CharacterConstantNode node);
	void visit(StringConstantNode node);
	void visit(TypeNode node);
	void visit(NewlineNode node);
	void visit(SpaceNode node);
	void visit(HorizontalTabNode node);

	void visit(BreakStatementNode node);
	void visit(ContinueStatementNode node);

	// Subroutine

	void visitEnter(SubroutineNode node);
	void visitLeave(SubroutineNode node);
	void visitEnter(ParameterDefinitionNode node);
	void visitLeave(ParameterDefinitionNode node);
	void visitEnter(ParameterNode node);
	void visitLeave(ParameterNode node);
	void visitEnter(FunctionInvocationNode node);
	void visitLeave(FunctionInvocationNode node);
	void visitEnter(ReturnStatementNode node);
	void visitLeave(ReturnStatementNode node);
	void visitEnter(CallStatementNode node);
	void visitLeave(CallStatementNode node);

	public static class Default implements ParseNodeVisitor
	{
		public void defaultVisit(ParseNode node) {	}
		public void defaultVisitEnter(ParseNode node) {
			defaultVisit(node);
		}
		public void defaultVisitLeave(ParseNode node) {
			defaultVisit(node);
		}		
		public void defaultVisitForLeaf(ParseNode node) {
			defaultVisit(node);
		}
		
		public void visitEnter(OperatorNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(OperatorNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(DeclarationNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(DeclarationNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(AssignmentStatementNode node) { defaultVisitEnter(node); }
		public void visitLeave(AssignmentStatementNode node) { defaultVisitLeave(node); }
		public void visitEnter(BlockNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(BlockNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(IfNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(IfNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(WhileNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(WhileNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(ForNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(ForNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(ParseNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(ParseNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(ExpressionListNode node) { defaultVisitEnter(node); }
		public void visitLeave(ExpressionListNode node) { defaultVisitLeave(node); }
		public void visitEnter(ArrayIndexNode node) { defaultVisitEnter(node); }
		public void visitLeave(ArrayIndexNode node) { defaultVisitLeave(node); }
		public void visitEnter(PrintStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(PrintStatementNode node) {
			defaultVisitLeave(node);
		}
		public void visitEnter(ProgramNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(ProgramNode node) {
			defaultVisitLeave(node);
		}
		

		public void visit(BooleanConstantNode node) {
			defaultVisitForLeaf(node);
		}
		public void visit(ErrorNode node) {
			defaultVisitForLeaf(node);
		}
		public void visit(IdentifierNode node) {
			defaultVisitForLeaf(node);
		}
		public void visit(IntegerConstantNode node) {
			defaultVisitForLeaf(node);
		}
		public void visit(FloatingConstantNode node) { defaultVisitForLeaf(node);}
		public void visit(CharacterConstantNode node) { defaultVisitForLeaf(node); }
		public void visit(StringConstantNode node) { defaultVisitForLeaf(node); }
		public void visit(ArrayIndexNode node) { defaultVisit(node); }
		public void visit(NewlineNode node) {
			defaultVisitForLeaf(node);
		}	
		public void visit(SpaceNode node) {
			defaultVisitForLeaf(node);
		}
		public void visit(HorizontalTabNode node) { defaultVisitForLeaf(node); }
		public void visit(TypeNode node) { defaultVisitForLeaf(node); }

		public void visit(BreakStatementNode node) { defaultVisitForLeaf(node); }

		public void visit(ContinueStatementNode node) { defaultVisitForLeaf(node); }

		public void visitEnter(SubroutineNode node) { defaultVisitEnter(node);}
		public void visitLeave(SubroutineNode node) { defaultVisitLeave(node); }
		public void visitEnter(ParameterDefinitionNode node) { defaultVisitEnter(node);}
		public void visitLeave(ParameterDefinitionNode node) { defaultVisitLeave(node); }
		public void visitEnter(ParameterNode node) { defaultVisitEnter(node);}
		public void visitLeave(ParameterNode node) { defaultVisitLeave(node); }
		public void visitEnter(FunctionInvocationNode node) { defaultVisitEnter(node);}
		public void visitLeave(FunctionInvocationNode node) { defaultVisitLeave(node); }
		public void visitEnter(ReturnStatementNode node) { defaultVisitEnter(node);}
		public void visitLeave(ReturnStatementNode node) { defaultVisitLeave(node); }
		public void visitEnter(CallStatementNode node) { defaultVisitEnter(node);}
		public void visitLeave(CallStatementNode node) { defaultVisitLeave(node); }

		///////////////////////////////////////////////////////////////////////////
		// helper methods for scoping.

		public void enterProgramScope(ParseNode node) {
			Scope scope = Scope.createProgramScope();
			node.setScope(scope);
		}

		public void enterSubroutine(ParseNode node) {
			Scope baseScope = node.getLocalScope();
			Scope scope = Scope.createSubroutineScope(baseScope);
			node.setScope(scope);
		}

		public void enterSubscope(ParseNode node) {
			Scope baseScope = node.getLocalScope();
			Scope scope = baseScope.createSubscope();
			node.setScope(scope);
		}

		public void leaveScope(ParseNode node) {
			node.getScope().leave();
		}
	}
}
