package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class BlockNode extends ParseNode {

	private Keyword blockName;

	public BlockNode(Token token, Keyword blockName) {
		super(token);
		this.blockName = blockName;
	}
	public BlockNode(ParseNode node) {
		super(node);
		this.blockName = Keyword.NULL_KEYWORD;
	}

	////////////////////////////////////////////////////////////
	// no attributes


	///////////////////////////////////////////////////////////
	// boilerplate for visitors

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}

	public Keyword getBlockName() {
		return this.blockName;
	}
}
