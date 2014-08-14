/**
 * User: booster
 * Date: 14/08/14
 * Time: 17:22
 */
package plugs.output {
import plugs.input.BooleanInput;
import plugs.input.IInput;
import plugs.input.IntInput;
import plugs.input.NumberInput;

public class BooleanOutput extends AbstractOutput {
    public function BooleanOutput(name:String = null) {
        super(name);
    }

    override public function canConnect(input:IInput):Boolean {
        return input is BooleanInput || input is IntInput || input is NumberInput;
    }
}
}
