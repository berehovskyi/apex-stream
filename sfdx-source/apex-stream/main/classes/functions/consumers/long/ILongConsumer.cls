/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Long` type and returns no value.
 */
public interface ILongConsumer {

    /**
     * @description Performs the operation on the input argument.
     * @param l the input argument of `Long` type
     */
    void accept(Long l);

}
