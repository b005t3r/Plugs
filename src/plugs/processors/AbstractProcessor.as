/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:43
 */
package plugs.processors {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.Connection;

import plugs.IProcessor;
import plugs.error.PullingDataNotSupportedError;
import plugs.error.PushingDataNotSupportedError;

public class AbstractProcessor implements IProcessor {
    protected var _inputs:List = new ArrayList();
    protected var _outputs:List = new ArrayList();
    protected var _name:String;

    public function AbstractProcessor(name:String = null) {
        _name = name;
    }

    public function get inputs():List { return _inputs; }
    public function get outputs():List { return _outputs; }
    public function get name():String { return _name; }

    public function requestPullData(connection:Connection):* { throw new PullingDataNotSupportedError(); }
    public function receivePushData(data:*, connection:Connection):void { throw new PushingDataNotSupportedError(); }
}
}
