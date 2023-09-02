/**
 * @description A function that takes two arguments of `Object` type and returns
 * an `Integer` value, which represents a comparison result. Typically, is used
 * for sorting. Permits comparison of null arguments.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IComparer {

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
     * @param o1 the first input argument of `Object` type
     * @param o2 the second input argument of `Object` type
     *
     * @return `-1` if `o1` is less than `o2`, `0` if they're equal,
     * and `1` otherwise
     */
    Integer compare(Object o1, Object o2);

}
