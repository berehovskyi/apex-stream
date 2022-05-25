/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `Double` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 * <p><a href="https://en.wikipedia.org/wiki/Monte_Carlo_method">Monte Carlo method</a></p>
 * @example
 * // Approximating the value of π using Monte Carlo method and sequences
 * Integer s = 200000;
 * IDoubleIterable x = DoubleSequence.generate(DoubleSupplier.random());
 * IDoubleIterable y = DoubleSequence.generate(DoubleSupplier.random());
 * IDoubleBinaryOperator euclidean = DoubleBinaryOperator.euclideanDistance();
 * // The number of points inside the quadrant,
 * // i.e. having a distance from the origin of less than 1
 * Integer n = DoubleSequence.zip(x, y, euclidean)
 *       .lim(s)
 *       .filter(DoublePredicate.isLess(1))
 *       .count();
 * // The ratio of the inside-count and the total-sample-count is an estimate of the ratio
 * // of the two areas, π / 4. Multiply the result by 4 to estimate π.
 * Double approxPi = 4 * n / (Double) s;
 * @see DoubleStream
 * @see SObjectSequence
 * @see ObjectSequence
 * @see IntSequence
 * @see LongSequence
 */
public virtual inherited sharing class DoubleSequence extends DoubleIterable implements IDoubleIterable {

    private final List<Double> doubles;

    protected DoubleSequence() {
        this(new List<Double>());
    }

    protected DoubleSequence(final List<Double> doubles) {
        this.doubles = doubles;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     * @return the internal `Iterator<Long>`
     */
    public Iterator<Double> iterator() {
        return doubles.iterator();
    }

    //<editor-fold desc="Conversion Operations">
    // @start-group Conversion Operations
    /**
     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
     * @return the `ObjectSequence`
     */
    public virtual IObjectIterable toObjectIterable() {
        return ObjectSequence.of(doubles);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `DoubleSequence` created from `doubles` list.
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the list of Doubles
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final List<Double> doubles) {
        Validate.notNull(doubles);
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` set.
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the set of Doubles
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final Set<Double> doubles) {
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` list if non-null,
     * otherwise returns an empty `DoubleSequence`.
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
     * @param doubles the list of Doubles
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     */
    public static IDoubleIterable ofNullable(final List<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` set if non-null,
     * otherwise returns an empty `DoubleSequence`.
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
     * @param doubles the set of Doubles
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     */
    public static IDoubleIterable ofNullable(final Set<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns an empty `DoubleSequence`.
     * @return the empty `DoubleSequence`
     */
    public static IDoubleIterable empty() {
        return new DoubleSequence();
    }

    /**
     * @description Returns eagerly concatenated `DoubleSequence` whose elements are all the
     * elements of the first `Iterable<Double>` followed by all the elements of the
     * second `Iterable<Double>`.
     * @example
     * IDoubleIterable doubleSeq = LongSequence.concat(seq1, seq2);
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IDoubleIterable concat(final Iterable<Double> iterable1, final Iterable<Double> iterable2) {
        return concat(new List<Iterable<Double>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Double>>`.
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.concat(seqs);
     * @param iterables the list of `Iterable<Double>`
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IDoubleIterable concat(final List<Iterable<Double>> iterables) {
        Validate.noNullElements(iterables);
        final List<Double> doubles = new List<Double>();
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            doubles.addAll(Iterators.toDoubleList(iterables[i].iterator()));
        }
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a combined `DoubleSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IDoubleIterable zip(
            final Iterable<Double> iterable1,
            final Iterable<Double> iterable2,
            final IDoubleBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        final List<Double> results = new List<Double>();
        final List<Double> left = Iterators.toDoubleList(iterable1.iterator());
        final List<Double> right = Iterators.toDoubleList(iterable2.iterator());
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            results.add(combiner.apply(left[i], right[i]));
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns new `DoubleSequence` by appending `iterable`
     * to the current sequence.
     * @example
     * IDoubleIterable doubleSeq = seq1.append(seq2);
     * @param iterable the `Iterable<Double>` to append to the current sequence
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual override IDoubleIterable append(final Iterable<Double> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `DoubleSequence` by prepending `iterable`
     * to the current sequence.
     * @example
     * DoubleIterable doubleSeq = seq1.prepend(seq2);
     * @param iterable the `Iterable<Double>` to prepend to the current sequence
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual IDoubleIterable prepend(final Iterable<Double> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns new `DoubleStream` from the current sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * IDoubleIterable doubleStream = DoubleSequence.of(new Set<Double>{ 0, 5L, 1L, -10 }).stream();
     * @return the new `DoubleStream`
     */
    public virtual IDoubleIterable stream() {
        return DoubleStream.of(iterator());
    }

    /**
     * @description Returns a `DoubleSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Double> filtered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .filter(DoublePredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `DoubleSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override IDoubleIterable filter(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            final Double j = doubles[i];
            if (predicate.test(j)) {
                results.add(j);
            }
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Double> firstFiltered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .take(DoublePredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `DoubleSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IDoubleIterable take(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            final Double j = doubles[i];
            if (predicate.test(j)) {
                results.add(j);
            } else {
                break;
            }
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> rest = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .drop(DoublePredicate.isGreater(0))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `DoubleSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IDoubleIterable drop(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        final List<Double> results = new List<Double>();
        Boolean drop = true;
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            final Double j = doubles[i];
            if (!predicate.test(j) || !drop) {
                results.add(j);
                drop = false;
            }
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> incrementedDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .mapTo(DoubleUnaryOperator.add(1.5))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IDoubleIterable mapTo(final IDoubleUnaryOperator mapper) {
        Validate.notNull(mapper);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            results.add(mapper.apply(doubles[i]));
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `IntSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IIntIterable mapToInt(final IDoubleToIntFunction mapper) {
        Validate.notNull(mapper);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            results.add(mapper.apply(doubles[i]));
        }
        return IntSequence.of(results);
    }

    /**
     * @description Returns a `LongSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `LongSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ILongIterable mapToLong(final IDoubleToLongFunction mapper) {
        Validate.notNull(mapper);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            results.add(mapper.apply(doubles[i]));
        }
        return LongSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ISObjectIterable mapToSObject(final IDoubleToSObjectFunction mapper) {
        Validate.notNull(mapper);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            results.add(mapper.apply(doubles[i]));
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
    public virtual IObjectIterable mapToObject(final IDoubleFunction mapper) {
        Validate.notNull(mapper);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            results.add(mapper.apply(doubles[i]));
        }
        return ObjectSequence.of(results);
    }

    /**
     * @description Returns a `DoubleSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return this `DoubleSequence`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual IDoubleIterable forEach(final IDoubleConsumer consumer) {
        Validate.notNull(consumer);
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            consumer.accept(doubles[i]);
        }
        return this;
    }

    /**
     * @description Returns a `DoubleSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> distinct = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .distinct()
     *     .toList();
     * @return the `DoubleSequence`
     */
    public virtual override IDoubleIterable distinct() {
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            if (!results.contains(doubles[i])) {
                results.add(doubles[i]);
            }
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> sorted = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .sort()
     *     .toList();
     * @return the `DoubleSequence`
     */
    public virtual IDoubleIterable sort() {
        final List<Double> clone = doubles.clone();
        clone.sort();
        return new DoubleSequence(clone);
    }

    /**
     * @description Returns a `DoubleSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Double> first3Doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .lim(3)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `DoubleSequence`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual IDoubleIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return DoubleSequence.empty(); }
        if (lim >= doubles.size()) { return this; }
        final List<Double> results = new List<Double>();
        for (Integer i = 0; i < lim; i++) {
            results.add(doubles[i]);
        }
        return new DoubleSequence(results);
    }

    /**
     * @description Returns a new `DoubleSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `DoubleSequence`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual IDoubleIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return this; }
        if (n >= doubles.size()) { return DoubleSequence.empty(); }
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            if (i >= n) {
                results.add(doubles[i]);
            }
        }
        return new DoubleSequence(results);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI }).reduce(0.0, DoubleBinaryOperator.sum());
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Double` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual Double reduce(final Double identity, final IDoubleBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Double result = identity;
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            result = accumulator.apply(result, doubles[i]);
        }
        return result;
    }

    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalDouble` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *      .reduce(DoubleBinaryOperator.sum())
     *      .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalDouble` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override OptionalDouble reduce(final IDoubleBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Double result;
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            result = i == 0 ? doubles[i] : accumulator.apply(result, doubles[i]);
        }
        return OptionalDouble.of(result);
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
    public virtual override Object collect(final ISupplier supplier, final IObjectDoubleConsumer accumulator) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        final Object container = supplier.get();
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            accumulator.accept(container, doubles[i]);
        }
        return container;
    }

    /**
     * @description Returns an `OptionalDouble` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Double firstGreaterDouble = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .find(DoublePredicate.isGreater(1.5))
     *     .get();
     * @param predicate the predicate
     * @return the `OptionalDouble`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual OptionalDouble find(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            final Double j = doubles[i];
            if (predicate.test(j)) {
                return OptionalDouble.ofNullable(j);
            }
        }
        return OptionalDouble.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `DoubleSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .every(DoublePredicate.isGreater(1.5))
     *     .get();
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Boolean every(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `DoubleSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     *  Boolean isSomeDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .some(DoublePredicate.isGreater(1.5))
     *     .get();
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Boolean some(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     * @return the count of elements
     */
    public virtual Integer count() {
        return doubles.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return doubles.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList();
     * @return the `List<Double>` containing the sequence elements
     */
    public virtual List<Double> toList() {
        return doubles;
    }

    /**
     * @description Accumulates elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toSett();
     * @return the `Set<Double>` containing the sequence elements
     */
    public virtual Set<Double> toSet() {
        return new Set<Double>(doubles);
    }

    private Boolean match(final IDoublePredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = doubles.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(doubles[i]);
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
