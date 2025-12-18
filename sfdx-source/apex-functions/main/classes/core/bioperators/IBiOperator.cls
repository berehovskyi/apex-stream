/**
 * @description An entity that takes two arguments of `Object` type and returns an `Object`
 * value. The types of the arguments and the of returned value <strong>must</strong> be the same.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IBiOperator extends IBiFunction {
    /**
     * @description Applies the function to the two input arguments.
     * <p>Contract:</p>
     * The method is expected to have the next properties:
     * <ul>
     *     <li>The arguments and the returned value must be of the same type.</li>
     * </ul>
     *
     * @param o1 the first input argument of `T` type
     * @param o2 the second input argument of `T` type
     *
     * @return the result of `T` type
     */
    Object apply(Object o1, Object o2);
}
