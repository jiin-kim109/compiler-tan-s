package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.StringLiteralToken;
import tokens.Token;

public class BreakStatementNode extends ParseNode {

	private ParseNode parentLoopNode;

	public BreakStatementNode(Token token) {
		super(token);
	}
	public BreakStatementNode(ParseNode node) {
		super(node);
	}

	public void setParentLoop(ParseNode parentLoopNode) {
		assert parentLoopNode instanceof LoopNode;
		this.parentLoopNode = parentLoopNode;
	}

	public ParseNode getParentLoopNode() {
		return this.parentLoopNode;
	}

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
