package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;

import java.util.List;

public class GlobalVariableVisitor extends ParseNodeVisitor.Default {

    @Override
    public void visitEnter(ProgramNode node) {
        enterProgramScope(node);
    }
    public void visitLeave(ProgramNode node) { }
    public void visitEnter(SubroutineNode node) {
    }
    public void visitLeave(SubroutineNode node) {
        ParseNode returnTypeNode = node.child(0);
        IdentifierNode functionIdentifier = (IdentifierNode) node.child(1);
        ParameterDefinitionNode parameterDefinition = (ParameterDefinitionNode) node.child(2);

        Type returnType = returnTypeNode.getType();
        List<Type> parameterTypes = parameterDefinition.parameterTypes();

        Scope globalScope = node.getLocalScope();
        Binding binding = globalScope.createBinding(functionIdentifier, PrimitiveType.INTEGER, Binding.Constancy.IS_CONSTANT);
        functionIdentifier.setBinding(binding);

        SubroutineNode.setSubroutineParamTypes(functionIdentifier, parameterTypes);
        SubroutineNode.setFunctionReturnTypes(functionIdentifier, returnType);
        node.setType(returnType);
    }

    public void visitEnter(ParameterDefinitionNode node) {}
    public void visitLeave(ParameterDefinitionNode node) {}

    public void visitEnter(ParameterNode node) {}
    public void visitLeave(ParameterNode node) {}

    public void visitEnter(IdentifierNode node) {}
    public void visitLeave(IdentifierNode node) {}

    @Override
    public void visit(TypeNode node) {
        node.setType(node.getType());
    }
}
