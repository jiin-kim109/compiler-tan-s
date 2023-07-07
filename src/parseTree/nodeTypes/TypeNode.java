package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Punctuator;
import lexicalAnalyzer.TypeLiteral;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.Array;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import tokens.LextantToken;
import tokens.StringLiteralToken;
import tokens.Token;
import tokens.TypeLiteralToken;;

public class TypeNode extends ParseNode {

	public TypeNode(Token token) {
		super(token);
	}

	public static TypeNode arrayOf(Token token, TypeNode subtype) {
		TypeNode node = new TypeNode(token);
		node.setType(new Array(subtype.getType()));
		return node;
	}

////////////////////////////////////////////////////////////
// attributes

///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}
}
