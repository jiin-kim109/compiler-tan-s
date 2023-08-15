package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.Type;
import tokens.Token;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SubroutineNode extends ParseNode {

	private static int addressCounter = 0;
	private static String makeAddress() {
		return "subroutine" + Integer.toString(addressCounter++);
	}

	public String functionLabel() {
		return makeAddress() + "-start";
	}

	public String functionEndLabel() {
		return makeAddress() + "-end";
	}

	private static Map<String, List<Type>> parameterDefinition = new HashMap<>();

	public SubroutineNode(Token token) {
		super(token);
	}
	public SubroutineNode(ParseNode node) {
		super(node);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public static void setSubroutineParamTypes(IdentifierNode functionIdentifierNode, List<Type> paramTypes) {
		Token token = functionIdentifierNode.getToken();
		String lexeme = token.getLexeme();
		parameterDefinition.put(lexeme, paramTypes);
	}

	public static List<Type> getSubroutineParamTypes(IdentifierNode functionIdentifier) {
		Token token = functionIdentifier.getToken();
		String lexeme = token.getLexeme();
		assert parameterDefinition.containsKey(lexeme);
		return parameterDefinition.get(lexeme);
	}

	///////////////////////////////////////////////////////////
	// boilerplate for visitors

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}