package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.Promotion;
import tokens.LextantToken;
import tokens.Token;

public class AssignmentStatementNode extends ParseNode {

	private Promotion expressionPromotion = Promotion.NONE;

	public AssignmentStatementNode(Token token) {
		super(token);
	}

	public AssignmentStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public Lextant getDeclarationType() {
		return lextantToken().getLextant();
	}
	public LextantToken lextantToken() {
		return (LextantToken)token;
	}

	public void setExpressionPromotion(Promotion promotion) {
		this.expressionPromotion = promotion;
	}
	public Promotion getExpressionPromotion() {
		return this.expressionPromotion;
	}
	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static AssignmentStatementNode withChildren(Token token, ParseNode identifier, ParseNode expression) {
		AssignmentStatementNode node = new AssignmentStatementNode(token);
		node.appendChild(identifier);
		node.appendChild(expression);
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
