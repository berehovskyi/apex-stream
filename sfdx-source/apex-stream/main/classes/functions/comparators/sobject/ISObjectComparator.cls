/**
 * @description A function that takes two arguments of `SObject` type and returns
 * an `Integer` value, which represents a comparison result. Typically, is used
 * for sorting. Permits comparison of null arguments.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectComparator {

    /**
     * @description Compares the two arguments.
     * <p>Contract:</p>
     * The method is expected to have the next properties:
     * <ul>
     *     <li>Does not cause any side effects.</li>
     *     <li>Does not return `null`.</li>
     *     <li>(compare(x, y) == 0) == (x == y))}.</li>
     * </ul>
     * The method must have the next properties:
     * <ul>
     *     <li>`compare(x, y)) == -signum(compare(y, x))`.</li>
     *     <li>Transitivity: if `(compare(x, y) > 0) && (compare(y, z) > 0)), then compare(x, z) > 0`.</li>
     *     <li>If `compare(x, y) == 0`, then `signum(compare(x, z)) == signum(compare(y, z))`.</li>
     * </ul>
     *
     * @param sObj1 the first input argument of `SObject` type
     * @param sObj2 the second input argument of `SObject` type
     *
     * @return `-1` if `sObj1` is less than `sObj2`, `0` if they're equal,
     * and `1` otherwise
     */
    Integer compare(SObject sObj1, SObject sObj2);

}
