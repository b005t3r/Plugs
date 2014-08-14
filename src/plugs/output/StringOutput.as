/**
 * User: booster
 * Date: 14/08/14
 * Time: 17:05
 */
package plugs.output {
import plugs.input.IInput;
import plugs.input.StringInput;

public class StringOutput extends AbstractOutput {
    public function StringOutput(name:String = null) {
        super(name);
    }

    override public function canConnect(input:IInput):Boolean {
        return input is StringInput;
    }
}
}
