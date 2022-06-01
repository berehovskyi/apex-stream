/**
 * @description An entity that takes one argument of `Double` type and returns an `Long` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IDoubleToLongFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param d the input argument of `Double` type
     *
     * @return the result
     */
    Long apply(Double d);

}
