/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `SObject` elements supporting aggregate operations.
 * Stream operations are composed of stream chain. A stream chain consists of:
 * <ul>
 *     <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
 *     <li>Zero or more Intermediate Operations (which transform a stream into another stream,
 *     such as {@link SObjectStream.filter(ISObjectPredicate))}.</li>
 *     <li>A Terminal Operation (which produces a result such as
 *     {@link SObjectStream.count()} or {@link SObjectStream.collect(ISObjectCollector)}).</li>
 * </ul>
 * <p>Streams are <strong>lazy</strong>:</p>
 * <ul>
 *     <li>Intermediate operations describe how a stream is processed without performing any action.</li>
 *     <li>Computation is only performed when the terminal operation is initiated,
 * and source elements are consumed only as needed.</li>
 * </ul>
 * <p>A stream may not consume all elements. It may be infinite and complete in finite time.</p>
 * <p>A stream should be operated on (invoking an intermediate or terminal stream operation)
 * only <strong>once</strong>.
 * A stream throws {@link IllegalStateException} if it detects that the stream is being reused.</p>
 * <p>Contract:</p>
 * <ul>
 *     <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>
 *     <li>Should be stateless in most cases.</li>
 * </ul>
 * <p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>,
 * i.e. do not support `spliterator()`.</p>
 * <p>There are primitive specializations for {@link IntStream}, {@link LongStream},
 * and {@link DoubleStream} and {@link ObjectStream} for Object references.</p>
 * <p>Sequences and streams equally ensure the fulfillment of the set goals,
 * but are implemented in different ways.</p>
 * @example
 * Double annualRevenueSumOfUniqueHotRankedAccounts
 *     = SObjectStream.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 * @see SObjectSequence
 * @see ObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 */
public virtual inherited sharing class SObjectStream extends SObjectIterable implements ISObjectIterable {

    private final Iterator<SObject> iterator;

    /**
     * @description A flag defining whether this stream has been linked or consumed.
     */
    public Boolean isOperated { get { return isOperated; } protected set; } {
        isOperated = false;
    }

    protected SObjectStream() {
        this(new List<SObject>().iterator());
    }

    protected SObjectStream(final Iterator<SObject> iterator) {
        this.iterator = iterator;
    }

    /**
     * @description Returns an internal iterator for the elements of this stream.
     * <p>Terminal Operation.</p>
     * @return the internal `Iterator<SObject>`
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public Iterator<SObject> iterator() {
        Validate.isTrue(!isOperated, Label.StreamOperatedErrorMessage);
        try {
            return iterator;
        } finally {
            isOperated = true;
        }
    }

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `SObjectStream` created from `iterator`.
     * @example
     * ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts).iterator());
     * ISObjectIterable accStream = SObjectStream.of(new Set<Account>(accounts).iterator());
     * ISObjectIterable accStream = SObjectStream.of(
     *     (Iterator<Account>) Database.getQueryLocator('SELECT Id FROM Account').iterator()
     * );
     * ISObjectIterable accStream = SObjectStream.of(otherStream.iterator());
     * @param iterator the iterator
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterator` is null
     */
    public static ISObjectIterable of(final Iterator<SObject> iterator) {
        Validate.notNull(iterator);
        return new SObjectStream(iterator);
    }

    /**
     * @description Returns a `SObjectStream` created from `iterable`.
     * @example
     * ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.of((Iterable<Account>) new Set<Account>(accounts));
     * @param iterable the iterable
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable` is null
     */
    public static ISObjectIterable of(final Iterable<SObject> iterable) {
        Validate.notNull(iterable);
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `SObjectStream` created from `iterable` if non-null,
     * otherwise returns an empty `SObjectStream`.
     * @example
     * ISObjectIterable accStream = SObjectStream.ofNullable(new List<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.ofNullable((Iterable<Account>) new Set<Account>(accounts));
     * @param iterable the iterable
     * @return the new `SObjectStream` if `iterable` is non-null,
     * otherwise an empty `SObjectStream`
     */
    public static ISObjectIterable ofNullable(final Iterable<SObject> iterable) {
        if (iterable == null) { return empty(); }
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns an empty `SObjectStream`.
     * @return the empty `SObjectStream`
     */
    public static ISObjectIterable empty() {
        return new SObjectStream();
    }

    /**
     * @description Returns an infinite `SObjectStream` where each element is
     * generated by `supplier`.
     * @example
     * ISObjectIterable accStream = SObjectStream.generate(SObjectSupplier.of(Account.SObjectType));
     * @param supplier the supplier of generated elements
     * @return the new `SObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static ISObjectIterable generate(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return new SObjectStream(new SObjectGenerator(supplier));
    }

    /**
     * @description Returns an infinite `SObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `SObjectStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `SObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static ISObjectIterable iterate(final SObject seed, final ISObjectUnaryOperator operator) {
        Validate.notNull(operator);
        return new SObjectStream(new SObjectIterate(seed, operator));
    }

    /**
     * @description Returns an infinite `SObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `SObjectStream`
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static ISObjectIterable iterate(
            final SObject seed,
            final ISObjectPredicate predicate,
            final ISObjectUnaryOperator operator
    ) {
        Validate.notNull(predicate);
        Validate.notNull(operator);
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns eagerly concatenated `SObjectStream` whose elements are all the
     * elements of the first `ISObjectIterable` followed by all the elements of the
     * second `ISObjectIterable`.
     * @example
     * ISObjectIterable accStream = SObjectStream.concat(stream1, stream2);
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ISObjectIterable concat(final ISObjectIterable iterable1, final ISObjectIterable iterable2) {
        return concat(new List<ISObjectIterable>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<ISObjectIterable>`.
     * @example
     * ISObjectIterable accStream = SObjectStream.concat(streams);
     * @param iterables the list of `ISObjectIterable`
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterables` or some of `ISObjectIterable` in a list is null
     */
    public static ISObjectIterable concat(final List<ISObjectIterable> iterables) {
        Validate.noNullElements(iterables);
        final List<Iterator<SObject>> iterators = new List<Iterator<SObject>>();
        final Iterator<ISObjectIterable> iterator = iterables.iterator();
        while (iterator.hasNext()) {
            final ISObjectIterable iterable = iterator.next();
            iterators.add(iterable.iterator());
        }
        return new SObjectStream(new SObjectConcatIterator(iterators));
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position.
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueStream = SObjectStream.zip(
     *     SObjectStream.of(Trigger.old),
     *     SObjectStream.of(Trigger.new),
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectStream`
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
        return new SObjectStream(new SObjectZipIterator(iterable1.iterator(), iterable2.iterator(), combiner));
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueStream = SObjectStream.zip(
     *     SObjectStream.of(Trigger.old),
     *     SObjectStream.of(Trigger.new),
     *     SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectStream`
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
        return new SObjectStream(new SObjectZipBiPredicateIterator(
                iterable1.iterator(),
                iterable2.iterator(),
                predicate,
                combiner
        ));
    }

    /**
     * @description Returns new `SObjectStream` by appending `iterable`
     * to the current stream.
     * @example
     * ISObjectIterable accStream = stream1.append(stream2);
     * @param iterable the `ISObjectIterable` to append to the current stream
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual ISObjectIterable append(final ISObjectIterable iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `SObjectStream` by prepending `iterable`
     * to the current stream.
     * @example
     * ISObjectIterable accStream = stream1.prepend(stream2);
     * @param iterable the `ISObjectIterable` to prepend to the current stream
     * @return the new `SObjectStream`
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
     * @description Returns new `SObjectSequence` from the current stream.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * ISObjectIterable accSeq = SObjectStream.of(accounts).sequence();
     * @return the new `SObjectSequence`
     */
    public virtual ISObjectIterable sequence() {
        return SObjectSequence.of(Iterators.toSObjectList(iterator()));
    }

    /**
     * @description Returns a `SObjectStream` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable filter(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new SObjectStream(new SObjectFilterIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Account> firstAccountsWithHotRating = SObjectStream.of(accounts)
     *     .take(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable take(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new SObjectStream(new SObjectTakeIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = SObjectStream.of(accounts)
     *     .drop(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `SObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override ISObjectIterable drop(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new SObjectStream(new SObjectDropIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Account> accounts = SObjectStream.of(contacts)
     *     .mapTo(SObjectUnaryOperator.getSObject(Contact.AccountId))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ISObjectIterable mapTo(final ISObjectUnaryOperator mapper) {
        Validate.notNull(mapper);
        return new SObjectStream(new SObjectMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `IntStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Integer> numberOfEmployees = SObjectStream.of(accounts)
     *     .mapToInt(SObjectToIntFunction.get(Account.NumberOfEmployees))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `IntStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IIntIterable mapToInt(final ISObjectToIntFunction mapper) {
        Validate.notNull(mapper);
        return IntStream.of(new SObjectToIntMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `LongStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Long> numberOfEmployees = SObjectStream.of(accounts)
     *     .mapToLong(SObjectToLongFunction.get(Account.NumberOfEmployees))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `LongStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ILongIterable mapToLong(final ISObjectToLongFunction mapper) {
        Validate.notNull(mapper);
        return LongStream.of(new SObjectToLongMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Double> annualRevenues = SObjectStream.of(accounts)
     *     .mapToDouble(SObjectToDoubleFunction.get(Account.AnnualRevenue))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IDoubleIterable mapToDouble(final ISObjectToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return DoubleStream.of(new SObjectToDoubleMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Object> birthdates = SObjectStream.of(contacts)
     *     .mapToObject(SObjectToDoubleFunction.get(Contact.Birthdate))
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `ObjectStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IObjectIterable mapToObject(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return ObjectStream.of(new SObjectToObjectMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectStream` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithResetAnnualRevenue = SObjectStream.of(accounts)
     *     .forEach(SObjectConsumer.set(Account.AnnualRevenue, 0))
     *     .toList();
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return the `SObjectStream`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual override ISObjectIterable forEach(final ISObjectConsumer consumer) {
        Validate.notNull(consumer);
        return new SObjectStream(new SObjectForEachIterator(iterator(), consumer));
    }

    /**
     * @description Returns a `SObjectStream` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccounts = SObjectStream.of(accounts)
     *     .distinct()
     *     .toList();
     * @return the `SObjectStream`
     */
    public virtual ISObjectIterable distinct() {
        return new SObjectStream(new SObjectDistinctIterator(iterator()));
    }

    /**
     * @description Returns a `SObjectStream` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccountsByName = SObjectStream.of(accounts)
     *     .distinct(SObjectFunction.get(Account.Name))
     *     .toList();
     * @param classifier the classifier function
     * @return the `SObjectStream`
     * @throws NullPointerException if `classifier` is null
     */
    public virtual override ISObjectIterable distinct(final ISObjectFunction classifier) {
        Validate.notNull(classifier);
        return new SObjectStream(new SObjectDistinctIterator(iterator(), classifier));
    }

    /**
     * @description Returns a `SObjectStream` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccounts = SObjectStream.of(accounts)
     *     .sort()
     *     .toList();
     * @return the `SObjectStream`
     */
    public virtual ISObjectIterable sort() {
        final List<SObject> sObjects = Iterators.toSObjectList(iterator());
        sObjects.sort();
        return new SObjectStream(sObjects.iterator());
    }

    /**
     * @description Returns a `SObjectStream` with sorted elements according to `comparator`.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByName = SObjectStream.of(accounts)
     *     .sort(SObjectComparator.comparing(Account.Name))
     *     .toList();
     * @param comparator the non-interfering, stateless comparator to compare stream elements
     * @return the `SObjectStream`
     * @throws NullPointerException if `comparator` is null
     */
    public virtual override ISObjectIterable sort(final ISObjectComparator comparator) {
        Validate.notNull(comparator);
        return new SObjectStream(new SObjectSortIterator(iterator(), comparator));
    }

    /**
     * @description Returns a `SObjectStream` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Account> first100Accounts = SObjectStream.of(accounts)
     *     .lim(100)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `SObjectStream`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual ISObjectIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return SObjectStream.empty(); }
        return new SObjectStream(new SObjectLimitIterator(iterator(), lim));
    }

    /**
     * @description Returns a new `SObjectStream` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = SObjectStream.of(accounts)
     *     .skip(100)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `SObjectStream`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual ISObjectIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return new SObjectStream(iterator()); }
        return new SObjectStream(new SObjectSkipIteratorIterator(iterator(), n));
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
     * Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
     *     .reduce(seedAcc, SObjectBinaryOperator.maxBy(Account.NumberOfEmployees));
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `SObject` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual SObject reduce(final SObject identity, final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        SObject result = identity;
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            result = accumulator.apply(result, iterator.next());
        }
        return result;
    }

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalSObject` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
     *     .reduce(SObjectBinaryOperator.maxBy(Account.NumberOfEmployees))
     *     .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalSObject` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override OptionalSObject reduce(final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Boolean found = false;
        SObject result;
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            final SObject value = iterator.next();
            if (!found) {
                found = true;
                result = value;
            } else {
                result = accumulator.apply(result, value);
            }
        }
        return found ? OptionalSObject.ofNullable(result) : OptionalSObject.empty();
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> accountNames = (List<String>) SObjectStream.of(accounts)
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
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            accumulator.accept(container, iterator.next());
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
     *     SObjectStream.of(contacts)
     *         .collect(SObjectCollector.groupingById(Contact.AccountId));
     * // Group contacts by Department and by Account.Rating, cascading two collectors
     * Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
     *     = (Map<String, Map<String, List<Contact>>>)
     *         SObjectStream.of(contacts)
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
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            collector.accumulator().accept(container, iterator.next());
        }
        return collector.finisher() == null ? container : collector.finisher().apply(container);
    }

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Account firstAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
     *     .find(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100))
     *     .get();
     * @param predicate the predicate
     * @return the `OptionalSObject`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override OptionalSObject find(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        SObject result;
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            if (predicate.test(sObj)) {
                result = sObj;
                break;
            }
        }
        return OptionalSObject.ofNullable(result);
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `SObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
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
     * If `SObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
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
        Integer count = 0;
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            iterator.next();
            count++;
        }
        return count;
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return !iterator().hasNext();
    }

    /**
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     * @return the `List<SObject>` containing the stream elements
     */
    public virtual List<SObject> toList() {
        return Iterators.toSObjectList(iterator());
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> accountNames = (List<String>) SObjectStream.of(accounts)
     *     .toList(SObjectFunction.get('Name'), List<String>.class);
     * @param mapper the mapping function
     * @param listType result type
     * @return the `List<Object>` containing the stream elements
     * @throws NullPointerException if `field` or `listType` is null
     */
    public virtual override List<Object> toList(final ISObjectFunction mapper, final Type listType) {
        return Iterators.toList(iterator(), mapper, listType);
    }

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toSet();
     * @return the `Set<SObject>` containing the stream elements
     */
    public virtual Set<SObject> toSet() {
        return Iterators.toSObjectSet(iterator());
    }

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<Id> accountIds = SObjectStream.of(accounts).toIdSet();
     * @return the `Set<Id>` containing the stream elements field values
     */
    public virtual Set<Id> toIdSet() {
        return toIdSet('Id');
    }

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<Id> accountIds = SObjectStream.of(contacts).toIdSet(SObjectFunction.get('AccountId'));
     * @param mapper the mapping function
     * @return the `Set<Id>` containing the stream elements field values
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override Set<Id> toIdSet(final ISObjectFunction mapper) {
        return Iterators.toIdSet(iterator(), mapper);
    }

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     * @example
     * Set<String> accountNames = SObjectStream.of(accounts).toStringSet(SObjectFunction.get('Name'));
     * @param mapper the mapping function
     * @return the `Set<String>`containing the stream elements field values
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override Set<String> toStringSet(final ISObjectFunction mapper) {
        return Iterators.toStringSet(iterator(), mapper);
    }

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
     *     .toMap();
     * @return the `Map<Id, SObject>` containing the stream elements
     */
    public virtual Map<Id, SObject> toMap() {
        return Iterators.toSObjectMap(iterator());
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectStream.of(contacts)
     *     .toByIdMap(SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<Id, SObject>` containing the stream elements
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     * @throws IllegalStateException if mapped keys contain duplicates, which can be casted to `mapType`
     */
    public virtual override Map<Id, SObject> toByIdMap(final ISObjectFunction keyMapper, final Type mapType) {
        return Iterators.toByIdMap(iterator(), keyMapper, mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) SObjectStream.of(accounts)
     *     .toByStringMap(SObjectFunction.get('Name'), Map<String, Account>.class);
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<String, SObject>` containing the stream elements
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     * @throws IllegalStateException if mapped keys contain duplicates, which can be casted to `mapType`
     */
    public virtual override Map<String, SObject> toByStringMap(final ISObjectFunction keyMapper, final Type mapType) {
        return Iterators.toByStringMap(iterator(), keyMapper, mapType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = SObjectStream.of(contacts)
     *     .groupById(SObjectFunction.get('AccountId'));
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the stream elements
     * @throws NullPointerException if `field` is null
     */
    public virtual override Map<Id, List<SObject>> groupById(final ISObjectFunction keyMapper) {
        return Iterators.groupById(iterator(), keyMapper);
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Map<String, List<Account>> accountsByRating = SObjectStream.of(accounts)
     *     .groupByString(SObjectFunction.get('Rating'));
     * @param keyMapper the mapping function producing keys
     * @return the `Map<String, List<SObject>>` containing the stream elements
     * @throws NullPointerException if `keyMapper` is null
     */
    public virtual override Map<String, List<SObject>> groupByString(final ISObjectFunction keyMapper) {
        return Iterators.groupByString(iterator(), keyMapper);
    }

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = SObjectStream.of(accounts).partition(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
     * @param predicate the predicate
     * @return the `Map<Boolean, List<SObject>>` containing the stream elements
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Map<Boolean, List<SObject>> partition(final ISObjectPredicate predicate) {
        return Iterators.partition(iterator(), predicate);
    }

    private Boolean match(final ISObjectPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        final Iterator<SObject> iterator = iterator();
        while (iterator.hasNext()) {
            final Boolean isMatched = predicate.test(iterator.next());
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
