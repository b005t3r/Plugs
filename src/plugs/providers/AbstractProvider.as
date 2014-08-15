/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:03
 */
package plugs.providers {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.Connection;

import plugs.IProvider;
import plugs.error.PullingDataNotSupportedError;
import plugs.error.PushingDataNotSupportedError;

public class AbstractProvider implements IProvider {
    protected var _outputs:List = new ArrayList();
    protected var _name:String;

    public function AbstractProvider(name:String = null) {
        _name = name;
    }

    public function get outputs():List { return _outputs; }
    public function get name():String { return _name; }

    public function pushData(connection:Connection = null):void { throw new PushingDataNotSupportedError(); }
    public function requestPullData(connection:Connection):* { throw new PullingDataNotSupportedError(); }
}
}
