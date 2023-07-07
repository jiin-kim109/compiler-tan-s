package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.StringLiteralToken;
import tokens.Token;

public class ArrayIndexNode extends ParseNode {
	public ArrayIndexNode(Token token) {
		super(token);
	}

	public static ArrayIndexNode make(Token token, ParseNode identifier, ParseNode index) {
		assert (identifier instanceof IdentifierNode);
		ArrayIndexNode node = new ArrayIndexNode(token);
		node.appendChild(identifier);
		node.appendChild(index);
		return node;
	}

	public ParseNode identifier() {
		return child(0);
	}

	public ParseNode index() {
		return child(1);
	}

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
