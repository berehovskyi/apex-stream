/**
 * @description A function that takes two arguments of `Object` and `Integer` types and
 * returns no value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IObjectIntConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     *
     * @param o the first input argument of `Object` type
     * @param i the second input argument of `Integer` type
     */
    void accept(Object o, Integer i);

}
