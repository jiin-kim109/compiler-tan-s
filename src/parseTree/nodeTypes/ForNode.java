package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ForNode extends LoopNode {

	public ForNode(Token token) {
		super(token);
	}
	public ForNode(ParseNode node) {
		super(node);
	}

	public ParseNode identifierDeclaration() {
		return child(0);
	}

	public ParseNode otherIdentifierDeclaration() {
		return child(1);
	}

	public IdentifierNode identifier() {
		ParseNode declaration = identifierDeclaration();
		ParseNode lValue = declaration.child(0);
		assert lValue instanceof IdentifierNode;
		return (IdentifierNode) lValue;
	}

	public IdentifierNode otherIdentifier() {
		ParseNode declaration = otherIdentifierDeclaration();
		ParseNode lValue = declaration.child(0);
		assert lValue instanceof IdentifierNode;
		return (IdentifierNode) lValue;
	}

	public ParseNode toExpression() {
		return child(1);
	}

	public ParseNode getStatementBlock() {
		return child(2);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public static ParseNode make(Token token, ParseNode identifierDeclaration, ParseNode otherIdentifierDeclaration, ParseNode statementBlock) {
		ForNode node = new ForNode(token);
		node.appendChild(identifierDeclaration);
		node.appendChild(otherIdentifierDeclaration);
		node.appendChild(statementBlock);
		return node;
	}

	///////////////////////////////////////////////////////////
	// boilerplate for visitors

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
