package parseTree.nodeTypes;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.Type;
import tokens.Token;

import java.util.ArrayList;
import java.util.List;

public class ParameterDefinitionNode extends ParseNode {

	public ParameterDefinitionNode(Token token) {
		super(token);
	}
	public ParameterDefinitionNode(ParseNode node) {
		super(node);
	}

	////////////////////////////////////////////////////////////
	// no attributes

	public List<Type> parameterTypes() {
		List<Type> paramTypes = new ArrayList<>();
		List<ParseNode> parameters = getChildren();
		for (ParseNode param : parameters) {
			ParseNode paramType = ((ParameterNode) param).paramType();
			paramTypes.add(paramType.getType());
		}
		return paramTypes;
	}

	public List<ParameterNode> parameters() {
		List<ParameterNode> parameters = new ArrayList<>();
		for (ParseNode param : getChildren()) {
			parameters.add((ParameterNode) param);
		}
		return parameters;
	}

	///////////////////////////////////////////////////////////
	// boilerplate for visitors

	@Override
	public void appendChild(ParseNode child) {
		assert child instanceof ParameterNode;
		super.appendChild(child);
	}

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
