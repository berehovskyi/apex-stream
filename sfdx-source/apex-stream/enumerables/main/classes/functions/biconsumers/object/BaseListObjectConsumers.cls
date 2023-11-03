/**
 * @description Provides base implementations of `List<T> - T` {@link BiConsumer}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 * 
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseListObjectConsumers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseListObjectConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to `List`
     * and adds to this `List<Object>` the result returned by the `mapper` applied to the second
     * input argument.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see BaseCollectors.toList
     * 
     * @example
     * List<String> container = new List<String>();
     * BaseListObjectConsumers.addToList(Function.identity()).accept(container, 'foo');
     * // container -> ['foo']
     */
    public static BiConsumer addToList(final IFunction mapper) {
        return new AddToListBiConsumer(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the number of elements
     * and the total sum using `Kahan Summation`.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see BaseCollectors.averagingDouble
     * 
     * @example
     * // Floating point numbers arithmetic operations are inaccurate by nature
     * Double sum = 0.0;
     * for (Integer i = 0; i < 10; i++) {
     *     sum += 0.1;
     * }
     * // sum / 10 -> 0.009999999999999999
     * // Can be mitigated using compensated summation algorithms i.e. Kahan Summation
     * List<Double> container = new List<Double>{ 0, 0, 0, 0 };
     * for (Integer i = 0; i < 10; i++) {
     *     BaseListObjectConsumers.averagingDouble(Function.identity()).accept(container, 0.1);
     * }
     * // container -> [ 0.1, 3.469446951953614E-18, 10.0, 0.09999999999999999 ]
     * Double avg = (container[0] + container[1]) / container[2]; // 0.01
     */
    public static BiConsumer averagingDouble(final IFunction mapper) {
        return new AveragingDouble(mapper);
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
     *
     * @param intermediateSum the high-order and low-order bits of the intermediate sum
     * @param d the summand
     *
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
    private class AddToListBiConsumer extends BiConsumer {
        private final IFunction mapper;
        private AddToListBiConsumer(IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) { ((List<Object>) container).add(mapper.apply(o)); }
    }

    private class AveragingDouble extends BiConsumer {
        private final IFunction mapper;
        private AveragingDouble(IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) {
            final List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += kahanSum(avgContainer, (Double) mapper.apply(o));
        }
    }
    //</editor-fold>

}
