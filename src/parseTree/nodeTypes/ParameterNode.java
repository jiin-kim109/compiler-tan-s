package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.Type;
import tokens.Token;

import java.util.List;

public class ParameterNode extends ParseNode {

	public ParameterNode(Token token) {
		super(token);
	}
	public ParameterNode(ParseNode node) {
		super(node);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public TypeNode paramType() {
		return (TypeNode) child(0);
	}

	public IdentifierNode identifier() {
		return (IdentifierNode) child(1);
	}

	///////////////////////////////////////////////////////////
	// boilerplate for visitors

	@Override
	public void appendChild(ParseNode child) {
		assert child instanceof TypeNode || child instanceof IdentifierNode;
		super.appendChild(child);
	}

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
