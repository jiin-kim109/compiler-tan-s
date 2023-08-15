package parseTree.nodeTypes;

import parseTree.ParseNode;
import tokens.Token;

public abstract class LoopNode extends ParseNode {
    private static int addressCounter = 0;
    private static String makeAddress() {
        return "loop" + Integer.toString(addressCounter++);
    }
    private String address;

    public String getAddress() { return address; }
    public String getLoopStartLabel() { return address + "-start"; }
    public String getLoopEndLabel() { return address + "-end"; }

    public LoopNode(Token token) {
        super(token);
        this.address = LoopNode.makeAddress();
    }

    public LoopNode(ParseNode node) {
        super(node);
        this.address = LoopNode.makeAddress();
    }
}
