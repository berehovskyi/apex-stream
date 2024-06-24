/**
 * @description Utility methods to simplify and standardize common enumerable manipulations.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @author Oleh Berehovskyi
 */
public inherited sharing class EnumerableSupport {

    /**
     * @description Returns a `BiOperator` that return a lesser input argument.
     *
     * @return the `BiOperator`
     *
     * @example
     * EnumerableSupport.min().apply(2, 5); // 2
     */
    public static BiOperator min() {
        return new MinBiOperator();
    }

    /**
     * @description Returns a `BiOperator` that return a greater input argument.
     *
     * @return the `BiOperator`
     *
     * @example
     * EnumerableSupport.max().apply(2, 5); // 5
     */
    public static BiOperator max() {
        return new MaxBiOperator();
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `List<Object>`.
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates SObjects into a List
     * List<Object> people = (List<Object>) [ObjectEnumerable].of(persons)
     *     .collect(EnumerableSupport.toList());
     * List<Account> accs = (List<Account>) [SObjectEnumerable].of(accounts)
     *     .collect(EnumerableSupport.toList().cast(List<Account>.class));
     */
    public static Collector toList() {
        return toList(Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates `T` input arguments
     * into a new `List<T>`.
     * <p>The result container can be cast to a specific `Type`.</p>
     *
     * @param elementType the type of the element
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `elementType` is null
     *
     * @example
     * // Accumulates Objects into a String List
     * List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
     *     .collect(EnumerableSupport.toList(String.class));
     * // is equivalent to
     * List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
     *     .collect(EnumerableSupport.toList().cast(List<String>.class));
     */
    public static Collector toList(final Type elementType) {
        Validate.notNull(elementType);
        return Collector.of(
            Supplier.of(Type.forName('List<' + elementType + '>')),
            new AddToListBiConsumer(Function.identity())
        );
    }

    /**
     * @description Returns a `Collector` that accumulates the values returned by `mapper`
     * into a new `List<Object>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a List
     * List<Object> names = (List<Object>) [ObjectEnumerable].of(people)
     *     .collect(EnumerableSupport.toList(getNameFunction));
     * List<String> names = (List<String>) [ObjectEnumerable].of(people)
     *     .collect(EnumerableSupport.toList(getNameFunction).cast(List<String>.class));
     */
    public static Collector toList(final IFunction mapper) {
        return Collector.of(Supplier.of(List<Object>.class), new AddToListBiConsumer(mapper));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is null.
     *
     * @param mapper the function extracting the Double value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) [ObjectEnumerable].of(people)
     *     .collect(EnumerableSupport.averagingLong(getBillingLatitudeFunction));
     */
    public static Collector averagingDouble(final IFunction mapper) {
        return Collector.of(
            new AveragingDoubleSupplier(),
            new AveragingDoubleBiConsumer(mapper),
            new AveragingDoubleFinisher()
        );
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Long sumOfBillingLatitude = (Long) [ObjectEnumerable].of(people)
     *     .collect(EnumerableSupport.summingDouble(getBillingLatitudeFunction));
     */
    public static Collector summingDouble(final IFunction mapper) {
        return Collector.of(
            new AveragingDoubleSupplier(),
            new AveragingDoubleBiConsumer(mapper),
            new SummingDoubleFinisher()
        );
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * EnumerableSupport.isEqual(func1, func2);
     * EnumerableSupport.isEqual(func1, Function.constant(100));
     */
    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return new ComparerPredicate(left, right, Comparer.defaultOrder(), 0);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * EnumerableSupport.isEqual(100).test(100); // true
     * EnumerableSupport.isEqual(100).test(50); // false
     */
    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * EnumerableSupport.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * EnumerableSupport.isIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
     * EnumerableSupport.isIn(getNameFunc, nameEnumerable);
     */
    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
        return new ContainsPredicate(function, container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * EnumerableSupport.isIn(new List<Object>{ 'John', 'Jim' });
     * EnumerableSupport.isIn(new Set<String>{ 'John', 'Jim' });
     * EnumerableSupport.isIn(nameEnumerable);
     */
    public static Predicate isIn(final Iterable<Object> container) {
        return isIn(Function.identity(), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is null.
     *
     * @return the `Predicate`
     *
     * @example
     * EnumerableSupport.isNull().test(null); // true;
     * EnumerableSupport.isNull().test(1); // false;
     */
    public static Predicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not null.
     *
     * @return the `Predicate`
     *
     * @example
     * EnumerableSupport.isNotNull().test(null); // false
     * EnumerableSupport.isNotNull().test(1); // true
     */
    public static Predicate isNotNull() {
        return isNull().negate();
    }

    private static Double kahanSum(final List<Double> intermediateSum, final Double d) {
        final Double tmp = d - intermediateSum[1];
        final Double sum = intermediateSum[0];
        final Double e = sum + tmp;
        intermediateSum[1] = (e - sum) - tmp;
        intermediateSum[0] = e;
        return d;
    }

    //<editor-fold desc="Lambdas">
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

    @TestVisible
    private class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Integer comparisonResult;
        @TestVisible
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

    private class ContainsPredicate extends Predicate {
        private final IFunction function;
        private final Set<Object> container;
        private ContainsPredicate(IFunction function, Iterable<Object> container) {
            Validate.notNull(function);
            Validate.notNull(container);
            this.function = function;
            this.container = toSet(container);
        }
        public override Boolean test(Object o) { return container.contains(function.apply(o)); }
        private Set<Object> toSet(Iterable<Object> source) {
            final Set<Object> dest = new Set<Object>();
            for (Object o : source) {
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
