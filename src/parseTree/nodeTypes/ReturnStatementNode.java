package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.Promotion;
import tokens.Token;

public class ReturnStatementNode extends ParseNode {

	private Promotion promotion;

	public ReturnStatementNode(Token token) {
		super(token);
	}
	public ReturnStatementNode(ParseNode node) {
		super(node);
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public Promotion promotion() {
		return promotion;
	}

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}

}
