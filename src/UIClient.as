//@todo draw display
//@todo change initialization
package {

import mx.containers.Canvas;
import mx.controls.*;

import reader.*;
import writer.*;

public class UIClient extends Canvas {

    public static var textArea:TextArea;
    public static var display:Display;
    private var imageLoader:Image;
    private var connection:UIClientConnection;

    private var dReader:UIDocumentReader;
    private var dWriter:UIDocumentWriter;

    public function UIClient() {
        super();
        init();


    }

    private function init():void {

        //this.stage.scaleMode = StageScaleMode.NO_SCALE;
        //this.stage.align = StageAlign.TOP_LEFT;

        display = new Display();   //ComponentFactory.setDisplay(display);
        connection = new UIClientConnection(display);

        loadImage();
        loadText();
        loadDisplay();
    }

    private function loadImage():void {
        imageLoader = new Image();
        imageLoader.x = 0;
        imageLoader.y = 0;
        imageLoader.load("iPhone-mini copy cut.png");
        addChild(imageLoader);

    }

    private function loadText():void {
        textArea = new TextArea();
        textArea.height = 550;
        textArea.width = 600;
        textArea.x = 395;
        textArea.y = 0;
        //textField.backgroundColor = 0x00FF00;
        //textField.background = true;
        //textField.scrollV = 1;
        addChild(textArea);
    }

    private function loadDisplay():Display {
        display.x = 35;
        display.y = 120;
        addChild(display);
        return display;

    }

    public static function debug(message:String):void {
        textArea.text = textArea.text + message;
    }

}
}