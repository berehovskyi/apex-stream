/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Double` type and returns no value.
 */
public interface IDoubleConsumer {

    /**
     * @description Performs the operation on the input argument.
     * @param d the input argument of `Double` type
     */
    void accept(Double d);

}
