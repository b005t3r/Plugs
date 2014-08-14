/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:08
 */
package plugs.output {
import plugs.input.IInput;
import plugs.input.IntInput;
import plugs.input.NumberInput;

public class IntOutput extends AbstractOutput {
    public function IntOutput(name:String = null) {
        super(name);
    }

    override public function canConnect(input:IInput):Boolean {
        return input is IntInput || input is NumberInput;
    }
}
}
