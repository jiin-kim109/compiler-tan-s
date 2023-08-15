package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

import java.util.ArrayList;
import java.util.List;

public class WhileNode extends LoopNode {

	private int numOfStatements = 0;

	public WhileNode(Token token) {
		super(token);
	}
	public WhileNode(ParseNode node) {
		super(node);
	}

	public ParseNode getConditionNode() {
		return child(0);
	}

	public ParseNode getStatementBlock() {
		return child(1);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public static ParseNode make(Token token, ParseNode condition, ParseNode statementBlock) {
		WhileNode node = new WhileNode(token);
		node.appendChild(condition);
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
