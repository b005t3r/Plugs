/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:04
 */
package plugs.inputs {
import plugs.outputs.BooleanOutput;
import plugs.IOutput;
import plugs.outputs.IntOutput;

public class IntInput extends AbstractInput {
    public function IntInput(name:String = null) {
        super(name);
    }

    override public function canConnect(output:IOutput):Boolean {
        return output is IntOutput || output is BooleanOutput;
    }
}
}
