/**
 * @description A sequence of `Long` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 *
 * @see SObjectSequence
 * @see ObjectSequence
 * @see DoubleSequence
 * @see IntSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * Long sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToLong(getAnnualRevenueToLongFunction)
 *         .sum();
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public virtual inherited sharing class LongSequence extends LongEnumerable {

    private final List<Long> longs;

    protected LongSequence() {
        this(new List<Long>());
    }

    protected LongSequence(final List<Long> longs) {
        this.longs = longs;
    }

    //<editor-fold desc="Iterator">
    // @start-group Iterator
    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Long>`
     */
    public override Iterator<Long> iterator() {
        return longs.iterator();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `LongEnumerable` created from `longs` list.
     *
     * @param longs the list of Longs
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `longs` is null
     *
     * @example
     * LongEnumerable longSeq = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final List<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs` set.
     *
     * @param longs the set of Longs
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `longs` is null
     *
     * @example
     * LongEnumerable longSeq = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final Set<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs` list if non-null,
     * otherwise returns an empty `LongEnumerable`.
     *
     * @param longs the list of Longs
     *
     * @return the new `LongEnumerable` if `longs` is non-null,
     * otherwise an empty `LongEnumerable`
     *
     * @example
     * LongEnumerable longSeq = LongSequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final List<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs` set if non-null,
     * otherwise returns an empty `LongEnumerable`.
     *
     * @param longs the set of Longs
     *
     * @return the new `LongEnumerable` if `longs` is non-null,
     * otherwise an empty `LongEnumerable`
     *
     * @example
     * LongEnumerable longSeq = LongSequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final Set<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns an empty `LongEnumerable`.
     *
     * @return the empty `LongEnumerable`
     */
    public static LongEnumerable empty() {
        return new LongSequence();
    }

    /**
     * @description Returns an ordered `LongEnumerable`
     * from `fromLong` (inclusive) to `toLong` (inclusive) by an incremental step of 1.
     *
     * @param fromLong the inclusive initial value
     * @param toLong the inclusive upper bound
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `fromLong` or `toLong` is null
     *
     * @example
     * LongEnumerable longSeqFrom0To100 = LongSequence.range(0, 100);
     */
    public static LongEnumerable range(final Long fromLong, final Long toLong) {
        return new LongSequence(SequencePipeline.rangeLong(fromLong, toLong));
    }

    /**
     * @description Returns eagerly concatenated `LongEnumerable` whose elements are all the
     * elements of the first `Iterable<Long>` followed by all the elements of the
     * second `Iterable<Long>`.
     *
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> concat = LongSequence.concat(longs1, longs2)
     *     .toList();
     * // [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
     */
    public static LongEnumerable concat(final Iterable<Long> iterable1, final Iterable<Long> iterable2) {
        return concat(new List<Iterable<Long>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Long>>`.
     *
     * @param iterables the list of `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> concat = LongSequence.concat(new List<Iterable<Long>>{ longs1, longs2 })
     *     .toList();
     * // [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
     */
    public static LongEnumerable concat(final List<Iterable<Long>> iterables) {
        return new LongSequence((List<Long>) SequencePipeline.concat(iterables, new List<Long>()));
    }

    /**
     * @description Returns a combined `LongEnumerable` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
     * }
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> zip = LongSequence.zip(longs1, longs2, new SumBiOperator())
     *     .toList();
     * // [13L, 6L, 15L, 11L, 9L, 18L, 4L, 7L]
     */
    public static LongEnumerable zip(
        final Iterable<Long> iterable1,
        final Iterable<Long> iterable2,
        final IBiOperator combiner
    ) {
        return new LongSequence(
            (List<Long>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Long>())
        );
    }

    /**
     * @description Returns new `LongEnumerable` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Long>` to append to the current sequence
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> append = LongSequence.of(longs1)
     *     .append(longs2)
     *     .toList();
     * // [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
     */
    public virtual override LongEnumerable append(final Iterable<Long> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `LongEnumerable` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Long>` to prepend to the current sequence
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> append = LongSequence.of(longs1)
     *     .prepend(longs2)
     *     .toList();
     * // [8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L, 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L]
     */
    public virtual override LongEnumerable prepend(final Iterable<Long> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns a `LongEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> filtered = LongSequence.of(new List<Long>{ 0L, 5L, 1L, 1L, 5L })
     *     .filter(Predicates.isEqual(5L))
     *     .toList(); // [5L, 5L]
     */
    public virtual override LongEnumerable filter(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.filter(longs, predicate, new List<Long>()));
    }

    /**
     * @description Returns a `LongEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> firstFiltered = LongSequence.of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
     *     .take(Predicates.isEqual(0L))
     *     .toList(); // [0L, 0L]
     */
    public virtual override LongEnumerable take(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.take(longs, predicate, new List<Long>()));
    }

    /**
     * @description Returns a `LongEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> rest = LongSequence.of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
     *     .drop(Predicates.isEqual(0L))
     *     .toList(); // [1L, 1L, 5L]
     */
    public virtual override LongEnumerable drop(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.drop(longs, predicate, new List<Long>()));
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
     * public class MultiplyLongOperator extends Operator {
     *     private final Long l;
     *     public MultiplyLongOperator(Long l) { this.l = l; }
     *     public override Object apply(Object j) { return (Long) j * l; }
     * }
     * List<Long> doubledLongs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapTo(new MultiplyLongOperator(2))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public virtual override LongEnumerable mapTo(final IOperator mapper) {
        return new LongSequence((List<Long>) SequencePipeline.mapTo(longs, mapper, new List<Long>()));
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
     * public class MultiplyIntFunction extends Function {
     *     private final Integer i;
     *     public MultiplyIntFunction(Integer i) { this.i = i; }
     *     public override Object apply(Object j) { return (Long) j * i; }
     * }
     * List<Integer> doubledInts = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToLong(new MultiplyIntFunction(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(longs, mapper, new List<Integer>()));
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
     * public class MultiplyDoubleFunction extends Function {
     *     private final Double d;
     *     public MultiplyDoubleFunction(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Long) j * d; }
     * }
     * List<Double> doubledDoubles = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToDouble(new MultiplyDoubleFunction(2))
     *     .toList(); // [0.0, 10.0, 2.0, -20.0]
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(longs, mapper, new List<Double>()));
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
     *     public override Object apply(Object i) { return new Account(AnnualRevenue = (Long) i); }
     * }
     * List<Account> accounts = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { AnnualRevenue: 0 },
     *   { AnnualRevenue: 5 },
     *   { AnnualRevenue: 1 },
     *   { AnnualRevenue: 10 }
     * ]
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(longs, mapper, new List<SObject>()));
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
     *     public override Object apply(Object i) { return String.valueOf(i); }
     * }
     * List<String> strings = (List<String>) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['0', '5', '1', '10']
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.mapTo(longs, mapper, new List<Object>()));
    }

    /**
     * @description Returns a new `LongEnumerable` with `Long` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyLongFunction extends Function {
     *     private final Long l;
     *     public MultiplyLongFunction(Long l) { this.l = l; }
     *     public override Object apply(Object o) { return new List<Long>{ ((Long) o) * l }; }
     * }
     * List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .flatMapTo(new MultiplyLongFunction(2L))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public virtual override LongEnumerable flatMapTo(final IFunction mapper) {
        return new LongSequence((List<Long>) SequencePipeline.flatMapTo(longs, mapper, new List<Long>()));
    }

    /**
     * @description Returns a `LongEnumerable` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `LongEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
     *     .toList(); // [0L, 5L, 1L, -10L ]
     */
    public virtual override LongEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(longs, consumer);
        return this;
    }

    /**
     * @description Returns a `LongEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongEnumerable`
     *
     * @example
     * List<Long> distinct = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L, 0L, 5L })
     *     .distinct()
     *     .toList(); // [0L, 5L, 1L, -10L]
     */
    public virtual override LongEnumerable distinct() {
        return new LongSequence((List<Long>) SequencePipeline.distinct(longs, new List<Long>()));
    }

    /**
     * @description Returns a `LongEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongEnumerable`
     *
     * @example
     * List<Long> sorted = LongSequence.of(new List<Long>{ 0L, 5L, null, 1L, -10L })
     *     .sort()
     *     .toList(); // [null, -10L, 0L, 1L, 5L]
     */
    public virtual override LongEnumerable sort() {
        return new LongSequence((List<Long>) SequencePipeline.sort(longs));
    }

    /**
     * @description Returns a `LongEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Long> sorted = LongSequence.of(new List<Long>{ 0L, 5L, null, 1L, -10L })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5L, 1L, 0L, -10L, null]
     */
    public virtual override LongEnumerable sort(final SortOrder order) {
        return new LongSequence((List<Long>) SequencePipeline.sort(longs, order));
    }

    /**
     * @description Returns a `LongEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `LongEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Long> first3Longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .lim(3)
     *     .toList(); // [0L, 5L, 1L]
     */
    public virtual override LongEnumerable lim(final Integer lim) {
        return new LongSequence((List<Long>) SequencePipeline.lim(longs, lim, new List<Long>()));
    }

    /**
     * @description Returns a new `LongEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `LongEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Long> restLongs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toList(); // [5L, 1L, -10L]
     */
    public virtual override LongEnumerable skip(final Integer n) {
        return new LongSequence((List<Long>) SequencePipeline.skip(longs, n, new List<Long>()));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Long` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
     * }
     * public class ProductBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 * (Long) o2; }
     * }
     * Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).reduce(0L, new SumBiOperator()); // -4L
     * Long factorialOfN = LongSequence.range(1, n).reduce(1, new ProductBiOperator());
     */
    public virtual override Long reduce(final Long identity, final IBiOperator accumulator) {
        return (Long) SequencePipeline.reduce(longs, identity, accumulator);
    }

    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Long describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Long result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
     * }
     * Long sum = (Long) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .reduce(new SumBiOperator())
     *     .get(); // -4L
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Long) SequencePipeline.reduce(longs, accumulator));
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
     * public class AddToLongSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
     * }
     * Set<Long> longs = (Set<Long>)
     *     LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L, 5L, 0L })
     *     .collect(Collector.of(Supplier.of(Set<Long>.class), new AddToLongSetBiConsumer()));
     * // [0L, 5L, 1L, -10L]
     */
    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(longs, collector);
    }

    /**
     * @description Returns an `Optional` Long describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Long
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Long firstEvenLong = (Long) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .find(new IsEvenPredicate())
     *     .get(); // 0L
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Long) SequencePipeline.find(longs, predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `LongEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Boolean isEveryLongEven = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .every(new IsEvenPredicate()); // false
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(longs, predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `LongEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Boolean isSomeLongEven = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .some(new IsEvenPredicate()); // true
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(longs, predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     *
     * @example
     * Long sum = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .sum(); // -4L
     */
    public virtual override Long sum() {
        return (Long) SequencePipeline.avgLong(longs, false);
    }

    /**
     * @description Returns `Optional` Double describing the arithmetic mean of elements of this sequence,
     * or an empty `Optional` if this sequence is empty.
     * <p>Terminal Operation.</p>
     *
     * @return the arithmetic mean of elements
     *
     * @example
     * Double avg = (Double) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .avg()
     *     .get(); // 1.0
     */
    public virtual override Optional avg() {
        return Optional.of(SequencePipeline.avgLong(longs, true));
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .count(); // 4
     */
    public virtual override Integer count() {
        return longs.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .isEmpty(); // false
     * LongSequence.of(new List<Long>())
     *     .isEmpty(); // true
     */
    public virtual override Boolean isEmpty() {
        return longs.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Long>` containing the sequence elements
     *
     * @example
     * List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toList(); // [5L, 1L, -10L]
     */
    public virtual override List<Long> toList() {
        return longs;
    }

    /**
     * @description Accumulates elements into a `Set<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Long>` containing the sequence elements
     *
     * @example
     * Set<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toSet(); // [5L, 1L, -10L, 0L]
     */
    public virtual override Set<Long> toSet() {
        return new Set<Long>(longs);
    }
    // @end-group
    //</editor-fold>

}
