/**
 * @author O. Berehovskyi.
 * @group Iterables
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
 * @example
 * Double annualRevenueSumOfUniqueHotRankedAccounts
 *     = SObjectSequence.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 * @see SObjectStream
 * @see ObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 */
public virtual inherited sharing class SObjectSequence extends SObjectIterable implements ISObjectIterable {

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
     * @return the internal `Iterator<SObject>`
     */
    public Iterator<SObject> iterator() {
        return sObjects.iterator();
    }

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `SObjectSequence` created from `sObjects` list.
     * @example
     * ISObjectIterable accSeq = SObjectSequence.of(new List<Account>(accounts));
     * @param sObjects the list of SObjects
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final List<SObject> sObjects) {
        Validate.notNull(sObjects);
        return new SObjectSequence(sObjects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` set.
     * @example
     * ISObjectIterable sObjSeq = SObjectSequence.of(new Set<SObject>(sObjects));
     * @param sObjects the set of SObjects
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final Set<SObject> sObjects) {
        Validate.notNull(sObjects);
        return new SObjectSequence(new List<SObject>(sObjects));
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` list if non-null,
     * otherwise returns an empty `SObjectSequence`.
     * @example
     * ISObjectIterable accSeq = SObjectSequence.ofNullable(new List<Account>(accounts));
     * @param sObjects the list of SObjects
     * @return the new `SObjectSequence` if `sObjects` is non-null,
     * otherwise an empty `SObjectSequence`
     */
    public static ISObjectIterable ofNullable(final List<SObject> sObjects) {
        if (sObjects == null) { return empty(); }
        return new SObjectSequence(sObjects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` set if non-null,
     * otherwise returns an empty `SObjectSequence`.
     * @example
     * ISObjectIterable accSeq = SObjectSequence.ofNullable(new Set<SObject>(sObjects));
     * @param sObjects the set of SObjects
     * @return the new `SObjectSequence` if `sObjects` is non-null,
     * otherwise an empty `SObjectSequence`
     */
    public static ISObjectIterable ofNullable(final Set<SObject> sObjects) {
        if (sObjects == null) { return empty(); }
        return new SObjectSequence(new List<SObject>(sObjects));
    }

    /**
     * @description Returns an empty `SObjectSequence`.
     * @return the empty `SObjectSequence`
     */
    public static ISObjectIterable empty() {
        return new SObjectSequence();
    }

    /**
     * @description Returns eagerly concatenated `SObjectSequence` whose elements are all the
     * elements of the first `ISObjectIterable` followed by all the elements of the
     * second `ISObjectIterable`.
     * @example
     * ISObjectIterable accSeq = SObjectSequence.concat(seq1, seq2);
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ISObjectIterable concat(final ISObjectIterable iterable1, final ISObjectIterable iterable2) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        return concat(new List<ISObjectIterable>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<ISObjectIterable>`.
     * @example
     * ISObjectIterable accSeq = SObjectSequence.concat(sequences);
     * @param iterables the list of `ISObjectIterable`
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterables` or some of `ISObjectIterable` in a list is null
     */
    public static ISObjectIterable concat(final List<ISObjectIterable> iterables) {
        Validate.noNullElements(iterables);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            results.addAll(iterables[i].toList());
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a combined `SObjectSequence` by applying `combiner` function
     * to each element at the same position.
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueSeq = SObjectSequence.zip(
     *     SObjectSequence.of(Trigger.old),
     *     SObjectSequence.of(Trigger.new),
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ISObjectIterable zip(
            final ISObjectIterable iterable1,
            final ISObjectIterable iterable2,
            final ISObjectBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        final List<SObject> results = new List<SObject>();
        final List<SObject> left = iterable1.toList();
        final List<SObject> right = iterable2.toList();
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            results.add(combiner.apply(left[i], right[i]));
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a combined `SObjectSequence` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = SObjectSequence.zip(
     *     SObjectSequence.of(Trigger.old),
     *     SObjectSequence.of(Trigger.new),
     *     SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     */
    public static ISObjectIterable zip(
            final ISObjectIterable iterable1,
            final ISObjectIterable iterable2,
            final ISObjectBiPredicate predicate,
            final ISObjectBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(predicate);
        Validate.notNull(combiner);
        final List<SObject> results = new List<SObject>();
        final List<SObject> left = iterable1.toList();
        final List<SObject> right = iterable2.toList();
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            if (predicate.test(left[i], right[i])) {
                results.add(combiner.apply(left[i], right[i]));
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns new `SObjectSequence` by appending `iterable`
     * to the current sequence.
     * @example
     * ISObjectIterable accSeq = seq.append(seq1);
     * @param iterable the `ISObjectIterable` to append to the current sequence
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual ISObjectIterable append(final ISObjectIterable iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `SObjectSequence` by prepending `iterable`
     * to the current sequence.
     * @example
     * ISObjectIterable accSeq = seq.prepend(seq2);
     * @param iterable the `ISObjectIterable` to prepend to the current sequence
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual ISObjectIterable prepend(final ISObjectIterable iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns new `SObjectStream` from the current sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * ISObjectIterable accStream = SObjectSequence.of(accounts).stream();
     * @return the new `SObjectStream`
     */
    public virtual ISObjectIterable stream() {
        return SObjectStream.of(iterator());
    }

    /**
     * @description Returns a `SObjectSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable filter(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            if (predicate.test(sObj)) {
                results.add(sObj);
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Account> firstAccountsWithHotRating = SObjectSequence.of(accounts)
     *     .take(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable take(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            if (predicate.test(sObj)) {
                results.add(sObj);
            } else {
                break;
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = SObjectSequence.of(accounts)
     *     .drop(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable drop(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        final List<SObject> results = new List<SObject>();
        Boolean drop = true;
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            if (!predicate.test(sObj) || !drop) {
                results.add(sObj);
                drop = false;
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> accounts = SObjectSequence.of(contacts)
     *     .mapTo(SObjectUnaryOperator.getSObject(Contact.AccountId))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ISObjectIterable mapTo(final ISObjectUnaryOperator mapper) {
        Validate.notNull(mapper);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Integer> numberOfEmployees = SObjectSequence.of(accounts)
     *     .mapToInt(SObjectToIntFunction.get(Account.NumberOfEmployees))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `IntSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IIntIterable mapToInt(final ISObjectToIntFunction mapper) {
        Validate.notNull(mapper);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return IntSequence.of(results);
    }

    /**
     * @description Returns a `LongSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> numberOfEmployees = SObjectSequence.of(accounts)
     *     .mapToLong(SObjectToLongFunction.get(Account.NumberOfEmployees))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `LongSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ILongIterable mapToLong(final ISObjectToLongFunction mapper) {
        Validate.notNull(mapper);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return LongSequence.of(results);
    }

    /**
     * @description Returns a `DoubleSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> annualRevenues = SObjectSequence.of(accounts)
     *     .mapToDouble(SObjectToDoubleFunction.get(Account.AnnualRevenue))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IDoubleIterable mapToDouble(final ISObjectToDoubleFunction mapper) {
        Validate.notNull(mapper);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a `ObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Object> birthdates = SObjectSequence.of(contacts)
     *     .mapToObject(SObjectToDoubleFunction.get(Contact.Birthdate))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `ObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IObjectIterable mapToObject(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return ObjectSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithResetAnnualRevenue = SObjectSequence.of(accounts)
     *     .forEach(SObjectConsumer.set(Account.AnnualRevenue, 0))
     *     .toList();
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return this `SObjectSequence`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual override ISObjectIterable forEach(final ISObjectConsumer consumer) {
        Validate.notNull(consumer);
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            consumer.accept(sObjects[i]);
        }
        return this;
    }

    /**
     * @description Returns a `SObjectSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccounts = SObjectSequence.of(accounts)
     *     .distinct()
     *     .toList();
     * @return the `SObjectSequence`
     */
    public virtual ISObjectIterable distinct() {
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            if (!results.contains(sObjects[i])) {
                results.add(sObjects[i]);
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccountsByName = SObjectSequence.of(accounts)
     *     .distinct(SObjectFunction.get(Account.Name))
     *     .toList();
     * @param classifier the classifier function
     * @return the `SObjectSequence`
     * @throws NullPointerException if `classifier` is null
     */
    public virtual override ISObjectIterable distinct(final ISObjectFunction classifier) {
        Validate.notNull(classifier);
        final List<SObject> results = new List<SObject>();
        final Set<Object> classifierResults = new Set<Object>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            if (classifierResults.add(classifier.apply(sObjects[i]))) {
                results.add(sObjects[i]);
            }
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a `SObjectSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccounts = SObjectSequence.of(accounts)
     *     .sort()
     *     .toList();
     * @return the `SObjectSequence`
     */
    public virtual ISObjectIterable sort() {
        final List<SObject> clone = sObjects.clone();
        clone.sort();
        return new SObjectSequence(clone);
    }

    /**
     * @description Returns a `SObjectSequence` with sorted elements according to `comparator`.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByName = SObjectSequence.of(accounts)
     *     .sort(SObjectComparator.comparing(Account.Name))
     *     .toList();
     * @param comparator the non-interfering, stateless comparator to compare sequence elements
     * @return the `SObjectSequence`
     * @throws NullPointerException if `comparator` is null
     */
    public virtual override ISObjectIterable sort(final ISObjectComparator comparator) {
        return new SObjectSequence(Lists.sort(sObjects, comparator));
    }

    /**
     * @description Returns a `SObjectSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Account> first100Accounts = SObjectSequence.of(accounts)
     *     .lim(100)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `SObjectSequence`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual ISObjectIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return SObjectSequence.empty(); }
        if (lim >= sObjects.size()) { return this; }
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0; i < lim; i++) {
            results.add(sObjects[i]);
        }
        return new SObjectSequence(results);
    }

    /**
     * @description Returns a new `SObjectSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = SObjectSequence.of(accounts)
     *     .skip(100)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `SObjectSequence`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual ISObjectIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return this; }
        if (n >= sObjects.size()) { return SObjectSequence.empty(); }
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            if (i >= n) {
                results.add(sObjects[i]);
            }
        }
        return new SObjectSequence(results);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
     *     .reduce(seedAcc, SObjectBinaryOperator.maxBy(Account.NumberOfEmployees));
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `SObject` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual SObject reduce(final SObject identity, final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        SObject result = identity;
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            result = accumulator.apply(result, sObjects[i]);
        }
        return result;
    }

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalSObject` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
     *     .reduce(SObjectBinaryOperator.maxBy(Account.NumberOfEmployees))
     *     .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalSObject` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override OptionalSObject reduce(final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        SObject result;
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            result = i == 0 ? sObjects[i] : accumulator.apply(result, sObjects[i]);
        }
        return OptionalSObject.ofNullable(result);
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
     *     .collect(
     *         Supplier.of(List<String>.class),
     *         ListSObjectConsumer.addToList(SObjectFunction.get(Account.Name))
     *     );
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public virtual Object collect(final ISupplier supplier, final IObjectSObjectConsumer accumulator) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        final Object container = supplier.get();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            accumulator.accept(container, sObjects[i]);
        }
        return container;
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     * @example
     * // Group contacts by AccountId
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     SObjectSequence.of(contacts)
     *         .collect(SObjectCollector.groupingById(Contact.AccountId));
     * // Group contacts by Department and by Account.Rating, cascading two collectors
     * Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
     *     = (Map<String, Map<String, List<Contact>>>)
     *         SObjectSequence.of(contacts)
     *             .collect(SObjectCollector.groupingByString(
     *                 SObjectFunction.get(Contact.Department),
     *                 SObjectCollector.groupingByString(
     *                     SObjectFunction.get('Account?.Rating')
     *                 )
     *             ).cast(Map<String, Map<String, List<Contact>>>.class));
     * @param collector the collector
     * @return the `Object` result of the collection
     * @throws NullPointerException if `collector` is null
     */
    public virtual Object collect(final ISObjectCollector collector) {
        Validate.notNull(collector);
        final Object container = collector.supplier().get();
        final IObjectSObjectConsumer accumulator = collector.accumulator();
        final IFunction finisher = collector.finisher();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            accumulator.accept(container, sObjects[i]);
        }
        return finisher == null ? container : finisher.apply(container);
    }

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Account firstAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .find(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100))
     *     .get();
     * @param predicate the predicate
     * @return the `OptionalSObject`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override OptionalSObject find(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            if (predicate.test(sObj)) {
                return OptionalSObject.ofNullable(sObj);
            }
        }
        return OptionalSObject.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `SObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .every(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100));
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Boolean every(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `SObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
     *     .some(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100));
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Boolean some(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     * @return the count of elements
     */
    public virtual Integer count() {
        return sObjects.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return sObjects.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @return the `List<SObject>` containing the sequence elements
     */
    public virtual List<SObject> toList() {
        return sObjects;
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
     *     .toList(SObjectFunction.get('Name'), List<String>.class);
     * @param mapper the mapping function
     * @param listType result type
     * @return the `List<Object>` containing the sequence elements
     * @throws NullPointerException if `field` or `listType` is null
     */
    public virtual override List<Object> toList(final ISObjectFunction mapper, final Type listType) {
        return Lists.toList(sObjects, mapper, listType);
    }

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<SObject> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toSet();
     * @return the `Set<SObject>` containing the sequence elements
     */
    public virtual Set<SObject> toSet() {
        return new Set<SObject>(sObjects);
    }

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<Id> accountIds = SObjectSequence.of(accounts).toIdSet();
     * @return the `Set<Id>` containing the sequence element field values
     */
    public Set<Id> toIdSet() {
        return toIdSet('Id');
    }

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<Id> accountIds = SObjectSequence.of(contacts).toIdSet(SObjectFunction.get('AccountId'));
     * @param mapper the mapping function
     * @return the `Set<Id>` containing the sequence elements field values
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override Set<Id> toIdSet(final ISObjectFunction mapper) {
        return Lists.toIdSet(sObjects, mapper);
    }

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<String> accountNames = SObjectSequence.of(accounts).toStringSet(SObjectFunction.get('Name'));
     * @param mapper the mapping function
     * @return the `Set<String>`containing the sequence elements field values
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override Set<String> toStringSet(final ISObjectFunction mapper) {
        return Lists.toStringSet(sObjects, mapper);
    }

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, SObject> accountsWithHotRating = SObjectSequence.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toMap();
     * @return the `Map<Id, SObject>` containing the sequence elements
     */
    public virtual Map<Id, SObject> toMap() {
        return new Map<Id, SObject>(sObjects);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectSequence.of(contacts)
     *     .toByIdMap(SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<Id, SObject>` containing the sequence elements
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     * @throws IllegalStateException if mapped keys contain duplicates, which can be casted to `mapType`
     */
    public virtual override Map<Id, SObject> toByIdMap(final ISObjectFunction keyMapper, final Type mapType) {
        return Lists.toByIdMap(sObjects, keyMapper, mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) SObjectSequence.of(accounts)
     *     .toByStringMap(SObjectFunction.get('Name'), Map<String, Account>.class);
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<String, SObject>` containing the sequence elements
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     * @throws IllegalStateException if mapped keys contain duplicates, which can be casted to `mapType`
     */
    public virtual override Map<String, SObject> toByStringMap(final ISObjectFunction keyMapper, final Type mapType) {
        return Lists.toByStringMap(sObjects, keyMapper, mapType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = SObjectSequence.of(contacts)
     *     .groupById(SObjectFunction.get('AccountId'));
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the sequence elements
     * @throws NullPointerException if `field` is null
     */
    public virtual override Map<Id, List<SObject>> groupById(final ISObjectFunction keyMapper) {
        return Lists.groupById(sObjects, keyMapper);
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<String, List<Account>> accountsByRating = SObjectSequence.of(accounts)
     *     .groupByString(SObjectFunction.get('Rating'));
     * @param keyMapper the mapping function producing keys
     * @return the `Map<String, List<SObject>>` containing the sequence elements
     * @throws NullPointerException if `keyMapper` is null
     */
    public virtual override Map<String, List<SObject>> groupByString(final ISObjectFunction keyMapper) {
        return Lists.groupByString(sObjects, keyMapper);
    }

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = SObjectSequence.of(accounts).partition(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
     * @param predicate the predicate
     * @return the `Map<Boolean, List<SObject>>` containing the sequence elements
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Map<Boolean, List<SObject>> partition(final ISObjectPredicate predicate) {
        return Lists.partition(sObjects, predicate);
    }

    private Boolean match(final ISObjectPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(sObjects[i]);
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
