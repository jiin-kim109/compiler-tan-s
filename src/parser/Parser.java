package parser;

import java.security.Key;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import lexicalAnalyzer.*;
import logging.TanLogger;
import parseTree.*;
import parseTree.nodeTypes.*;
import tokens.*;


public class Parser {
	private Scanner scanner;
	private Token nowReading;
	private Token previouslyRead;
	
	public static ParseNode parse(Scanner scanner) {
		Parser parser = new Parser(scanner);
		return parser.parse();
	}
	public Parser(Scanner scanner) {
		super();
		this.scanner = scanner;
	}
	
	public ParseNode parse() {
		readToken();
		return parseProgram();
	}

	////////////////////////////////////////////////////////////
	// "program" is the start symbol S
	// S -> MAIN mainBlock
	
	private ParseNode parseProgram() {
		if(!startsProgram(nowReading)) {
			return syntaxErrorNode("program");
		}
		ParseNode program = new ProgramNode(nowReading);

		while(startsSubroutine(nowReading)) {
			ParseNode subroutine = parseSubroutine();
			program.appendChild(subroutine);
		}
		expect(Keyword.MAIN);
		ParseNode mainBlock = parseBlock(Keyword.MAIN);
		program.appendChild(mainBlock);
		
		if(!(nowReading instanceof NullToken)) {
			return syntaxErrorNode("end of program");
		}
		
		return program;
	}
	private boolean startsProgram(Token token) {
		return token.isLextant(Keyword.MAIN) || startsSubroutine(token);
	}

	private ParseNode parseSubroutine() {
		if(!startsSubroutine(nowReading)) {
			return syntaxErrorNode("subroutine");
		}
		ParseNode subroutineNode = new SubroutineNode(nowReading);
		readToken();

		ParseNode returnTypeLiteral = parseTypeLiteral();
		if (!startsIdentifier(nowReading)) {
			return syntaxErrorNode("subroutine");
		}
		ParseNode functionIdentifier = new IdentifierNode(nowReading);
		readToken();
		ParseNode paramDefinition = new ParameterDefinitionNode(nowReading);
		expect(Punctuator.OPEN_PARENTHESIS);
		// Parameters
		while(startsTypeLiteral(nowReading)) {
			ParseNode parameterNode = new ParameterNode(nowReading);
			ParseNode paramType = parseTypeLiteral();
			ParseNode paramIdentifier = parseIdentifier();
			parameterNode.appendChild(paramType);
			parameterNode.appendChild(paramIdentifier);

			paramDefinition.appendChild(parameterNode);
			if (nowReading.isLextant(Punctuator.CLOSE_PARENTHESIS)) {
				break;
			}
			expect(Punctuator.LIST_DELIMITER);
		}
		expect(Punctuator.CLOSE_PARENTHESIS);
		// Procedure
		ParseNode procedureBlock = parseBlock();

		subroutineNode.appendChild(returnTypeLiteral);
		subroutineNode.appendChild(functionIdentifier);
		subroutineNode.appendChild(paramDefinition);
		subroutineNode.appendChild(procedureBlock);
		return subroutineNode;
	}
	private boolean startsSubroutine(Token token) { return token.isLextant(Keyword.FUNCTION); }
	
	
	///////////////////////////////////////////////////////////
	// Block
	private ParseNode parseBlock() {
		return parseBlock(Keyword.NULL_KEYWORD);
	}

	// Block -> { statement* }
	private ParseNode parseBlock(Keyword blockName) {
		if (!startsBlock(nowReading)) {
			return syntaxErrorNode("block node");
		}

		ParseNode block = new BlockNode(nowReading, blockName);
		expect(Punctuator.OPEN_BRACE);

		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			block.appendChild(statement);
		}
		expect(Punctuator.CLOSE_BRACE);
		return block;
	}
	
	///////////////////////////////////////////////////////////
	// statements
	
	// statement-> declaration | printStmt
	private ParseNode parseStatement() {
		if(!startsStatement(nowReading)) {
			return syntaxErrorNode("statement");
		}

		if(startsBlock(nowReading)) {
			return parseBlock();
		}
		if (startsIfStatement(nowReading)) {
			return parseIfStatement();
		}
		if (startsForLoopStatement(nowReading)) {
			return parseForLoopStatement();
		}
		if (startsWhileLoopStatement(nowReading)) {
			return parseWhileLoopStatement();
		}
		if (startsCallStatement(nowReading)) {
			return parseCallStatement();
		}
		if (startsReturnStatement(nowReading)) {
			return parseReturnStatement();
		}
		if (startsBreakStatement(nowReading)) {
			return parseBreakStatement();
		}
		if (startsContinueStatement(nowReading)) {
			return parseContinueStatement();
		}
		if(startsDeclaration(nowReading)) {
			return parseDeclaration();
		}
		if(startsPrintStatement(nowReading)) {
			return parsePrintStatement();
		}
		if(startsAssignment(nowReading)) {
			return parseAssignment();
		}
		return syntaxErrorNode("statement");
	}
	private boolean startsStatement(Token token) {
		return startsBlock(token) ||
				startsPrintStatement(token) ||
			   	startsDeclaration(token) ||
				startsAssignment(token) ||
				startsIfStatement(token) ||
				startsWhileLoopStatement(token) ||
				startsForLoopStatement(token) ||
				startsReturnStatement(token) ||
				startsBreakStatement(token) ||
				startsContinueStatement(token) ||
				startsCallStatement(token);
	}

	private boolean startsBlock(Token token) {
		return nowReading.isLextant(Punctuator.OPEN_BRACE);
	}

	// If -> if PE { statements + }
	private ParseNode parseIfStatement() {
		if(!startsIfStatement(nowReading)) {
			return syntaxErrorNode("if statement");
		}
		Token token = nowReading;
		readToken();
		ParseNode condition = parseParenthesisExpression();
		ParseNode statementBlock = new BlockNode(nowReading, Keyword.NULL_KEYWORD);
		// IF
		expect(Punctuator.OPEN_BRACE);
		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			statementBlock.appendChild(statement);
		}
		expect(Punctuator.CLOSE_BRACE);
		// ELSE
		if (nowReading.isLextant(Keyword.ELSE)) {
			readToken();
			ParseNode elseBlock = new BlockNode(nowReading, Keyword.NULL_KEYWORD);
			expect(Punctuator.OPEN_BRACE);
			while(startsStatement(nowReading)) {
				ParseNode statement = parseStatement();
				elseBlock.appendChild(statement);
			}
			expect(Punctuator.CLOSE_BRACE);
			return IfNode.make(token, condition, elseBlock, statementBlock);
		}
		return IfNode.make(token, condition, statementBlock);
	}
	private boolean startsIfStatement(Token token) {
		return token.isLextant(Keyword.IF);
	}

	private ParseNode parseForLoopStatement() {
		if(!startsForLoopStatement(nowReading)) {
			return syntaxErrorNode("for loop statement");
		}
		Token token = nowReading;

		readToken();
		expect(Punctuator.OPEN_PARENTHESIS);
		ParseNode identifier = parseIdentifier();
		expect(Keyword.FROM);
		ParseNode fromExpression = parseExpression();

		ParseNode otherIdentifier = new IdentifierNode(nowReading);
		readToken();
		ParseNode toExpression = parseExpression();

		expect(Punctuator.CLOSE_PARENTHESIS);
		ParseNode identifierDeclaration = DeclarationNode.withChildren(token, identifier, fromExpression);
		ParseNode otherIdentifierDeclaration = DeclarationNode.withChildren(token, otherIdentifier, toExpression);

		ParseNode statementBlock = new BlockNode(nowReading, Keyword.NULL_KEYWORD);
		expect(Punctuator.OPEN_BRACE);
		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			statementBlock.appendChild(statement);
		}
		expect(Punctuator.CLOSE_BRACE);

		ParseNode forLoopBlock = new BlockNode(nowReading, Keyword.NULL_KEYWORD);
		forLoopBlock.appendChild(ForNode.make(token, identifierDeclaration, otherIdentifierDeclaration, statementBlock));
		return forLoopBlock;
	}
	private boolean startsForLoopStatement(Token token) {
		return token.isLextant(Keyword.FOR);
	}
	private ParseNode parseWhileLoopStatement() {
		if(!startsWhileLoopStatement(nowReading)) {
			return syntaxErrorNode("while loop statement");
		}
		Token token = nowReading;
		readToken();
		ParseNode condition = parseParenthesisExpression();
		ParseNode statementBlock = new BlockNode(nowReading, Keyword.NULL_KEYWORD);
		expect(Punctuator.OPEN_BRACE);
		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			statementBlock.appendChild(statement);
		}
		expect(Punctuator.CLOSE_BRACE);
		return WhileNode.make(token, condition, statementBlock);
	}
	private boolean startsWhileLoopStatement(Token token) {
		return token.isLextant(Keyword.WHILE);
	}

	// Return & Call
	private ParseNode parseCallStatement() {
		if (!startsCallStatement(nowReading)) {
			return syntaxErrorNode("call statement");
		}
		Token token = nowReading;
		readToken();
		ParseNode functionInvocation = parseIdentifier();
		assert functionInvocation instanceof FunctionInvocationNode;
		expect(Punctuator.TERMINATOR);

		ParseNode callStatementNode = new CallStatementNode(token);
		callStatementNode.appendChild(functionInvocation);
		return callStatementNode;
	}

	private boolean startsCallStatement(Token token) {
		return token.isLextant(Keyword.CALL);
	}
	private ParseNode parseReturnStatement() {
		if (!startsReturnStatement(nowReading)) {
			return syntaxErrorNode("return statement");
		}
		Token token = nowReading;
		readToken();
		ParseNode returnExpression = parseExpression();
		expect(Punctuator.TERMINATOR);

		ParseNode returnNode = new ReturnStatementNode(token);
		returnNode.appendChild(returnExpression);
		return returnNode;
	}

	private boolean startsReturnStatement(Token token) {
		return token.isLextant(Keyword.RETURN);
	}

	// Break & Continue Statement
	private ParseNode parseBreakStatement() {
		if (!startsBreakStatement(nowReading)) {
			return syntaxErrorNode("break statement");
		}
		Token token = nowReading;
		readToken();
		expect(Punctuator.TERMINATOR);
		return new BreakStatementNode(token);
	}

	private ParseNode parseContinueStatement() {
		if (!startsContinueStatement(nowReading)) {
			return syntaxErrorNode("continue statement");
		}
		Token token = nowReading;
		readToken();
		expect(Punctuator.TERMINATOR);
		return new ContinueStatementNode(token);
	}

	private boolean startsBreakStatement(Token token) {
		return token.isLextant(Keyword.BREAK);
	}

	private boolean startsContinueStatement(Token token) {
		return token.isLextant(Keyword.CONTINUE);
	}

	// printStmt -> PRINT printExpressionList TERMINATOR
	private ParseNode parsePrintStatement() {
		if(!startsPrintStatement(nowReading)) {
			return syntaxErrorNode("print statement");
		}
		ParseNode result = new PrintStatementNode(nowReading);
		readToken();
		result = parsePrintExpressionList(result);

		expect(Punctuator.TERMINATOR);
		return result;
	}
	private boolean startsPrintStatement(Token token) {
		return token.isLextant(Keyword.PRINT);
	}	

	// This adds the printExpressions it parses to the children of the given parent
	// printExpressionList -> printSeparator* (expression printSeparator+)* expression? (note that this is nullable)

	private ParseNode parsePrintExpressionList(ParseNode parent) {
		if(!startsPrintExpressionList(nowReading)) {
			return syntaxErrorNode("printExpressionList");
		}
		
		while(startsPrintSeparator(nowReading)) {
			parsePrintSeparator(parent);
		}
		while(startsExpression(nowReading)) {
			parent.appendChild(parseExpression());
			if(nowReading.isLextant(Punctuator.TERMINATOR)) {
				return parent;
			}
			do {
				parsePrintSeparator(parent);
			} while(startsPrintSeparator(nowReading));
		}
		return parent;
	}	
	private boolean startsPrintExpressionList(Token token) {
		return startsExpression(token) || startsPrintSeparator(token) || token.isLextant(Punctuator.TERMINATOR);
	}

	
	// This adds the printSeparator it parses to the children of the given parent
	// printSeparator -> PRINT_SEPARATOR | PRINT_SPACE | PRINT_NEWLINE | PRINT_TAB
	
	private void parsePrintSeparator(ParseNode parent) {
		if(!startsPrintSeparator(nowReading)) {
			ParseNode child = syntaxErrorNode("print separator");
			parent.appendChild(child);
			return;
		}
		if(nowReading.isLextant(Punctuator.PRINT_NEWLINE)) {
			readToken();
			ParseNode child = new NewlineNode(previouslyRead);
			parent.appendChild(child);
		}		
		else if(nowReading.isLextant(Punctuator.PRINT_SPACE)) {
			readToken();
			ParseNode child = new SpaceNode(previouslyRead);
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Punctuator.PRINT_HORIZONTAL_TAB)) {
			readToken();
			ParseNode child = new HorizontalTabNode(previouslyRead);
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Punctuator.PRINT_SEPARATOR)) {
			readToken();
		}
	}
	private boolean startsPrintSeparator(Token token) {
		return token.isLextant(Punctuator.PRINT_SEPARATOR, Punctuator.PRINT_SPACE, Punctuator.PRINT_NEWLINE, Punctuator.PRINT_HORIZONTAL_TAB);
	}
	
	
	// declaration -> CONST identifier := expression TERMINATOR
	private ParseNode parseDeclaration() {
		if(!startsDeclaration(nowReading)) {
			return syntaxErrorNode("declaration");
		}
		Token declarationToken = nowReading;
		readToken();
		ParseNode identifier = parseIdentifier();
		expect(Punctuator.ASSIGN);
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);
		
		return DeclarationNode.withChildren(declarationToken, identifier, initializer);
	}
	private boolean startsDeclaration(Token token) {
		return token.isLextant(Keyword.CONST, Keyword.VAR);
	}

	// assignment -> identifier := expression TERMINATOR
	private ParseNode parseAssignment() {
		if (!startsAssignment(nowReading)) {
			return syntaxErrorNode("assignment");
		}

		ParseNode identifier = nowReading.isLextant(Punctuator.OPEN_SQUARE) ?
				parseArrayExpression() :
				parseParenthesisExpression();
		expect(Punctuator.ASSIGN);
		Token assignmentToken = previouslyRead;
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);

		return AssignmentStatementNode.withChildren(assignmentToken, identifier, initializer);
	}
	private boolean startsAssignment(Token token) {
		return startsIdentifier(token) || token.isLextant(Punctuator.OPEN_SQUARE) || token.isLextant(Punctuator.OPEN_PARENTHESIS);
	}
	
	///////////////////////////////////////////////////////////
	// expressions
	// expr                     -> comparisonExpression
	// comparisonExpression     -> additiveExpression [> additiveExpression]?
	// additiveExpression       -> multiplicativeExpression [+ multiplicativeExpression]*  (left-assoc)
	// multiplicativeExpression -> atomicExpression [MULT atomicExpression]*  (left-assoc)
	// atomicExpression         -> unaryExpression | literal
	// unaryExpression			-> UNARYOP atomicExpression
	// literal                  -> intNumber | identifier | booleanConstant

	// expr  -> comparisonExpression
	private ParseNode parseExpression() {
		if(!startsExpression(nowReading)) {
			return syntaxErrorNode("expression");
		}
		return parseAndOrExpression();
	}
	private boolean startsExpression(Token token) {
		return startsAndOrExpression(token);
	}

	private ParseNode parseAndOrExpression() {
		if (!startsAndOrExpression(nowReading)) {
			return syntaxErrorNode("andOr");
		}

		ParseNode leftCondition = parseComparisonExpression();
		if (nowReading.isLextant(Punctuator.AND, Punctuator.OR)) {
			Token andOrToken = nowReading;
			readToken();
			ParseNode rightCondition = parseExpression();
			return OperatorNode.withChildren(andOrToken, leftCondition, rightCondition);
		}
		return leftCondition;
	}
	private boolean startsAndOrExpression(Token token) {
		return startsComparisonExpression(token);
	}

	// comparisonExpression -> additiveExpression [> additiveExpression]?
	private ParseNode parseComparisonExpression() {
		if(!startsComparisonExpression(nowReading)) {
			return syntaxErrorNode("comparison expression");
		}

		ParseNode left = parseAdditiveExpression();
		if (nowReading.isLextant(Punctuator.GREATER, Punctuator.GREATER_OR_EQUAL, Punctuator.SMALLER, Punctuator.SMALLER_OR_EQUAL, Punctuator.EQUAL, Punctuator.NOT_EQUAL)) {
			Token comparisonToken = nowReading;
			readToken();
			ParseNode right = parseAdditiveExpression();
			return OperatorNode.withChildren(comparisonToken, left, right);
		}
		return left;

	}
	private boolean startsComparisonExpression(Token token) {
		return startsAdditiveExpression(token);
	}

	// additiveExpression -> multiplicativeExpression [+ multiplicativeExpression]*  (left-assoc)
	private ParseNode parseAdditiveExpression() {
		if(!startsAdditiveExpression(nowReading)) {
			return syntaxErrorNode("additiveExpression");
		}
		ParseNode left = parseMultiplicativeExpression();
		while(nowReading.isLextant(Punctuator.ADD, Punctuator.SUBTRACT)) {
			Token additiveToken = nowReading;
			readToken();
			ParseNode right = parseMultiplicativeExpression();
			left = OperatorNode.withChildren(additiveToken, left, right);
		}
		return left;
	}
	private boolean startsAdditiveExpression(Token token) {
		return startsMultiplicativeExpression(token);
	}	

	// multiplicativeExpression -> atomicExpression [MULT atomicExpression]*  (left-assoc)
	private ParseNode parseMultiplicativeExpression() {
		if(!startsMultiplicativeExpression(nowReading)) {
			return syntaxErrorNode("multiplicativeExpression");
		}

		ParseNode left = parseAtomicExpression();
		while(nowReading.isLextant(Punctuator.MULTIPLY, Punctuator.DIVIDE)) {
			Token multiplicativeToken = nowReading;
			readToken();
			ParseNode right = parseAtomicExpression();
			
			left = OperatorNode.withChildren(multiplicativeToken, left, right);
		}
		return left;
	}
	private boolean startsMultiplicativeExpression(Token token) {
		return startsAtomicExpression(token);
	}
	
	// atomicExpression         -> unaryExpression | literal
	private ParseNode parseAtomicExpression() {
		if(!startsAtomicExpression(nowReading)) {
			return syntaxErrorNode("atomic expression");
		}
		if(startsUnaryExpression(nowReading)) {
			return parseUnaryExpression();
		}
		return parseLiteral();
	}
	private boolean startsAtomicExpression(Token token) {
		return startsLiteral(token) || startsUnaryExpression(token);
	}

	// unaryExpression -> (-|+)* CastingExpression
	private ParseNode parseUnaryExpression() {
		if(!startsUnaryExpression(nowReading)) {
			return syntaxErrorNode("unary expression");
		}

		if (nowReading.isLextant(Punctuator.SUBTRACT, Punctuator.ADD, Punctuator.NOT, Punctuator.LENGTH)) {
			Token operatorToken = nowReading;
			readToken();
			ParseNode child = parseAtomicExpression();
			return OperatorNode.withChildren(operatorToken, child);
		}
		return parseArrayExpression();
	}
	private boolean startsUnaryExpression(Token token) {
		return token.isLextant(Punctuator.SUBTRACT, Punctuator.ADD, Punctuator.NOT, Punctuator.LENGTH) || startsArrayExpression(token);
	}

	// arrayExpression -> [ expressionList -> expression (,expression)* ] | CE
	private ParseNode parseArrayExpression() {
		if (!startsArrayExpression(nowReading)) {
			return syntaxErrorNode("array expression");
		}

		if (nowReading.isLextant(Punctuator.OBJECT_CREATION)) {
			Token arrayToken = nowReading;
			readToken();
			ParseNode typeNode = parseArrayExpression();
			ParseNode sizeExpression = parseParenthesisExpression();
			return ExpressionListNode.createEmpty(arrayToken, typeNode, sizeExpression);
		}

		if (nowReading.isLextant(Punctuator.OPEN_SQUARE)) {
			Token listOpenToken = nowReading;
			readToken();
			ParseNode firstExprInList = parseExpression();
			if (firstExprInList instanceof TypeNode) { // array type
				expect(Punctuator.CLOSE_SQUARE);
				return TypeNode.arrayOf(firstExprInList.getToken(), (TypeNode) firstExprInList);
			}

			List<ParseNode> listElements = new ArrayList<>();
			listElements.add(firstExprInList);
			if (nowReading.isLextant(Punctuator.INDEXING)) {
				assert firstExprInList instanceof IdentifierNode || firstExprInList instanceof ExpressionListNode || firstExprInList instanceof ArrayIndexNode;
				Token indexToken = nowReading;
				readToken();
				ParseNode indexExpression = parseExpression();
				expect(Punctuator.CLOSE_SQUARE);
				return ArrayIndexNode.make(indexToken, firstExprInList, indexExpression);
			}
			while (nowReading.isLextant(Punctuator.LIST_DELIMITER)) { // expression list
				readToken();
				listElements.add(parseExpression());
			}
			expect(Punctuator.CLOSE_SQUARE);
			return ExpressionListNode.withElements(listOpenToken, listElements);
		}
		return parseCastingExpression();
	}

	private boolean startsArrayExpression(Token token) {
		return token.isLextant(Punctuator.OPEN_SQUARE, Punctuator.OBJECT_CREATION) || startsCastingExpression(token);
	}

	// castingExpression -> (CA)? ParenthesisExpression
	private ParseNode parseCastingExpression() {
		if (!startsCastingExpression(nowReading)) {
			return syntaxErrorNode("casting expression");
		}

		if (nowReading.isLextant(Punctuator.TYPE_CAST)) {
			Token typeToken = nowReading;
			readToken();
			ParseNode typeNode;
			if (nowReading.isLextant(Punctuator.OPEN_SQUARE))
				typeNode = parseArrayExpression();
			else
				typeNode = parseTypeLiteral();
			assert (typeNode instanceof TypeNode);
			expect(Punctuator.GREATER);
			if (!startsParenthesisExpression(nowReading)) {
				return syntaxErrorNode("casting expression");
			}
			ParseNode parenthesizedExpression = parseParenthesisExpression();
			return OperatorNode.withChildren(typeToken, typeNode, parenthesizedExpression);
		}
		return parseParenthesisExpression();
	}

	private boolean startsCastingExpression(Token token) {
		return token.isLextant(Punctuator.TYPE_CAST) || startsParenthesisExpression(token);
	}

	// Parenthesis expression -> ( E ) | LE
	private ParseNode parseParenthesisExpression() {
		if (!startsParenthesisExpression(nowReading)) {
			return parseLiteral();
		}
		readToken();
		ParseNode statement = parseExpression();
		expect(Punctuator.CLOSE_PARENTHESIS);

		return statement;
	}

	private boolean startsParenthesisExpression(Token token) {
		return token.isLextant(Punctuator.OPEN_PARENTHESIS);
	}

	// literal -> number | identifier | booleanConstant
	private ParseNode parseLiteral() {
		if(!startsLiteral(nowReading)) {
			return syntaxErrorNode("literal");
		}

		if(startsTypeLiteral(nowReading)) {
			return parseTypeLiteral();
		}
		if(startsIntLiteral(nowReading)) {
			return parseIntLiteral();
		}
		if(startsFloatLiteral(nowReading)) {
			return parseFloatLiteral();
		}
		if(startsCharLiteral(nowReading)) {
			return parseCharLiteral();
		}
		if(startsStringLiteral(nowReading)) {
			return parseStringLiteral();
		}
		if(startsIdentifier(nowReading)) {
			return parseIdentifier();
		}
		if(startsBooleanLiteral(nowReading)) {
			return parseBooleanLiteral();
		}

		return syntaxErrorNode("literal");
	}
	private boolean startsLiteral(Token token) {
		return startsIntLiteral(token) ||
				startsFloatLiteral(token) ||
				startsCharLiteral(token) ||
				startsStringLiteral(token) ||
				startsIdentifier(token) ||
				startsBooleanLiteral(token) ||
				startsTypeLiteral(token);
	}

	// number (literal)
	private ParseNode parseIntLiteral() {
		if(!startsIntLiteral(nowReading)) {
			return syntaxErrorNode("integer constant");
		}
		readToken();
		return new IntegerConstantNode(previouslyRead);
	}

	private ParseNode parseFloatLiteral() {
		if (!startsFloatLiteral(nowReading)) {
			return syntaxErrorNode("floating constant");
		}
		readToken();
		return new FloatingConstantNode(previouslyRead);
	}

	private ParseNode parseCharLiteral() {
		if (!startsCharLiteral(nowReading)) {
			return syntaxErrorNode("character constant");
		}
		readToken();
		return new CharacterConstantNode(previouslyRead);
	}

	private ParseNode parseStringLiteral() {
		if (!startsStringLiteral(nowReading)) {
			return syntaxErrorNode("string constant");
		}
		readToken();
		return new StringConstantNode(previouslyRead);
	}

	private ParseNode parseTypeLiteral() {
		if (!startsTypeLiteral(nowReading)) {
			return syntaxErrorNode("type literal");
		}
		TypeLiteralToken typeLiteralToken = (TypeLiteralToken) nowReading;
		TypeNode typeNode = new TypeNode(typeLiteralToken);
		typeNode.setType(typeLiteralToken.primitive());
		readToken();
		return typeNode;
	}

	private boolean startsIntLiteral(Token token) {
		return token instanceof IntegerLiteralToken;
	}

	private boolean startsFloatLiteral(Token token) {
		return token instanceof FloatingLiteralToken;
	}

	private boolean startsCharLiteral(Token token) {
		return token instanceof CharacterLiteralToken;
	}

	private boolean startsStringLiteral(Token token) {
		return token instanceof StringLiteralToken;
	}

	private boolean startsTypeLiteral(Token token) { return token instanceof TypeLiteralToken; }

	// identifier (terminal)
	private ParseNode parseIdentifier() {
		if(!startsIdentifier(nowReading)) {
			return syntaxErrorNode("identifier");
		}
		readToken();
		ParseNode identifierNode = new IdentifierNode(previouslyRead);
		if (nowReading.isLextant(Punctuator.OPEN_PARENTHESIS)) {
			readToken();
			ParseNode functionInvocationNode = new FunctionInvocationNode(previouslyRead);
			functionInvocationNode.appendChild(identifierNode);
			if (nowReading.isLextant(Punctuator.CLOSE_PARENTHESIS)){
				readToken();
			}
			else {
				ParseNode argumentExpression = parseExpression();
				functionInvocationNode.appendChild(argumentExpression);
				while(nowReading.isLextant(Punctuator.LIST_DELIMITER)) {
					readToken();
					functionInvocationNode.appendChild(parseExpression());
				}
				expect(Punctuator.CLOSE_PARENTHESIS);
			}
			return functionInvocationNode;
		}
		return new IdentifierNode(previouslyRead);
	}
	private boolean startsIdentifier(Token token) {
		return token instanceof IdentifierToken;
	}

	// boolean literal
	private ParseNode parseBooleanLiteral() {
		if(!startsBooleanLiteral(nowReading)) {
			return syntaxErrorNode("boolean constant");
		}
		readToken();
		return new BooleanConstantNode(previouslyRead);
	}
	private boolean startsBooleanLiteral(Token token) {
		return token.isLextant(Keyword.TRUE, Keyword.FALSE);
	}

	private void readToken() {
		previouslyRead = nowReading;
		nowReading = scanner.next();
	}	
	
	// if the current token is one of the given lextants, read the next token.
	// otherwise, give a syntax error and read next token (to avoid endless looping).
	private void expect(Lextant ...lextants ) {
		if(!nowReading.isLextant(lextants)) {
			syntaxError(nowReading, "expecting " + Arrays.toString(lextants));
		}
		readToken();
	}	
	private ErrorNode syntaxErrorNode(String expectedSymbol) {
		syntaxError(nowReading, "expecting " + expectedSymbol);
		ErrorNode errorNode = new ErrorNode(nowReading);
		readToken();
		return errorNode;
	}
	private void syntaxError(Token token, String errorDescription) {
		String message = "" + token.getLocation() + " " + errorDescription;
		error(message);
	}
	private void error(String message) {
		TanLogger log = TanLogger.getLogger("compiler.Parser");
		log.severe("syntax error: " + message);
	}	
}

