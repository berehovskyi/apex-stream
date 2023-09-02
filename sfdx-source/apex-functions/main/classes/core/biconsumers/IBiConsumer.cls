/**
 * @description A function that takes two arguments of `Object` type and returns no value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IBiConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     *
     * @param o1 the first input argument of `Object` type
     * @param o2 the second input argument of `Object` type
     */
    void accept(Object o1, Object o2);

}
