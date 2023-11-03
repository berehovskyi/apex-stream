/**
 * @description Provides common implementations of Double {@link BiOperator}
 * and related utilities.
 *
 * @see BiOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class DoubleBiOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected DoubleBiOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiOperator` that return a the square root of the sum
     * of the squares of the Integer input arguments.
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static BiOperator euclideanDistance() {
        return new EuclideanDistance();
    }

    /**
     * @description Returns a `BiOperator` that return a <strong>naive</strong> sum of
     * two Integer input arguments. Please use compensated summation whenever it is possible.
     * <p><strong>Note: </strong></p>
     * <p>Using `IDoubleIterable.sum()` is preferable over
     * `IDoubleIterable.reduce(0, BiOperators.sum())`.</p>
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if one of the Integer input argument is null
     *
     * @see DoubleEnumerable.sum
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
    private class EuclideanDistance extends BiOperator {
        public override Object apply(Object o1, Object o2) {
            return Math.sqrt(Math.pow((Double) o1, 2) + Math.pow((Double) o2, 2));
        }
    }

    private class Sum extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Double) o1 + (Double) o2; }
    }

    private class Product extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Double) o1 * (Double) o2; }
    }

    private class Min extends BiOperator {
        final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) {
            return comp.compare((Double) o1, (Double) o2) != 1 ? o1 : o2;
        }
    }

    private class Max extends BiOperator {
        final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) {
            return comp.compare((Double) o1, (Double) o2) == 1 ? o1 : o2;
        }
    }
    // @end-group
    //</editor-fold>

}
