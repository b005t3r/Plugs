/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:43
 */
package plugs.processors {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.Connection;
import plugs.IInput;
import plugs.IOutput;
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

    public function requestPullData(outputConnection:Connection):* { throw new PullingDataNotSupportedError(); }
    public function receivePushData(data:*, inputConnection:Connection):void { throw new PushingDataNotSupportedError(); }

    protected function addOutput(output:IOutput):void {
        _outputs.add(output);

        output.provider = this;
    }

    protected function removeOutput(output:IOutput):void {
        output.provider = null;

        _outputs.remove(output);
    }

    protected function addInput(input:IInput):void {
        _inputs.add(input);

        input.consumer = this;
    }

    protected function removeInput(input:IInput):void {
        input.consumer = null;

        _inputs.remove(input);
    }
}
}
