package pub {

import mx.binding.utils.BindingUtils;
import mx.controls.Label;
import mx.events.PropertyChangeEvent;
import uidocument.commons.api.document.*;

public class Text extends Label implements Configurable, IUpdater {


    public function Text(element:Element) {
        super();

        setPosition(element.getPosition());
        setProperties(element.getProperties());

    }

    public function setProperties(properties:Property):void {

        if (properties is Variant) {
            BindingUtils.bindProperty(this, "text", properties.getPropertyByName("text"), ["1"]);
        } else {
            if (properties.getPropertyByName("text")[2] == false) {
                this.text = properties.getPropertyByName("text")[1];
                //BindingUtils.bindProperty(this, "text", properties.getPropertyByName("text"), ["1"]);
            } else {
                BindingUtils.bindProperty(this, "text", properties.getPropertyByName("text"), ["1"]);
            }
        }

    }

    public function setPosition(position:Position):void {
        this.x = position.getX();
        this.y = position.getY();
        this.width = position.getWidth();
        this.height = position.getHeight();
    }

    public function setBehavior(behavior:Behavior):void {
    }

    public function setAction(action:Action):void {
    }

    public function update(val:PropertyChangeEvent):void {
        this[val.property] = "" + val.newValue;
    }

}

/*
 public function getBinding(property:String):Updater {
 if (property == "text")
 return new Updater() {
 public function update(value:Object):void {
 this.text = value;
 }
 }
 }
 }
 */

}