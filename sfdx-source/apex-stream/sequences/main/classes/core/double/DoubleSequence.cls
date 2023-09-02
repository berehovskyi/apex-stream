/**
 * @description A sequence of `Double` elements supporting aggregate operations,
 * a primitive specialization of {@link ObjectSequence}.
 * <p><a href="https://en.wikipedia.org/wiki/Monte_Carlo_method">Monte Carlo method</a></p>
 *
 * @see DoubleStream
 * @see SObjectSequence
 * @see ObjectSequence
 * @see IntSequence
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * // Approximating the value of π using Monte Carlo method and sequences
 * Integer s = 200000;
 * IDoubleIterable x = DoubleSequence.generate(DoubleSuppliers.random());
 * IDoubleIterable y = DoubleSequence.generate(DoubleSuppliers.random());
 * IDoubleBinaryOperator euclidean = DoubleBinaryOperators.euclideanDistance();
 * // The number of points inside the quadrant,
 * // i.e. having a distance from the origin of less than 1
 * Integer n = DoubleSequence.zip(x, y, euclidean)
 *       .lim(s)
 *       .filter(DoublePredicates.isLess(1))
 *       .count();
 * // The ratio of the inside-count and the total-sample-count is an estimate of the ratio
 * // of the two areas, π / 4. Multiply the result by 4 to estimate π.
 * Double approxPi = 4 * n / (Double) s;
 */
public virtual inherited sharing class DoubleSequence extends DoubleEnumerable {

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
     *
     * @return the internal `Iterator<Long>`
     */
    public override Iterator<Double> iterator() {
        return doubles.iterator();
    }

//    //<editor-fold desc="Conversion Operations">
//    // @start-group Conversion Operations
//    /**
//     * @description Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.
//     *
//     * @return the `ObjectSequence`
//     */
//    public virtual IIterable toObjectIterable() {
//        return ObjectSequence.of(doubles);
//    }
//    // @end-group
//    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `DoubleSequence` created from `doubles` list.
     *
     * @param doubles the list of Doubles
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final List<Double> doubles) {
        Validate.notNull(doubles);
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` set.
     *
     * @param doubles the set of Doubles
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Set<Double> doubles) {
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` list if non-null,
     * otherwise returns an empty `DoubleSequence`.
     *
     * @param doubles the list of Doubles
     *
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     *
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
     */
    public static DoubleEnumerable ofNullable(final List<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` set if non-null,
     * otherwise returns an empty `DoubleSequence`.
     *
     * @param doubles the set of Doubles
     *
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     *
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
     */
    public static DoubleEnumerable ofNullable(final Set<Double> doubles) {
        if (doubles == null) { return empty(); }
        return new DoubleSequence(new List<Double>(doubles));
    }

    /**
     * @description Returns an empty `DoubleSequence`.
     *
     * @return the empty `DoubleSequence`
     */
    public static DoubleEnumerable empty() {
        return new DoubleSequence();
    }

    /**
     * @description Returns eagerly concatenated `DoubleSequence` whose elements are all the
     * elements of the first `Iterable<Double>` followed by all the elements of the
     * second `Iterable<Double>`.
     *
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * IDoubleIterable doubleSeq = LongSequence.concat(seq1, seq2);
     */
    public static DoubleEnumerable concat(final Iterable<Double> iterable1, final Iterable<Double> iterable2) {
        return concat(new List<Iterable<Double>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Double>>`.
     *
     * @param iterables the list of `Iterable<Double>`
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * IDoubleIterable doubleSeq = DoubleSequence.concat(seqs);
     */
    public static DoubleEnumerable concat(final List<Iterable<Double>> iterables) {
        return new DoubleSequence((List<Double>) SequencePipeline.concat(iterables, new List<Double>()));
//        Validate.noNullElements(iterables);
//        final List<Double> doubles = new List<Double>();
//        for (Integer i = 0, size = iterables.size(); i < size; i++) {
//            doubles.addAll(Iterators.toDoubleList((Iterator<Double>) iterables[i].iterator()));
//        }
//        return new DoubleSequence(doubles);
    }

    /**
     * @description Returns a combined `DoubleSequence` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static DoubleEnumerable zip(
            final Iterable<Double> iterable1,
            final Iterable<Double> iterable2,
            final IBiOperator combiner
    ) {
        return new DoubleSequence(
            (List<Double>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<Double>())
        );
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(combiner);
//        final List<Double> results = new List<Double>();
//        final List<Double> left = Iterators.toDoubleList((Iterator<Double>) iterable1.iterator());
//        final List<Double> right = Iterators.toDoubleList((Iterator<Double>) iterable2.iterator());
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            results.add((Double) combiner.apply(left[i], right[i]));
//        }
//        return new DoubleSequence(results);
    }

    /**
     * @description Returns new `DoubleSequence` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Double>` to append to the current sequence
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IDoubleIterable doubleSeq = seq1.append(seq2);
     */
    public virtual override DoubleEnumerable append(final Iterable<Double> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `DoubleSequence` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Double>` to prepend to the current sequence
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * DoubleIterable doubleSeq = seq1.prepend(seq2);
     */
    public virtual override DoubleEnumerable prepend(final Iterable<Double> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `DoubleStream` from the current sequence.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `DoubleStream`
//     *
//     * @example
//     * IDoubleIterable doubleStream = DoubleSequence.of(new Set<Double>{ 0, 5L, 1L, -10 }).stream();
//     */
//    public virtual DoubleEnumerable stream() {
//        return DoubleStream.of(iterator());
//    }

    /**
     * @description Returns a `DoubleSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> filtered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .filter(DoublePredicates.isGreater(0))
     *     .toList();
     */
    public virtual override DoubleEnumerable filter(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.filter(doubles, predicate, new List<Double>()));
//        Validate.notNull(predicate);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            final Double j = (Double) doubles[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            }
//        }
//        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> firstFiltered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .take(DoublePredicates.isGreater(0))
     *     .toList();
     */
    public virtual override DoubleEnumerable take(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.take(doubles, predicate, new List<Double>()));
//        Validate.notNull(predicate);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            final Double j = (Double) doubles[i];
//            if (predicate.test(j)) {
//                results.add(j);
//            } else {
//                break;
//            }
//        }
//        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> rest = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .drop(DoublePredicates.isGreater(0))
     *     .toList();
     */
    public virtual override DoubleEnumerable drop(final IPredicate predicate) {
        return new DoubleSequence((List<Double>) SequencePipeline.drop(doubles, predicate, new List<Double>()));
//        Validate.notNull(predicate);
//        final List<Double> results = new List<Double>();
//        Boolean drop = true;
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            final Double j = (Double) doubles[i];
//            if (!predicate.test(j) || !drop) {
//                results.add(j);
//                drop = false;
//            }
//        }
//        return new DoubleSequence(results);
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
     *
     * @example
     * List<Double> incrementedDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .mapTo(DoubleUnaryOperators.add(1.5))
     *     .toList();
     */
    public virtual override DoubleEnumerable mapTo(final IOperator mapper) {
        return new DoubleSequence((List<Double>) SequencePipeline.mapTo(doubles, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            results.add((Double) mapper.apply(doubles[i]));
//        }
//        return new DoubleSequence(results);
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
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(doubles, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            results.add((Integer) mapper.apply(doubles[i]));
//        }
//        return IntSequence.of(results);
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
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(doubles, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            results.add((Long) mapper.apply(doubles[i]));
//        }
//        return LongSequence.of(results);
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
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(doubles, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            results.add((SObject) mapper.apply(doubles[i]));
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
        return ObjectSequence.of(SequencePipeline.mapTo(doubles, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            results.add(mapper.apply(doubles[i]));
//        }
//        return ObjectSequence.of(results);
    }

    public virtual override DoubleEnumerable flatMapTo(final IFunction mapper) {
        return new DoubleSequence((List<Double>) SequencePipeline.flatMapTo(doubles, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            final Iterable<Double> result = (Iterable<Double>) mapper.apply(doubles[i]);
//            if (result != null) {
//                results.addAll(Iterators.toDoubleList(result.iterator()));
//            }
//        }
//        return new DoubleSequence(results);
    }

    /**
     * @description Returns a `DoubleSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `DoubleSequence`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public virtual override DoubleEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(doubles, consumer);
//        Validate.notNull(consumer);
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            consumer.accept(doubles[i]);
//        }
        return this;
    }

    /**
     * @description Returns a `DoubleSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleSequence`
     *
     * @example
     * List<Double> distinct = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .distinct()
     *     .toList();
     */
    public virtual override DoubleEnumerable distinct() {
        return new DoubleSequence((List<Double>) SequencePipeline.distinct(doubles, new List<Double>()));
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            if (!results.contains((Double) doubles[i])) {
//                results.add((Double) doubles[i]);
//            }
//        }
//        return new DoubleSequence(results);
    }

//    public virtual override DoubleIterable distinct(final IFunction classifier) {
//        Validate.notNull(classifier);
//        final List<Double> results = new List<Double>();
//        final Set<Object> classifierResults = new Set<Object>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            if (classifierResults.add(classifier.apply(doubles[i]))) {
//                results.add((Double) doubles[i]);
//            }
//        }
//        return new DoubleSequence(results);
//    }

    /**
     * @description Returns a `DoubleSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleSequence`
     *
     * @example
     * List<Double> sorted = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .sort()
     *     .toList();
     */
    public virtual override DoubleEnumerable sort() {
        return new DoubleSequence((List<Double>) SequencePipeline.sort(doubles));
//        final List<Double> clone = (List<Double>) doubles.clone();
//        clone.sort();
//        return new DoubleSequence(clone);
    }

    public virtual override DoubleEnumerable sort(final SortOrder order) {
        return new DoubleSequence((List<Double>) SequencePipeline.sort(doubles, order));
//        return new DoubleSequence((List<Double>) Lists.sort(doubles, Comparer.defaultOrder().order(order)));
    }

    /**
     * @description Returns a `DoubleSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `DoubleSequence`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Double> first3Doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .lim(3)
     *     .toList();
     */
    public virtual override DoubleEnumerable lim(final Integer lim) {
        return new DoubleSequence((List<Double>) SequencePipeline.lim(doubles, lim, new List<Double>()));
//        Validate.notNull(lim);
//        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
//        if (lim == 0) { return DoubleSequence.empty(); }
//        if (lim >= doubles.size()) { return this; }
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0; i < lim; i++) {
//            results.add((Double) doubles[i]);
//        }
//        return new DoubleSequence(results);
    }

    /**
     * @description Returns a new `DoubleSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `DoubleSequence`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList();
     */
    public virtual override DoubleEnumerable skip(final Integer n) {
        return new DoubleSequence((List<Double>) SequencePipeline.skip(doubles, n, new List<Double>()));
//        Validate.notNull(n);
//        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
//        if (n == 0) { return this; }
//        if (n >= doubles.size()) { return DoubleSequence.empty(); }
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            if (i >= n) {
//                results.add((Double) doubles[i]);
//            }
//        }
//        return new DoubleSequence(results);
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
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .reduce((Double) 0.0, DoubleBinaryOperators.sum());
     */
    public virtual override Double reduce(final Double identity, final IBiOperator accumulator) {
        return (Double) SequencePipeline.reduce(doubles, identity, accumulator);
//        Validate.notNull(accumulator);
//        Double result = (Double) identity;
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            result = (Double) accumulator.apply(result, doubles[i]);
//        }
//        return result;
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
     * Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *      .reduce(DoubleBinaryOperators.sum())
     *      .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((Double) SequencePipeline.reduce(doubles, accumulator));
//        Validate.notNull(accumulator);
//        Double result;
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            result = i == 0 ? (Double) doubles[i] : (Double) accumulator.apply(result, doubles[i]);
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
//    public virtual override Object collect(final ISupplier supplier, final IBiConsumer accumulator) {
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            accumulator.accept(container, doubles[i]);
//        }
//        return container;
//    }

    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(doubles, collector);
//        Validate.notNull(collector);
//        final Object container = collector.supplier().get();
//        final IBiConsumer accumulator = collector.accumulator();
//        final IFunction finisher = collector.finisher();
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            accumulator.accept(container, doubles[i]);
//        }
//        return finisher == null ? container : finisher.apply(container);
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
     * Double firstGreaterDouble = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .find(DoublePredicates.isGreater(1.5))
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((Double) SequencePipeline.find(doubles, predicate));
//        Validate.notNull(predicate);
//        for (Integer i = 0, size = doubles.size(); i < size; i++) {
//            final Double j = (Double) doubles[i];
//            if (predicate.test(j)) {
//                return Optional.ofNullable(j);
//            }
//        }
//        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `DoubleSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .every(DoublePredicates.isGreater(1.5))
     *     .get();
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(doubles, predicate, 1);
//        Validate.notNull(predicate);
//        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `DoubleSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomeDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .some(DoublePredicates.isGreater(1.5))
     *     .get();
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(doubles, predicate, 0);
//        Validate.notNull(predicate);
//        return match(predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     */
    public virtual override Integer count() {
        return doubles.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
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
     * List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList();
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
     * Set<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toSet();
     */
    public virtual override Set<Double> toSet() {
        return new Set<Double>(doubles);
    }
    // @end-group
    //</editor-fold>

}
