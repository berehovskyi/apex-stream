/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Integer` type and returns a `Double`
 * value.
 */
public interface IIntToDoubleFunction {

    /**
     * @description Applies the function to the input argument.
     * @param i the input argument of `Integer` type
     * @return the result
     */
    Double apply(Integer i);

}
