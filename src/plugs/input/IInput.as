/**
 * User: booster
 * Date: 14/08/14
 * Time: 10:50
 */
package plugs.input {
import medkit.collection.List;

import plugs.IConsumer;
import plugs.output.IOutput;

public interface IInput {
    function get consumer():IConsumer
    function set consumer(value:IConsumer):void

    function get connections:List

    function get name():String

    function canConnect(output:IOutput):Boolean
}
}
