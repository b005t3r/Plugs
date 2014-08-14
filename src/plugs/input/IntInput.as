/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:04
 */
package plugs.input {
import plugs.output.BooleanOutput;
import plugs.output.IOutput;
import plugs.output.IntOutput;

public class IntInput extends AbstractInput {
    public function IntInput(name:String = null) {
        super(name);
    }

    override public function canConnect(output:IOutput):Boolean {
        return output is IntOutput || output is BooleanOutput;
    }
}
}
