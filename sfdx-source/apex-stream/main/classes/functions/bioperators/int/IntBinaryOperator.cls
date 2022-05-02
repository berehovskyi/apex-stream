/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IIntBinaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IntStream.zip
 * @see IntSequence.zip
 * @see IIntIterable.reduce
 * @see Collector
 */
public abstract inherited sharing class IntBinaryOperator implements IIntBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Integer i1, Integer i2);
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
    public static IntBinaryOperator max() {
        return new Max();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a lesser Integer input argument.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     * @see Math.min
     */
    public static IntBinaryOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a product of two Integer input arguments.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static IntBinaryOperator product() {
        return new Product();
    }

    /**
     * @description Returns a `IntBinaryOperator` that return a sum of two Integer input arguments.
     * @return the `IntBinaryOperator`
     * @throws NullPointerException if one of the Integer input argument is null
     */
    public static IntBinaryOperator sum() {
        return new Sum();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Max extends IntBinaryOperator {
        public override Integer apply(Integer i1, Integer i2) { return Math.max(i1, i2); }
    }

    private class Min extends IntBinaryOperator {
        public override Integer apply(Integer i1, Integer i2) { return Math.min(i1, i2); }
    }

    private class Product extends IntBinaryOperator {
        public override Integer apply(Integer i1, Integer i2) { return i1 * i2; }
    }

    private class Sum extends IntBinaryOperator {
        public override Integer apply(Integer i1, Integer i2) { return i1 + i2; }
    }
    // @end-group
    //</editor-fold>

}
