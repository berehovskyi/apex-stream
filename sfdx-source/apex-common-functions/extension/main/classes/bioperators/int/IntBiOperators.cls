/**
 * @description Provides common implementations of Integer {@link BiOperator}
 * and related utilities.
 *
 * @see BiOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class IntBiOperators {

    @TestVisible
    protected IntBiOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiOperator` that return a sum of two Integer input arguments.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static BiOperator sum() {
        return new Sum();
    }

    /**
     * @description Returns a `BiOperator` that return a product of two Integer input arguments.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static BiOperator product() {
        return new Product();
    }

    /**
     * @description Returns a `BiOperator` that return a lesser Integer input argument.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static BiOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `BiOperator` that return a greater Integer input argument.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static BiOperator max() {
        return new Max();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Sum extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Integer) o1 +(Integer)  o2; }
    }

    private class Product extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Integer) o1 * (Integer) o2; }
    }

    private class Min extends BiOperator {
        public override Object apply(Object o1, Object o2) {
            return Comparer.compareObjects((Integer) o1, (Integer) o2) != 1 ? o1 : o2;
        }
    }

    private class Max extends BiOperator {
        public override Object apply(Object o1, Object o2) {
            return Comparer.compareObjects((Integer) o1, (Integer) o2) == 1 ? o1 : o2;
        }
    }
    // @end-group
    //</editor-fold>

}
