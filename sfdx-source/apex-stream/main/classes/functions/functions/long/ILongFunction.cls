/**
 * @description An entity that takes one argument of `Long` type and returns a `Object` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ILongFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param l the input argument of `Long` type
     *
     * @return the result
     */
    Object apply(Long l);

}
