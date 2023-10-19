/**
 * @description
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class BaseListObjectConsumers {
    
    @TestVisible
    protected BaseListObjectConsumers() {}

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
     */
    public static BiConsumer addToList(final IFunction mapper) {
        return new AddToListBiConsumer(mapper);
    }

    //<editor-fold desc="List-Double BiConsumers">
    // @start-group List-Double BiConsumers
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
     */
    public static BiConsumer averagingDouble(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingDouble(mapper);
    }

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

    public class AddToListBiConsumer extends BiConsumer {
        private final IFunction mapper;
        public AddToListBiConsumer(IFunction mapper){ this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((List<Object>) container).add(mapper.apply(o)); }
    }

    private class AveragingDouble extends BiConsumer {
        private final IFunction mapper;
        private AveragingDouble(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) {
            final List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += kahanSum(avgContainer, (Double) mapper.apply(o));
        }
    }

}
