/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:07
 */
package plugs.providers {
import medkit.collection.List;

import plugs.Connection;
import plugs.IOutput;

public class ValueProvider extends AbstractProvider {
    private var _value:* = undefined;

    public function ValueProvider(output:IOutput, name:String = null) {
        super(name);

        _outputs.add(output);
    }

    public function get value():* { return _value; }
    public function set value(value:*):void { _value = value; }

    override public function pushData(connection:Connection = null):void {
        if(connection != null) {
            if(connection.output != _outputs.get(0))
                throw new ArgumentError("output is not a part of this connection");

            connection.pushData(_value);
        }
        else {
            var connections:List = IOutput(_outputs.get(0)).connections;

            var count:int = connections..size();
            for(var i:int = 0; i < count; ++i) {
                var conn:Connection = connections.get(i);

                conn.pushData(_value);
            }
        }
    }

    override public function requestPullData(connection:Connection):* {
        if(connection.output != _outputs.get(0))
            throw new ArgumentError("output is not a part of this connection");

        return _value;
    }
}
}
