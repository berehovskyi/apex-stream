/**
 * @description A sequence of `Double` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectStream}.
 *
 * @see SObjectStream
 * @see ObjectStream
 * @see IntStream
 * @see LongStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * <p><a href="https://en.wikipedia.org/wiki/Monte_Carlo_method">Monte Carlo method</a></p>
 * // Approximating the value of π using Monte Carlo method and streams
 * public class IsLessPredicate extends Predicate {
 *     private final Double d;
 *     public IsLessPredicate(Double d) { this.d = d; }
 *     public override Boolean test(Object o) { return (Double) o < d; }
 * }
 * public class RandomDoubleSupplier extends Supplier {
 *     public override Object get() { return Math.random(); }
 * }
 * public class EuclideanDistanceBiOperator extends BiOperator {
 *     public override Object apply(Object o1, Object o2) {
 *         return Math.sqrt(Math.pow((Double) o1, 2) + Math.pow((Double) o2, 2));
 *     }
 * }
 * Integer s = 200000;
 * IDoubleEnumerable x = DoubleStream.generate(new RandomDoubleSupplier());
 * IDoubleEnumerable y = DoubleStream.generate(new RandomDoubleSupplier());
 * IDoubleBinaryOperator euclidean = new EuclideanDistanceBiOperator();
 * // The number of points inside the quadrant,
 * // i.e. having a distance from the origin of less than 1
 * Integer n = DoubleStream.zip(x, y, euclidean)
 *       .lim(s)
 *       .filter(new IsLessPredicate(1))
 *       .count();
 * // The ratio of the inside-count and the total-sample-count is an estimate of the ratio
 * // of the two areas, π / 4. Multiply the result by 4 to estimate π.
 * Double approxPi = 4 * n / (Double) s;
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public virtual inherited sharing class DoubleStream extends DoubleEnumerable implements IRunnable {

    private final transient Iterator<Double> iterator;

    /**
     * @description A flag defining whether this stream has been linked or consumed.
     */
    public Boolean isOperated { get { return isOperated; } protected set; } {
        isOperated = false;
    }

    protected DoubleStream() {
        this((new List<Double>()).iterator());
    }

    protected DoubleStream(final Iterator<Double> iterator) {
        this.iterator = iterator;
    }

    //<editor-fold desc="Iterator">
    // @start-group Iterator
    /**
     * @description Returns an internal iterator for the elements of this stream.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Double>`
     *
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public override Iterator<Double> iterator() {
        Validate.isTrue(!isOperated, Label.AS_ErrorMessage_StreamOperated);
        try {
            return iterator;
        } finally {
            isOperated = true;
        }
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `DoubleEnumerable` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * DoubleEnumerable doubleStream = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI }.iterator());
     * DoubleEnumerable doubleStream = DoubleStream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI }.iterator());
     * DoubleEnumerable doubleStream = DoubleStream.of(otherStream.iterator());
     */
    public static DoubleEnumerable of(final Iterator<Double> iterator) {
        Validate.notNull(iterator);
        return new DoubleStream(iterator);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles`.
     *
     * @param doubles the iterable
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * DoubleEnumerable doubleStream = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * DoubleEnumerable doubleStream = DoubleStream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Iterable<Double> doubles) {
        Validate.notNull(doubles);
        return new DoubleStream(doubles.iterator());
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleEnumerable`.
     *
     * @param doubles the iterable
     *
     * @return the new `DoubleEnumerable` if `doubles` is non-null,
     * otherwise an empty `DoubleEnumerable`
     *
     * @example
     * DoubleEnumerable doubleStream = DoubleStream.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final Iterable<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleStream(doubles.iterator());
    }

    /**
     * @description Returns an empty `DoubleEnumerable`.
     *
     * @return the empty `DoubleEnumerable`
     */
    public static DoubleEnumerable empty() {
        return new DoubleStream();
    }

    /**
     * @description Returns an infinite `DoubleEnumerable` where each element is
     * generated by `supplier`.
     *
     * @param supplier the supplier of generated elements
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * public class RandomDoubleSupplier extends Supplier {
     *     public override Object get() { return Math.random(); }
     * }
     * DoubleEnumerable randomStream = DoubleStream.generate(new RandomDoubleSupplier());
     * Iterator<Double> it = randomStream.iterator();
     * it.next(); // 0.5812563210347667
     * it.next(); // 0.5098673811400521
     * it.next(); // 0.727574226817816
     */
    public static DoubleEnumerable generate(final ISupplier supplier) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.generate(supplier));
    }

    /**
     * @description Returns an infinite `DoubleEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `DoubleEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * public class AddOperator extends Operator {
     *     private final Double d;
     *     public AddOperator(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Double) j + d; }
     * }
     * DoubleEnumerable doubleIncrementalStream = DoubleStream.iterate(0, new AddOperator(1));
     * Iterator<Double> it = doubleIncrementalStream.iterator();
     * it.next(); // 0.0
     * it.next(); // 1.0
     * it.next(); // 2.0
     */
    public static DoubleEnumerable iterate(final Double seed, final IOperator operator) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.iterate(seed, operator));
    }

    /**
     * @description Returns an infinite `DoubleEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     *
     * @example
     * public class IsLessPredicate extends Predicate {
     *     private final Double d;
     *     public IsLessPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o < d; }
     * }
     * public class AddOperator extends Operator {
     *     private final Double d;
     *     public AddOperator(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Double) j + d; }
     * }
     * List<Double> doubles = DoubleStream.iterate(
     *     0,
     *     new IsLessPredicate(5),
     *     new AddOperator(1)
     * ).toList(); // [0.0, 1.0, 2.0, 3.0, 4.0]
     */
    public static DoubleEnumerable iterate(final Double seed, final IPredicate predicate, final IOperator operator) {
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `DoubleEnumerable` whose elements are all the
     * elements of the first `Iterable<Double>` followed by all the elements of the
     * second `Iterable<Double>`.
     *
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> concat = DoubleStream.concat(doubles1, doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public static DoubleEnumerable concat(final Iterable<Double> iterable1, final Iterable<Double> iterable2) {
        return concat(new List<Iterable<Double>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Double>>`.
     *
     * @param iterables the list of `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> concat = DoubleStream.concat(new List<Iterable<Double>>{ doubles1, doubles2 })
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public static DoubleEnumerable concat(final List<Iterable<Double>> iterables) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.concat(iterables, Double.class));
    }

    /**
     * @description Returns a combined `DoubleEnumerable` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Double) o1 + (Double) o2; }
     * }
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> zip = DoubleStream.zip(doubles1, doubles2, new SumBiOperator())
     *     .toList();
     * // [13.0, 6.0, 15.0, 11.0, 9.0, 18.0, 4.0, 7.0]
     */
    public static DoubleEnumerable zip(
        final Iterable<Double> iterable1,
        final Iterable<Double> iterable2,
        final IBiOperator combiner
    ) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.zip(iterable1, iterable2, combiner));
    }

    /**
     * @description Returns new `DoubleEnumerable` by appending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Double>` to append to the current stream
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> append = DoubleStream.of(doubles1)
     *     .append(doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public virtual override DoubleEnumerable append(final Iterable<Double> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `DoubleEnumerable` by prepending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Double>` to prepend to the current stream
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> prepend = DoubleStream.of(doubles1)
     *     .prepend(doubles2)
     *     .toList();
     * // [8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public virtual override DoubleEnumerable prepend(final Iterable<Double> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns a `DoubleEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> filtered = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .filter(BasePredicates.isEqual(5))
     *     .toList(); // [5, 5]
     */
    public virtual override DoubleEnumerable filter(final IPredicate predicate) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.filter(iterator(), predicate));
    }

    /**
     * @description Returns a `DoubleEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> firstFiltered = DoubleStream.of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .filter(BasePredicates.isEqual(0.1))
     *     .toList(); // [0.1, 0.1]
     */
    public virtual override DoubleEnumerable take(final IPredicate predicate) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.take(iterator(), predicate));
    }

    /**
     * @description Returns a `DoubleEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> rest = DoubleStream.of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .drop(BasePredicates.isEqual(0.1))
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable drop(final IPredicate predicate) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.drop(iterator(), predicate));
    }

    /**
     * @description Returns a `DoubleEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyDoubleOperator extends Operator {
     *     private final Double d;
     *     public MultiplyDoubleOperator(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Double) j * d; }
     * }
     * List<Double> doubledDoubles = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapTo(new MultiplyDoubleOperator(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public virtual override DoubleEnumerable mapTo(final IOperator mapper) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.mapTo(iterator(), (IFunction) mapper));
    }

    /**
     * @description Returns a `IntEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class RoundToIntFunction extends Function {
     *     public override Object apply(Object x) { return Math.round((Double) x); }
     * }
     * List<Integer> ints = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToInt(new RoundToIntFunction())
     *     .toList(); // [6, 0, 1, 3, -9, -6, 4, 4]
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `LongEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class RoundToLongFunction extends Function {
     *     public override Object apply(Object x) { return Math.roundToLong((Double) x); }
     * }
     * List<Long> longs = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToLong(new RoundToLongFunction())
     *     .toList(); // [6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L]
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object d) { return new Account(AnnualRevenue = (Double) d); }
     * }
     * List<Account> accounts = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { AnnualRevenue: 5.5 },
     *   { AnnualRevenue: 0.01 },
     *   { AnnualRevenue: 1.0 },
     *   { AnnualRevenue: 3 }
     * ]
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectStream.of((Iterator<SObject>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class ToStringFunction extends Function {
     *     public override Object apply(Object d) { return String.valueOf(d); }
     * }
     * List<String> strings = (List<String>) DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['5.5', '0.01', '1.0', '3']
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectStream.of(StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `DoubleEnumerable` with `Double` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyDoubleFunction extends Function {
     *     private final Double d;
     *     public MultiplyDoubleFunction(Double d) { this.d = d; }
     *     public override Object apply(Object o) { return new List<Double>{ ((Double) o) * d }; }
     * }
     * List<Double> doubles = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .flatMapTo(new MultiplyDoubleFunction(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public virtual override DoubleEnumerable flatMapTo(final IFunction mapper) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleEnumerable` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Double> doubles = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .forEach(new DebugConsumer()) // prints 5.5, 0.01, 1.0, 3
     *     .toList(); // [5.5, 0.01, 1.0, 3]
     */
    public virtual override DoubleEnumerable forEach(final IConsumer consumer) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.forEach(iterator(), consumer));
    }

    /**
     * @description Returns a `DoubleEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> distinct = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .distinct()
     *     .toList(); // [0.1, 5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable distinct() {
        return new DoubleStream((Iterator<Double>) StreamPipeline.distinct(iterator()));
    }

    /**
     * @description Returns a `DoubleEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> sorted = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort()
     *     .toList(); // [null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5]
     */
    public virtual override DoubleEnumerable sort() {
        return new DoubleStream((Iterator<Double>) StreamPipeline.sort(iterator()));
    }

    /**
     * @description Returns a new `DoubleEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Double> sorted = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null]
     */
    public virtual override DoubleEnumerable sort(final SortOrder order) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.sort(iterator(), order));
    }

    /**
     * @description Returns a `DoubleEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `DoubleEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Double> first3Doubles = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .lim(3)
     *     .toList(); // [0.1, 5, 1.5]
     */
    public virtual override DoubleEnumerable lim(final Integer lim) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.lim(iterator(), lim));
    }

    /**
     * @description Returns a new `DoubleEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `DoubleEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Double> restDoubles = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable skip(final Integer n) {
        return new DoubleStream((Iterator<Double>) StreamPipeline.skip(iterator(), n));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Double` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Double) o1 + (Double) o2; }
     * }
     * Double naiveSum = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .reduce((Double) 0.0, new SumBiOperator());
     * Double max = DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce((Double) 0.0, BaseBiOperators.max()); // 5.5
     */
    public virtual override Double reduce(final Double identity, final IBiOperator accumulator) {
        return (Double) StreamPipeline.reduce(iterator(), (Object) identity, accumulator);
    }

    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Double describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Double result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Double) o1 + (Double) o2; }
     * }
     * Double naiveSum = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .reduce(new SumBiOperator())
     *     .get();
     * Double max = (Double) DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce(BaseBiOperators.max())
     *     .get(); // 5.5
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Double) StreamPipeline.reduce(iterator(), accumulator));
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the function that returns a mutable result container
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `collector` is null
     *
     * @example
     * public class AddToDoubleSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
     * }
     * Set<Double> doubles = (Set<Double>)
     *     DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .collect(Collector.of(Supplier.of(Set<Double>.class), new AddToDoubleSetBiConsumer()));
     * // [5.5, 0.01, 1.0, 3, -8.99, -6, 4.01]
     */
    public virtual override Object collect(final ICollector collector) {
        return StreamPipeline.collect(iterator(), collector);
    }

    /**
     * @description Returns an `Optional` Double describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Double
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Double firstGreaterThan4Double = DoubleStream.of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
     *     .find(new IsGreaterPredicate(4))
     *     .get(); // 5.5
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Double) StreamPipeline.find(iterator(), predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `DoubleEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Boolean isEveryDoublePositive = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .every(new IsGreaterPredicate(0)); // true
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `DoubleEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Boolean isSomeDoubleGreaterThan6 = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .some(new IsGreaterPredicate(6)); // false
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = DoubleStream.of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
     *     .count(); // 10
     */
    public virtual override Integer count() {
        return StreamPipeline.count(iterator());
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * DoubleStream.of(new List<Double>{ 0.1, 0.2, 0.3 })
     *     .isEmpty(); // false
     * DoubleStream.of(new List<Double>())
     *     .isEmpty(); // true
     */
    public virtual override Boolean isEmpty() {
        return StreamPipeline.isEmpty(iterator());
    }

    /**
     * @description Accumulates elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Double>` containing the stream elements
     *
     * @example
     * List<Double> doubles = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override List<Double> toList() {
        return (List<Double>) StreamPipeline.toList(iterator(), Double.class);
    }

    /**
     * @description Accumulates elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Double>` containing the stream elements
     *
     * @example
     * Set<Double> doubles = DoubleStream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 5 })
     *     .skip(1)
     *     .toSet(); // [5, 1.5, Math.PI]
     */
    public virtual override Set<Double> toSet() {
        return StreamPipeline.toDoubleSet(iterator());
    }

    /**
     * @description Advances the iterator to its end.
     * <p>Terminal Operation.</p>
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * IRunnable doubleStream = (IRunnable) DoubleStream.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .forEach(new DebugConsumer());
     * // the `forEach` intermediate operation will not be performed until a terminal operation is initiated
     * doubleStream.run(); // prints 5.5, 0.01, 1.0, 3
     */
    public void run() {
        StreamPipeline.run(iterator());
    }
    // @end-group
    //</editor-fold>

}
