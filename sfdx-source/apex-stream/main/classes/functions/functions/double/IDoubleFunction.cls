/**
 * @description An entity that takes one argument of `Double` type and returns a `Object` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IDoubleFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param d the input argument of `Double` type
     *
     * @return the result
     */
    Object apply(Double d);

}
