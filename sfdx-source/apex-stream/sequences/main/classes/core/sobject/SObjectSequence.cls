/**
 * @description A sequence of `SObject` elements supporting aggregate operations.
 * Sequence operations are composed of sequence chain. A sequence chain consists of:
 * <ul>
 *     <li>A Source (which might be an iterable (such as list or set)).</li>
 *     <li>Zero or more Intermediate Operations (which transform a sequence into another sequence,
 *     such as {@link SObjectSequence.filter(ISObjectPredicate))}.</li>
 *     <li>A Terminal Operation (which produces a result such as
 *     {@link SObjectSequence.count()} or {@link SObjectSequence.collect(ISObjectCollector)}).</li>
 * </ul>
 * <p>Sequences are <strong>eager</strong>:</p>
 * <ul>
 *     <li>Intermediate operations describe how a sequence is processed eagerly performing every action.</li>
 *     <li>Computation is performed every time when the intermediate or the terminal operation is initiated.</li>
 * </ul>
 * <p>A sequence may not consume all elements. It may not be infinite.</p>
 * <p>A sequence can be operated on (invoking an intermediate or terminal sequence operation)
 * <strong>multiple times</strong>.
 * <p>Contract:</p>
 * <ul>
 *     <li>Must be non-interfering (do not modify the sequence source but may mutate its elements).</li>
 * </ul>
 * <p>There are primitive specializations for {@link IntSequence}, {@link LongSequence},
 * and {@link DoubleSequence} and {@link ObjectSequence} for Object references.</p>
 * <p>Sequences and streams equally ensure the fulfillment of the set goals,
 * but are implemented in different ways.</p>
 *
 * @see SObjectStream
 * @see ObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Double annualRevenueSumOfUniqueHotRankedAccounts
 *     = SObjectSequence.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 */
public virtual inherited sharing class SObjectSequence extends SObjectEnumerable {

    private final List<SObject> sObjects;

    protected SObjectSequence() {
        this(new List<SObject>());
    }

    protected SObjectSequence(final List<SObject> sObjects) {
        this.sObjects = sObjects;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<SObject>`
     */
    public override Iterator<SObject> iterator() {
        return sObjects.iterator();
    }

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `SObjectSequence` created from `sObjects` list.
     *
     * @param sObjects the list of SObjects
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * ISObjectIterable accSeq = SObjectSequence.of(new List<Account>(accounts));
     */
    public static SObjectEnumerable of(final List<SObject> sObjects) {
        Validate.notNull(sObjects);
        return new SObjectSequence(sObjects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` set.
     *
     * @param sObjects the set of SObjects
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * ISObjectIterable sObjSeq = SObjectSequence.of(new Set<SObject>(sObjects));
     */
    public static SObjectEnumerable of(final Set<SObject> sObjects) {
        Validate.notNull(sObjects);
        return new SObjectSequence(new List<SObject>(sObjects));
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` list if non-null,
     * otherwise returns an empty `SObjectSequence`.
     *
     * @param sObjects the list of SObjects
     *
     * @return the new `SObjectSequence` if `sObjects` is non-null,
     * otherwise an empty `SObjectSequence`
     *
     * @example
     * ISObjectIterable accSeq = SObjectSequence.ofNullable(new List<Account>(accounts));
     */
    public static SObjectEnumerable ofNullable(final List<SObject> sObjects) {
        if (sObjects == null) { return empty(); }
        return new SObjectSequence(sObjects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` set if non-null,
     * otherwise returns an empty `SObjectSequence`.
     *
     * @param sObjects the set of SObjects
     *
     * @return the new `SObjectSequence` if `sObjects` is non-null,
     * otherwise an empty `SObjectSequence`
     *
     * @example
     * ISObjectIterable accSeq = SObjectSequence.ofNullable(new Set<SObject>(sObjects));
     */
    public static SObjectEnumerable ofNullable(final Set<SObject> sObjects) {
        if (sObjects == null) { return empty(); }
        return new SObjectSequence(new List<SObject>(sObjects));
    }

    /**
     * @description Returns an empty `SObjectSequence`.
     *
     * @return the empty `SObjectSequence`
     */
    public static SObjectEnumerable empty() {
        return new SObjectSequence();
    }

    /**
     * @description Returns eagerly concatenated `SObjectSequence` whose elements are all the
     * elements of the first `Iterable<SObject>` followed by all the elements of the
     * second `Iterable<SObject>`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * ISObjectIterable accSeq = SObjectSequence.concat(seq1, seq2);
     */
    public static SObjectEnumerable concat(final Iterable<SObject> iterable1, final Iterable<SObject> iterable2) {
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
        return concat(new List<Iterable<SObject>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<SObject>>`.
     *
     * @param iterables the list of `Iterable<SObject>`
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * ISObjectIterable accSeq = SObjectSequence.concat(sequences);
     */
    public static SObjectEnumerable concat(final List<Iterable<SObject>> iterables) {
//        Validate.noNullElements(iterables);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = iterables.size(); i < size; i++) {
//            results.addAll(Iterators.toSObjectList((Iterator<SObject>) iterables[i].iterator()));
//        }
        return new SObjectSequence((List<SObject>) SequencePipeline.concat(iterables, new List<SObject>()));
    }

    /**
     * @description Returns a combined `SObjectSequence` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueSeq = SObjectSequence.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     */
    public static SObjectEnumerable zip(
            final Iterable<SObject> iterable1,
            final Iterable<SObject> iterable2,
            final IBiOperator combiner
    ) {
        return new SObjectSequence(
            (List<SObject>) SequencePipeline.zip(iterable1, iterable2, combiner, new List<SObject>())
        );
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(combiner);
//        final List<SObject> results = new List<SObject>();
//        final List<SObject> left = Iterators.toSObjectList((Iterator<SObject>) iterable1.iterator());
//        final List<SObject> right = Iterators.toSObjectList((Iterator<SObject>) iterable2.iterator());
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            results.add((SObject) combiner.apply(left[i], right[i]));
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a combined `SObjectSequence` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     *
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = SObjectSequence.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBiPredicates.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     */
    public static SObjectEnumerable zip(
            final Iterable<SObject> iterable1,
            final Iterable<SObject> iterable2,
            final IBiPredicate predicate,
            final IBiOperator combiner
    ) {
        return new SObjectSequence(
            (List<SObject>) SequencePipeline.zip(iterable1, iterable2, predicate, combiner, new List<SObject>())
        );
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(predicate);
//        Validate.notNull(combiner);
//        final List<SObject> results = new List<SObject>();
//        final List<SObject> left = Iterators.toSObjectList((Iterator<SObject>) iterable1.iterator());
//        final List<SObject> right = Iterators.toSObjectList((Iterator<SObject>) iterable2.iterator());
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            if (predicate.test(left[i], right[i])) {
//                results.add((SObject) combiner.apply(left[i], right[i]));
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns new `SObjectSequence` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<SObject>` to append to the current sequence
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ISObjectIterable accSeq = seq.append(seq1);
     */
    public virtual override SObjectEnumerable append(final Iterable<SObject> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `SObjectSequence` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<SObject>` to prepend to the current sequence
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ISObjectIterable accSeq = seq.prepend(seq2);
     */
    public virtual override SObjectEnumerable prepend(final Iterable<SObject> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `SObjectStream` from the current sequence.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `SObjectStream`
//     *
//     * @example
//     * ISObjectIterable accStream = SObjectSequence.of(accounts).stream();
//     */
//    public virtual SObjectEnumerable stream() {
//        return SObjectStream.of(iterator());
//        return null;
//    }

    /**
     * @description Returns a `SObjectSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable filter(final IPredicate predicate) {
        return new SObjectSequence((List<SObject>) SequencePipeline.filter(sObjects, predicate, new List<SObject>()));
//        Validate.notNull(predicate);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final SObject sObj = (SObject) sObjects[i];
//            if (predicate.test(sObj)) {
//                results.add(sObj);
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> firstAccountsWithHotRating = SObjectSequence.of(accounts)
     *     .take(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable take(final IPredicate predicate) {
        return new SObjectSequence((List<SObject>) SequencePipeline.take(sObjects, predicate, new List<SObject>()));
//        Validate.notNull(predicate);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final SObject sObj = (SObject) sObjects[i];
//            if (predicate.test(sObj)) {
//                results.add(sObj);
//            } else {
//                break;
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> restAccounts = SObjectSequence.of(accounts)
     *     .drop(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable drop(final IPredicate predicate) {
        return new SObjectSequence((List<SObject>) SequencePipeline.drop(sObjects, predicate, new List<SObject>()));
//        Validate.notNull(predicate);
//        final List<SObject> results = new List<SObject>();
//        Boolean drop = true;
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final SObject sObj = (SObject) sObjects[i];
//            if (!predicate.test(sObj) || !drop) {
//                results.add(sObj);
//                drop = false;
//            }
//        }
//        return new SObjectSequence(results);
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
     *
     * @example
     * List<Account> accounts = SObjectSequence.of(contacts)
     *     .mapTo(SObjectUnaryOperators.getSObject(Contact.AccountId))
     *     .toList();
     */
    public virtual override SObjectEnumerable mapTo(final IOperator mapper) {
        return new SObjectSequence((List<SObject>) SequencePipeline.mapTo(sObjects, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            results.add((SObject) mapper.apply(sObjects[i]));
//        }
//        return new SObjectSequence(results);
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
     * List<Integer> numberOfEmployees = SObjectSequence.of(accounts)
     *     .mapToInt(SObjectToIntFunctions.get(Account.NumberOfEmployees))
     *     .toList();
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(sObjects, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            results.add((Integer) mapper.apply(sObjects[i]));
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
     *
     * @example
     * List<Long> numberOfEmployees = SObjectSequence.of(accounts)
     *     .mapToLong(SObjectToLongFunctions.get(Account.NumberOfEmployees))
     *     .toList();
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(sObjects, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            results.add((Long) mapper.apply(sObjects[i]));
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
     *
     * @example
     * List<Double> annualRevenues = SObjectSequence.of(accounts)
     *     .mapToDouble(SObjectToDoubleFunctions.get(Account.AnnualRevenue))
     *     .toList();
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(sObjects, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            results.add((Double) mapper.apply(sObjects[i]));
//        }
//        return DoubleSequence.of(results);
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
     *
     * @example
     * List<Object> birthdates = SObjectSequence.of(contacts)
     *     .mapToObject(SObjectToDoubleFunctions.get(Contact.Birthdate))
     *     .toList();
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.mapTo(sObjects, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            results.add(mapper.apply(sObjects[i]));
//        }
//        return ObjectSequence.of(results);
    }

    /**
     * @description Returns a new `SObjectSequence` with `SObject` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Contact> contacts = SObjectSequence.of(accounts)
     *     .flatMapTo(SObjectFunctions.getSObjects('Contacts'))
     *     .toList();
     */
    public virtual override SObjectEnumerable flatMapTo(final IFunction mapper) {
        return new SObjectSequence((List<SObject>) SequencePipeline.flatMapTo(sObjects, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(sObjects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toSObjectList(result.iterator()));
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a new `IntSequence` with `Integer` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IntEnumerable flatMapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.flatMapTo(sObjects, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final Iterable<Integer> result = (Iterable<Integer>) mapper.apply(sObjects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toIntList(result.iterator()));
//            }
//        }
//        return IntSequence.of(results);
    }

    /**
     * @description Returns a new `LongSequence` with `Long` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override LongEnumerable flatMapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.flatMapTo(sObjects, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final Iterable<Long> result = (Iterable<Long>) mapper.apply(sObjects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toLongList(result.iterator()));
//            }
//        }
//        return LongSequence.of(results);
    }

    /**
     * @description Returns a new `DoubleSequence` with `Double` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.flatMapTo(sObjects, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final Iterable<Double> result = (Iterable<Double>) mapper.apply(sObjects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toDoubleList(result.iterator()));
//            }
//        }
//        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a new `ObjectSequence` with `Object` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ObjectEnumerable flatMapToObject(final IFunction mapper) {
        return ObjectSequence.of(SequencePipeline.flatMapTo(sObjects, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(sObjects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toList(result));
//            }
//        }
//        return ObjectSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `SObjectSequence`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * List<Account> accountsWithResetAnnualRevenue = SObjectSequence.of(accounts)
     *     .forEach(SObjectConsumers.set(Account.AnnualRevenue, 0))
     *     .toList();
     */
    public virtual override SObjectEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(sObjects, consumer);
        return this;
    }

    /**
     * @description Returns a `SObjectSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectSequence`
     *
     * @example
     * List<Account> distinctAccounts = SObjectSequence.of(accounts)
     *     .distinct()
     *     .toList();
     */
    public virtual override SObjectEnumerable distinct() {
        return new SObjectSequence((List<SObject>) SequencePipeline.distinct(sObjects, new List<SObject>()));
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            if (!results.contains((SObject) sObjects[i])) {
//                results.add((SObject) sObjects[i]);
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * List<Account> distinctAccountsByName = SObjectSequence.of(accounts)
     *     .distinct(SObjectFunctions.get(Account.Name))
     *     .toList();
     */
    public virtual override SObjectEnumerable distinct(final IFunction classifier) {
        return new SObjectSequence(
            (List<SObject>) SequencePipeline.distinct(sObjects, classifier, new List<SObject>())
        );
//        Validate.notNull(classifier);
//        final List<SObject> results = new List<SObject>();
//        final Set<Object> classifierResults = new Set<Object>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            if (classifierResults.add(classifier.apply(sObjects[i]))) {
//                results.add((SObject) sObjects[i]);
//            }
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectSequence`
     *
     * @example
     * List<Account> sortedAccounts = SObjectSequence.of(accounts)
     *     .sort()
     *     .toList();
     */
    public virtual override SObjectEnumerable sort() {
//        final List<SObject> clone = (List<SObject>) sObjects.clone();
//        clone.sort();
        return new SObjectSequence((List<SObject>) SequencePipeline.sort(sObjects));
    }

    /**
     * @description Returns a `SObjectSequence` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare sequence elements
     *
     * @return the `SObjectSequence`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * List<Account> sortedAccountsByName = SObjectSequence.of(accounts)
     *     .sort(SObjectComparer.comparing(Account.Name))
     *     .toList();
     */
    public virtual override SObjectEnumerable sort(final IComparer comparer) {
        return new SObjectSequence((List<SObject>) SequencePipeline.sort(sObjects, comparer));
    }

    /**
     * @description Returns a `SObjectSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `SObjectSequence`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Account> first100Accounts = SObjectSequence.of(accounts)
     *     .lim(100)
     *     .toList();
     */
    public virtual override SObjectEnumerable lim(final Integer lim) {
        return new SObjectSequence((List<SObject>) SequencePipeline.lim(sObjects, lim, new List<SObject>()));
//        Validate.notNull(lim);
//        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
//        if (lim == 0) { return SObjectSequence.empty(); }
//        if (lim >= sObjects.size()) { return this; }
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0; i < lim; i++) {
//            results.add((SObject) sObjects[i]);
//        }
//        return new SObjectSequence(results);
    }

    /**
     * @description Returns a new `SObjectSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `SObjectSequence`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Account> restAccounts = SObjectSequence.of(accounts)
     *     .skip(100)
     *     .toList();
     */
    public virtual override SObjectEnumerable skip(final Integer n) {
        return new SObjectSequence((List<SObject>) SequencePipeline.skip(sObjects, n, new List<SObject>()));
//        Validate.notNull(n);
//        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
//        if (n == 0) { return this; }
//        if (n >= sObjects.size()) { return SObjectSequence.empty(); }
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            if (i >= n) {
//                results.add((SObject) sObjects[i]);
//            }
//        }
//        return new SObjectSequence(results);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `SObject` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
     *     .reduce(seedAcc, SObjectBinaryOperator.maxBy(Account.NumberOfEmployees));
     */
    public virtual override SObject reduce(final SObject identity, final IBiOperator accumulator) {
        return (SObject) SequencePipeline.reduce(sObjects, identity, accumulator);
//        Validate.notNull(accumulator);
//        SObject result = (SObject) identity;
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            result = (SObject) accumulator.apply(result, sObjects[i]);
//        }
//        return result;
    }

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` SObject describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` SObject result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
     *     .reduce(SObjectBinaryOperator.maxBy(Account.NumberOfEmployees))
     *     .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((SObject) SequencePipeline.reduce(sObjects, accumulator));
//        Validate.notNull(accumulator);
//        SObject result;
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            result = i == 0 ? (SObject) sObjects[i] : (SObject) accumulator.apply(result, sObjects[i]);
//        }
//        return Optional.ofNullable(result);
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
//     *
//     * @example
//     * List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
//     *     .collect(
//     *         Supplier.of(List<String>.class),
//     *         ListSObjectConsumers.addToList(SObjectFunctions.get(Account.Name))
//     *     );
//     */
//    public virtual override Object collect(final ISupplier supplier, final IBiConsumer accumulator) {
//        return SequencePipeline.collect(sObjects, Collector.of(supplier, accumulator));
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            accumulator.accept(container, sObjects[i]);
//        }
//        return container;
//    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the collector
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `collector` is null
     *
     * @example
     * // Group contacts by AccountId
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     SObjectSequence.of(contacts)
     *         .collect(SObjectCollectors.groupingById(Contact.AccountId));
     *         
     * // Group contacts by Department and by Account.Rating, cascading two collectors
     * Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
     *     = (Map<String, Map<String, List<Contact>>>)
     *         SObjectSequence.of(contacts)
     *             .collect(SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get(Contact.Department),
     *                 SObjectCollectors.groupingByString(
     *                     SObjectFunctions.get('Account?.Rating')
     *                 )
     *             ).cast(Map<String, Map<String, List<Contact>>>.class));
     */
    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(sObjects, collector);
//        Validate.notNull(collector);
//        final Object container = collector.supplier().get();
//        final IBiConsumer accumulator = collector.accumulator();
//        final IFunction finisher = collector.finisher();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            accumulator.accept(container, sObjects[i]);
//        }
//        return finisher == null ? container : finisher.apply(container);
    }

    /**
     * @description Returns an `Optional` SObject describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` SObject
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Account firstAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .find(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100))
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((SObject) SequencePipeline.find(sObjects, predicate));
//        Validate.notNull(predicate);
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            final SObject sObj = (SObject) sObjects[i];
//            if (predicate.test(sObj)) {
//                return Optional.ofNullable(sObj);
//            }
//        }
//        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `SObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .every(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100));
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(sObjects, predicate, 1);
//        Validate.notNull(predicate);
//        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `SObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .some(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100));
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(sObjects, predicate, 0);
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
        return sObjects.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    public virtual override Boolean isEmpty() {
        return sObjects.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<SObject>` containing the sequence elements
     *
     * @example
     * List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override List<SObject> toList() {
        return sObjects;
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `elementType`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     * @param elementType result type
     *
     * @return the `List<Object>` containing the sequence elements
     *
     * @throws NullPointerException if `field` or `elementType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
     *     .toList(SObjectFunctions.get('Name'), List<String>.class);
     */
    public virtual override List<Object> toList(final IFunction mapper, final Type elementType) {
        return SequencePipeline.toList(sObjects, mapper, elementType);
    }

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<SObject>` containing the sequence elements
     *
     * @example
     * Set<SObject> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toSet();
     */
    public virtual override Set<SObject> toSet() {
        return new Set<SObject>(sObjects);
    }

    /**
     * @description Accumulates `Object` elements returned by `mapper` into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Object>` containing the sequence elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Object> createdDates = SObjectSequence.of(contacts).toIdSet(SObjectFunctions.get('CreatedDate'));
     */
    public virtual override Set<Object> toSet(final IFunction mapper) {
        return SequencePipeline.toObjectSet(sObjects, mapper);
    }

//    /**
//     * @description Accumulates `Id` elements into a `Set<Id>`.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `Set<Id>` containing the sequence element field values
//     *
//     * @example
//     * Set<Id> accountIds = SObjectSequence.of(accounts).toIdSet();
//     */
//    public override Set<Id> toIdSet() {
//        return toIdSet('Id');
//    }

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Id>` containing the sequence elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Id> accountIds = SObjectSequence.of(contacts).toIdSet(SObjectFunctions.get('AccountId'));
     */
    public virtual override Set<Id> toIdSet(final IFunction mapper) {
        return SequencePipeline.toIdSet(sObjects, mapper);
    }

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<String>`containing the sequence elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<String> accountNames = SObjectSequence.of(accounts).toStringSet(SObjectFunctions.get('Name'));
     */
    public virtual override Set<String> toStringSet(final IFunction mapper) {
        return SequencePipeline.toStringSet(sObjects, mapper);
    }

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Map<Id, SObject>` containing the sequence elements
     *
     * @example
     * Map<Id, SObject> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toMap();
     */
    public virtual override Map<Id, SObject> toMap() {
        return new Map<Id, SObject>(sObjects);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `valueType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the value type
     *
     * @return the `Map<Id, SObject>` containing the sequence elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `valueType`
     * @throws NullPointerException if `keyMapper` or `valueType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectSequence.of(contacts)
     *     .toByIdMap(SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
     */
    public virtual override Map<Id, SObject> toByIdMap(final IFunction keyMapper, final Type valueType) {
        return (Map<Id, SObject>) SequencePipeline.toByIdMap(sObjects, keyMapper, valueType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `valueType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the value type
     *
     * @return the `Map<String, SObject>` containing the sequence elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `valueType`
     * @throws NullPointerException if `keyMapper` or `valueType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) SObjectSequence.of(accounts)
     *     .toByStringMap(SObjectFunctions.get('Name'), Map<String, Account>.class);
     */
    public virtual override Map<String, SObject> toByStringMap(final IFunction keyMapper, final Type valueType) {
        return (Map<String, SObject>) SequencePipeline.toByStringMap(sObjects, keyMapper, valueType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the sequence elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = SObjectSequence.of(contacts)
     *     .groupById(SObjectFunctions.get('AccountId'));
     */
    public virtual override Map<Id, List<SObject>> groupById(final IFunction keyMapper) {
        return (Map<Id, List<SObject>>) SequencePipeline.groupById(sObjects, keyMapper, SObject.class);
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<String, List<SObject>>` containing the sequence elements
     *
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * Map<String, List<Account>> accountsByRating = SObjectSequence.of(accounts)
     *     .groupByString(SObjectFunctions.get('Rating'));
     */
    public virtual override Map<String, List<SObject>> groupByString(final IFunction keyMapper) {
        return (Map<String, List<SObject>>) SequencePipeline.groupByString(sObjects, keyMapper, SObject.class);
    }

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the sequence elements
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = SObjectSequence.of(accounts).partition(SObjectPredicates.isEqual(Account.Rating, 'Hot'));
     */
    public virtual override Map<Boolean, List<SObject>> partition(final IPredicate predicate) {
        return (Map<Boolean, List<SObject>>) SequencePipeline.partition(sObjects, predicate, SObject.class);
    }
    // @end-group
    //</editor-fold>

}
