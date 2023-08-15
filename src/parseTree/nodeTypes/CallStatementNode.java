package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class CallStatementNode extends ParseNode {

	private ParseNode parentLoopNode;

	public CallStatementNode(Token token) {
		super(token);
	}
	public CallStatementNode(ParseNode node) {
		super(node);
	}

	public ParseNode getParentLoopNode() {
		return this.parentLoopNode;
	}

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}

}
