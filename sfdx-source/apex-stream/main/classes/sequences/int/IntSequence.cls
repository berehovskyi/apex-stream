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
public virtual inherited sharing class IntSequence extends IntIterable implements IIntIterable {

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
    public Iterator<Integer> iterator() {
        return integers.iterator();
    }

    //<editor-fold desc="Conversion Operations">
    // @start-group Conversion Operations
    /**
     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
     *
     * @return the `ObjectSequence`
     */
    public virtual IObjectIterable toObjectIterable() {
        return ObjectSequence.of(integers);
    }
    // @end-group
    //</editor-fold>

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
    public static IIntIterable of(final List<Integer> integers) {
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
    public static IIntIterable of(final Set<Integer> integers) {
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
    public static IIntIterable ofNullable(final List<Integer> integers) {
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
    public static IIntIterable ofNullable(final Set<Integer> integers) {
        if (integers == null) { return empty(); }
        return new IntSequence(new List<Integer>(integers));
    }

    /**
     * @description Returns an empty `IntSequence`.
     *
     * @return the empty `IntSequence`
     */
    public static IIntIterable empty() {
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
    public static IIntIterable range(final Integer fromInt, final Integer toInt) {
        Validate.notNull(fromInt);
        Validate.notNull(toInt);
        final List<Integer> integers = new List<Integer>();
        for (Integer i = fromInt; i <= toInt; i++) {
            integers.add(i);
        }
        return new IntSequence(integers);
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
    public static IIntIterable concat(final Iterable<Integer> iterable1, final Iterable<Integer> iterable2) {
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
    public static IIntIterable concat(final List<Iterable<Integer>> iterables) {
        Validate.noNullElements(iterables);
        final List<Integer> integers = new List<Integer>();
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            integers.addAll(Iterators.toIntList(iterables[i].iterator()));
        }
        return new IntSequence(integers);
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
    public static IIntIterable zip(
            final Iterable<Integer> iterable1,
            final Iterable<Integer> iterable2,
            final IIntBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        final List<Integer> results = new List<Integer>();
        final List<Integer> left = Iterators.toIntList(iterable1.iterator());
        final List<Integer> right = Iterators.toIntList(iterable2.iterator());
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            results.add(combiner.apply(left[i], right[i]));
        }
        return new IntSequence(results);
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
    public virtual override IIntIterable append(final Iterable<Integer> iterable) {
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
    public virtual IIntIterable prepend(final Iterable<Integer> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns new `IntStream` from the current sequence.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IntStream`
     *
     * @example
     * IIntIterable intStream = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).stream();
     */
    public virtual IIntIterable stream() {
        return IntStream.of(iterator());
    }

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
     *     .filter(IntPredicate.isGreater(0))
     *     .toList();
     */
    public virtual override IIntIterable filter(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            final Integer j = integers[i];
            if (predicate.test(j)) {
                results.add(j);
            }
        }
        return new IntSequence(results);
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
     *     .take(IntPredicate.isGreater(0))
     *     .toList();
     */
    public virtual IIntIterable take(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            final Integer j = integers[i];
            if (predicate.test(j)) {
                results.add(j);
            } else {
                break;
            }
        }
        return new IntSequence(results);
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
     *     .drop(IntPredicate.isGreater(0))
     *     .toList();
     */
    public virtual IIntIterable drop(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        final List<Integer> results = new List<Integer>();
        Boolean drop = true;
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            final Integer j = integers[i];
            if (!predicate.test(j) || !drop) {
                results.add(j);
                drop = false;
            }
        }
        return new IntSequence(results);
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
     *     .mapTo(IntUnaryOperator.add(1))
     *     .toList();
     */
    public virtual IIntIterable mapTo(final IIntUnaryOperator mapper) {
        Validate.notNull(mapper);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            results.add(mapper.apply(integers[i]));
        }
        return new IntSequence(results);
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
    public virtual override ILongIterable mapToLong(final IIntToLongFunction mapper) {
        Validate.notNull(mapper);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            results.add(mapper.apply(integers[i]));
        }
        return LongSequence.of(results);
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
    public virtual override IDoubleIterable mapToDouble(final IIntToDoubleFunction mapper) {
        Validate.notNull(mapper);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            results.add(mapper.apply(integers[i]));
        }
        return DoubleSequence.of(results);
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
    public virtual ISObjectIterable mapToSObject(final IIntToSObjectFunction mapper) {
        Validate.notNull(mapper);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            results.add(mapper.apply(integers[i]));
        }
        return SObjectSequence.of(results);
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
    public virtual IObjectIterable mapToObject(final IIntFunction mapper) {
        Validate.notNull(mapper);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            results.add(mapper.apply(integers[i]));
        }
        return ObjectSequence.of(results);
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
    public virtual IIntIterable forEach(final IIntConsumer consumer) {
        Validate.notNull(consumer);
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            consumer.accept(integers[i]);
        }
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
    public virtual override IIntIterable distinct() {
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            if (!results.contains(integers[i])) {
                results.add(integers[i]);
            }
        }
        return new IntSequence(results);
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
    public virtual IIntIterable sort() {
        final List<Integer> clone = integers.clone();
        clone.sort();
        return new IntSequence(clone);
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
    public virtual IIntIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return IntSequence.empty(); }
        if (lim >= integers.size()) { return this; }
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0; i < lim; i++) {
            results.add(integers[i]);
        }
        return new IntSequence(results);
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
    public virtual IIntIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return this; }
        if (n >= integers.size()) { return IntSequence.empty(); }
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            if (i >= n) {
                results.add(integers[i]);
            }
        }
        return new IntSequence(results);
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
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, IntBinaryOperator.sum());
     * Integer factorialOfN = IntSequence.range(1, n).reduce(1, IntBinaryOperator.product());
     */
    public virtual Integer reduce(final Integer identity, final IIntBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Integer result = identity;
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            result = accumulator.apply(result, integers[i]);
        }
        return result;
    }

    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalInt` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `OptionalInt` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *      .reduce(IntBinaryOperator.sum())
     *      .get();
     */
    public override OptionalInt reduce(final IIntBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Integer result;
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            result = i == 0 ? integers[i] : accumulator.apply(result, integers[i]);
        }
        return OptionalInt.of(result);
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     *
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public virtual Object collect(final ISupplier supplier, final IObjectIntConsumer accumulator) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        final Object container = supplier.get();
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            accumulator.accept(container, integers[i]);
        }
        return container;
    }

    /**
     * @description Returns an `OptionalInt` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `OptionalInt`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Integer firstEvenInt = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     *     .find(IntPredicate.isEven())
     *     .get();
     */
    public virtual OptionalInt find(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            final Integer j = integers[i];
            if (predicate.test(j)) {
                return OptionalInt.ofNullable(j);
            }
        }
        return OptionalInt.empty();
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
     *     .every(IntPredicate.isEven())
     *     .get();
     */
    public virtual Boolean every(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 1);
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
     *     .some(IntPredicate.isEven())
     *     .get();
     */
    public override Boolean some(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 0);
    }

    /**
     * @description Returns the sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     */
    public virtual Integer sum() {
        Integer sum = 0;
        Integer i = 0;
        for (Integer size = integers.size(); i < size; i++) {
            sum += integers[i];
        }
        return i == 0 ? null : sum;
    }

    /**
     * @description Returns `OptionalDouble` describing the arithmetic mean of elements of this sequence,
     * or an empty `OptionalDouble` if this sequence is empty.
     * <p>Terminal Operation.</p>
     *
     * @return the arithmetic mean of elements
     */
    public virtual OptionalDouble avg() {
        Double sum = 0.0;
        Integer i = 0;
        for (Integer size = integers.size(); i < size; i++) {
            sum += integers[i];
        }
        return i == 0 ? OptionalDouble.empty() : OptionalDouble.of(sum / i);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     */
    public virtual Integer count() {
        return integers.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
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
    public virtual List<Integer> toList() {
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
    public virtual Set<Integer> toSet() {
        return new Set<Integer>(integers);
    }

    private Boolean match(final IIntPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = integers.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(integers[i]);
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
