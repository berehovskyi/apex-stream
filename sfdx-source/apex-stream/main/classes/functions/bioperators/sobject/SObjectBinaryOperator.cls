/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ISObjectBinaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see SObjectStream.zip
 * @see SObjectSequence.zip
 * @see ISObjectIterable.reduce
 * @see SObjectCollector
 */
public abstract inherited sharing class SObjectBinaryOperator implements ISObjectBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(SObject sObj1, SObject sObj2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectBinaryOperator` that return the first input argument.
     * @return the `SObjectBinaryOperator`
     */
    public static SObjectBinaryOperator left() {
        return new GetLeftArg();
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that return the second input argument.
     * @return the `SObjectBinaryOperator`
     */
    public static SObjectBinaryOperator right() {
        return new GetRightArg();
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a lesser input argument according to
     * the `comparator`.
     * @param comparator the comparator to compare arguments
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `comparator` is null
     */
    public static SObjectBinaryOperator minBy(final ISObjectComparator comparator) {
        Validate.notNull(comparator);
        return new MinBy(comparator);
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a lesser input argument according to
     * the `fieldName`.
     * @param fieldName the field value to compare
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `fieldName` is blank
     */
    public static SObjectBinaryOperator minBy(final String fieldName) {
        return minBy(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a lesser input argument according to
     * the `field`.
     * @param field the field value to compare
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectBinaryOperator minBy(final SObjectField field) {
        return minBy(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a greater input argument according to
     * the `comparator`.
     * @param comparator the comparator to compare arguments
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `comparator` is null
     */
    public static SObjectBinaryOperator maxBy(final ISObjectComparator comparator) {
        Validate.notNull(comparator);
        return new MaxBy(comparator);
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a greater input argument according to
     * the `fieldName`.
     * @param fieldName the field value to compare
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `fieldName` is blank
     */
    public static SObjectBinaryOperator maxBy(final String fieldName) {
        return maxBy(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that returns a greater input argument according to
     * the `field`.
     * @param field the field value to compare
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectBinaryOperator maxBy(final SObjectField field) {
        return maxBy(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns a combined `SObjectBinaryOperator` of the `consumer`
     * and the `merger`.
     * @param consumer the binary consumer
     * @param merger the binary operator that merges the input arguments after its consumption
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `consumer` or `merger` is null
     */
    public static SObjectBinaryOperator combine(
            final ISObjectBiConsumer consumer,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(consumer);
        Validate.notNull(merger);
        return new Combine(consumer, merger);
    }

    /**
     * @description Returns a combined `SObjectBinaryOperator` of the `consumer`
     * and the `right` binary operator.
     * @param consumer the binary consumer
     * @return the `SObjectBinaryOperator`
     * @throws NullPointerException if `consumer` is null
     */
    public static SObjectBinaryOperator forBiConsumer(final ISObjectBiConsumer consumer) {
        return combine(consumer, SObjectBinaryOperator.right());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetLeftArg extends SObjectBinaryOperator {
        public override SObject apply(SObject sObj1, SObject sObj2) { return sObj1; }
    }

    private class GetRightArg extends SObjectBinaryOperator {
        public override SObject apply(SObject sObj1, SObject sObj2) { return sObj2; }
    }

    private class MinBy extends SObjectBinaryOperator {
        private final ISObjectComparator comparator;
        private MinBy(ISObjectComparator comparator) { this.comparator = comparator; }
        public override SObject apply(SObject sObj1, SObject sObj2) {
            return comparator.compare(sObj1, sObj2) <= 0 ? sObj1 : sObj2;
        }
    }

    private class MaxBy extends SObjectBinaryOperator {
        private final ISObjectComparator comparator;
        private MaxBy(ISObjectComparator comparator) { this.comparator = comparator; }
        public override SObject apply(SObject sObj1, SObject sObj2) {
            return comparator.compare(sObj1, sObj2) >= 0 ? sObj1 : sObj2;
        }
    }

    private class Combine extends SObjectBinaryOperator {
        private final ISObjectBiConsumer consumer;
        private final ISObjectBinaryOperator merger;
        private Combine(ISObjectBiConsumer consumer, ISObjectBinaryOperator merger) {
            this.consumer = consumer;
            this.merger = merger;
        }
        public override SObject apply(SObject sObj1, SObject sObj2) {
            consumer.accept(sObj1, sObj2);
            return merger.apply(sObj1, sObj2);
        }
    }
    // @end-group
    //</editor-fold>

}
