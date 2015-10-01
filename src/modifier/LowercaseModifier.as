package modifier{

import mx.events.PropertyChangeEvent;

public class LowercaseModifier extends Modifier {

    public function LowercaseModifier(suc:IUpdater) {
        super(suc);
    }

    override public function update(val:PropertyChangeEvent):void {
        val.newValue = val.newValue.toString().toLocaleLowerCase();
        successor.update(val);
    }
}
}