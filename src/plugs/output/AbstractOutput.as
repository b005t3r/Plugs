/**
 * User: booster
 * Date: 14/08/14
 * Time: 11:06
 */
package plugs.output {
import medkit.collection.ArrayList;
import medkit.collection.List;

import plugs.IProvider;

import plugs.input.IInput;

public class AbstractOutput implements IOutput {
    protected var _provider:IProvider;
    protected var _connections:List = new ArrayList();
    private var _name:String;

    public function AbstractOutput(name:String = null) {
        _name = name;
    }

    public function get provider():IProvider { return null; }
    public function set provider(value:IProvider):void { }

    public function get connections():List { return _connections; }

    public function get name():String { return _name; }

    public function canConnect(input:IInput):Boolean { throw new Error("abstract method"); }
}
}
