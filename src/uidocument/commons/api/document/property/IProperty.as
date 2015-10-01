package uidocument.commons.api.document.property {
public interface IProperty {

    function getName():String;

    function setName(name:String):void;

    function getValue():String;

    function setValue(value:String):void;

    function getModifiers():String;

    function setModifiers(modifiers:String):void;

}
}