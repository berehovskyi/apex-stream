/**
 * @description An entity that takes one argument of `Double` type and returns an `Integer`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IDoubleToIntFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param d the input argument of `Double` type
     *
     * @return the result
     */
    Integer apply(Double d);

}
