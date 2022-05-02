/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Object` type and returns an `Double`
 * value.
 */
public interface IToDoubleFunction {

    /**
     * @description Applies the function to the input argument.
     * @param o the input argument of `Object` type
     * @return the result
     */
    Double apply(Object o);

}
