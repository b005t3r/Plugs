/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:24
 */
package plugs.consumers {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.Connection;

import plugs.IConsumer;
import plugs.error.PullingDataNotSupportedError;
import plugs.error.PushingDataNotSupportedError;

public class AbstractConsumer implements IConsumer {
    protected var _inputs:List = new ArrayList();
    protected var _name:String;

    public function AbstractConsumer(name:String = null) {
        _name = name;
    }

    public function get inputs():List { return _inputs; }
    public function get name():String { return _name; }

    public function receivePushData(data:*, connection:Connection):void { throw new PushingDataNotSupportedError(); }
    public function pullData(connection:Connection = null):void { throw new PullingDataNotSupportedError(); }
}
}
