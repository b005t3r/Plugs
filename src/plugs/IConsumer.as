/**
 * User: booster
 * Date: 14/08/14
 * Time: 10:57
 */
package plugs {
import medkit.collection.List;

public interface IConsumer {
    function get inputs():List

    function get name():String

    function receivePushData(data:*, connection:Connection):void
}
}
