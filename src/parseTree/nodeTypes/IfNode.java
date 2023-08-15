package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

import java.util.ArrayList;
import java.util.List;

public class IfNode extends ParseNode {

	private int numOfStatements = 0;

	public IfNode(Token token) {
		super(token);
	}
	public IfNode(ParseNode node) {
		super(node);
	}

	public ParseNode getConditionNode() {
		return child(0);
	}

	public boolean hasElseBlock() {
		return child(1) instanceof BlockNode;
	}

	public ParseNode getElseBlock() {
		return child(1);
	}

	public ParseNode getStatementBlock() {
		return child(2);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public static ParseNode make(Token token, ParseNode condition, ParseNode statementBlock) {
		assert statementBlock instanceof BlockNode;
		IfNode node = new IfNode(token);
		node.appendChild(condition);
		node.appendChild(new ErrorNode(token));
		node.appendChild(statementBlock);
		return node;
	}

	public static ParseNode make(Token token, ParseNode condition, ParseNode elseNode, ParseNode statementBlock) {
		assert elseNode instanceof BlockNode;
		assert statementBlock instanceof BlockNode;
		IfNode node = new IfNode(token);
		node.appendChild(condition);
		node.appendChild(elseNode);
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
