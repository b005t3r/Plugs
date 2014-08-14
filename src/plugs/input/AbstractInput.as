/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:04
 */
package plugs.input {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.IConsumer;

import plugs.output.IOutput;

public class AbstractInput implements IInput {
    protected var _consumer:IConsumer;
    protected var _connections:List = new ArrayList();
    private var _name:String;

    public function AbstractInput(name:String = null) {
        _name = name;
    }

    public function get consumer():IConsumer { return _consumer; }
    public function set consumer(value:IConsumer):void { _consumer = value; }

    public function get connections():List { return _connections; }

    public function get name():String { return _name;}

    public function canConnect(output:IOutput):Boolean { throw new Error("abstract method"); }
}
}
