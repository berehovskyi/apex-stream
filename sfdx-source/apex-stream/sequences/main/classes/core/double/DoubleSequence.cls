/**
 * @description A sequence of `Double` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 * <p><a href="https://en.wikipedia.org/wiki/Monte_Carlo_method">Monte Carlo method</a></p>
 *
 * @see SObjectSequence
 * @see ObjectSequence
 * @see IntSequence
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * // Approximating the value of π using Monte Carlo method and sequences
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
 * IDoubleEnumerable x = DoubleSequence.generate(new RandomDoubleSupplier());
 * IDoubleEnumerable y = DoubleSequence.generate(new RandomDoubleSupplier());
 * IDoubleBinaryOperator euclidean = new EuclideanDistanceBiOperator();
 * // The number of points inside the quadrant,
 * // i.e. having a distance from the origin of less than 1
 * Integer n = DoubleSequence.zip(x, y, euclidean)
 *       .lim(s)
 *       .filter(new IsLessPredicate(1))
 *       .count();
 * // The ratio of the inside-count and the total-sample-count is an estimate of the ratio
 * // of the two areas, π / 4. Multiply the result by 4 to estimate π.
 * Double approxPi = 4 * n / (Double) s;
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public virtual inherited sharing class DoubleSequence extends DoubleEnumerable {

    private final List<Double> doubles;

    protected DoubleSequence() {
        this(new List<Double>());
    }

    protected DoubleSequence(final List<Double> doubles) {
        this.doubles = doubles;
    }

    //<editor-fold desc="Iterator">
    // @start-group Iterator
    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Long>`
     */
    public override Iterator<Double> iterator() {
        return doubles.iterator();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` list.
     *
     * @param doubles the list of Doubles
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * DoubleEnumerable doubleSeq = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final List<Double> doubles) {
        Validate.notNull(doubles);
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` set.
     *
     * @param doubles the set of Doubles
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * DoubleEnumerable doubleSeq = DoubleSequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Set<Double> doubles) {
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` list if non-null,
     * otherwise returns an empty `DoubleEnumerable`.
     *
     * @param doubles the list of Doubles
     *
     * @return the new `DoubleEnumerable` if `doubles` is non-null,
     * otherwise an empty `DoubleEnumerable`
     *
     * @example
     * DoubleEnumerable doubleSeq = DoubleSequence.ofNullable(new List<Double>{ 0, 5L, 1L, -10 });
     */
    public static DoubleEnumerable ofNullable(final List<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` set if non-null,
     * otherwise returns an empty `DoubleEnumerable`.
     *
     * @param doubles the set of Doubles
     *
     * @return the new `DoubleEnumerable` if `doubles` is non-null,
     * otherwise an empty `DoubleEnumerable`
     *
     * @example
     * DoubleEnumerable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5, 1, -10 });
     */
    public static DoubleEnumerable ofNullable(final Set<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns an empty `DoubleEnumerable`.
     *
     * @return the empty `DoubleEnumerable`
     */
    public static DoubleEnumerable empty() {
        return new DoubleSequence();
    }

    /**
     * @description Returns eagerly concatenated `DoubleEnumerable` whose elements are all the
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
     * List<Double> concat = DoubleSequence.concat(doubles1, doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public static DoubleEnumerable concat(final Iterable<Double> iterable1, final Iterable<Double> iterable2) {
        return concat(new List<Iterable<Double>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Double>>`.
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
     * List<Double> concat = DoubleSequence.concat(new List<Iterable<Double>>{ doubles1, doubles2 })
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public static DoubleEnumerable concat(final List<Iterable<Double>> iterables) {
        return new DoubleSequence((List<Double>) SequencePipeline.concat(iterables, new List<Double>()));
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
     * List<Double> zip = DoubleSequence.zip(doubles1, doubles2, new SumBiOperator())
     *     .toList();
     * // [13.0, 6.0, 15.0, 11.0, 9.0, 18.0, 4.0, 7.0]
     */
    public static DoubleEnumerable zip(
        final Iterable<Double> iterable1,
        final Iterable<Double> iterable2,
        final IBiOperator combiner
    ) {
        return new DoubleSequence(
            (List<Double>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Double>())
        );
    }

    /**
     * @description Returns new `DoubleEnumerable` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Double>` to append to the current sequence
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> append = DoubleSequence.of(doubles1)
     *     .append(doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public virtual override DoubleEnumerable append(final Iterable<Double> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `DoubleEnumerable` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Double>` to prepend to the current sequence
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> prepend = DoubleSequence.of(doubles1)
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
     * List<Double> filtered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .filter(Predicates.isEqual(5))
     *     .toList(); // [5, 5]
     */
    public virtual override DoubleEnumerable filter(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.filter(doubles, predicate, new List<Double>()));
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
     * List<Double> firstFiltered = DoubleSequence.of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .filter(Predicates.isEqual(0.1))
     *     .toList(); // [0.1, 0.1]
     */
    public virtual override DoubleEnumerable take(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.take(doubles, predicate, new List<Double>()));
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
     * List<Double> rest = DoubleSequence.of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .drop(Predicates.isEqual(0.1))
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable drop(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.drop(doubles, predicate, new List<Double>()));
    }

    /**
     * @description Returns a `DoubleEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
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
     * List<Double> doubledDoubles = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapTo(new MultiplyDoubleOperator(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public virtual override DoubleEnumerable mapTo(final IOperator mapper) {
        return new DoubleSequence((List<Double>) SequencePipeline.mapTo(doubles, mapper, new List<Double>()));
    }

    /**
     * @description Returns a `IntEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
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
     * List<Integer> ints = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToInt(new RoundToIntFunction())
     *     .toList(); // [6, 0, 1, 3, -9, -6, 4, 4]
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(doubles, mapper, new List<Integer>()));
    }

    /**
     * @description Returns a `LongEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
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
     * List<Long> longs = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToLong(new RoundToLongFunction())
     *     .toList(); // [6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L]
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(doubles, mapper, new List<Long>()));
    }

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
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
     * List<Account> accounts = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
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
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(doubles, mapper, new List<SObject>()));
    }

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
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
     * List<String> strings = (List<String>) DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['5.5', '0.01', '1.0', '3']
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.mapTo(doubles, mapper, new List<Object>()));
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
     * List<Double> doubles = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .flatMapTo(new MultiplyDoubleFunction(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public virtual override DoubleEnumerable flatMapTo(final IFunction mapper) {
        return new DoubleSequence((List<Double>) SequencePipeline.flatMapTo(doubles, mapper, new List<Double>()));
    }

    /**
     * @description Returns a `DoubleEnumerable` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `DoubleEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Double> doubles = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .forEach(new DebugConsumer()) // prints 5.5, 0.01, 1.0, 3
     *     .toList(); // [5.5, 0.01, 1.0, 3]
     */
    public virtual override DoubleEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(doubles, consumer);
        return this;
    }

    /**
     * @description Returns a `DoubleEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> distinct = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .distinct()
     *     .toList(); // [0.1, 5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable distinct() {
        return new DoubleSequence((List<Double>) SequencePipeline.distinct(doubles, new List<Double>()));
    }

    /**
     * @description Returns a `DoubleEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> sorted = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort()
     *     .toList(); // [null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5]
     */
    public virtual override DoubleEnumerable sort() {
        return new DoubleSequence((List<Double>) SequencePipeline.sort(doubles));
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
     * List<Double> sorted = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null]
     */
    public virtual override DoubleEnumerable sort(final SortOrder order) {
        return new DoubleSequence((List<Double>) SequencePipeline.sort(doubles, order));
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
     * List<Double> first3Doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .lim(3)
     *     .toList(); // [0.1, 5, 1.5]
     */
    public virtual override DoubleEnumerable lim(final Integer lim) {
        return new DoubleSequence((List<Double>) SequencePipeline.lim(doubles, lim, new List<Double>()));
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
     * List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override DoubleEnumerable skip(final Integer n) {
        return new DoubleSequence((List<Double>) SequencePipeline.skip(doubles, n, new List<Double>()));
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
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .reduce((Double) 0.0, new SumBiOperator());
     * Double max = DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce((Double) 0.0, BiOperators.max()); // 5.5
     */
    public virtual override Double reduce(final Double identity, final IBiOperator accumulator) {
        return (Double) SequencePipeline.reduce(doubles, identity, accumulator);
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
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .reduce(new SumBiOperator())
     *     .get();
     * Double max = (Double) DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce(BiOperators.max())
     *     .get(); // 5.5
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Double) SequencePipeline.reduce(doubles, accumulator));
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
     *     DoubleSequence.of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .collect(Collector.of(Supplier.of(Set<Double>.class), new AddToDoubleSetBiConsumer()));
     * // [5.5, 0.01, 1.0, 3, -8.99, -6, 4.01]
     */
    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(doubles, collector);
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
     * Double firstGreaterThan4Double = DoubleSequence.of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
     *     .find(new IsGreaterPredicate(4))
     *     .get(); // 5.5
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Double) SequencePipeline.find(doubles, predicate));
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
     * Boolean isEveryDoublePositive = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .every(new IsGreaterPredicate(0)); // true
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(doubles, predicate, 1);
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
     * Boolean isSomeDoubleGreaterThan6 = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .some(new IsGreaterPredicate(6)); // false
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(doubles, predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = DoubleSequence.of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
     *     .count(); // 10
     */
    public virtual override Integer count() {
        return doubles.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * DoubleSequence.of(new List<Double>{ 0.1, 0.2, 0.3 })
     *     .isEmpty(); // false
     * DoubleSequence.of(new List<Double>())
     *     .isEmpty(); // true
     */
    public virtual override Boolean isEmpty() {
        return doubles.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Double>` containing the sequence elements
     *
     * @example
     * List<Double> doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public virtual override List<Double> toList() {
        return doubles;
    }

    /**
     * @description Accumulates elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Double>` containing the sequence elements
     *
     * @example
     * Set<Double> doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 5 })
     *     .skip(1)
     *     .toSet(); // [5, 1.5, Math.PI]
     */
    public virtual override Set<Double> toSet() {
        return new Set<Double>(doubles);
    }
    // @end-group
    //</editor-fold>

}
