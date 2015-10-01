package modifier{

import mx.events.PropertyChangeEvent;

public class DotsModifier extends Modifier {

    public function DotsModifier(suc:IUpdater) {
        super(suc);
    }

    override public function update(val:PropertyChangeEvent):void {
        val.newValue = val.newValue + "...";
        successor.update(val);
    }
}
}