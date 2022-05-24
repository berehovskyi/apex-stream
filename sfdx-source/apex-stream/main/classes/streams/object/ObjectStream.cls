/**
 * @author O. Berehovskyi
 * @group Iterables
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
 * @example
 * Double sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectStream.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToDouble(getAnnualRevenueToDoubleFunction)
 *         .sum();
 * @see ObjectSequence
 * @see SObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 */
public virtual inherited sharing class ObjectStream extends ObjectIterable implements IObjectIterable {

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
     * @return the internal `Iterator<Object>`
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public Iterator<Object> iterator() {
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
     * @description Returns a `ObjectStream` created from `iterator`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people).iterator());
     * IObjectIterable peopleStream = ObjectStream.of(new Set<Person>(people).iterator());
     * IObjectIterable peopleStream = ObjectStream.of(otherStream.iterator());
     * @param iterator the iterator
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterator` is null
     */
    public static IObjectIterable of(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        return new ObjectStream(iterator);
    }

    /**
     * @description Returns a `ObjectStream` created from `List<Object>`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectStream`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final List<Object> objects) {
        Validate.notNull(objects);
        return new ObjectStream(objects.iterator());
    }

    /**
     * @description Returns a `ObjectStream` created from `Set<Object>`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.of(new Set<Object>(people));
     * @param objects the set
     * @return the new `ObjectStream`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final Set<Object> objects) {
        Validate.notNull(objects);
        return new ObjectStream(objects.iterator());
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.ofNullable(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     */
    public static IObjectIterable ofNullable(final List<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectStream(objects.iterator());
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.ofNullable(new Set<Object>(people));
     * @param objects the set
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     */
    public static IObjectIterable ofNullable(final Set<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectStream(objects.iterator());
    }

    /**
     * @description Returns an empty `ObjectStream`.
     * @return the empty `ObjectStream`
     */
    public static IObjectIterable empty() {
        return new ObjectStream();
    }

    /**
     * @description Returns an infinite `ObjectStream` where each element is
     * generated by `supplier`.
     * @param supplier the supplier of generated elements
     * @return the new `ObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IObjectIterable generate(final ISupplier supplier) {
        Validate.notNull(supplier);
        return new ObjectStream(new ObjectGenerator(supplier));
    }

    /**
     * @description Returns an infinite `ObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `ObjectStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `ObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IObjectIterable iterate(final Object seed, final IUnaryOperator operator) {
        Validate.notNull(operator);
        return new ObjectStream(new ObjectIterate(seed, operator));
    }

    /**
     * @description Returns an infinite `ObjectStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `ObjectStream`
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static IObjectIterable iterate(
            final Object seed,
            final IPredicate predicate,
            final IUnaryOperator operator
    ) {
        Validate.notNull(predicate);
        Validate.notNull(operator);
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `ObjectStream` whose elements are all the
     * elements of the first `Iterable<Object>` followed by all the elements of the
     * second `Iterable<Object>`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.concat(stream1, stream2);
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IObjectIterable concat(final Iterable<Object> iterable1, final Iterable<Object> iterable2) {
        return concat(new List<Iterable<Object>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Object>>`.
     * @example
     * IObjectIterable peopleStream = ObjectStream.concat(streams);
     * @param iterables the list of `Iterable<Object>`
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IObjectIterable concat(final List<Iterable<Object>> iterables) {
        Validate.noNullElements(iterables);
        final List<Iterator<Object>> iterators = new List<Iterator<Object>>();
        final Iterator<Iterable<Object>> iterator = iterables.iterator();
        while (iterator.hasNext()) {
            final Iterable<Object> iterable = iterator.next();
            iterators.add(iterable.iterator());
        }
        return new ObjectStream(new ObjectConcatIterator(iterators));
    }

    /**
     * @description Returns a combined `ObjectStream` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IObjectIterable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        return new ObjectStream(new ObjectZipIterator(iterable1.iterator(), iterable2.iterator(), combiner));
    }

    /**
     * @description Returns a combined `ObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     */
    public static IObjectIterable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBiPredicate predicate,
            final IBinaryOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        return new ObjectStream(new ObjectZipBiPredicateIterator(
                iterable1.iterator(),
                iterable2.iterator(),
                predicate,
                combiner
        ));
    }

    /**
     * @description Returns new `ObjectStream` by appending `iterable`
     * to the current stream.
     * @example
     * IObjectIterable peopleStream = stream1.append(stream2);
     * @param iterable the `Iterable<Object>` to append to the current stream
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual IObjectIterable append(final Iterable<Object> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `ObjectStream` by prepending `iterable`
     * to the current stream.
     * @example
     * IObjectIterable peopleStream = stream1.prepend(stream2);
     * @param iterable the `Iterable<Object>` to prepend to the current stream
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual IObjectIterable prepend(final Iterable<Object> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns new `ObjectSequence` from the current stream.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * IObjectIterable peopleSeq = ObjectStream.of(people).sequence();
     * @return the new `ObjectSequence`
     */
    public virtual IObjectIterable sequence() {
        return ObjectSequence.of(Iterators.toObjectList(iterator()));
    }

    /**
     * @description Returns a `ObjectStream` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Person> filtered = (List<Person>) ObjectStream.of(people)
     *     .filter(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override IObjectIterable filter(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new ObjectStream(new ObjectFilterIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectStream` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Person> firstFiltered = (List<Person>) ObjectStream.of(people)
     *     .take(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IObjectIterable take(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new ObjectStream(new ObjectTakeIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectStream` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> rest = (List<Person>) ObjectStream.of(people)
     *     .drop(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectStream`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IObjectIterable drop(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new ObjectStream(new ObjectDropIterator(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<String> peopleNames = (List<String>) ObjectStream.of(people)
     *     .mapTo(getName)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `ObjectStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IObjectIterable mapTo(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ObjectStream(new ObjectMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `IntStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Integer> peopleAges = ObjectStream.of(people)
     *     .mapToInt(getAge)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `IntStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IIntIterable mapToInt(final IToIntFunction mapper) {
        Validate.notNull(mapper);
        return IntStream.of(new ObjectToIntMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `LongStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Long> peopleIds = ObjectStream.of(people)
     *     .mapToLong(getId)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `LongStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ILongIterable mapToLong(final IToLongFunction mapper) {
        Validate.notNull(mapper);
        return LongStream.of(new ObjectToLongMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Double> peopleHeights = ObjectStream.of(people)
     *     .mapToDouble(getHeight)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IDoubleIterable mapToDouble(final IToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return DoubleStream.of(new ObjectToDoubleMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectStream` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Contact> contacts = ObjectStream.of(people)
     *     .mapToSObject(getAsContact)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectStream`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ISObjectIterable mapToSObject(final IToSObjectFunction mapper) {
        Validate.notNull(mapper);
        return SObjectStream.of(new ObjectToSObjectMapIterator(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectStream` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Person> editedPeople = (List<Person>) ObjectStream.of(people)
     *     .forEach(setSomeProperty)
     *     .toList();
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return the `ObjectStream`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual IObjectIterable forEach(final IConsumer consumer) {
        Validate.notNull(consumer);
        return new ObjectStream(new ObjectForEachIterator(iterator(), consumer));
    }

    /**
     * @description Returns a `ObjectStream` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> distinctPeople = (List<Person>) ObjectStream.of(people)
     *     .distinct()
     *     .toList();
     * @return the `ObjectStream`
     */
    public virtual IObjectIterable distinct() {
        return new ObjectStream(new ObjectDistinctIterator(iterator()));
    }

    /**
     * @description Returns a `ObjectStream` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> distinctPeopleByName = (List<Person>) ObjectStream.of(people)
     *     .distinct(getName)
     *     .toList();
     * @param classifier the classifier function
     * @return the `ObjectStream`
     * @throws NullPointerException if `classifier` is null
     */
    public virtual IObjectIterable distinct(final IFunction classifier) {
        Validate.notNull(classifier);
        return new ObjectStream(new ObjectDistinctIterator(iterator(), classifier));
    }

    /**
     * @description Returns a `ObjectStream` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> sortedPeople = (List<Person>) ObjectStream.of(people)
     *     .sort()
     *     .toList();
     * @return the `ObjectStream`
     */
    public virtual IObjectIterable sort() {
        final List<Object> objects = Iterators.toObjectList(iterator());
        objects.sort();
        return new ObjectStream(objects.iterator());
    }

    /**
     * @description Returns a `ObjectStream` with sorted elements according to `comparator`.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) ObjectStream.of(people)
     *     .sort(getName)
     *     .toList();
     * @param comparator the non-interfering, stateless comparator to compare stream elements
     * @return the `ObjectStream`
     * @throws NullPointerException if `comparator` is null
     */
    public virtual override IObjectIterable sort(final IComparator comparator) {
        Validate.notNull(comparator);
        return new ObjectStream(new ObjectSortIterator(iterator(), comparator));
    }

    /**
     * @description Returns a `ObjectStream` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Person> first100People = (List<Person>) ObjectStream.of(people)
     *     .lim(100)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `ObjectStream`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual IObjectIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) { return ObjectStream.empty(); }
        return new ObjectStream(new ObjectLimitIterator(iterator(), lim));
    }

    /**
     * @description Returns a new `ObjectStream` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> restPeople = (List<Person>) ObjectStream.of(people)
     *     .skip(100)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `ObjectStream`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual IObjectIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return new ObjectStream(iterator()); }
        return new ObjectStream(new ObjectSkipIterator(iterator(), n));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual Object reduce(final Object identity, final IBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Object result = identity;
        final Iterator<Object> iterator = iterator();
        while (iterator.hasNext()) {
            result = accumulator.apply(result, iterator.next());
        }
        return result;
    }

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Person eldestPerson = (Person) ObjectStream.of(people)
     *     .reduce(maxBy(getAge))
     *     .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Optional` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override Optional reduce(final IBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Boolean found = false;
        Object result;
        final Iterator<Object> iterator = iterator();
        while (iterator.hasNext()) {
            final Object value = iterator.next();
            if (!found) {
                found = true;
                result = value;
            } else {
                result = accumulator.apply(result, value);
            }
        }
        return found ? Optional.ofNullable(result) : Optional.empty();
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> peopleNames = (List<String>) ObjectStream.of(people)
     *     .collect(
     *         Supplier.of(List<String>.class),
     *         ListObjectConsumer.addToList(getName)
     *     );
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public virtual Object collect(final ISupplier supplier, final IBiConsumer accumulator) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        final Object container = supplier.get();
        final Iterator<Object> iterator = iterator();
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
     * // Group people by city
     * Map<String, List<Person>> peopleByCity = (Map<String, List<Person>>)
     *     ObjectStream.of(people)
     *          .collect(Collector.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
     * // Group people by city and by country, cascading two collectors
     * Map<String, Map<String, List<Person>>> peopleByCityByCountry
     *     = (Map<String, Map<String, List<Person>>>)
     *         ObjectStream.of(people)
     *             .collect(Collector.groupingByString(
     *                 getCountry,
     *                 Collector.groupingByString(getCity)
     *             ).cast(Map<String, Map<String, List<Person>>>.class));
     * @param collector the collector
     * @return the `Object` result of the collection
     * @throws NullPointerException if `collector` is null
     */
    public virtual override Object collect(final ICollector collector) {
        Validate.notNull(collector);
        final Object container = collector.supplier().get();
        final Iterator<Object> iterator = iterator();
        while (iterator.hasNext()) {
            collector.accumulator().accept(container, iterator.next());
        }
        return collector.finisher() == null ? container : collector.finisher().apply(container);
    }

    /**
     * @description Returns an `Optional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Person firstActivePerson = (Person) ObjectStream.of(people)
     *     .find(isActive)
     *     .get();
     * @param predicate the predicate
     * @return the `Optional`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Optional find(final IPredicate predicate) {
        Validate.notNull(predicate);
        Object result;
        final Iterator<Object> iterator = iterator();
        while (iterator.hasNext()) {
            final Object o = iterator.next();
            if (predicate.test(o)) {
                result = o;
                break;
            }
        }
        return Optional.ofNullable(result);
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryPersonActive = ObjectStream.of(people).every(isActive);
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Boolean every(final IPredicate predicate) {
        Validate.notNull(predicate);
        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ObjectStream` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomePersonActive = ObjectStream.of(people).some(isActive);
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override Boolean some(final IPredicate predicate) {
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
        final Iterator<Object> iterator = iterator();
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
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Person> activePeople = (List<Person>) ObjectStream.of(people)
     *     .filter(isActive)
     *     .toList();
     * @return the `List<Object>` containing the stream elements
     */
    public virtual List<Object> toList() {
        return Iterators.toObjectList(iterator());
    }

    /**
     * @description Accumulates elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Object> activePeople = ObjectStream.of(people)
     *     .filter(isActive)
     *     .toSet();
     * @return the `Set<Object>` containing the stream elements
     */
    public virtual Set<Object> toSet() {
        return Iterators.toObjectSet(iterator());
    }

    private Boolean match(final IPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        final Iterator<Object> iterator = iterator();
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
