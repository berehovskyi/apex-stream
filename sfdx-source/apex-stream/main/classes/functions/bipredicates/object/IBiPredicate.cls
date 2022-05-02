/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes two arguments of `Object` type and returns a Boolean value
 * (`true` or `false`).
 */
public interface IBiPredicate {

    /**
     * @description Returns the result of applying this predicate to input.
     * <p>Contract:</p>
     * The method is expected to have the next properties:
     * <ul>
     *     <li>Does not cause any side effects.</li>
     *     <li>Does not return `null`.</li>
     * </ul>
     * @param o1 the first input argument of `Object` type
     * @param o2 the second input argument of `Object` type
     * @return `true` if the input satisfies the predicate, `false` otherwise
     */
    Boolean test(Object o1, Object o2);

}
