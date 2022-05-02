/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IDoubleBinaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see DoubleStream.zip
 * @see DoubleSequence.zip
 * @see IDoubleIterable.reduce
 * @see Collector
 */
public abstract inherited sharing class DoubleBinaryOperator implements IDoubleBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Double d1, Double d2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IntBinaryOperator` that return a greater Integer input argument.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     * @see Math.max
     */
    public static DoubleBinaryOperator max() {
        return new Max();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a lesser Integer input argument.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     * @see Math.min
     */
    public static DoubleBinaryOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a product of two Integer input arguments.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static DoubleBinaryOperator product() {
        return new Product();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a <strong>naive</strong> sum of
     * two Integer input arguments. Please use compensated summation whenever it is possible.
     * <p><strong>Note: </strong></p>
     * <p>Using `IDoubleIterable.sum()` is preferable over
     * `IDoubleIterable.reduce(0, DoubleBinaryOperator.sum())`.</p>
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     * @see IDoubleIterable.sum
     */
    public static DoubleBinaryOperator sum() {
        return new Sum();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a the square root of the sum
     * of the squares of the Integer input arguments.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static DoubleBinaryOperator euclideanDistance() {
        return new EuclideanDistance();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Max extends DoubleBinaryOperator {
        public override Double apply(Double d1, Double d2) { return Math.max(d1, d2); }
    }

    private class Min extends DoubleBinaryOperator {
        public override Double apply(Double d1, Double d2) { return Math.min(d1, d2); }
    }

    private class Product extends DoubleBinaryOperator {
        public override Double apply(Double d1, Double d2) { return d1 * d2; }
    }

    private class Sum extends DoubleBinaryOperator {
        public override Double apply(Double d1, Double d2) { return d1 + d2; }
    }

    private class EuclideanDistance extends DoubleBinaryOperator {
        public override Double apply(Double d1, Double d2) { return Math.sqrt(Math.pow(d1, 2) + Math.pow(d2, 2)); }
    }
    // @end-group
    //</editor-fold>

}
