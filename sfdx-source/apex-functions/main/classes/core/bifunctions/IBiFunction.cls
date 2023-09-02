/**
 * @description An entity that takes two arguments of `Object` type and returns an `Object`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IBiFunction {

    /**
     * @description Applies the function to the two input arguments.
     *
     * @param o1 the first input argument of `Object` type
     * @param o2 the second input argument of `Object` type
     *
     * @return the result
     */
    Object apply(Object o1, Object o2);

}
