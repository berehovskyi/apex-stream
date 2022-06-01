/**
 * @description An entity that takes one argument of `Object` type and returns a `Double`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IToDoubleFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param o the input argument of `Object` type
     *
     * @return the result
     */
    Double apply(Object o);

}
