/**
 * @description An entity that takes one argument of `Integer` type and returns a `Long`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IIntToLongFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param i the input argument of `Integer` type
     *
     * @return the result
     */
    Long apply(Integer i);

}
