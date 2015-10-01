//@todo static
package {

import flash.display.DisplayObject;
import flash.events.MouseEvent;

import pub.Button;
import pub.Text;
import pub.media.Still;

import uidocument.commons.api.document.Element;

public class ComponentFactory {


    public static function createUIElement(element:Element, display:Display):DisplayObject {
        switch (element.getId()) {
            case "public.text":
                return new Text(element);
            case "public.media.still":
                return new Still(element);
            case "public.button":
                return setBehavior(setPosition(new Button(element, display), element), element);
        }
        return null;
    }

    public static function setBehavior(component:DisplayObject, element:Element):DisplayObject {

        return component;
    }

    public function actionHandler(e:MouseEvent):void {
    }    

    private static function setPosition(component:DisplayObject, element:Element):DisplayObject {
        component.x = element.getPosition().getX();
        component.y = element.getPosition().getY();
        component.width = element.getPosition().getWidth();
        component.height = element.getPosition().getHeight();
        return component;
    }

    public static function setDisplay(display:Display):void {   UIClient.debug("SETTING");
        //this.display = display;
    }

}
}