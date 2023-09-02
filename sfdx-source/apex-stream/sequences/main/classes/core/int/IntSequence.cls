/**
 * @description A sequence of `Integer` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 *
 * @see IntStream
 * @see SObjectSequence
 * @see ObjectSequence
 * @see DoubleSequence
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Integer sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToInt(getAnnualRevenueToIntFunction)
 *         .sum();
 */
public virtual inherited sharing class IntSequence extends IntEnumerable {

    private final List<Integer> integers;

    protected IntSequence() {
        this(new List<Integer>());
    }

    protected IntSequence(final List<Integer> integers) {
        this.integers = integers;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Integer>`
     */
    public override Iterator<Integer> iterator() {
        return integers.iterator();
    }

//    //<editor-fold desc="Conversion Operations">
//    // @start-group Conversion Operations
//    /**
//     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
//     *
//     * @return the `ObjectSequence`
//     */
//    public virtual IIterable toObjectIterable() {
//        return ObjectSequence.of(integers);
//    }
//    // @end-group
//    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `IntSequence` created from `integers` list.
     *
     * @param integers the list of Longs
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IIntIterable intSeq = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final List<Integer> integers) {
        Validate.notNull(integers);
        return new IntSequence(integers);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` set.
     *
     * @param integers the set of Integers
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IIntIterable intSeq = IntSequence.of(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final Set<Integer> integers) {
        Validate.notNull(integers);
        return new IntSequence(new List<Integer>(integers));
    }

    /**
     * @description Returns a `IntSequence` created from `integers` list if non-null,
     * otherwise returns an empty `IntSequence`.
     *
     * @param integers the list of Integers
     *
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     *
     * @example
     * IIntIterable intSeq = IntSequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final List<Integer> integers) {
        if (integers == null) { return empty(); }
        return new IntSequence(integers);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` set if non-null,
     * otherwise returns an empty `IntSequence`.
     *
     * @param integers the set of Integers
     *
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     *
     * @example
     * IIntIterable intSeq = IntSequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final Set<Integer> integers) {
        if (integers == null) { return empty(); }
        return new IntSequence(new List<Integer>(integers));
    }

    /**
     * @description Returns an empty `IntSequence`.
     *
     * @return the empty `IntSequence`
     */
    public static IntEnumerable empty() {
        return new IntSequence();
    }

    /**
     * @description Returns an ordered `IntSequence`
     * from `fromInt` (inclusive) to `toInt` (inclusive) by an incremental step of 1.
     *
     * @param fromInt the inclusive initial value
     * @param toInt the inclusive upper bound
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `fromInt` or `toInt` is null
     *
     * @example
     * IIntIterable intSeqFrom0To100 = IntSequence.range(0, 100);
     */
    public static IntEnumerable range(final Integer fromInt, final Integer toInt) {
        return new IntSequence(SequencePipeline.rangeInt(fromInt, toInt));
    }

    /**
     * @description Returns eagerly concatenated `IntSequence` whose elements are all the
     * elements of the first `Iterable<Integer>` followed by all the elements of the
     * second `Iterable<Integer>`.
     *
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * IIntIterable intSeq = IntSequence.concat(seq1, seq2);
     */
    public static IntEnumerable concat(final Iterable<Integer> iterable1, final Iterable<Integer> iterable2) {
        return concat(new List<Iterable<Integer>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Integer>>`.
     *
     * @param iterables the list of `Iterable<Integer>`
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * IIntIterable intSeq = IntSequence.concat(seqs);
     */
    public static IntEnumerable concat(final List<Iterable<Integer>> iterables) {
        return new IntSequence((List<Integer>) SequencePipeline.concat(iterables, new List<Integer>()));
//        Validate.noNullElements(iterables);
//        final List<Integer> integers = new List<Integer>();
//        for (Integer i = 0, size = iterables.size(); i < size; i++) {
//            integers.addAll(Iterators.toIntList((Iterator<Integer>) iterables[i].iterator()));
//        }
//        return new IntSequence(integers);
    }

    /**
     * @description Returns a combined `IntSequence` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IntEnumerable zip(
            final Iterable<Integer> iterable1,
            final Iterable<Integer> iterable2,
            final IBiOperator combiner
    ) {
        return new IntSequence(
            (List<Integer>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Integer>())
        );
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(combiner);
//        final List<Integer> results = new List<Integer>();
//        final List<Integer> left = Iterators.toIntList((Iterator<Integer>) iterable1.iterator());
//        final List<Integer> right = Iterators.toIntList((Iterator<Integer>) iterable2.iterator());
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            results.add((Integer) combiner.apply(left[i], right[i]));
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns new `IntSequence` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Integer>` to append to the current sequence
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IIntIterable intSeq = seq1.append(seq2);
     */
    public virtual override IntEnumerable append(final Iterable<Integer> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `IntSequence` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Integer>` to prepend to the current sequence
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IIntIterable intSeq = seq1.prepend(seq2);
     */
    public virtual override IntEnumerable prepend(final Iterable<Integer> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `IntStream` from the current sequence.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `IntStream`
//     *
//     * @example
//     * IIntIterable intStream = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).stream();
//     */
//    public virtual IntEnumerable stream() {
//        return IntStream.of(iterator());
//    }

    /**
     * @description Returns a `IntSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> filtered = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .filter(IntPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override IntEnumerable filter(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.filter(integers, predicate, new List<Integer>()));
//        Validate.notNull(predicate);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            final Integer j = (Integer) integers[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            }
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `IntSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> firstFiltered = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .take(IntPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override IntEnumerable take(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.take(integers, predicate, new List<Integer>()));
//        Validate.notNull(predicate);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            final Integer j = (Integer) integers[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            } else {
//                break;
//            }
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `IntSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> rest = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .drop(IntPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override IntEnumerable drop(final IPredicate predicate) {
        return new IntSequence((List<Integer>) SequencePipeline.drop(integers, predicate, new List<Integer>()));
//        Validate.notNull(predicate);
//        final List<Integer> results = new List<Integer>();
//        Boolean drop = true;
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            final Integer j = (Integer) integers[i];
//            if (!predicate.test(j) || !drop) {
//                results.add(j);
//                drop = false;
//            }
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntSequence`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Integer> incrementedInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapTo(IntUnaryOperators.add(1))
     *     .toList();
     */
    public virtual override IntEnumerable mapTo(final IOperator mapper) {
        return new IntSequence((List<Integer>) SequencePipeline.mapTo(integers, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            results.add((Integer) mapper.apply(integers[i]));
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `LongSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(integers, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            results.add((Long) mapper.apply(integers[i]));
//        }
//        return LongSequence.of(results);
    }

    /**
     * @description Returns a `DoubleSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(integers, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            results.add((Double) mapper.apply(integers[i]));
//        }
//        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(integers, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            results.add((SObject) mapper.apply(integers[i]));
//        }
//        return SObjectSequence.of(results);
    }

    /**
     * @description Returns a `ObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.mapTo(integers, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            results.add(mapper.apply(integers[i]));
//        }
//        return ObjectSequence.of(results);
    }

    public virtual override IntEnumerable flatMapTo(final IFunction mapper) {
        return new IntSequence((List<Integer>) SequencePipeline.flatMapTo(integers, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            final Iterable<Integer> result = (Iterable<Integer>) mapper.apply(integers[i]);
//            if (result != null) {
//                results.addAll(Iterators.toIntList(result.iterator()));
//            }
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `IntSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `IntSequence`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public virtual override IntEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(integers, consumer);
//        Validate.notNull(consumer);
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            consumer.accept(integers[i]);
//        }
        return this;
    }

    /**
     * @description Returns a `IntSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntSequence`
     *
     * @example
     * List<Integer> distinct = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .distinct()
     *     .toList();
     */
    public virtual override IntEnumerable distinct() {
        return new IntSequence((List<Integer>) SequencePipeline.distinct(integers, new List<Integer>()));
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            if (!results.contains((Integer) integers[i])) {
//                results.add((Integer) integers[i]);
//            }
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntSequence`
     *
     * @example
     * List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .sort()
     *     .toList();
     */
    public virtual override IntEnumerable sort() {
        return new IntSequence((List<Integer>) SequencePipeline.sort(integers));
//        final List<Integer> clone = (List<Integer>) integers.clone();
//        clone.sort();
//        return new IntSequence(clone);
    }

    public virtual override IntEnumerable sort(final SortOrder order) {
        return new IntSequence((List<Integer>) SequencePipeline.sort(integers, order));
//        return new IntSequence((List<Integer>) Lists.sort(integers, Comparer.defaultOrder().order(order)));
    }

    /**
     * @description Returns a `IntSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `IntSequence`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Integer> first3Ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .lim(3)
     *     .toList();
     */
    public virtual override IntEnumerable lim(final Integer lim) {
        return new IntSequence((List<Integer>) SequencePipeline.lim(integers, lim, new List<Integer>()));
//        Validate.notNull(lim);
//        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
//        if (lim == 0) { return IntSequence.empty(); }
//        if (lim >= integers.size()) { return this; }
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0; i < lim; i++) {
//            results.add((Integer) integers[i]);
//        }
//        return new IntSequence(results);
    }

    /**
     * @description Returns a new `IntSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `IntSequence`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .skip(1)
     *     .toList();
     */
    public virtual override IntEnumerable skip(final Integer n) {
        return new IntSequence((List<Integer>) SequencePipeline.skip(integers, n, new List<Integer>()));
//        Validate.notNull(n);
//        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
//        if (n == 0) { return this; }
//        if (n >= integers.size()) { return IntSequence.empty(); }
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            if (i >= n) {
//                results.add((Integer) integers[i]);
//            }
//        }
//        return new IntSequence(results);
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
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, IntBinaryOperators.sum());
     * Integer factorialOfN = IntSequence.range(1, n).reduce(1, IntBinaryOperators.product());
     */
    public virtual override Integer reduce(final Integer identity, final IBiOperator accumulator) {
        return (Integer) SequencePipeline.reduce(integers, identity, accumulator);
//        Validate.notNull(accumulator);
//        Integer result = (Integer) identity;
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            result = (Integer) accumulator.apply(result, integers[i]);
//        }
//        return result;
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
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *      .reduce(IntBinaryOperators.sum())
     *      .get();
     */
    public override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Integer) SequencePipeline.reduce(integers, accumulator));
//        Validate.notNull(accumulator);
//        Integer result;
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            result = i == 0 ? (Integer) integers[i] : (Integer) accumulator.apply(result, integers[i]);
//        }
//        return Optional.of(result);
    }

//    /**
//     * @description Performs a mutable reduction operation on elements, collecting elements
//     * to a container returned by `supplier` by applying `accumulator` function.
//     * <p>Terminal Operation.</p>
//     *
//     * @param supplier the function that returns a mutable result container
//     * @param accumulator the associative, non-interfering, stateless accumulation function
//     *
//     * @return the `Object` result of the collection
//     *
//     * @throws NullPointerException if `supplier` or `accumulator` is null
//     */
//    public virtual Object collect(final ISupplier supplier, final IObjectIntConsumer accumulator) {
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            accumulator.accept(container, integers[i]);
//        }
//        return container;
//    }

    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(integers, collector);
//        Validate.notNull(collector);
//        final Object container = collector.supplier().get();
//        final IBiConsumer accumulator = collector.accumulator();
//        final IFunction finisher = collector.finisher();
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            accumulator.accept(container, integers[i]);
//        }
//        return finisher == null ? container : finisher.apply(container);
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
     * Integer firstEvenInt = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .find(IntPredicates.isEven())
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Integer) SequencePipeline.find(integers, predicate));
//        Validate.notNull(predicate);
//        for (Integer i = 0, size = integers.size(); i < size; i++) {
//            final Integer j = (Integer) integers[i];
//            if (predicate.test(j)) {
//                return Optional.ofNullable(j);
//            }
//        }
//        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `IntSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .every(IntPredicates.isEven())
     *     .get();
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(integers, predicate, 1);
//        Validate.notNull(predicate);
//        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IntSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomeLongEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .some(IntPredicates.isEven())
     *     .get();
     */
    public override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(integers, predicate, 0);
//        Validate.notNull(predicate);
//        return match(predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     */
    public virtual override Integer sum() {
        Integer sum = 0;
        Integer i = 0;
        for (Integer size = integers.size(); i < size; i++) {
            sum += integers[i];
        }
        return i == 0 ? null : sum;
    }

    /**
     * @description Returns `Optional` Double describing the arithmetic mean of elements of this sequence,
     * or an empty `Optional` if this sequence is empty.
     * <p>Terminal Operation.</p>
     *
     * @return the arithmetic mean of elements
     */
    public virtual override Optional avg() {
        Double sum = 0.0;
        Integer i = 0;
        for (Integer size = integers.size(); i < size; i++) {
            sum += (Double) integers[i];
        }
        return i == 0 ? Optional.empty() : Optional.of(sum / i);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     */
    public virtual override Integer count() {
        return integers.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
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
