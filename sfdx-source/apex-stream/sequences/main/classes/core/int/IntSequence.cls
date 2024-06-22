/**
 * @description A sequence of `Integer` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 *
 * @see SObjectSequence
 * @see ObjectSequence
 * @see DoubleSequence
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * Integer sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToInt(getAnnualRevenueToIntFunction)
 *         .sum();
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public virtual inherited sharing class IntSequence extends IntEnumerable {

    private final List<Integer> integers;

    protected IntSequence() {
        this(new List<Integer>());
    }

    protected IntSequence(final List<Integer> integers) {
        this.integers = integers;
    }

    //<editor-fold desc="Iterator">
    // @start-group Iterator
    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Integer>`
     */
    public override Iterator<Integer> iterator() {
        return integers.iterator();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `IntEnumerable` created from `integers` list.
     *
     * @param integers the list of Longs
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IntEnumerable intSeq = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final List<Integer> integers) {
        Validate.notNull(integers);
        return new IntSequence(integers);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers` set.
     *
     * @param integers the set of Integers
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IntEnumerable intSeq = IntSequence.of(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final Set<Integer> integers) {
        Validate.notNull(integers);
        return new IntSequence(new List<Integer>(integers));
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers` list if non-null,
     * otherwise returns an empty `IntEnumerable`.
     *
     * @param integers the list of Integers
     *
     * @return the new `IntEnumerable` if `integers` is non-null,
     * otherwise an empty `IntEnumerable`
     *
     * @example
     * IntEnumerable intSeq = IntSequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final List<Integer> integers) {
        if (integers == null) { return empty(); }
        return new IntSequence(integers);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers` set if non-null,
     * otherwise returns an empty `IntEnumerable`.
     *
     * @param integers the set of Integers
     *
     * @return the new `IntEnumerable` if `integers` is non-null,
     * otherwise an empty `IntEnumerable`
     *
     * @example
     * IntEnumerable intSeq = IntSequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final Set<Integer> integers) {
        if (integers == null) { return empty(); }
        return new IntSequence(new List<Integer>(integers));
    }

    /**
     * @description Returns an empty `IntEnumerable`.
     *
     * @return the empty `IntEnumerable`
     */
    public static IntEnumerable empty() {
        return new IntSequence();
    }

    /**
     * @description Returns an ordered `IntEnumerable`
     * from `fromInt` (inclusive) to `toInt` (inclusive) by an incremental step of 1.
     *
     * @param fromInt the inclusive initial value
     * @param toInt the inclusive upper bound
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `fromInt` or `toInt` is null
     *
     * @example
     * IntEnumerable intSeqFrom0To100 = IntSequence.range(0, 100);
     */
    public static IntEnumerable range(final Integer fromInt, final Integer toInt) {
        return new IntSequence(SequencePipeline.rangeInt(fromInt, toInt));
    }

    /**
     * @description Returns eagerly concatenated `IntEnumerable` whose elements are all the
     * elements of the first `Iterable<Integer>` followed by all the elements of the
     * second `Iterable<Integer>`.
     *
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> concat = IntSequence.concat(ints1, ints2)
     *     .toList();
     * // [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
     */
    public static IntEnumerable concat(final Iterable<Integer> iterable1, final Iterable<Integer> iterable2) {
        return concat(new List<Iterable<Integer>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Integer>>`.
     *
     * @param iterables the list of `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> concat = IntSequence.concat(new List<Iterable<Integer>>{ ints1, ints2 })
     *     .toList();
     * // [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
     */
    public static IntEnumerable concat(final List<Iterable<Integer>> iterables) {
        return new IntSequence((List<Integer>) SequencePipeline.concat(iterables, new List<Integer>()));
    }

    /**
     * @description Returns a combined `IntEnumerable` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
     * }
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> zip = IntSequence.zip(ints1, ints2, new SumBiOperator())
     *     .toList();
     * // [13, 6, 15, 11, 9, 18, 4, 7]
     */
    public static IntEnumerable zip(
        final Iterable<Integer> iterable1,
        final Iterable<Integer> iterable2,
        final IBiOperator combiner
    ) {
        return new IntSequence(
            (List<Integer>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Integer>())
        );
    }

    /**
     * @description Returns new `IntEnumerable` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Integer>` to append to the current sequence
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> append = IntSequence.of(ints1)
     *     .append(ints2)
     *     .toList();
     * // [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
     */
    public virtual override IntEnumerable append(final Iterable<Integer> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `IntEnumerable` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Integer>` to prepend to the current sequence
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> prepend = IntSequence.of(ints1)
     *     .prepend(ints2)
     *     .toList();
     * // [8, 3, 6, 4, 4, 9, 1, 0, 5, 3, 9, 7, 5, 9, 3, 7]
     */
    public virtual override IntEnumerable prepend(final Iterable<Integer> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns a `IntEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> filtered = IntSequence.of(new List<Integer>{ 0, 5, 1, 1, 5 })
     *     .filter(Predicates.isEqual(5))
     *     .toList(); // [5, 5]
     */
    public virtual override IntEnumerable filter(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.filter(integers, predicate, new List<Integer>()));
    }

    /**
     * @description Returns a `IntEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> firstFiltered = IntSequence.of(new List<Integer>{ 0, 0, 1, 1, 5 })
     *     .take(Predicates.isEqual(0))
     *     .toList(); // [0, 0]
     */
    public virtual override IntEnumerable take(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.take(integers, predicate, new List<Integer>()));
    }

    /**
     * @description Returns a `IntEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> rest = IntSequence.of(new List<Integer>{ 0, 0, 1, 1, 5 })
     *     .drop(Predicates.isEqual(0))
     *     .toList(); // [1, 1, 5]
     */
    public virtual override IntEnumerable drop(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.drop(integers, predicate, new List<Integer>()));
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
     * public class MultiplyIntOperator extends Operator {
     *     private final Integer i;
     *     public MultiplyIntOperator(Integer i) { this.i = i; }
     *     public override Object apply(Object j) { return (Integer) j * i; }
     * }
     * List<Integer> doubledInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapTo(new MultiplyIntOperator(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public virtual override IntEnumerable mapTo(final IOperator mapper) {
        return new IntSequence((List<Integer>) SequencePipeline.mapTo(integers, mapper, new List<Integer>()));
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
     * public class MultiplyLongFunction extends Function {
     *     private final Long l;
     *     public MultiplyLongFunction(Long l) { this.l = l; }
     *     public override Object apply(Object j) { return (Integer) j * l; }
     * }
     * List<Long> doubledLongs = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapToLong(new MultiplyLongFunction(2))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(integers, mapper, new List<Long>()));
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
     *     public override Object apply(Object j) { return (Integer) j * d; }
     * }
     * List<Double> doubledDoubles = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapToDouble(new MultiplyDoubleFunction(2))
     *     .toList(); // [0.0, 10.0, 2.0, -20.0]
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(integers, mapper, new List<Double>()));
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
     *     public override Object apply(Object i) { return new Account(AnnualRevenue = (Integer) i); }
     * }
     * List<Account> accounts = IntSequence.of(new List<Integer>{ 0, 5, 1, 10 })
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
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(integers, mapper, new List<SObject>()));
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
     * List<String> strings = (List<String>) IntSequence.of(new List<Integer>{ 0, 5, 1, 10 })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['0', '5', '1', '10']
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.mapTo(integers, mapper, new List<Object>()));
    }

    /**
     * @description Returns a new `IntEnumerable` with `Integer` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyIntFunction extends Function {
     *     private final Integer i;
     *     public MultiplyIntFunction(Integer i) { this.i = i; }
     *     public override Object apply(Object o) { return new List<Integer>{ ((Integer) o) * i }; }
     * }
     * List<Integer> ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .flatMapTo(new MultiplyIntFunction(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public virtual override IntEnumerable flatMapTo(final IFunction mapper) {
        return new IntSequence((List<Integer>) SequencePipeline.flatMapTo(integers, mapper, new List<Integer>()));
    }

    /**
     * @description Returns a `IntEnumerable` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `IntEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Integer> ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
     *     .toList(); // [0, 5, 1, -10 ]
     */
    public virtual override IntEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(integers, consumer);
        return this;
    }

    /**
     * @description Returns a `IntEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntEnumerable`
     *
     * @example
     * List<Integer> distinct = IntSequence.of(new List<Integer>{ 0, 5, 1, -10, 0, 5 })
     *     .distinct()
     *     .toList(); // [0, 5, 1, -10];
     */
    public virtual override IntEnumerable distinct() {
        return new IntSequence((List<Integer>) SequencePipeline.distinct(integers, new List<Integer>()));
    }

    /**
     * @description Returns a `IntEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntEnumerable`
     *
     * @example
     * List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, null, 1, -10 })
     *     .sort()
     *     .toList(); // [null, -10, 0, 1, 5]
     */
    public virtual override IntEnumerable sort() {
        return new IntSequence((List<Integer>) SequencePipeline.sort(integers));
    }

    /**
     * @description Returns a `IntEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, null, 1, -10 })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5, 1, 0, -10, null]
     */
    public virtual override IntEnumerable sort(final SortOrder order) {
        return new IntSequence((List<Integer>) SequencePipeline.sort(integers, order));
    }

    /**
     * @description Returns a `IntEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `IntEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Integer> first3Ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .lim(3)
     *     .toList(); // [0, 5, 1]
     */
    public virtual override IntEnumerable lim(final Integer lim) {
        return new IntSequence((List<Integer>) SequencePipeline.lim(integers, lim, new List<Integer>()));
    }

    /**
     * @description Returns a new `IntEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `IntEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .skip(1)
     *     .toList(); // [5, 1, -10]
     */
    public virtual override IntEnumerable skip(final Integer n) {
        return new IntSequence((List<Integer>) SequencePipeline.skip(integers, n, new List<Integer>()));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Integer` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
     * }
     * public class ProductBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 * (Integer) o2; }
     * }
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, new SumBiOperator()); // -4
     * Integer factorialOfN = IntSequence.range(1, n).reduce(1, new ProductBiOperator());
     */
    public virtual override Integer reduce(final Integer identity, final IBiOperator accumulator) {
        return (Integer) SequencePipeline.reduce(integers, identity, accumulator);
    }

    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Integer describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Integer result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
     * }
     * Integer sum = (Integer) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .reduce(new SumBiOperator())
     *     .get(); // -4
     */
    public override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Integer) SequencePipeline.reduce(integers, accumulator));
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
     * public class AddToIntSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
     * }
     * Set<Integer> ints = (Set<Integer>)
     *     IntSequence.of(new List<Integer>{ 0, 5, 1, -10, 5, 0 })
     *     .collect(Collector.of(Supplier.of(Set<Integer>.class), new AddToIntSetBiConsumer()));
     * // [0, 5, 1, -10]
     */
    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(integers, collector);
    }

    /**
     * @description Returns an `Optional` Integer describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Integer
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Integer firstEvenInt = (Integer) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .find(new IsEvenPredicate())
     *     .get(); // 0
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Integer) SequencePipeline.find(integers, predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `IntEnumerable` is empty then `false` is returned.
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
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Boolean isEveryIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .every(new IsEvenPredicate()); // false
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(integers, predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IntEnumerable` is empty then `false` is returned.
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
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Boolean isSomeIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .some(new IsEvenPredicate()); // true
     */
    public override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(integers, predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     *
     * @example
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .sum(); // -4
     */
    public virtual override Integer sum() {
        return (Integer) SequencePipeline.avgInt(integers, false);
    }

    /**
     * @description Returns `Optional` Double describing the arithmetic mean of elements of this sequence,
     * or an empty `Optional` if this sequence is empty.
     * <p>Terminal Operation.</p>
     *
     * @return the arithmetic mean of elements
     *
     * @example
     * Double avg = (Double) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .avg()
     *     .get(); // -1.0
     */
    public virtual override Optional avg() {
        return Optional.of(SequencePipeline.avgInt(integers, true));
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .count(); // 4
     */
    public virtual override Integer count() {
        return integers.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .isEmpty(); // false
     * IntSequence.of(new List<Integer>())
     *     .isEmpty(); // true
     */
    public virtual override Boolean isEmpty() {
        return integers.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Integer>` containing the sequence elements
     *
     * @example
     * List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .lim(1)
     *     .toList();
     */
    public virtual override List<Integer> toList() {
        return integers;
    }

    /**
     * @description Accumulates elements into a `Set<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Integer>` containing the sequence elements
     *
     * @example
     * Set<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .lim(1)
     *     .toSet();
     */
    public virtual override Set<Integer> toSet() {
        return new Set<Integer>(integers);
    }
    // @end-group
    //</editor-fold>

}
