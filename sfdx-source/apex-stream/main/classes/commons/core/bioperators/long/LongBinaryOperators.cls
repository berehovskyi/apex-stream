/**
 * @description Provides common implementations of {@link LongBinaryOperator}
 * and related utilities.
 *
 * @see LongBinaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongBinaryOperators {

    @TestVisible
    private LongBinaryOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongBinaryOperator` that return a sum of two Long input arguments.
     *
     * @return the `LongBinaryOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static LongBinaryOperator sum() {
        return new Sum();
    }

    /**
     * @description Returns a `LongBinaryOperator` that return a product of two Long input arguments.
     *
     * @return the `LongBinaryOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static LongBinaryOperator product() {
        return new Product();
    }

    /**
     * @description Returns a `LongBinaryOperator` that return a lesser Long input argument.
     *
     * @return the `LongBinaryOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static LongBinaryOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `LongBinaryOperator` that return a greater Long input argument.
     *
     * @return the `LongBinaryOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static LongBinaryOperator max() {
        return new Max();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Sum extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return l1 + l2; }
    }

    private class Product extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return l1 * l2; }
    }

    private class Min extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) {
            return Comparators.compareNullSafeLongs(l1, l2) != 1 ? l1 : l2;
        }
    }

    private class Max extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) {
            return Comparators.compareNullSafeLongs(l1, l2) == 1 ? l1 : l2;
        }
    }
    // @end-group
    //</editor-fold>

}
