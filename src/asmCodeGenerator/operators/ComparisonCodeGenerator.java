package asmCodeGenerator.operators;

import parseTree.ParseNode;
import semanticAnalyzer.types.Type;


public abstract class ComparisonCodeGenerator implements SimpleCodeGenerator {

	protected Type operandType(ParseNode node) {
		assert (node.nChildren() == 2);
		ParseNode left = node.child(0);
		return left.getType();
	}
}
