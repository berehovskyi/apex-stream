/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Double` type and returns a Boolean value
 * (`true` or `false`).
 */
public interface IDoublePredicate {

    /**
     * @description Returns the result of applying this predicate to input.
     * <p>Contract:</p>
     * The method is expected to have the next properties:
     * <ul>
     *     <li>Does not cause any side effects.</li>
     *     <li>Does not return `null`.</li>
     * </ul>
     * @param d the input argument of `Double` type
     * @return `true` if the input satisfies the predicate, `false` otherwise
     */
    Boolean test(Double d);

}
