/**
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
 *
 * @see SObjectSequence
 * @see ObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Double annualRevenueSumOfUniqueHotRankedAccounts
 *     = SObjectStream.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 */
public virtual inherited sharing class SObjectStream extends SObjectEnumerable {

    private final transient Iterator<SObject> iterator;

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
     *
     * @return the internal `Iterator<SObject>`
     *
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public override Iterator<SObject> iterator() {
        Validate.isTrue(!isOperated, Label.AS_ErrorMessage_StreamOperated);
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
     *
     * @param iterator the iterator
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts).iterator());
     * ISObjectIterable accStream = SObjectStream.of(new Set<Account>(accounts).iterator());
     * ISObjectIterable accStream = SObjectStream.of(
     *     (Iterator<Account>) Database.getQueryLocator('SELECT Id FROM Account').iterator()
     * );
     * ISObjectIterable accStream = SObjectStream.of(otherStream.iterator());
     */
    public static SObjectEnumerable of(final Iterator<SObject> iterator) {
        Validate.notNull(iterator);
        return new SObjectStream(iterator);
    }

    /**
     * @description Returns a `SObjectStream` created from `iterable`.
     *
     * @param iterable the iterable
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.of((Iterable<Account>) new Set<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.of(stream1);
     */
    public static SObjectEnumerable of(final Iterable<SObject> iterable) {
        Validate.notNull(iterable);
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `SObjectStream` created from `iterable` if non-null,
     * otherwise returns an empty `SObjectStream`.
     *
     * @param iterable the iterable
     *
     * @return the new `SObjectStream` if `iterable` is non-null,
     * otherwise an empty `SObjectStream`
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.ofNullable(new List<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.ofNullable((Iterable<Account>) new Set<Account>(accounts));
     * ISObjectIterable accStream = SObjectStream.ofNullable(stream1);
     */
    public static SObjectEnumerable ofNullable(final Iterable<SObject> iterable) {
        if (iterable == null) { return empty(); }
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns an empty `SObjectStream`.
     *
     * @return the empty `SObjectStream`
     */
    public static SObjectEnumerable empty() {
        return new SObjectStream();
    }

    /**
     * @description Returns an infinite `SObjectStream` where each element is
     * generated by `supplier`.
     *
     * @param supplier the supplier of generated elements
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.generate(SObjectSupplier.of(Account.SObjectType));
     */
    public static SObjectEnumerable generate(final ISupplier supplier) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.generate(supplier));
    }

    /**
     * @description Returns an infinite `SObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `SObjectStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IOperator operator) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.iterate(seed, operator));
    }

    /**
     * @description Returns an infinite `SObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IPredicate predicate, final IOperator operator) {
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `SObjectStream` whose elements are all the
     * elements of the first `Iterable<SObject>` followed by all the elements of the
     * second `Iterable<SObject>`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.concat(stream1, stream2);
     * ISObjectIterable accStream = SObjectStream.concat(accounts1, accounts2);
     */
    public static SObjectEnumerable concat(final Iterable<SObject> iterable1, final Iterable<SObject> iterable2) {
        return concat(new List<Iterable<SObject>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<SObject>>`.
     *
     * @param iterables the list of `Iterable<SObject>`
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * ISObjectIterable accStream = SObjectStream.concat(streams);
     */
    public static SObjectEnumerable concat(final List<Iterable<SObject>> iterables) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.concat(iterables, SObject.class));
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueStream = SObjectStream.zip(
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
        return new SObjectStream((Iterator<SObject>) StreamPipeline.zip(iterable1, iterable2, combiner));
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     *
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueStream = SObjectStream.zip(
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
        return new SObjectStream((Iterator<SObject>) StreamPipeline.zip(iterable1, iterable2, predicate, combiner));
    }

    /**
     * @description Returns new `SObjectStream` by appending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<SObject>` to append to the current stream
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ISObjectIterable accStream = stream1.append(stream2);
     */
    public virtual override SObjectEnumerable append(final Iterable<SObject> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `SObjectStream` by prepending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<SObject>` to prepend to the current stream
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ISObjectIterable accStream = stream1.prepend(stream2);
     */
    public virtual override SObjectEnumerable prepend(final Iterable<SObject> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `SObjectSequence` from the current stream.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `SObjectSequence`
//     *
//     * @example
//     * ISObjectIterable accSeq = SObjectStream.of(accounts).sequence();
//     */
//    public virtual SObjectEnumerable sequence() {
//        return SObjectSequence.of(toList());
//    }

    /**
     * @description Returns a `SObjectStream` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable filter(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.filter(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> firstAccountsWithHotRating = SObjectStream.of(accounts)
     *     .take(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable take(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.take(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Account> restAccounts = SObjectStream.of(accounts)
     *     .drop(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override SObjectEnumerable drop(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.drop(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Account> accounts = SObjectStream.of(contacts)
     *     .mapTo(SObjectUnaryOperators.getSObject(Contact.AccountId))
     *     .toList();
     */
    public virtual override SObjectEnumerable mapTo(final IOperator mapper) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.mapTo(iterator(), (IFunction) mapper));
    }

    /**
     * @description Returns a `IntStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Integer> numberOfEmployees = SObjectStream.of(accounts)
     *     .mapToInt(SObjectToIntFunctions.get(Account.NumberOfEmployees))
     *     .toList();
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `LongStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Long> numberOfEmployees = SObjectStream.of(accounts)
     *     .mapToLong(SObjectToLongFunctions.get(Account.NumberOfEmployees))
     *     .toList();
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Double> annualRevenues = SObjectStream.of(accounts)
     *     .mapToDouble(SObjectToDoubleFunctions.get(Account.AnnualRevenue))
     *     .toList();
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Object> birthdates = SObjectStream.of(contacts)
     *     .mapToObject(SObjectToDoubleFunctions.get(Contact.Birthdate))
     *     .toList();
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectStream.of(StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `SObjectStream` with `SObject` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectStream`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<Contact> contacts = SObjectStream.of(accounts)
     *     .flatMapTo(SObjectFunctions.getSObjects('Contacts'))
     *     .toList();
     */
    public virtual override SObjectEnumerable flatMapTo(final IFunction mapper) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `IntStream` with `Integer` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntStream`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override IntEnumerable flatMapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `LongStream` with `Long` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongStream`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override LongEnumerable flatMapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `DoubleStream` with `Double` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleStream`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `ObjectStream` with `Object` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual override ObjectEnumerable flatMapToObject(final IFunction mapper) {
        return ObjectStream.of(StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectStream` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * List<Account> accountsWithResetAnnualRevenue = SObjectStream.of(accounts)
     *     .forEach(SObjectConsumers.set(Account.AnnualRevenue, 0))
     *     .toList();
     */
    public virtual override SObjectEnumerable forEach(final IConsumer consumer) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.forEach(iterator(), consumer));
    }

    /**
     * @description Returns a `SObjectStream` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectStream`
     *
     * @example
     * List<Account> distinctAccounts = SObjectStream.of(accounts)
     *     .distinct()
     *     .toList();
     */
    public virtual override SObjectEnumerable distinct() {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.distinct(iterator()));
    }

    /**
     * @description Returns a `SObjectStream` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * List<Account> distinctAccountsByName = SObjectStream.of(accounts)
     *     .distinct(SObjectFunctions.get(Account.Name))
     *     .toList();
     */
    public virtual override SObjectEnumerable distinct(final IFunction classifier) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.distinct(iterator(), classifier));
    }

    /**
     * @description Returns a `SObjectStream` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectStream`
     *
     * @example
     * List<Account> sortedAccounts = SObjectStream.of(accounts)
     *     .sort()
     *     .toList();
     */
    public virtual override SObjectEnumerable sort() {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.sort(iterator()));
    }

    /**
     * @description Returns a `SObjectStream` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare stream elements
     *
     * @return the `SObjectStream`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * List<Account> sortedAccountsByName = SObjectStream.of(accounts)
     *     .sort(SObjectComparer.comparing(Account.Name))
     *     .toList();
     */
    public virtual override SObjectEnumerable sort(final IComparer comparer) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.sort(iterator(), comparer));
    }

    /**
     * @description Returns a `SObjectStream` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `SObjectStream`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Account> first100Accounts = SObjectStream.of(accounts)
     *     .lim(100)
     *     .toList();
     */
    public virtual override SObjectEnumerable lim(final Integer lim) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.lim(iterator(), lim));
    }

    /**
     * @description Returns a new `SObjectStream` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `SObjectStream`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Account> restAccounts = SObjectStream.of(accounts)
     *     .skip(100)
     *     .toList();
     */
    public virtual override SObjectEnumerable skip(final Integer n) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.skip(iterator(), n));
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
     * Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
     *     .reduce(seedAcc, SObjectBinaryOperator.maxBy(Account.NumberOfEmployees));
     */
    public virtual override SObject reduce(final SObject identity, final IBiOperator accumulator) {
        return (SObject) StreamPipeline.reduce(iterator(), (Object) identity, accumulator);
    }

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalSObject` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `OptionalSObject` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
     *     .reduce(SObjectBinaryOperator.maxBy(Account.NumberOfEmployees))
     *     .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((SObject) StreamPipeline.reduce(iterator(), accumulator));
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
//     * List<String> accountNames = (List<String>) SObjectStream.of(accounts)
//     *     .collect(
//     *         Supplier.of(List<String>.class),
//     *         ListSObjectConsumers.addToList(SObjectFunctions.get(Account.Name))
//     *     );
//     */
//    public virtual Object collect(final ISupplier supplier, final IObjectSObjectConsumer accumulator) {
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        final Iterator<SObject> iterator = iterator();
//        while (iterator.hasNext()) {
//            accumulator.accept(container, iterator.next());
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
     *     SObjectStream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(Contact.AccountId));
     *         
     * // Group contacts by Department and by Account.Rating, cascading two collectors
     * Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
     *     = (Map<String, Map<String, List<Contact>>>)
     *         SObjectStream.of(contacts)
     *             .collect(SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get(Contact.Department),
     *                 SObjectCollectors.groupingByString(
     *                     SObjectFunctions.get('Account?.Rating')
     *                 )
     *             ).cast(Map<String, Map<String, List<Contact>>>.class));
     */
    public virtual override Object collect(final ICollector collector) {
        return StreamPipeline.collect(iterator(), collector);
    }

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `OptionalSObject`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Account firstAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
     *     .find(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100))
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((SObject) StreamPipeline.find(iterator(), predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `SObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
     *     .every(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100));
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `SObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
     *     .some(SObjectPredicates.isGreater(Account.NumberOfEmployees, 100));
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     */
    public virtual override Integer count() {
        return StreamPipeline.count(iterator());
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    public virtual override Boolean isEmpty() {
        return StreamPipeline.isEmpty(iterator());
    }

    /**
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<SObject>` containing the stream elements
     *
     * @example
     * List<Account> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toList();
     */
    public virtual override List<SObject> toList() {
        return (List<SObject>) StreamPipeline.toList(iterator(), SObject.class);
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     * @param elementType the element type
     *
     * @return the `List<Object>` containing the stream elements
     *
     * @throws NullPointerException if `field` or `listType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) SObjectStream.of(accounts)
     *     .toList(SObjectFunctions.get('Name'), String.class);
     */
    public virtual override List<Object> toList(final IFunction mapper, final Type elementType) {
        return StreamPipeline.toList(iterator(), mapper, elementType);
    }

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<SObject>` containing the stream elements
     *
     * @example
     * Set<SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toSet();
     */
    public virtual override Set<SObject> toSet() {
        return StreamPipeline.toSObjectSet(iterator());
    }

    /**
     * @description Accumulates `Object` elements returned by `mapper` into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Object>`containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Object> createdDates = SObjectStream.of(accounts).toSet(SObjectFunctions.get('CreatedDate'));
     */
    public virtual override Set<Object> toSet(final IFunction mapper) {
        return StreamPipeline.toObjectSet(iterator(), mapper);
    }

//    /**
//     * @description Accumulates `Id` elements into a `Set<Id>`.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `Set<Id>` containing the stream elements field values
//     *
//     * @example
//     * Set<Id> accountIds = SObjectStream.of(accounts).toIdSet();
//     */
//    public virtual override Set<Id> toIdSet() {
//        return toIdSet('Id');
//    }

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Id>` containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Id> accountIds = SObjectStream.of(contacts).toIdSet(SObjectFunctions.get('AccountId'));
     */
    public virtual override Set<Id> toIdSet(final IFunction mapper) {
        return StreamPipeline.toIdSet(iterator(), mapper);
    }

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<String>`containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<String> accountNames = SObjectStream.of(accounts).toStringSet(SObjectFunctions.get('Name'));
     */
    public virtual override Set<String> toStringSet(final IFunction mapper) {
        return StreamPipeline.toStringSet(iterator(), mapper);
    }

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Map<Id, SObject>` containing the stream elements
     *
     * @example
     * Map<Id, SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toMap();
     */
    public virtual override Map<Id, SObject> toMap() {
        return new Map<Id, SObject>((List<SObject>) StreamPipeline.toList(iterator(), SObject.class));
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the type of the value
     *
     * @return the `Map<Id, SObject>` containing the stream elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `mapType`
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectStream.of(contacts)
     *     .toByIdMap(SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
     */
    public virtual override Map<Id, SObject> toByIdMap(final IFunction keyMapper, final Type valueType) {
        return (Map<Id, SObject>) StreamPipeline.toByIdMap(iterator(), keyMapper, valueType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the type of the value
     *
     * @return the `Map<String, SObject>` containing the stream elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `mapType`
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) SObjectStream.of(accounts)
     *     .toByStringMap(SObjectFunctions.get('Name'), Map<String, Account>.class);
     */
    public virtual override Map<String, SObject> toByStringMap(final IFunction keyMapper, final Type valueType) {
        return (Map<String, SObject>) StreamPipeline.toByStringMap(iterator(), keyMapper, valueType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = SObjectStream.of(contacts)
     *     .groupById(SObjectFunctions.get('AccountId'));
     */
    public virtual override Map<Id, List<SObject>> groupById(final IFunction keyMapper) {
        return (Map<Id, List<SObject>>) StreamPipeline.groupById(iterator(), keyMapper, SObject.class);
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<String, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * Map<String, List<Account>> accountsByRating = SObjectStream.of(accounts)
     *     .groupByString(SObjectFunctions.get('Rating'));
     */
    public virtual override Map<String, List<SObject>> groupByString(final IFunction keyMapper) {
        return (Map<String, List<SObject>>) StreamPipeline.groupByString(iterator(), keyMapper, SObject.class);
    }

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = SObjectStream.of(accounts).partition(SObjectPredicates.isEqual(Account.Rating, 'Hot'));
     */
    public virtual override Map<Boolean, List<SObject>> partition(final IPredicate predicate) {
        return (Map<Boolean, List<SObject>>) StreamPipeline.partition(iterator(), predicate, SObject.class);
    }
    // @end-group
    //</editor-fold>

}
