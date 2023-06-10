package parseTree.nodeTypes;

import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.PrimitiveType;
import tokens.LextantToken;
import tokens.Token;;

public class TypecastNode extends ParseNode {
	public TypecastNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
		assert(token.isLextant(Punctuator.TYPE_CAST));
		assert(token.getLexeme().length() > 2);
	}
	public TypecastNode(ParseNode node) {
		super(node);
	}

////////////////////////////////////////////////////////////
// attributes
	
	public PrimitiveType castingType() {
		return PrimitiveType.forLexeme(getToken().getLexeme().substring(1, getToken().getLexeme().length()-1));
	}

	public LextantToken getToken() {
		return (LextantToken)token;
	}	

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
