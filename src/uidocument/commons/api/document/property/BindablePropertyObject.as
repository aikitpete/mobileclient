//@todo remove listener
package uidocument.commons.api.document.property{

import mx.events.*;
import modifier.*

[Bindable]
public class BindablePropertyObject extends BindableObject implements IUpdater, IProperty {

    public var name:String;
    public var value:String;
    public var modifiers:String;

    public function BindablePropertyObject() {
        super();

    }


    public function addListener(property:BindablePropertyObject, setter:IUpdater):void {

        var modifier:IUpdater = setter;
        if (this.name!=property.name) {
            modifier = new PropertyNameModifier(modifier, property.name);
        }
        if (property.modifiers.length != 0) {
            var mod:Array = property.modifiers.split(":");
            for (var i:Number = 0; i < mod.length; i++) {
                switch (mod[i].toString()) {
                    case "dots":
                        modifier = new DotsModifier(modifier);
                        break;
                    case "uppercase":
                        modifier = new UppercaseModifier(modifier);
                        break;
                    case "lowercase":
                        modifier = new LowercaseModifier(modifier);
                        break;
                    case "capital":
                        modifier = new CapitalModifier(modifier);
                        break;
                }
            }

        }
        this.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, modifier.update);

    }

    public function removeListener(property:BindablePropertyObject, setter:IUpdater) {
        this.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, setter.update);
    }

    public function dispatch(name:String) {

    }


    public function update(val:PropertyChangeEvent):void {
        this.value = ""+val.newValue;
    }

        public function getName():String {
        return this.name;
    }

    public function setName(name:String):void {
        this.name = name;
    }

    public function getValue():String {
        return this.value;
    }

    public function setValue(value:String):void {
        this.value = value;
    }

    public function getModifiers():String {
        return this.modifiers;
    }

    public function setModifiers(modifiers:String):void {
        this.modifiers = modifiers;
    }

}
}