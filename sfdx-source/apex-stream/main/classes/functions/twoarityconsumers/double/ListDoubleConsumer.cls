/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Provides common class level implementations, and related utilities for
 * `List<Double> - Double` two-arity consumers. Typically is used by collectors.
 * @see Collector
 */
public abstract inherited sharing class ListDoubleConsumer extends ObjectDoubleConsumer {

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ObjectDoubleConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the number of elements
     * and the total sum using `Kahan Summation`.
     * @return the `ObjectDoubleConsumer`
     * @throws NullPointerException if at least one of the input arguments is null
     * @see Collector.averagingDouble
     */
    public static ObjectDoubleConsumer averagingDouble() {
        return new AverageDouble();
    }

    /**
     * @description Returns a `ObjectDoubleConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the total sum using
     * `Kahan Summation`.
     * @return the `ObjectDoubleConsumer`
     * @throws NullPointerException if at least one of the input arguments is null
     * @see Collector.summingDouble
     */
    public static ObjectDoubleConsumer summingDouble() {
        return new SumDouble();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Public Methods">
    // @start-group Public Methods
    /**
     * @description Integrates a new summand value to
     * <a href="https://en.wikipedia.org/wiki/Kahan_summation_algorithm">Kahan Summation</a>.
     * High-order bits of the sum are in intermediateSum[0], low-order
     * bits of the sum are in intermediateSum[1]
     * @param intermediateSum the high-order and low-order bits of the intermediate sum
     * @param d the summand
     * @return intermediate high-order / low-order sum container
     */
    public static Double kahanSum(final List<Double> intermediateSum, final Double d) {
        final Double tmp = d - intermediateSum[1];
        final Double sum = intermediateSum[0];
        final Double e = sum + tmp;
        intermediateSum[1] = (e - sum) - tmp;
        intermediateSum[0] = e;
        return d;
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AverageDouble extends ObjectDoubleConsumer {
        public override void accept(Object container, Double d) {
            List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += kahanSum(avgContainer, d);
        }
    }

    private class SumDouble extends ObjectDoubleConsumer {
        public override void accept(Object container, Double d) {
            List<Double> sumContainer = ((List<Double>) container);
            sumContainer[2] += kahanSum(sumContainer, d);
        }
    }
    // @end-group
    //</editor-fold>

}
