package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.CharacterLiteralToken;
import tokens.StringLiteralToken;
import tokens.Token;

public class StringConstantNode extends ParseNode {

	private static int addressCounter = 0;
	public StringConstantNode(Token token) {
		super(token);
		assert(token instanceof StringLiteralToken);
	}
	public StringConstantNode(ParseNode node) {
		super(node);
	}

	public static String addressCounter() {
		return "string" + Integer.toString(addressCounter++);
	}

////////////////////////////////////////////////////////////
// attributes
	
	public String getValue() {
		return stringToken().getValue();
	}

	public StringLiteralToken stringToken() {
		return (StringLiteralToken)token;
	}	

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
