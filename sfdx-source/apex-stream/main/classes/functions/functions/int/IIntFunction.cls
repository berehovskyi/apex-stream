/**
 * @description An entity that takes one argument of `Integer` type and returns a `Object` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IIntFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param i the input argument of `Integer` type
     *
     * @return the result
     */
    Object apply(Integer i);

}
