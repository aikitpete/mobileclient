package {

import mx.containers.Canvas;
import writer.*;
import uidocument.commons.api.document.*;

public class Display extends Canvas {

    private var dWriter:UIDocumentWriter;

    public function Display() {
        super();
    }

    public function init(dWriter:UIDocumentWriter):void {
        this.dWriter = dWriter;
        
        
    }

    public function displayInterface(uInterface:Interface):void {
        for each (var n:Element in uInterface.getRoot().getChildren()) {
            addChild(ComponentFactory.createUIElement(n,this));
            UIClient.debug("Element displayed\n");
        }
    }

    

    public function executeAction (action:String, bProperties:Property):void {
        dWriter.executeAction(action,bProperties);
    }

    override public function toString ():String {
        return "DDD";//"width:"+this.width+",height"+this.height;
    }

}

}