/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:30
 */
package plugs.consumers {
import medkit.collection.List;

import plugs.Connection;
import plugs.IInput;

public class DebugConsumer extends AbstractConsumer {
    public static function traceData(data:*, connection:Connection):void {
        trace("[", connection.output, "->", connection.input, "] ", data);
    }

    protected var _dataReceivedFunc:Function = traceData;

    public function DebugConsumer(input:IInput, name:String = null) {
        super(name);

        addInput(input);
    }

    public function get input():IInput { return _inputs.get(0); }

    public function get dataReceivedFunc():Function { return _dataReceivedFunc; }
    public function set dataReceivedFunc(value:Function):void { _dataReceivedFunc = value; }

    override public function receivePushData(data:*, inputConnection:Connection):void {
        if(inputConnection.input != _inputs.get(0))
            throw new ArgumentError("input is not a part of this connection");

        _dataReceivedFunc(data, inputConnection);
    }

    override public function pullData(connection:Connection = null):void {
        if(connection != null) {
            _dataReceivedFunc(connection.pullData(), connection);
        }
        else {
            var connections:List = IInput(_inputs.get(0)).connections;

            var count:int = connections.size();
            for(var i:int = 0; i < count; ++i) {
                var conn:Connection = connections.get(i);

                _dataReceivedFunc(conn.pullData(), conn);
            }
        }
    }
}
}
