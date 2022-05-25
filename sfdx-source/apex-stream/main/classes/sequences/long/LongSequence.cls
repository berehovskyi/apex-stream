/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `Long` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 * @example
 * Long sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToLong(getAnnualRevenueToLongFunction)
 *         .sum();
 * @see LongStream
 * @see SObjectSequence
 * @see ObjectSequence
 * @see DoubleSequence
 * @see IntSequence
 */
public virtual inherited sharing class LongSequence extends LongIterable implements ILongIterable {

    private final List<Long> longs;

    protected LongSequence() {
        this(new List<Long>());
    }

    protected LongSequence(final List<Long> longs){
        this.longs = longs;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     * @return the internal `Iterator<Long>`
     */
    public Iterator<Long> iterator() {
        return longs.iterator();
    }

    //<editor-fold desc="Conversion Operations">
    // @start-group Conversion Operations
    /**
     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
     * @return the `ObjectSequence`
     */
    public virtual IObjectIterable toObjectIterable() {
        return ObjectSequence.of(longs);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `LongSequence` created from `longs` list.
     * @example
     * ILongIterable longSeq = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list of Longs
     * @return the new `LongSequence`
     * @throws NullPointerException if `longs` is null
     */
    public static ILongIterable of(final List<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` set.
     * @example
     * ILongIterable longSeq = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the set of Longs
     * @return the new `LongSequence`
     * @throws NullPointerException if `longs` is null
     */
    public static ILongIterable of(final Set<Long> longs) {
        Validate.notNull(longs);
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns a `LongSequence` created from `longs` list if non-null,
     * otherwise returns an empty `LongSequence`.
     * @example
     * ILongIterable longSeq = LongSequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list of Longs
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     */
    public static ILongIterable ofNullable(final List<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(longs);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` set if non-null,
     * otherwise returns an empty `LongSequence`.
     * @example
     * ILongIterable longSeq = LongSequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the set of Longs
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     */
    public static ILongIterable ofNullable(final Set<Long> longs) {
        if (longs == null) { return empty(); }
        return new LongSequence(new List<Long>(longs));
    }

    /**
     * @description Returns an empty `LongSequence`.
     * @return the empty `LongSequence`
     */
    public static ILongIterable empty() {
        return new LongSequence();
    }

    /**
     * @description Returns an ordered `LongSequence` 
     * from `fromLong` (inclusive) to `toLong` (inclusive) by an incremental step of 1.
     * @example
     * ILongIterable longSeqFrom0To100 = LongSequence.range(0, 100);
     * @param fromLong the inclusive initial value
     * @param toLong the inclusive upper bound
     * @return the new `LongSequence`
     * @throws NullPointerException if `fromLong` or `toLong` is null
     */
    public static ILongIterable range(final Long fromLong, final Long toLong) {
        Validate.notNull(fromLong);
        Validate.notNull(toLong);
        final List<Long> longs = new List<Long>();
        for (Long i = fromLong; i <= toLong; i++) {
            longs.add(i);
        }
        return new LongSequence(longs);
    }

    /**
     * @description Returns eagerly concatenated `LongSequence` whose elements are all the
     * elements of the first `Iterable<Long>` followed by all the elements of the
     * second `Iterable<Long>`.
     * @example
     * ILongIterable longSeq = LongSequence.concat(seq1, seq2);
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ILongIterable concat(final Iterable<Long> iterable1, final Iterable<Long> iterable2) {
        return concat(new List<Iterable<Long>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Long>>`.
     * @example
     * ILongIterable longSeq = LongStream.concat(seqs);
     * @param iterables the list of `Iterable<Long>`
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static ILongIterable concat(final List<Iterable<Long>> iterables) {
        Validate.noNullElements(iterables);
        final List<Long> longs = new List<Long>();
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            longs.addAll(Iterators.toLongList(iterables[i].iterator()));
        }
        return new LongSequence(longs);
    }

    /**
     * @description Returns a combined `LongSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ILongIterable zip(
            final Iterable<Long> iterable1,
            final Iterable<Long> iterable2,
            final ILongBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        final List<Long> results = new List<Long>();
        final List<Long> left = Iterators.toLongList(iterable1.iterator());
        final List<Long> right = Iterators.toLongList(iterable2.iterator());
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            results.add(combiner.apply(left[i], right[i]));
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns new `LongSequence` by appending `iterable`
     * to the current sequence.
     * @example
     * ILongIterable longSeq = seq1.append(seq2);
     * @param iterable the `Iterable<Long>` to append to the current sequence
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual override ILongIterable append(final Iterable<Long> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `LongSequence` by prepending `iterable`
     * to the current sequence.
     * @example
     * ILongIterable longSeq = seq1.prepend(seq2);
     * @param iterable the `Iterable<Long>` to prepend to the current sequence
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual ILongIterable prepend(final Iterable<Long> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns new `LongStream` from the current sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * ILongIterable longStream = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).stream();
     * @return the new `LongStream`
     */
    public virtual ILongIterable stream() {
        return LongStream.of(iterator());
    }

    /**
     * @description Returns a `LongSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Long> filtered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .filter(LongPredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `LongSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ILongIterable filter(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            final Long j = longs[i];
            if (predicate.test(j)) {
                results.add(j);
            }
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Long> firstFiltered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .take(LongPredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `LongSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual ILongIterable take(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            final Long j = longs[i];
            if (predicate.test(j)) {
                results.add(j);
            } else {
                break;
            }
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> rest = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .drop(LongPredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `LongSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual ILongIterable drop(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        final List<Long> results = new List<Long>();
        Boolean drop = true;
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            final Long o = longs[i];
            if (!predicate.test(o) || !drop) {
                results.add(o);
                drop = false;
            }
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> incrementedLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .mapTo(LongUnaryOperator.add(1L))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `LongSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ILongIterable mapTo(final ILongUnaryOperator mapper) {
        Validate.notNull(mapper);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            results.add(mapper.apply(longs[i]));
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `IntSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IIntIterable mapToInt(final ILongToIntFunction mapper) {
        Validate.notNull(mapper);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            results.add(mapper.apply(longs[i]));
        }
        return IntSequence.of(results);
    }

    /**
     * @description Returns a `DoubleSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IDoubleIterable mapToDouble(final ILongToDoubleFunction mapper) {
        Validate.notNull(mapper);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            results.add(mapper.apply(longs[i]));
        }
        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ISObjectIterable mapToSObject(final ILongToSObjectFunction mapper) {
        Validate.notNull(mapper);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            results.add(mapper.apply(longs[i]));
        }
        return SObjectSequence.of(results);
    }

    /**
     * @description Returns a `ObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `ObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IObjectIterable mapToObject(final ILongFunction mapper) {
        Validate.notNull(mapper);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            results.add(mapper.apply(longs[i]));
        }
        return ObjectSequence.of(results);
    }

    /**
     * @description Returns a `LongSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return this `LongSequence`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual ILongIterable forEach(final ILongConsumer consumer) {
        Validate.notNull(consumer);
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            consumer.accept(longs[i]);
        }
        return this;
    }

    /**
     * @description Returns a `LongSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> distinct = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .distinct()
     *     .toList();
     * @return the `LongSequence`
     */
    public virtual override ILongIterable distinct() {
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            if (!results.contains(longs[i])) {
                results.add(longs[i]);
            }
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a `LongSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> sorted = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .sort()
     *     .toList();
     * @return the `LongSequence`
     */
    public virtual ILongIterable sort() {
        final List<Long> clone = longs.clone();
        clone.sort();
        return new LongSequence(clone);
    }

    /**
     * @description Returns a `LongSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Long> first3Longs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .lim(3)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `LongSequence`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual ILongIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return LongSequence.empty(); }
        if (lim >= longs.size()) { return this; }
        final List<Long> results = new List<Long>();
        for (Integer i = 0; i < lim; i++) {
            results.add(longs[i]);
        }
        return new LongSequence(results);
    }

    /**
     * @description Returns a new `LongSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> restLongs = LongStream.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .skip(1)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `LongSequence`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual ILongIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return this; }
        if (n >= longs.size()) { return LongSequence.empty(); }
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            if (i >= n) {
                results.add(longs[i]);
            }
        }
        return new LongSequence(results);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).reduce(0L, LongBinaryOperator.sum());
     * Long factorialOfN = LongSequence.range(1, n).reduce(1, LongBinaryOperator.product());
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Long` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual Long reduce(final Long identity, final ILongBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Long result = identity;
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            result = accumulator.apply(result, longs[i]);
        }
        return result;
    }

    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalLong` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *      .reduce(LongBinaryOperator.sum())
     *      .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalLong` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override OptionalLong reduce(final ILongBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Long result;
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            result = i == 0 ? longs[i] : accumulator.apply(result, longs[i]);
        }
        return OptionalLong.of(result);
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public virtual Object collect(final ISupplier supplier, final IObjectLongConsumer accumulator) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        final Object container = supplier.get();
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            accumulator.accept(container, longs[i]);
        }
        return container;
    }

    /**
     * @description Returns an `OptionalLong` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Long firstEvenLong = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .find(LongPredicate.isEven())
     *     .get();
     * @param predicate the predicate
     * @return the `OptionalLong`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual OptionalLong find(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            final Long j = longs[i];
            if (predicate.test(j)) {
                return OptionalLong.ofNullable(j);
            }
        }
        return OptionalLong.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `LongSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .every(LongPredicate.isEven())
     *     .get();
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Boolean every(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `LongSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomeLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .some(LongPredicate.isEven())
     *     .get();
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Boolean some(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     * @return the sum of elements
     */
    public virtual Long sum() {
        Long sum = 0;
        Integer i = 0;
        for (Integer size = longs.size(); i < size; i++) {
            sum += longs[i];
        }
        return i == 0 ? null : sum;
    }

    /**
     * @description Returns `OptionalDouble` describing the arithmetic mean of elements of this sequence, 
     * or an empty `OptionalDouble` if this sequence is empty.
     * <p>Terminal Operation.</p>
     * @return the arithmetic mean of elements
     */
    public virtual OptionalDouble avg() {
        Double sum = 0.0;
        Integer i = 0;
        for (Integer size = longs.size(); i < size; i++) {
            sum += longs[i];
        }
        return i == 0 ? OptionalDouble.empty() : OptionalDouble.of(sum / i);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     * @return the count of elements
     */
    public virtual Integer count() {
        return longs.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return longs.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Long>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Long> restLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     *     .lim(1)
     *     .toList();
     * @return the `List<Long>` containing the sequence elements
     */
    public virtual List<Long> toList() {
        return longs;
    }

    /**
     * @description Accumulates elements into a `Set<Long>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Long> restLongs = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 })
     *     .lim(1)
     *     .toList();
     * @return the `Set<Long>` containing the sequence elements
     */
    public virtual Set<Long> toSet() {
        return new Set<Long>(longs);
    }

    private Boolean match(final ILongPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = longs.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(longs[i]);
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
