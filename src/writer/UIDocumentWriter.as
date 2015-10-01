package writer{
import uidocument.commons.api.document.*;


public class UIDocumentWriter {

    private var document:UIDocument;
    private var connection:UIClientConnection;
    private var eWriter:EventsWriter;

    public function UIDocumentWriter(document:UIDocument, connection:UIClientConnection) {
        this.document = document;
        this.connection = connection;
        this.eWriter = new EventsWriter();
    }

    private function findAction(action:String):Action {
        var actions:Array = document.getActions();
        for (var i:Number = 0; i < actions.length; i++) {
            if (actions[i].getId() == action)
                return actions[i];
        }
        return null;
    }

    public function executeAction(action:String, bProperties:Property):void {
        sendMessage(eWriter.writeXML(findAction(action), bProperties));
    }

    private function sendMessage(xml:XML):void {
        connection.send(xml);
    }

}
}