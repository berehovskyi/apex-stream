/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `Object` elements supporting aggregate operations.
 * Sequence operations are composed of sequence chain. A sequence chain consists of:
 * <ul>
 *     <li>A Source (which might be an iterable (such as list or set)).</li>
 *     <li>Zero or more Intermediate Operations (which transform a sequence into another sequence,
 *     such as {@link ObjectSequence.filter(IPredicate))}.</li>
 *     <li>A Terminal Operation (which produces a result such as
 *     {@link ObjectSequence.count()} or {@link ObjectSequence.collect(ICollector)}).</li>
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
 * and {@link DoubleSequence} and {@link SObjectSequence} for SObject references.</p>
 * <p>Sequences and streams equally ensure the fulfillment of the set goals,
 * but are implemented in different ways.</p>
 * @example
 * Double sumAnnualRevenueOfUniqueHotRankedAccounts
 *     = SObjectSequence.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 * @see ObjectStream
 * @see SObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 */
public virtual inherited sharing class ObjectSequence extends ObjectIterable implements IObjectIterable {

    private final List<Object> objects;

    protected ObjectSequence() {
        this(new List<Object>());
    }

    protected ObjectSequence(final List<Object> objects) {
        this.objects = objects;
    }

    /**
     * @description Returns an internal iterator for the elements of this sequence.
     * <p>Terminal Operation.</p>
     * @return the internal `Iterator<Object>`
     */
    public Iterator<Object> iterator() {
        return objects.iterator();
    }

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `ObjectSequence` created from `objects` list.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.of(new List<Person>(people));
     * @param objects the list of Objects
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final List<Object> objects) {
        Validate.notNull(objects);
        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` set.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.of(new Set<Person>(people));
     * @param objects the set of Objects
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final Set<Object> objects) {
        Validate.notNull(objects);
        return new ObjectSequence(new List<Object>(objects));
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` list if non-null,
     * otherwise returns an empty `ObjectSequence`.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.ofNullable(new List<Person>(people));
     * IObjectIterable emptyPeopleSeq = ObjectSequence.ofNullable(null);
     * @param objects the list of Objects
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     */
    public static IObjectIterable ofNullable(final List<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` set if non-null,
     * otherwise returns an empty `ObjectSequence`.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.ofNullable(new Set<Person>(people));
     * IObjectIterable emptypeopleSeq = ObjectSequence.ofNullable(null);
     * @param objects the set of Objects
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     */
    public static IObjectIterable ofNullable(final Set<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectSequence(new List<Object>(objects));
    }

    /**
     * @description Returns an empty `ObjectSequence`.
     * @return the empty `ObjectSequence`
     */
    public static IObjectIterable empty() {
        return new ObjectSequence();
    }

    /**
     * @description Returns eagerly concatenated `ObjectSequence` whose elements are all the
     * elements of the first `Iterable<Object>` followed by all the elements of the
     * second `Iterable<Object>`.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.concat(seq1, seq2);
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IObjectIterable concat(final Iterable<Object> iterable1, final Iterable<Object> iterable2) {
        return concat(new List<Iterable<Object>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Object>>`.
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.concat(sequences);
     * @param iterables the list of `Iterable<Object>`
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IObjectIterable concat(final List<Iterable<Object>> iterables) {
        Validate.noNullElements(iterables);
        final List<Object> objects = new List<Object>();
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            objects.addAll(Iterators.toObjectList(iterables[i].iterator()));
        }
        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a combined `ObjectSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `ObjectSequence`
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
        final List<Object> results = new List<Object>();
        final List<Object> left = Iterators.toObjectList(iterable1.iterator());
        final List<Object> right = Iterators.toObjectList(iterable2.iterator());
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            results.add(combiner.apply(left[i], right[i]));
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a combined `ObjectSequence` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `ObjectSequence`
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
        Validate.notNull(predicate);
        Validate.notNull(combiner);
        final List<Object> results = new List<Object>();
        final List<Object> left = Iterators.toObjectList(iterable1.iterator());
        final List<Object> right = Iterators.toObjectList(iterable2.iterator());
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            if (predicate.test(left[i], right[i])) {
                results.add(combiner.apply(left[i], right[i]));
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns new `ObjectSequence` by appending `iterable`
     * to the current sequence.
     * @example
     * IObjectIterable peopleSeq = seq1.append(seq2);
     * @param iterable the `Iterable<Object>` to append to the current sequence
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public virtual IObjectIterable append(final Iterable<Object> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `ObjectSequence` by prepending `iterable`
     * to the current sequence.
     * @example
     * IObjectIterable peopleSeq = seq1.prepend(seq2);
     * @param iterable the `Iterable<Object>` to prepend to the current sequence
     * @return the new `ObjectSequence`
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
     * @description Returns new `ObjectStream` from the current sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * IObjectIterable peopleStream = ObjectSequence.of(people).stream();
     * @return the new `ObjectStream`
     */
    public virtual IObjectIterable stream() {
        return ObjectStream.of(iterator());
    }

    /**
     * @description Returns a `ObjectSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     * @example
     * List<Person> filtered = (List<Person>) ObjectSequence.of(people)
     *     .filter(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual override IObjectIterable filter(final IPredicate predicate) {
        Validate.notNull(predicate);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            final Object o = objects[i];
            if (predicate.test(o)) {
                results.add(o);
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Person> firstFiltered = (List<Person>) ObjectSequence.of(people)
     *     .take(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IObjectIterable take(final IPredicate predicate) {
        Validate.notNull(predicate);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            final Object o = objects[i];
            if (predicate.test(o)) {
                results.add(o);
            } else {
                break;
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> rest = (List<Person>) ObjectSequence.of(people)
     *     .drop(predicate)
     *     .toList();
     * @param predicate the non-interfering, stateless predicate
     * @return the `ObjectSequence`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual IObjectIterable drop(final IPredicate predicate) {
        Validate.notNull(predicate);
        final List<Object> results = new List<Object>();
        Boolean drop = true;
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            final Object o = objects[i];
            if (!predicate.test(o) || !drop) {
                results.add(o);
                drop = false;
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<String> peopleNames = (List<String>) ObjectSequence.of(people)
     *     .mapTo(getName)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `ObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IObjectIterable mapTo(final IFunction mapper) {
        Validate.notNull(mapper);
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            results.add(mapper.apply(objects[i]));
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `IntSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Integer> peopleAges = ObjectSequence.of(people)
     *     .mapToInt(getAge)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `IntSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IIntIterable mapToInt(final IToIntFunction mapper) {
        Validate.notNull(mapper);
        final List<Integer> results = new List<Integer>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            results.add(mapper.apply(objects[i]));
        }
        return IntSequence.of(results);
    }

    /**
     * @description Returns a `LongSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Long> peopleIds = ObjectSequence.of(people)
     *     .mapToLong(getId)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `LongSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ILongIterable mapToLong(final IToLongFunction mapper) {
        Validate.notNull(mapper);
        final List<Long> results = new List<Long>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            results.add(mapper.apply(objects[i]));
        }
        return LongSequence.of(results);
    }

    /**
     * @description Returns a `DoubleSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Double> peopleHeights = ObjectSequence.of(people)
     *     .mapToDouble(getHeight)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `DoubleSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual IDoubleIterable mapToDouble(final IToDoubleFunction mapper) {
        Validate.notNull(mapper);
        final List<Double> results = new List<Double>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            results.add(mapper.apply(objects[i]));
        }
        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` with elements returned by `mapper` function,
     * applied to the elements of this sequence.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Contact> contacts = ObjectSequence.of(people)
     *     .mapToSObject(getAsContact)
     *     .toList();
     * @param mapper the non-interfering, stateless operator
     * @return the `SObjectSequence`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual ISObjectIterable mapToSObject(final IToSObjectFunction mapper) {
        Validate.notNull(mapper);
        final List<SObject> results = new List<SObject>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            results.add(mapper.apply(objects[i]));
        }
        return SObjectSequence.of(results);
    }

    /**
     * @description Returns a `SObjectSequence` after performing `consumer` action on each element.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> editedPeople = (List<Person>) ObjectSequence.of(people)
     *     .forEach(setSomeProperty)
     *     .toList();
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     * @return this `SObjectSequence`
     * @throws NullPointerException if `consumer` is null
     */
    public virtual IObjectIterable forEach(final IConsumer consumer) {
        Validate.notNull(consumer);
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            consumer.accept(objects[i]);
        }
        return this;
    }

    /**
     * @description Returns a `ObjectSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> distinctPeople = (List<Person>) ObjectSequence.of(people)
     *     .distinct()
     *     .toList();
     * @return the `ObjectSequence`
     */
    public virtual IObjectIterable distinct() {
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            if (!results.contains(objects[i])) {
                results.add(objects[i]);
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> distinctPeopleByName = (List<Person>) ObjectSequence.of(people)
     *     .distinct(getName)
     *     .toList();
     * @param classifier the classifier function
     * @return the `ObjectSequence`
     * @throws NullPointerException if `classifier` is null
     */
    public virtual IObjectIterable distinct(final IFunction classifier) {
        Validate.notNull(classifier);
        final List<Object> results = new List<Object>();
        final Set<Object> classifierResults = new Set<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            if (classifierResults.add(classifier.apply(objects[i]))) {
                results.add(objects[i]);
            }
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> sortedPeople = (List<Person>) ObjectSequence.of(people)
     *     .sort()
     *     .toList();
     * @return the `ObjectSequence`
     */
    public virtual IObjectIterable sort() {
        final List<Object> clone = objects.clone();
        clone.sort();
        return new ObjectSequence(clone);
    }

    /**
     * @description Returns a `ObjectSequence` with sorted elements according to `comparator`.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) ObjectSequence.of(people)
     *     .sort(getName)
     *     .toList();
     * @param comparator the non-interfering, stateless comparator to compare sequence elements
     * @return the `ObjectSequence`
     * @throws NullPointerException if `comparator` is null
     */
    public virtual override IObjectIterable sort(final IComparator comparator) {
        return new ObjectSequence(Lists.sort(objects, comparator));
    }

    /**
     * @description Returns a `ObjectSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     * @example
     * List<Person> first100People = (List<Person>) ObjectSequence.of(people)
     *     .lim(100)
     *     .toList();
     * @param lim the number of elements to limit
     * @return the `ObjectSequence`
     * @throws NullPointerException if `lim` is null
     * @throws IllegalStateException if `lim` is less than 0
     */
    public virtual IObjectIterable lim(final Integer lim) {
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ lim });
        if (lim == 0) return ObjectSequence.empty();
        if (lim >= objects.size()) { return this; }
        final List<Object> results = new List<Object>();
        for (Integer i = 0; i < lim; i++) {
            results.add(objects[i]);
        }
        return new ObjectSequence(results);
    }

    /**
     * @description Returns a new `ObjectSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     * @example
     * List<Person> restPeople = (List<Person>) ObjectSequence.of(people)
     *     .skip(100)
     *     .toList();
     * @param n the number of elements to skip
     * @return the `ObjectSequence`
     * @throws NullPointerException if `n` is null
     * @throws IllegalStateException if `n` is less than 0
     */
    public virtual IObjectIterable skip(final Integer n) {
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.ArgumentNotPositiveErrorMessage, new List<Object>{ n });
        if (n == 0) { return this; }
        if (n >= objects.size()) { return ObjectSequence.empty(); }
        final List<Object> results = new List<Object>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            if (i >= n) {
                results.add(objects[i]);
            }
        }
        return new ObjectSequence(results);
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
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            result = accumulator.apply(result, objects[i]);
        }
        return result;
    }

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @example
     * Person eldestPerson = (Person) ObjectSequence.of(people)
     *     .reduce(maxBy(getAge))
     *     .get();
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Optional` result of the reduction
     * @throws NullPointerException if `accumulator` is null
     */
    public virtual override Optional reduce(final IBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        Object result;
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            result = i == 0 ? objects[i] : accumulator.apply(result, objects[i]);
        }
        return Optional.ofNullable(result);
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @example
     * List<String> peopleNames = (List<String>) ObjectSequence.of(people)
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
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            accumulator.accept(container, objects[i]);
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
     *     ObjectSequence.of(people)
     *          .collect(Collector.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
     * // Group people by city and by country, cascading two collectors
     * Map<String, Map<String, List<Person>>> peopleByCityByCountry
     *     = (Map<String, Map<String, List<Person>>>)
     *         ObjectSequence.of(people)
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
        final IBiConsumer accumulator = collector.accumulator();
        final IFunction finisher = collector.finisher();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            accumulator.accept(container, objects[i]);
        }
        return finisher == null ? container : finisher.apply(container);
    }

    /**
     * @description Returns an `Optional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Person firstActivePerson = (Person) ObjectSequence.of(people)
     *     .find(isActive)
     *     .get();
     * @param predicate the predicate
     * @return the `Optional`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Optional find(final IPredicate predicate) {
        Validate.notNull(predicate);
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            final Object o = objects[i];
            if (predicate.test(o)) {
                return Optional.ofNullable(o);
            }
        }
        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryPersonActive = ObjectSequence.of(people).every(isActive);
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
     * If `ObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomePersonActive = ObjectSequence.of(people).some(isActive);
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
        return objects.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return objects.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Person> activePeople = (List<Person>) ObjectSequence.of(people)
     *     .filter(isActive)
     *     .toList();
     * @return the `List<Object>` containing the sequence elements
     */
    public virtual List<Object> toList() {
        return objects;
    }

    /**
     * @description Accumulates elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     * @example
     * List<Object> activePeople = ObjectSequence.of(people)
     *     .filter(isActive)
     *     .toSet();
     * @return the `Set<Object>` containing the sequence elements
     */
    public virtual Set<Object> toSet() {
        return new Set<Object>(objects);
    }

    private Boolean match(final IPredicate predicate, final Integer kind) {
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(objects[i]);
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }
    // @end-group
    //</editor-fold>

}
