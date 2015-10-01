package pub {

import flash.events.MouseEvent;
import uidocument.commons.api.document.*;
import mx.controls.*;
import mx.events.PropertyChangeEvent;

import uidocument.commons.api.document.Element;

public class Button extends mx.controls.Button implements IUpdater {

    private var display:Display;
    private var trigger:String;
    private var action:String;
    private var bProperties:Property;

    public function Button(element:Element,display:Display):void {
                                
        label = element.getPropertyByName("name")[1];
        this.display = display;

        for (var i:Number = 0; i < element.getBehaviorLength(); i++) {
            this.trigger = element.getBehavior(i).getTrigger();
            this.action = element.getBehavior(i).getAction();
            this.bProperties = element.getBehavior(i).getProperties();

            switch (trigger) {
                case "pointer.click":

                    addEventListener(MouseEvent.CLICK,actionHandler);
            }
        }
    }

    public function actionHandler (e:MouseEvent) :void {
        display.executeAction(action, bProperties);  
    }

    public function update(val:PropertyChangeEvent):void {
        this[val.property] = "" + val.newValue;
    }

}
}