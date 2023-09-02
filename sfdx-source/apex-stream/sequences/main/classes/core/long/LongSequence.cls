/**
 * @description A sequence of `Long` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 *
 * @see LongStream
 * @see SObjectSequence
 * @see ObjectSequence
 * @see DoubleSequence
 * @see IntSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Long sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToLong(getAnnualRevenueToLongFunction)
 *         .sum();
 */
public virtual inherited sharing class LongSequence extends LongEnumerable {

    private final List<Long> longs;

    protected LongSequence() {
        this(new List<Long>());
    }

    protected LongSequence(final List<Long> longs) {
        this.longs = longs;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Long>`
     */
    public override Iterator<Long> iterator() {
        return longs.iterator();
    }

//    //<editor-fold desc="Conversion Operations">
//    // @start-group Conversion Operations
//    /**
//     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
//     *
//     * @return the `ObjectSequence`
//     */
//    public virtual IIterable toObjectIterable() {
//        return ObjectSequence.of(longs);
//    }
//    // @end-group
//    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `LongSequence` created from `longs` list.
     *
     * @param longs the list of Longs
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `longs` is null
     *
     * @example
     * ILongIterable longSeq = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final List<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` set.
     *
     * @param longs the set of Longs
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `longs` is null
     *
     * @example
     * ILongIterable longSeq = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final Set<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns a `LongSequence` created from `longs` list if non-null,
     * otherwise returns an empty `LongSequence`.
     *
     * @param longs the list of Longs
     *
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     *
     * @example
     * ILongIterable longSeq = LongSequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final List<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` set if non-null,
     * otherwise returns an empty `LongSequence`.
     *
     * @param longs the set of Longs
     *
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     *
     * @example
     * ILongIterable longSeq = LongSequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final Set<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns an empty `LongSequence`.
     *
     * @return the empty `LongSequence`
     */
    public static LongEnumerable empty() {
        return new LongSequence();
    }

    /**
     * @description Returns an ordered `LongSequence`
     * from `fromLong` (inclusive) to `toLong` (inclusive) by an incremental step of 1.
     *
     * @param fromLong the inclusive initial value
     * @param toLong the inclusive upper bound
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `fromLong` or `toLong` is null
     *
     * @example
     * ILongIterable longSeqFrom0To100 = LongSequence.range(0, 100);
     */
    public static LongEnumerable range(final Long fromLong, final Long toLong) {
        return new LongSequence(SequencePipeline.rangeLong(fromLong, toLong));
    }

    /**
     * @description Returns eagerly concatenated `LongSequence` whose elements are all the
     * elements of the first `Iterable<Long>` followed by all the elements of the
     * second `Iterable<Long>`.
     *
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * ILongIterable longSeq = LongSequence.concat(seq1, seq2);
     */
    public static LongEnumerable concat(final Iterable<Long> iterable1, final Iterable<Long> iterable2) {
        return concat(new List<Iterable<Long>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Long>>`.
     *
     * @param iterables the list of `Iterable<Long>`
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * ILongIterable longSeq = LongStream.concat(seqs);
     */
    public static LongEnumerable concat(final List<Iterable<Long>> iterables) {
        return new LongSequence((List<Long>) SequencePipeline.concat(iterables, new List<Long>()));
//        Validate.noNullElements(iterables);
//        final List<Long> longs = new List<Long>();
//        for (Integer i = 0, size = iterables.size(); i < size; i++) {
//            longs.addAll(Iterators.toLongList((Iterator<Long>) iterables[i].iterator()));
//        }
//        return new LongSequence(longs);
    }

    /**
     * @description Returns a combined `LongSequence` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static LongEnumerable zip(
            final Iterable<Long> iterable1,
            final Iterable<Long> iterable2,
            final IBiOperator combiner
    ) {
        return new LongSequence(
            (List<Long>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Long>())
        );
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(combiner);
//        final List<Long> results = new List<Long>();
//        final List<Long> left = Iterators.toLongList((Iterator<Long>) iterable1.iterator());
//        final List<Long> right = Iterators.toLongList((Iterator<Long>) iterable2.iterator());
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            results.add((Long) combiner.apply(left[i], right[i]));
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns new `LongSequence` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Long>` to append to the current sequence
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ILongIterable longSeq = seq1.append(seq2);
     */
    public virtual override LongEnumerable append(final Iterable<Long> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `LongSequence` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Long>` to prepend to the current sequence
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ILongIterable longSeq = seq1.prepend(seq2);
     */
    public virtual override LongEnumerable prepend(final Iterable<Long> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `LongStream` from the current sequence.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `LongStream`
//     *
//     * @example
//     * ILongIterable longStream = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).stream();
//     */
//    public virtual LongEnumerable stream() {
//        return LongStream.of(iterator());
//    }

    /**
     * @description Returns a `LongSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> filtered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .filter(LongPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override LongEnumerable filter(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.filter(longs, predicate, new List<Long>()));
//        Validate.notNull(predicate);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            final Long j = (Long) longs[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            }
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> firstFiltered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .take(LongPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override LongEnumerable take(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.take(longs, predicate, new List<Long>()));
//        Validate.notNull(predicate);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            final Long j = (Long) longs[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            } else {
//                break;
//            }
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> rest = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .drop(LongPredicates.isGreater(0))
     *     .toList();
     */
    public virtual override LongEnumerable drop(final IPredicate predicate) {
        return new LongSequence((List<Long>) SequencePipeline.drop(longs, predicate, new List<Long>()));
//        Validate.notNull(predicate);
//        final List<Long> results = new List<Long>();
//        Boolean drop = true;
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            final Long o = (Long) longs[i];
//            if (!predicate.test(o) || !drop) {
//                results.add(o);
//                drop = false;
//            }
//        }
//        return new LongSequence(results);
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
     *
     * @example
     * List<Long> incrementedLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .mapTo(LongUnaryOperators.add(1L))
     *     .toList();
     */
    public virtual override LongEnumerable mapTo(final IOperator mapper) {
        return new LongSequence((List<Long>) SequencePipeline.mapTo(longs, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            results.add((Long) mapper.apply(longs[i]));
//        }
//        return new LongSequence(results);
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
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(longs, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            results.add((Integer) mapper.apply(longs[i]));
//        }
//        return IntSequence.of(results);
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
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(longs, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            results.add((Double) mapper.apply(longs[i]));
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
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(longs, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            results.add((SObject) mapper.apply(longs[i]));
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
        return ObjectSequence.of(SequencePipeline.mapTo(longs, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            results.add(mapper.apply(longs[i]));
//        }
//        return ObjectSequence.of(results);
    }

    public virtual override LongEnumerable flatMapTo(final IFunction mapper) {
        return new LongSequence((List<Long>) SequencePipeline.flatMapTo(longs, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            final Iterable<Long> result = (Iterable<Long>) mapper.apply(longs[i]);
//            if (result != null) {
//                results.addAll(Iterators.toLongList(result.iterator()));
//            }
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `LongSequence`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public virtual override LongEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(longs, consumer);
//        Validate.notNull(consumer);
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            consumer.accept(longs[i]);
//        }
        return this;
    }

    /**
     * @description Returns a `LongSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongSequence`
     *
     * @example
     * List<Long> distinct = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .distinct()
     *     .toList();
     */
    public virtual override LongEnumerable distinct() {
        return new LongSequence((List<Long>) SequencePipeline.distinct(longs, new List<Long>()));
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            if (!results.contains((Long) longs[i])) {
//                results.add((Long) longs[i]);
//            }
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongSequence`
     *
     * @example
     * List<Long> sorted = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .sort()
     *     .toList();
     */
    public virtual override LongEnumerable sort() {
        return new LongSequence((List<Long>) SequencePipeline.sort(longs));
//        final List<Long> clone = (List<Long>) longs.clone();
//        clone.sort();
//        return new LongSequence(clone);
    }

    public virtual override LongEnumerable sort(final SortOrder order) {
        return new LongSequence((List<Long>) SequencePipeline.sort(longs, order));
    }

    /**
     * @description Returns a `LongSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `LongSequence`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Long> first3Longs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .lim(3)
     *     .toList();
     */
    public virtual override LongEnumerable lim(final Integer lim) {
        return new LongSequence((List<Long>) SequencePipeline.lim(longs, lim, new List<Long>()));
//        Validate.notNull(lim);
//        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
//        if (lim == 0) { return LongSequence.empty(); }
//        if (lim >= longs.size()) { return this; }
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0; i < lim; i++) {
//            results.add((Long) longs[i]);
//        }
//        return new LongSequence(results);
    }

    /**
     * @description Returns a new `LongSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `LongSequence`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Long> restLongs = LongStream.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .skip(1)
     *     .toList();
     */
    public virtual override LongEnumerable skip(final Integer n) {
        return new LongSequence((List<Long>) SequencePipeline.skip(longs, n, new List<Long>()));
//        Validate.notNull(n);
//        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
//        if (n == 0) { return this; }
//        if (n >= longs.size()) { return LongSequence.empty(); }
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            if (i >= n) {
//                results.add((Long) longs[i]);
//            }
//        }
//        return new LongSequence(results);
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
     * Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).reduce(0L, LongBinaryOperators.sum());
     * Long factorialOfN = LongSequence.range(1, n).reduce(1, LongBinaryOperators.product());
     */
    public virtual override Long reduce(final Long identity, final IBiOperator accumulator) {
        return (Long) SequencePipeline.reduce(longs, identity, accumulator);
//        Validate.notNull(accumulator);
//        Long result = (Long) identity;
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            result = (Long) accumulator.apply(result, longs[i]);
//        }
//        return result;
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
     * Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *      .reduce(LongBinaryOperators.sum())
     *      .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Long) SequencePipeline.reduce(longs, accumulator));
//        Validate.notNull(accumulator);
//        Long result;
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            result = i == 0 ? (Long) longs[i] : (Long) accumulator.apply(result, longs[i]);
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
//    public virtual Object collect(final ISupplier supplier, final IObjectLongConsumer accumulator) {
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            accumulator.accept(container, longs[i]);
//        }
//        return container;
//    }

    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(longs, collector);
//        Validate.notNull(collector);
//        final Object container = collector.supplier().get();
//        final IBiConsumer accumulator = collector.accumulator();
//        final IFunction finisher = collector.finisher();
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            accumulator.accept(container, longs[i]);
//        }
//        return finisher == null ? container : finisher.apply(container);
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
     * Long firstEvenLong = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .find(LongPredicates.isEven())
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Long) SequencePipeline.find(longs, predicate));
//        Validate.notNull(predicate);
//        for (Integer i = 0, size = longs.size(); i < size; i++) {
//            final Long j = (Long) longs[i];
//            if (predicate.test(j)) {
//                return Optional.ofNullable(j);
//            }
//        }
//        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `LongSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .every(LongPredicates.isEven())
     *     .get();
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(longs, predicate, 1);
//        Validate.notNull(predicate);
//        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `LongSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomeLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .some(LongPredicates.isEven())
     *     .get();
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(longs, predicate, 0);
//        Validate.notNull(predicate);
//        return match(predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     */
    public virtual override Long sum() {
        Long sum = 0;
        Integer i = 0;
        for (Integer size = longs.size(); i < size; i++) {
            sum += longs[i];
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
        for (Integer size = longs.size(); i < size; i++) {
            sum += (Double) longs[i];
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
        return longs.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
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
     * List<Long> restLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .lim(1)
     *     .toList();
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
     * List<Long> restLongs = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 })
     *     .lim(1)
     *     .toList();
     */
    public virtual override Set<Long> toSet() {
        return new Set<Long>(longs);
    }
    // @end-group
    //</editor-fold>

}
