/**
 * User: booster
 * Date: 14/08/14
 * Time: 17:04
 */
package plugs.input {
import plugs.output.IOutput;
import plugs.output.StringOutput;

public class StringInput extends AbstractInput {
    public function StringInput(name:String = null) {
        super(name);
    }

    override public function canConnect(output:IOutput):Boolean {
        return output is StringOutput;
    }
}
}
