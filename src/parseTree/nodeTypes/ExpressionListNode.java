package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.signatures.Promotion;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import tokens.IntegerLiteralToken;
import tokens.LextantToken;
import tokens.Token;

import java.util.ArrayList;
import java.util.List;

public class ExpressionListNode extends ParseNode {
	private List<Promotion> promotions = new ArrayList<>();
	private int listSize = -1;

	private static int addressCounter = 0;

	public static String addressCounter() {
		return "expressionList" + Integer.toString(addressCounter++);
	}
	public ExpressionListNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public void setListSize(int size) {
		this.listSize = size;
	}

	public int getListSize() {
		return this.listSize;
	}

	public ParseNode getTypeNode() {
		return child(0);
	}

	public ParseNode getSizeNode() {
		return child(1);
	}

	public ParseNode first() {
		return child(2);
	}

	public boolean hasDefinedType() {
		ParseNode type = getTypeNode();
		return type != null && type instanceof TypeNode;
	}

	public boolean containNonPrimitive() {
		for (int i=2; i<getChildren().size(); i++) {
			if (!(child(i).getType() instanceof PrimitiveType)) {
				return true;
			}
		}
		return false;
	}

	public boolean containPrimitive() {
		for (int i=2; i<getChildren().size(); i++) {
			if (child(i).getType() instanceof PrimitiveType) {
				return true;
			}
		}
		return false;
	}

	public List<ParseNode> getElements() {
		if (getChildren().size() < 3)
			return new ArrayList<>();
		return getChildren().subList(2, getChildren().size());
	}

	public List<Type> childTypes() {
		List<Type> types = new ArrayList<>();
		for (int i=2; i<getChildren().size(); i++) {
			types.add(child(i).getType());
		}
		return types;
	}

	public Promotion promotion(int index) {
		return this.promotions.get(index);
	}

	public int numPromotions() {
		return this.promotions.size();
	}

	public void promoteTo(Promotion promotion) {
		promotions = new ArrayList<>();
		for (int i=2; i<getChildren().size(); i++) {
			Type childType = child(i).getType();
			if (promotion.appliesTo(childType)) {
				child(i).setType(promotion.apply(childType));
				promotions.add(promotion);
			}
			else {
				promotions.add(Promotion.NONE);
			}
		}
	}

	public boolean checkChildrenHaveTheSameType() {
		Type matchType = first().getType();
		for (int i=2; i<getChildren().size(); i++) {
			if (!matchType.equivalent(child(i).getType()))
				return false;
			else
				matchType = child(i).getType();
		}
		return true;
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory

	public static ParseNode withElements(Token token, List<ParseNode> children) {
		ExpressionListNode node = new ExpressionListNode(token);
		node.appendChild(new ErrorNode(token)); // type
		node.appendChild(new ErrorNode(token)); // size
		for(ParseNode child: children) {
			node.appendChild(child);
		}
		node.setListSize(children.size());
		return node;
	}

	public static ParseNode createEmpty(Token token, ParseNode type, ParseNode sizeExpression) {
		assert type instanceof TypeNode;
		assert sizeExpression instanceof IntegerConstantNode;
		ExpressionListNode node = new ExpressionListNode(token);
		node.appendChild(type);
		node.appendChild(sizeExpression);
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

