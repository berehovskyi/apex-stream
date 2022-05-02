/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Object` type and returns an `Object` value.
 */
public interface IFunction {

    /**
     * @description Applies the function to the input argument.
     * <p>Contract: The type of an input argument and of the returned value may be different.</p>
     * @param o the input argument of `Object` type
     * @return the result
     */
    Object apply(Object o);

}
