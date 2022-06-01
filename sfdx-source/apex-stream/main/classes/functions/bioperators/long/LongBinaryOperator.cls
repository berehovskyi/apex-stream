/**
 * @description Inherits {@link ILongBinaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see LongStream.zip
 * @see LongSequence.zip
 * @see ILongIterable.reduce
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongBinaryOperator implements ILongBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Long l1, Long l2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
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
     * @description Returns a `LongBinaryOperator` that return a sum of two Long input arguments.
     *
     * @return the `LongBinaryOperator`
     *
     * @throws NullPointerException if one of the Long input argument is null
     */
    public static LongBinaryOperator sum() {
        return new Sum();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Max extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return Comparator.compareNullSafeLongs(l1, l2) == 1 ? l1 : l2; }
    }

    private class Min extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return Comparator.compareNullSafeLongs(l1, l2) != 1 ? l1 : l2; }
    }

    private class Product extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return l1 * l2; }
    }

    private class Sum extends LongBinaryOperator {
        public override Long apply(Long l1, Long l2) { return l1 + l2; }
    }
    // @end-group
    //</editor-fold>

}
