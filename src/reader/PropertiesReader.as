// @todo implicitni hodnota property
// @todo check keys :
// @todo : in value
// @todo property inside tag
// @todo property DOMAIN SEPARATOR
package reader{

import mx.binding.utils.BindingUtils;

import uidocument.commons.api.document.*;

public class PropertiesReader {

    public var dReader:UIDocumentReader;

    public function PropertiesReader(dReader:UIDocumentReader) {
        this.dReader = dReader
    }

    public function processProperties(xml:XML):Property {
        var property:Property = DocumentObjectFactory.createProperty();
        if (xml.properties.length() >= 1) {
            for (var i:Number = 0; i < xml.properties.length(); i++) {
                processValues(xml.properties[i], property);
            }
        }
        if (xml.property.length() >= 1) {
            for (var j:Number = 0; j < xml.property.length(); j++) {
                if (xml.property[j].@key.length() > 0)
                    property.push(processValue(xml.property[j].@name, xml.property[j].@key));
                else
                    property.push(processValue(xml.property[j].@name, xml.property[j].@value));
            }
        }
        return property;
    }

    public function processValues(xml:XML, property:Property):void {
        if (xml.@names.length() > 0) {
            var names:Array = xml.@names.split(",");
            var values:Array;
            if (xml.@values.length() != 0) {
                values = xml.@values.split(",");
            } else if (xml.@keys.length() != 0) {
                values = xml.@keys.split(",");
            }
            if (values.length != names.length)
                return;
            for (var i:Number = 0; i < names.length; i++) {
                property.push(processValue(names[i], values[i]));
            }
        }
    }

    public function processValue(name:String, value:String):Array {
        if (name.length >= 1 && value.length >= 1 && value.indexOf(":") == -1) {
            return new Array(name, value, false);
        } else if (name.length >= 1 && value.length >= 1 && value.indexOf(":") != -1) {
            var tmp:Array = new Array(name, null, true);
            BindingUtils.bindProperty(tmp, "1", dReader.findModel(value.split(":", 1)[0]).getValueByName(value.split(":", 2)[1]), ["1"]);
            return tmp;
        } else
            return null;
    }

    public function getPropertyFromAction(query:String):Property {
        /*var action:Action = dReader.findAction(query);
         if (action!=null)
         return action.getVariant();
         else*/
        return null;
    }

    public function getPropertyFromEvent(query:String):Property {
        /*var event:Event = dReader.findEvent(query);
         if (event!=null)
         return event.getVariant();
         else*/
        return null;
    }

    public function getPropertyFromInterface(query:String):Property {
        /*var iface:Interface = dReader.findInterface(query);
         //if (iface!=null)
         //    return iface.getVariant();
         else*/
        return null;
    }

    public function getPropertyFromModel(query:String):Property {
        var model:ModelUpdate = dReader.findModel(query);
        if (model != null)
            return model.getVariant();
        else
            return null;
    }

}
}