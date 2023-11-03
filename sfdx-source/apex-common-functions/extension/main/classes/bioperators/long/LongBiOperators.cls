/**
 * @description Provides common implementations of Long {@link BiOperator}
 * and related utilities.
 *
 * @see BiOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class LongBiOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected LongBiOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiOperator` that return a sum of two Long input arguments.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static BiOperator sum() {
        return new Sum();
    }

    /**
     * @description Returns a `BiOperator` that return a product of two Long input arguments.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static BiOperator product() {
        return new Product();
    }

    /**
     * @description Returns a `BiOperator` that return a lesser Long input argument.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static BiOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `BiOperator` that return a greater Long input argument.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static BiOperator max() {
        return new Max();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Sum extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
    }

    private class Product extends BiOperator {
        public override Object apply(Object l1, Object l2) { return (Long) l1 * (Long) l2; }
    }

    private class Min extends BiOperator {
        final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object l1, Object l2) {
            return comp.compare((Long) l1, (Long) l2) != 1 ? l1 : l2;
        }
    }

    private class Max extends BiOperator {
        final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object l1, Object l2) {
            return comp.compare((Long) l1, (Long) l2) == 1 ? l1 : l2;
        }
    }
    // @end-group
    //</editor-fold>

}
