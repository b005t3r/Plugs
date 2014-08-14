/**
 * User: booster
 * Date: 14/08/14
 * Time: 16:55
 */
package plugs.output {
import plugs.input.IInput;
import plugs.input.NumberInput;

public class NumberOutput extends AbstractOutput {
    public function NumberOutput(name:String = null) {
        super(name);
    }

    override public function canConnect(input:IInput):Boolean {
        return input is NumberInput;
    }
}
}
