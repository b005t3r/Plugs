/**
 * User: booster
 * Date: 14/08/14
 * Time: 10:53
 */
package plugs {
import plugs.input.IInput;
import plugs.output.IOutput;

public class Connection {
    public static function connect(input:IInput, output:IOutput):Connection {
        if(! input.canConnect(output) || ! output.canConnect(input))
            return null;

        var conn:Connection = new Connection(input, output);

        input.connections.add(conn);
        output.connections.add(conn);

        return conn;
    }

    private var _input:IInput;
    private var _output:IOutput;

    public function Connection(input:IInput, output:IOutput) {
        _input = input;
        _output = output;
    }

    public function get input():IInput { return _input; }
    public function get output():IOutput { return _output; }

    public function disconnect():void {
        input.connections.remove(this);
        output.connections.remove(this);
    }

    public function pushData(data:*):void {
        _input.consumer.receivePushData(data, this);
    }

    public function pullData(data:*):* {
        return _output.provider.requestPullData(this);
    }
}
}
