/* Automatically generated by IntelliJ IDEA from Java, revision needed before production use */
/*
 * Copyright (c) 2008, Vaclav Slovacek. All Rights Reserved.
 *
 * Product: UIProtocol Java
 *
 * This source-code is released under following license:
 * - no release outside i2home project is allowed
 * - this copyright notice must be placed unmodified in every file derived from this source code
 */



// @todo class attribute
package uidocument.commons.api.document {

/**
 * Complete interface of the specified class.
 */

public class Interface {

    private var root:Container;
    private var id:String;
    //private var children:Array;

    public function Interface(id:String) {
        trace("Interface created");
        this.id = id;

    }

    /**
     * Retrieves root container of the interface.
     *
     * @return root container of the interface
     */
    public function getRoot():Container {
        return this.root;
    }

    ;

    /**
     * Sets root node of the interface.
     *
     * @param root of the interface
     */
    public function setRoot(root:Container):void {
        this.root = root;
    }

    ;

    /**
     * Adds the specified element into interface.
     *
     * @param element to be added into interface
     */
    public function addElement(element:Element):void {
        this.getRoot().add(element);
    }

    ;

    /**
     * Retrieves id of the element containing children.
     *
     * @return id of the element containing children
     */
    public function getChildrenContainer():String {
        return this.root.getId();
    }

    ;
}
}
