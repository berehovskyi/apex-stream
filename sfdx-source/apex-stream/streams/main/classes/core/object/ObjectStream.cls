/**
 * @description A sequence of `Object` elements supporting aggregate operations.
 * Stream operations are composed of stream chain. A stream chain consists of:
 * <ul>
 *     <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
 *     <li>Zero or more Intermediate Operations (which transform a stream into another stream,
 *     such as {@link ObjectStream.filter(IPredicate))}.</li>
 *     <li>A Terminal Operation (which produces a result such as
 *     {@link ObjectStream.count()} or {@link ObjectStream.collect(ICollector)}).</li>
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
 * <p>Intermediate operations describe how a stream is processed without performing any action.</p>
 * <p>Contract:</p>
 * <ul>
 *     <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>
 *     <li>Should be stateless in most cases.</li>
 * </ul>
 * <p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>,
 * i.e. do not support `spliterator()`.</p>
 * <p>There are primitive specializations for {@link IntStream}, {@link LongStream},
 * and {@link DoubleStream} and {@link SObjectStream} for SObject references.</p>
 * <p>Sequences and streams equally ensure the fulfillment of the set goals,
 * but are implemented in different ways.</p>
 *
 * @see ObjectSequence
 * @see SObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Double sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectStream.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToDouble(getAnnualRevenueToDoubleFunction)
 *         .sum();
 */
public virtual inherited sharing class ObjectStream extends ObjectEnumerable {

    private final transient Iterator<Object> iterator;

    /**
     * @description A flag defining whether this stream has been linked or consumed.
     */
    public Boolean isOperated { get { return isOperated; } protected set; } {
        isOperated = false;
    }

    protected ObjectStream() {
        this(new List<Object>().iterator());
    }

    protected ObjectStream(final Iterator<Object> iterator) {
        this.iterator = iterator;
    }

    /**
     * @description Returns an internal iterator for the elements of this stream.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<Object>`
     *
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public override Iterator<Object> iterator() {
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
     * @description Returns a `ObjectStream` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people).iterator());
     * IObjectIterable peopleStream = ObjectStream.of(new Set<Person>(people).iterator());
     * IObjectIterable peopleStream = ObjectStream.of(otherStream.iterator());
     */
    public static ObjectEnumerable of(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        return new ObjectStream(iterator);
    }

    /**
     * @description Returns a `ObjectStream` created from `Iterable<Object>`.
     *
     * @param iterable the iterable
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final Iterable<Object> iterable) {
        Validate.notNull(iterable);
        return new ObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `ObjectStream` created from `List<Object>`.
     *
     * @param objects the list
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final List<Object> objects) {
        return of((Iterable<Object>) objects);
    }

    /**
     * @description Returns a `ObjectStream` created from `Set<Object>`.
     *
     * @param objects the set
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new Set<Object>(people));
     */
    public static ObjectEnumerable of(final Set<Object> objects) {
        return of((Iterable<Object>) objects);
    }

    /**
     * @description Returns a `ObjectStream` created from `Iterable<Object>` if non-null,
     * otherwise returns an empty `ObjectStream`.
     *
     * @param iterable the iterable
     *
     * @return the new `ObjectStream` if `iterable` is non-null,
     * otherwise an empty `ObjectStream`
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.ofNullable(new List<Person>(people));
     */
    public static ObjectEnumerable ofNullable(final Iterable<Object> iterable) {
        if (iterable == null) { return empty(); }
        return new ObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     *
     * @param objects the list
     *
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.ofNullable(new List<Person>(people));
     */
    public static ObjectEnumerable ofNullable(final List<Object> objects) {
        return ofNullable((Iterable<Object>) objects);
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     *
     * @param objects the set
     *
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.ofNullable(new Set<Object>(people));
     */
    public static ObjectEnumerable ofNullable(final Set<Object> objects) {
        return ofNullable((Iterable<Object>) objects);
    }

    /**
     * @description Returns an empty `ObjectStream`.
     *
     * @return the empty `ObjectStream`
     */
    public static ObjectEnumerable empty() {
        return new ObjectStream();
    }

    /**
     * @description Returns an infinite `ObjectStream` where each element is
     * generated by `supplier`.
     *
     * @param supplier the supplier of generated elements
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static ObjectEnumerable generate(final ISupplier supplier) {
        return new ObjectStream(StreamPipeline.generate(supplier));
    }

    /**
     * @description Returns an infinite `ObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `ObjectStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static ObjectEnumerable iterate(final Object seed, final IOperator operator) {
        return new ObjectStream(StreamPipeline.iterate(seed, operator));
    }

    /**
     * @description Returns an infinite `ObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static ObjectEnumerable iterate(final Object seed, final IPredicate predicate, final IOperator operator) {
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `ObjectStream` whose elements are all the
     * elements of the first `Iterable<Object>` followed by all the elements of the
     * second `Iterable<Object>`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.concat(stream1, stream2);
     */
    public static ObjectEnumerable concat(final Iterable<Object> iterable1, final Iterable<Object> iterable2) {
        return concat(new List<Iterable<Object>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Object>>`.
     *
     * @param iterables the list of `Iterable<Object>`
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * IObjectIterable peopleStream = ObjectStream.concat(streams);
     */
    public static ObjectEnumerable concat(final List<Iterable<Object>> iterables) {
        return new ObjectStream(StreamPipeline.concat(iterables, Object.class));
    }

    /**
     * @description Returns a combined `ObjectStream` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ObjectEnumerable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBiOperator combiner
    ) {
        return new ObjectStream(StreamPipeline.zip(iterable1, iterable2, combiner));
    }

    /**
     * @description Returns a combined `ObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     */
    public static ObjectEnumerable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBiPredicate predicate,
            final IBiOperator combiner
    ) {
        return new ObjectStream(StreamPipeline.zip(iterable1, iterable2, predicate, combiner));
    }

    /**
     * @description Returns new `ObjectStream` by appending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Object>` to append to the current stream
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IObjectIterable peopleStream = stream1.append(stream2);
     */
    public virtual override ObjectEnumerable append(final Iterable<Object> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `ObjectStream` by prepending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Object>` to prepend to the current stream
     *
     * @return the new `ObjectStream`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IObjectIterable peopleStream = stream1.prepend(stream2);
     */
    public virtual override ObjectEnumerable prepend(final Iterable<Object> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `ObjectSequence` from the current stream.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `ObjectSequence`
//     *
//     * @example
//     * IObjectIterable peopleSeq = ObjectStream.of(people).sequence();
//     */
//    public virtual ObjectEnumerable sequence() {
//        return ObjectSequence.of(toList());
//    }

    /**
     * @description Returns a `ObjectStream` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> filtered = (List<Person>) ObjectStream.of(people)
     *     .filter(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable filter(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.filter(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectStream` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> firstFiltered = (List<Person>) ObjectStream.of(people)
     *     .take(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable take(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.take(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectStream` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> rest = (List<Person>) ObjectStream.of(people)
     *     .drop(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable drop(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.drop(iterator(), predicate));
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
     * List<String> peopleNames = (List<String>) ObjectStream.of(people)
     *     .mapTo(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable mapTo(final IOperator mapper) {
        return new ObjectStream(StreamPipeline.mapTo(iterator(), (IFunction) mapper));
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
     * List<Integer> peopleAges = ObjectStream.of(people)
     *     .mapToInt(getAge)
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
     * List<Long> peopleIds = ObjectStream.of(people)
     *     .mapToLong(getId)
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
     * List<Double> peopleHeights = ObjectStream.of(people)
     *     .mapToDouble(getHeight)
     *     .toList();
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.mapTo(iterator(), mapper));
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
     * List<Contact> contacts = ObjectStream.of(people)
     *     .mapToSObject(getAsContact)
     *     .toList();
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectStream.of((Iterator<SObject>) StreamPipeline.mapTo(iterator(), mapper));
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
     * @example
     * List<Property> flattenedProperties = (List<Property>) ObjectStream.of(people)
     *     .flatMapTo(getListProperty)
     *     .toList(List<Property>.class);
     *     
     * List<List<String>> containedStrings; // [ ['foo'], null, [], ['baz', 'bar'], [null] ]
     * List<String> flattenedStrings = (List<String>) ObjectStream.of(containedStrings)
     *     .flatMapTo(Function.identity())
     *     .toList(List<String>.class); // ['foo', 'baz', 'bar', null]
     */
    public virtual override ObjectEnumerable flatMapTo(final IFunction mapper) {
        return new ObjectStream(StreamPipeline.flatMapTo(iterator(), mapper));
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
     * @example
     * List<Integer> flattenedProperties = (List<Integer>) ObjectStream.of(people)
     *     .flatMapToInt(getIntListProperty)
     *     .toList();
     *     
     * List<List<Integer>> containedInts; // [ [1], null, [], [0, 10], [null] ]
     * List<Integer> flattenedInts = ObjectStream.of(containedInts)
     *     .flatMapToInt(Function.identity())
     *     .toList(); // [1, 0, 10, null]
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
     * @example
     * List<Long> flattenedProperties = (List<Long>) ObjectStream.of(people)
     *     .flatMapToLong(getLongListProperty)
     *     .toList();
     *     
     * List<List<Long>> containedLongs; // [ [1L], null, [], [0L, 10L], [null] ]
     * List<Long> flattenedLongs = ObjectStream.of(containedLongs)
     *     .flatMapToLong(Function.identity())
     *     .toList(); // [1L, 0L, 10L, null]
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
     * @example
     * List<Double> flattenedProperties = (List<Double>) ObjectStream.of(people)
     *     .flatMapToDouble(getDoubleListProperty)
     *     .toList();
     *     
     * List<List<Double>> containedDoubles; // [ [1.0], null, [], [0.5, Math.PI], [null] ]
     * List<Double> flattenedDoubles = ObjectStream.of(containedDoubles)
     *     .flatMapToDouble(Function.identity())
     *     .toList(); // [1.0, 0.5, Math.PI, null]
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.flatMapTo(iterator(), mapper));
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
     * @example
     * List<List<Account>> containedAccounts; // [ [acc1], null, [], [acc2, acc3], [null] ]
     * List<Account> flattenedAccounts = ObjectStream.of(containedDoubles)
     *     .flatMapToSObject(Function.identity())
     *     .toList(); // [acc1, acc2, acc3, null]
     */
    public virtual override SObjectEnumerable flatMapToSObject(final IFunction mapper) {
        return SObjectStream.of((Iterator<SObject>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectStream` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * List<Person> editedPeople = (List<Person>) ObjectStream.of(people)
     *     .forEach(setSomeProperty)
     *     .toList();
     */
    public virtual override ObjectEnumerable forEach(final IConsumer consumer) {
        return new ObjectStream(StreamPipeline.forEach(iterator(), consumer));
    }

    /**
     * @description Returns a `ObjectStream` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectStream`
     *
     * @example
     * List<Person> distinctPeople = (List<Person>) ObjectStream.of(people)
     *     .distinct()
     *     .toList();
     */
    public virtual override ObjectEnumerable distinct() {
        return new ObjectStream(StreamPipeline.distinct(iterator()));
    }

    /**
     * @description Returns a `ObjectStream` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * List<Person> distinctPeopleByName = (List<Person>) ObjectStream.of(people)
     *     .distinct(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable distinct(final IFunction classifier) {
        return new ObjectStream(StreamPipeline.distinct(iterator(), classifier));
    }

    /**
     * @description Returns a `ObjectStream` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectStream`
     *
     * @example
     * List<Person> sortedPeople = (List<Person>) ObjectStream.of(people)
     *     .sort()
     *     .toList();
     */
    public virtual override ObjectEnumerable sort() {
        return new ObjectStream(StreamPipeline.sort(iterator()));
    }

    public virtual override ObjectEnumerable sort(final SortOrder order) {
        return new ObjectStream(StreamPipeline.sort(iterator(), order));
    }

    /**
     * @description Returns a `ObjectStream` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare stream elements
     *
     * @return the `ObjectStream`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) ObjectStream.of(people)
     *     .sort(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable sort(final IComparer comparer) {
        return new ObjectStream(StreamPipeline.sort(iterator(), comparer));
    }

    /**
     * @description Returns a `ObjectStream` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `ObjectStream`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Person> first100People = (List<Person>) ObjectStream.of(people)
     *     .lim(100)
     *     .toList();
     */
    public virtual override ObjectEnumerable lim(final Integer lim) {
        return new ObjectStream(StreamPipeline.lim(iterator(), lim));
    }

    /**
     * @description Returns a new `ObjectStream` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `ObjectStream`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Person> restPeople = (List<Person>) ObjectStream.of(people)
     *     .skip(100)
     *     .toList();
     */
    public virtual override ObjectEnumerable skip(final Integer n) {
        return new ObjectStream(StreamPipeline.skip(iterator(), n));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Object` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override Object reduce(final Object identity, final IBiOperator accumulator) {
        return StreamPipeline.reduce(iterator(), identity, accumulator);
    }

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Person eldestPerson = (Person) ObjectStream.of(people)
     *     .reduce(maxBy(getAge))
     *     .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable(StreamPipeline.reduce(iterator(), accumulator));
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
//     * List<String> peopleNames = (List<String>) ObjectStream.of(people)
//     *     .collect(
//     *         Supplier.of(List<String>.class),
//     *         ListObjectConsumers.addToList(getName)
//     *     );
//     */
//    public virtual Object collect(final ISupplier supplier, final IBiConsumer accumulator) {
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        final Iterator<Object> iterator = iterator();
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
     * // Group people by city
     * Map<String, List<Person>> peopleByCity = (Map<String, List<Person>>)
     *     ObjectStream.of(people)
     *          .collect(Collectors.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
     *          
     * // Group people by city and by country, cascading two collectors
     * Map<String, Map<String, List<Person>>> peopleByCityByCountry
     *     = (Map<String, Map<String, List<Person>>>)
     *         ObjectStream.of(people)
     *             .collect(Collectors.groupingByString(
     *                 getCountry,
     *                 Collectors.groupingByString(getCity)
     *             ).cast(Map<String, Map<String, List<Person>>>.class));
     */
    public virtual override Object collect(final ICollector collector) {
        return StreamPipeline.collect(iterator(), collector);
    }

    /**
     * @description Returns an `Optional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Person firstActivePerson = (Person) ObjectStream.of(people)
     *     .find(isActive)
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable(StreamPipeline.find(iterator(), predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryPersonActive = ObjectStream.of(people).every(isActive);
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomePersonActive = ObjectStream.of(people).some(isActive);
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
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Object>` containing the stream elements
     *
     * @example
     * List<Person> activePeople = (List<Person>) ObjectStream.of(people)
     *     .filter(isActive)
     *     .toList();
     */
    public virtual override List<Object> toList() {
        return StreamPipeline.toList(iterator());
    }

    /**
     * @description Accumulates elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Object>` containing the stream elements
     *
     * @example
     * List<Object> activePeople = ObjectStream.of(people)
     *     .filter(isActive)
     *     .toSet();
     */
    public virtual override Set<Object> toSet() {
        return StreamPipeline.toObjectSet(iterator());
    }
    // @end-group
    //</editor-fold>

}
