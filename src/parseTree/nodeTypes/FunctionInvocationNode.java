package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.Promotion;
import symbolTable.Scope;
import tokens.StringLiteralToken;
import tokens.Token;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

public class FunctionInvocationNode extends ParseNode {

	List<Promotion> promotions = new ArrayList<>();

	private int stackOffset = 0;
	public FunctionInvocationNode(Token token) {
		super(token);
	}
	public FunctionInvocationNode(ParseNode node) {
		super(node);
	}

	public void setStackOffset(int offset) {
		stackOffset = offset;
	}
	public int getStackOffset() {
		return stackOffset;
	}

	public ParseNode functionIdentifer() {
		ParseNode functionIdentifier = child(0);
		assert functionIdentifier instanceof IdentifierNode;
		return functionIdentifier;
	}

	public List<ParseNode> arguments() {
		if (nChildren() <= 1)
			return new ArrayList<>();
		return IntStream.range(1, nChildren()).mapToObj(i -> child(i)).toList();
	}

	public void resetPromotions() {
		IntStream.range(0, arguments().size()).forEach(i -> promotions.add(Promotion.NONE));
	}

	public void setPromotion(int index, Promotion promotion) {
		promotions.set(index, promotion);
	}

	public Promotion promotion(int index) {
		return promotions.get(index);
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
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}

}
