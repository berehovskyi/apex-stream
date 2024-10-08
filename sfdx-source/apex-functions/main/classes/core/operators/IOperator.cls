/**
 * @description An entity that takes one argument of `Object` type and returns an `Object` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IOperator extends IFunction {

    /**
     * @description Applies the function to the input argument.
     * <p>Contract: The type of input argument and of the returned value must be the same.</p>
     *
     * @param o the input argument of `Object` type
     *
     * @return the result
     */
    Object apply(Object o);

}
