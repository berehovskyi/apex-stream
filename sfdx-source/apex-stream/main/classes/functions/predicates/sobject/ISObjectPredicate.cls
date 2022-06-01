/**
 * @description A function that takes one argument of `SObject` type and returns a Boolean value
 * (`true` or `false`).
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectPredicate {

    /**
     * @description Returns the result of applying this predicate to input.
     * <p>Contract:</p>
     * The method is expected to have the next properties:
     * <ul>
     *     <li>Does not cause any side effects.</li>
     *     <li>Does not return `null`.</li>
     * </ul>
     *
     * @param sObj the input argument of `SObject` type
     *
     * @return `true` if the input satisfies the predicate, `false` otherwise
     */
    Boolean test(SObject sObj);

}
