package writer {

import uidocument.commons.api.document.*;

public class EventsWriter extends PropertyWriter {

    public function EventsWriter() {
        super();
    }

    public function writeXML (action:Action, bProperties:Property):XML {
        var xml:XML =  new XML(<UIProtocol version="1.0"/>);
        xml.appendChild(<Events/>);
        
        xml.Events.appendChild(processProperties(action, bProperties));
        return xml;
    }

    

}
}