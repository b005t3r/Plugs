/**
 * User: booster
 * Date: 14/08/14
 * Time: 10:50
 */
package plugs.output {
import medkit.collection.List;

import plugs.IProvider;

import plugs.input.IInput;

public interface IOutput {
    function get provider():IProvider
    function set provider(value:IProvider):void

    function get connections:List

    function get name():String

    function canConnect(input:IInput):Boolean
}
}
