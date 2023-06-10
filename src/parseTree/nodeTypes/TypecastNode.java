package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
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

	public LextantToken getToken() {
		return (LextantToken)token;
	}

	public PrimitiveType primitiveType() {
		return Keyword.toPrimitive(keyword());
	}

	public Keyword keyword() {
		String lexeme = getToken().getLexeme();
		return Keyword.forLexeme(lexeme.substring(1, lexeme.length()-1));
	}

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
