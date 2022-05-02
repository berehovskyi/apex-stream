/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Object` type and returns no value.
 */
public interface IConsumer {

    /**
     * @description Performs the operation on the input argument. The method is expected to operate
     * via side-effects.
     * @param o the input argument of `Object` type
     */
    void accept(Object o);

}
