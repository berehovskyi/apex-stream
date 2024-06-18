/**
 * @description Utility methods for and manipulating enumerables.
 *
 * @author Oleh Berehovskyi
 */
public inherited sharing class EnumerableSupport {

    public static BiOperator min() {
        return new MinBiOperator();
    }

    public static BiOperator max() {
        return new MaxBiOperator();
    }

    public static Collector toList(final Type elementType) {
        Validate.notNull(elementType);
        return Collector.of(
            Supplier.of(Type.forName('List<' + elementType + '>')),
            new AddToListBiConsumer(Function.identity())
        );
    }

    public static Collector averagingDouble(final IFunction mapper) {
        return Collector.of(
            new AveragingDoubleSupplier(),
            new AveragingDoubleBiConsumer(mapper),
            new AveragingDoubleFinisher()
        );
    }

    public static Collector summingDouble(final IFunction mapper) {
        return Collector.of(
            new AveragingDoubleSupplier(),
            new AveragingDoubleBiConsumer(mapper),
            new SummingDoubleFinisher()
        );
    }

    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return new ComparerPredicate(left, right, Comparer.defaultOrder(), 0);
    }

    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
    }

    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
        return new IsInPredicate(function, container);
    }

    public static Predicate isIn(final Iterable<Object> container) {
        return isIn(Function.identity(), container);
    }

    public static Predicate isNull() {
        return isEqual(null);
    }

    public static Predicate isNotNull() {
        return isNull().negate();
    }

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
    private static Double kahanSum(final List<Double> intermediateSum, final Double d) {
        final Double tmp = d - intermediateSum[1];
        final Double sum = intermediateSum[0];
        final Double e = sum + tmp;
        intermediateSum[1] = (e - sum) - tmp;
        intermediateSum[0] = e;
        return d;
    }

    private class AddToListBiConsumer extends BiConsumer {
        private final IFunction mapper;
        private AddToListBiConsumer(IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) { ((List<Object>) container).add(mapper.apply(o)); }
    }

    private class AveragingDoubleBiConsumer extends BiConsumer {
        private final IFunction mapper;
        private AveragingDoubleBiConsumer(IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) {
            final List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += kahanSum(avgContainer, (Double) mapper.apply(o));
        }
    }

    private class MinBiOperator extends BiOperator {
        private final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) { return comp.compare(o1, o2) != 1 ? o1 : o2; }
    }

    private class MaxBiOperator extends BiOperator {
        private final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) { return comp.compare(o1, o2) == 1 ? o1 : o2; }
    }

    private class AveragingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
            if (doubles[2] == 0) { return null; }
            return (doubles[0] + doubles[1]) / doubles[2];
        }
    }

    private class SummingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
            if (doubles[2] == 0) { return null; }
            return doubles[0] + doubles[1];
        }
    }

    private class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Integer comparisonResult;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        private ComparerPredicate(
            IFunction left,
            IFunction right,
            IComparer comparer,
            Integer comparisonResult
        ) {
            Validate.notNull(left);
            Validate.notNull(right);
            Validate.notNull(comparer);
            Validate.notNull(comparisonResult);
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object obj) {
            return comparer.compare(left.apply(obj), right.apply(obj)) == comparisonResult;
        }
    }

    private class IsInPredicate extends Predicate {
        private final IFunction function;
        private final Set<Object> container;
        private IsInPredicate(IFunction function, Iterable<Object> container) {
            Validate.notNull(function);
            Validate.notNull(container);
            this.function = function;
            this.container = toSet(container);
        }
        public override Boolean test(Object o) { return container.contains(function.apply(o)); }
        private Set<Object> toSet(Iterable<Object> src) {
            final Set<Object> dest = new Set<Object>();
            for (Object o : src) {
                dest.add(o);
            }
            return dest;
        }
    }

    private class AveragingDoubleSupplier extends Supplier {
        public override Object get() { return new List<Double>{ 0, 0, 0, 0 }; }
    }
    //</editor-fold>

}
