/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes two arguments of `Object` and `Long` types and
 * returns no value.
 */
public interface IObjectLongConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     * @param o the first input argument of `Object` type
     * @param l the second input argument of `Long` type
     */
    void accept(Object o, Long l);

}
