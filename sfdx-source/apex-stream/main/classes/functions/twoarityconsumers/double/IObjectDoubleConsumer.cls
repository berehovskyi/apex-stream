/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes two arguments of `Object` and `Double` types and
 * returns no value.
 */
public interface IObjectDoubleConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     * @param o the first input argument of `Object` type
     * @param d the second input argument of `Double` type
     */
    void accept(Object o, Double d);

}
