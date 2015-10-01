// @todo combined property, remove empty constructor
// @todo PUBLIC VAR DATA  change to PRIVATE
// @todo MODIFIERS  :modifier
// @todo TYPES OF VALUES     colorType, paintType
package uidocument.commons.api.document {
public class Property {

    public var data:Array;


    public function Property():void {
        data = new Array();
    }

    public function push(array:Array):void {
        data.push(array)
    }

    public function getData():Array {
        return data;
    }

    public function setData(data:Array):void {
        this.data = data;
    }

    public function getProperty(i:Number):Array {
        if (this.getLength() > i) return data[i];
        else return null;
    }

    public function getValue(i:Number):Number {
        if (this.getLength() >= i) return data[i - 1][1];
        else return -1;
    }

    public function getPropertyByName(str:String):Array {
        for (var i:Number = 0; i < this.data.length; i++)
            if (data[i][0] == str) return data[i];
        return null;
    }

    public function getValueByName(str:String):String {
        for (var i:Number = 0; i < this.data.length; i++)
            if (data[i][0] == str) return data[i][1];
        return null;
    }

    public function getLength():Number {
        return data.length;
    }

    public function toString():String {
        var ret:String = "";
        for (var i:Number = 0; i < data.length; i++)
            ret = ret + data[i][0] + "," + data[i][1] + ";";
        return ret;
    }

    public function compare(property:Property):Boolean {
        return false;
    }
}
}