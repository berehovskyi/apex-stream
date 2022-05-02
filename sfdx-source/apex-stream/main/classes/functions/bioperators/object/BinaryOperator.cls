/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IBinaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ObjectStream.zip
 * @see ObjectSequence.zip
 * @see IObjectIterable.reduce
 * @see Collector
 */
public abstract inherited sharing class BinaryOperator implements IBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectBinaryOperator` that return the first input argument.
     * @return the `SObjectBinaryOperator`
     */
    public static BinaryOperator left() {
        return new GetLeftArg();
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that return the second input argument.
     * @return the `SObjectBinaryOperator`
     */
    public static BinaryOperator right() {
        return new GetRightArg();
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a lesser input argument according to
     * the `comparator`.
     * @param comparator the comparator to compare arguments
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `comparator` is null
     */
    public static BinaryOperator minBy(final IComparator comparator) {
        Validate.notNull(comparator);
        return new MinBy(comparator);
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a greater input argument according to
     * the `comparator`.
     * @param comparator the comparator to compare arguments
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `comparator` is null
     */
    public static BinaryOperator maxBy(final IComparator comparator) {
        Validate.notNull(comparator);
        return new MaxBy(comparator);
    }

    /**
     * @description Returns a composed `BinaryOperator` of the `IIntBinaryOperator`.
     * @param operator the binary operator
     * @return the `BinaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static BinaryOperator upcast(final IIntBinaryOperator operator) {
        Validate.notNull(operator);
        return new OfIntBinaryOperator(operator);
    }

    /**
     * @description Returns a composed `BinaryOperator` of the `ILongBinaryOperator`.
     * @param operator the binary operator
     * @return the `BinaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static BinaryOperator upcast(final ILongBinaryOperator operator) {
        Validate.notNull(operator);
        return new OfLongBinaryOperator(operator);
    }

    /**
     * @description Returns a composed `BinaryOperator` of the `IDoubleBinaryOperator`.
     * @param operator the binary operator
     * @return the `BinaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static BinaryOperator upcast(final IDoubleBinaryOperator operator) {
        Validate.notNull(operator);
        return new OfDoubleBinaryOperator(operator);
    }

    /**
     * @description Returns a composed `BinaryOperator` of the `ISObjectBinaryOperator`.
     * @param operator the binary operator
     * @return the `BinaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static BinaryOperator upcast(final ISObjectBinaryOperator operator) {
        Validate.notNull(operator);
        return new OfSObjectBinaryOperator(operator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetLeftArg extends BinaryOperator {
        public override Object apply(Object o1, Object o2) { return o1; }
    }

    private class GetRightArg extends BinaryOperator {
        public override Object apply(Object o1, Object o2) { return o2; }
    }

    private class MinBy extends BinaryOperator {
        private final IComparator comparator;
        private MinBy(IComparator comparator) { this.comparator = comparator; }
        public override Object apply(Object o1, Object o2) { return comparator.compare(o1, o2) <= 0 ? o1 : o2; }
    }

    private class MaxBy extends BinaryOperator {
        private final IComparator comparator;
        private MaxBy(IComparator comparator) { this.comparator = comparator; }
        public override Object apply(Object o1, Object o2) { return comparator.compare(o1, o2) >= 0 ? o1 : o2; }
    }

    private class OfIntBinaryOperator extends BinaryOperator {
        private final IIntBinaryOperator operator;
        private OfIntBinaryOperator(IIntBinaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o1, Object o2) { return operator.apply((Integer) o1, (Integer) o2); }
    }

    private class OfLongBinaryOperator extends BinaryOperator {
        private final ILongBinaryOperator operator;
        private OfLongBinaryOperator(ILongBinaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o1, Object o2) { return operator.apply((Long) o1, (Long) o2); }
    }

    private class OfDoubleBinaryOperator extends BinaryOperator {
        private final IDoubleBinaryOperator operator;
        private OfDoubleBinaryOperator(IDoubleBinaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o1, Object o2) { return operator.apply((Double) o1, (Double) o2); }
    }

    private class OfSObjectBinaryOperator extends BinaryOperator {
        private final ISObjectBinaryOperator operator;
        private OfSObjectBinaryOperator(ISObjectBinaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o1, Object o2) { return operator.apply((SObject) o1, (SObject) o2); }
    }
    // @end-group
    //</editor-fold>

}
