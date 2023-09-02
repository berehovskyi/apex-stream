/**
 * @description Provides default and static methods of 
 * {@link IBiOperator} functional interface.
 *
 * @see IBiOperator
 * @see ObjectStream.zip
 * @see ObjectSequence.zip
 * @see IObjectEnumerable.reduce
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class BiOperator implements IBiOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `BiOperator` that return the first input argument.
     *
     * @return the `BiOperator`
     */
    public static BiOperator left() {
        return new GetLeftArg();
    }

    /**
     * @description Returns a `BiOperator` that return the second input argument.
     *
     * @return the `BiOperator`
     */
    public static BiOperator right() {
        return new GetRightArg();
    }

    /**
     * @description Returns a `BiOperator` that returns a lesser input argument according to
     * the `comparer`.
     *
     * @param comparer the comparer to compare arguments
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if `comparer` is null
     */
    public static BiOperator minBy(final IComparer comparer) {
        Validate.notNull(comparer);
        return new MinBy(comparer);
    }

    /**
     * @description Returns a `BiOperator` that returns a greater input argument according to
     * the `comparer`.
     *
     * @param comparer the comparer to compare arguments
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if `comparer` is null
     */
    public static BiOperator maxBy(final IComparer comparer) {
        Validate.notNull(comparer);
        return new MaxBy(comparer);
    }

    /**
     * @description Returns a combined `BiOperator` of the `consumer`
     * and the `merger`.
     *
     * @param consumer the binary consumer
     * @param merger the binary operator that merges the input arguments after its consumption
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if `consumer` or `merger` is null
     */
    public static BiOperator combine(
        final IBiConsumer consumer,
        final IBiOperator merger
    ) {
        Validate.notNull(consumer);
        Validate.notNull(merger);
        return new Combine(consumer, merger);
    }

    /**
     * @description Returns a combined `BiOperator` of the `consumer`
     * and the `right` binary operator.
     *
     * @param consumer the binary consumer
     *
     * @return the `BiOperator`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static BiOperator combine(final IBiConsumer consumer) {
        return combine(consumer, BiOperator.right());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetLeftArg extends BiOperator {
        public override Object apply(Object o1, Object o2) { return o1; }
    }

    private class GetRightArg extends BiOperator {
        public override Object apply(Object o1, Object o2) { return o2; }
    }

    private class MinBy extends BiOperator {
        private final IComparer comparer;
        private MinBy(IComparer comparer) { this.comparer = comparer; }
        public override Object apply(Object o1, Object o2) { return comparer.compare(o1, o2) <= 0 ? o1 : o2; }
    }

    private class MaxBy extends BiOperator {
        private final IComparer comparer;
        private MaxBy(IComparer comparer) { this.comparer = comparer; }
        public override Object apply(Object o1, Object o2) { return comparer.compare(o1, o2) >= 0 ? o1 : o2; }
    }

    private class Combine extends BiOperator {
        private final IBiConsumer consumer;
        private final IBiOperator merger;
        private Combine(IBiConsumer consumer, IBiOperator merger) {
            this.consumer = consumer;
            this.merger = merger;
        }
        public override Object apply(Object obj1, Object obj2) {
            consumer.accept(obj1, obj2);
            return merger.apply(obj1, obj2);
        }
    }
    // @end-group
    //</editor-fold>

}
