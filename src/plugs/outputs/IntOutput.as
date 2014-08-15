/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:08
 */
package plugs.outputs {
import plugs.IInput;
import plugs.inputs.IntInput;
import plugs.inputs.NumberInput;

public class IntOutput extends AbstractOutput {
    public function IntOutput(name:String = null) {
        super(name);
    }

    override public function canConnect(input:IInput):Boolean {
        return input is IntInput || input is NumberInput;
    }
}
}
