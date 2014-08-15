/**
 * User: booster
 * Date: 15/08/14
 * Time: 10:15
 */
package plugs.error {

public class PushingDataNotSupportedError extends Error {
    public function PushingDataNotSupportedError(message:* = "pushing data model is not supported", id:* = 0) {
        super(message, id);
    }
}
}
