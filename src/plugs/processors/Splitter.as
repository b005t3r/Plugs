/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:51
 */
package plugs.processors {
import plugs.Connection;
import plugs.IInput;
import plugs.IOutput;

public class Splitter extends AbstractProcessor {
    public function Splitter(input:IInput, output:IOutput, name:String = null) {
        super(name);

        if(! input.canConnect(output) || ! output.canConnect(input))
            throw new ArgumentError("input: '" + input + "' and output + '" + output + "' are not compatible");

        addInput(input);
        addOutput(output);
    }

    public function get input():IInput { return _inputs.get(0); }
    public function get output():IOutput { return _outputs.get(0); }

    override public function requestPullData(outputConnection:Connection):* {
        if(outputConnection.output != _outputs.get(0))
            throw new ArgumentError("output is not a part of this connection");

        var input:IInput = _inputs.get(0);

        return input.connections.get(0).pullData();
    }

    override public function receivePushData(data:*, inputConnection:Connection):void {
        if(inputConnection.input != _inputs.get(0))
            throw new ArgumentError("input is not a part of this connection");

        var output:IOutput = _outputs.get(0);

        var count:int = output.connections.size();
        for(var i:int = 0; i < count; ++i) {
            var conn:Connection = output.connections.get(i);

            conn.pushData(data);
        }
    }
}
}
