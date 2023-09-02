/**
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
 *
 * @see ObjectStream
 * @see SObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 *
 * @example
 * Double sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectSequence.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToDouble(getAnnualRevenueToDoubleFunction)
 *         .sum();
 */
public virtual inherited sharing class ObjectSequence extends ObjectEnumerable {

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
     *
     * @return the internal `Iterator<Object>`
     */
    public override Iterator<Object> iterator() {
        return objects.iterator();
    }

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `ObjectSequence` created from `objects` list.
     *
     * @param objects the list of Objects
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final List<Object> objects) {
        Validate.notNull(objects);
        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` set.
     *
     * @param objects the set of Objects
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.of(new Set<Person>(people));
     */
    public static ObjectEnumerable of(final Set<Object> objects) {
        Validate.notNull(objects);
        return new ObjectSequence(new List<Object>(objects));
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` list if non-null,
     * otherwise returns an empty `ObjectSequence`.
     *
     * @param objects the list of Objects
     *
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.ofNullable(new List<Person>(people));
     * IObjectIterable emptyPeopleSeq = ObjectSequence.ofNullable(null);
     */
    public static ObjectEnumerable ofNullable(final List<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` set if non-null,
     * otherwise returns an empty `ObjectSequence`.
     *
     * @param objects the set of Objects
     *
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.ofNullable(new Set<Person>(people));
     * IObjectIterable emptySeq = ObjectSequence.ofNullable(null);
     */
    public static ObjectEnumerable ofNullable(final Set<Object> objects) {
        if (objects == null) { return empty(); }
        return new ObjectSequence(new List<Object>(objects));
    }

    /**
     * @description Returns an empty `ObjectSequence`.
     *
     * @return the empty `ObjectSequence`
     */
    public static ObjectEnumerable empty() {
        return new ObjectSequence();
    }

    /**
     * @description Returns eagerly concatenated `ObjectSequence` whose elements are all the
     * elements of the first `Iterable<Object>` followed by all the elements of the
     * second `Iterable<Object>`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.concat(seq1, seq2);
     */
    public static ObjectEnumerable concat(final Iterable<Object> iterable1, final Iterable<Object> iterable2) {
        return concat(new List<Iterable<Object>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Object>>`.
     *
     * @param iterables the list of `Iterable<Object>`
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * IObjectIterable peopleSeq = ObjectSequence.concat(sequences);
     */
    public static ObjectEnumerable concat(final List<Iterable<Object>> iterables) {
        return new ObjectSequence(SequencePipeline.concat(iterables, new List<Object>()));
//        Validate.noNullElements(iterables);
//        final List<Object> objects = new List<Object>();
//        for (Integer i = 0, size = iterables.size(); i < size; i++) {
//            objects.addAll(Iterators.toList(iterables[i], Object.class));
//        }
//        return new ObjectSequence(objects);
    }

    /**
     * @description Returns a combined `ObjectSequence` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ObjectEnumerable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBiOperator combiner
    ) {
        return new ObjectSequence(SequencePipeline.zip(iterable1, iterable2, combiner, new List<Object>()));
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(combiner);
//        final List<Object> results = new List<Object>();
//        final List<Object> left = Iterators.toList(iterable1, Object.class);
//        final List<Object> right = Iterators.toList(iterable2, Object.class);
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            results.add(combiner.apply(left[i], right[i]));
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a combined `ObjectSequence` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectSequence`
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
        return new ObjectSequence(SequencePipeline.zip(iterable1, iterable2, predicate, combiner, new List<Object>()));
//        Validate.notNull(iterable1);
//        Validate.notNull(iterable2);
//        Validate.notNull(predicate);
//        Validate.notNull(combiner);
//        final List<Object> results = new List<Object>();
//        final List<Object> left = Iterators.toList(iterable1, Object.class);
//        final List<Object> right = Iterators.toList(iterable2, Object.class);
//        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
//            if (predicate.test(left[i], right[i])) {
//                results.add(combiner.apply(left[i], right[i]));
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns new `ObjectSequence` by appending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Object>` to append to the current sequence
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IObjectIterable peopleSeq = seq1.append(seq2);
     */
    public virtual override ObjectEnumerable append(final Iterable<Object> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `ObjectSequence` by prepending `iterable`
     * to the current sequence.
     *
     * @param iterable the `Iterable<Object>` to prepend to the current sequence
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IObjectIterable peopleSeq = seq1.prepend(seq2);
     */
    public virtual override ObjectEnumerable prepend(final Iterable<Object> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
//    /**
//     * @description Returns new `ObjectStream` from the current sequence.
//     * <p>Stateful Intermediate Operation.</p>
//     *
//     * @return the new `ObjectStream`
//     *
//     * @example
//     * IObjectIterable peopleStream = ObjectSequence.of(people).stream();
//     */
//    public virtual ObjectEnumerable stream() {
//        return ObjectStream.of(iterator()); // ToDo
//        return null;
//    }

    /**
     * @description Returns a `ObjectSequence` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> filtered = (List<Person>) ObjectSequence.of(people)
     *     .filter(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable filter(final IPredicate predicate) {
        return new ObjectSequence(SequencePipeline.filter(objects, predicate, new List<Object>()));
//        Validate.notNull(predicate);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Object o = objects[i];
//            if (predicate.test(o)) {
//                results.add(o);
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> firstFiltered = (List<Person>) ObjectSequence.of(people)
     *     .take(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable take(final IPredicate predicate) {
        return new ObjectSequence(SequencePipeline.take(objects, predicate, new List<Object>()));
//        Validate.notNull(predicate);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Object o = objects[i];
//            if (predicate.test(o)) {
//                results.add(o);
//            } else {
//                break;
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Person> rest = (List<Person>) ObjectSequence.of(people)
     *     .drop(predicate)
     *     .toList();
     */
    public virtual override ObjectEnumerable drop(final IPredicate predicate) {
        return new ObjectSequence(SequencePipeline.drop(objects, predicate, new List<Object>()));
//        Validate.notNull(predicate);
//        final List<Object> results = new List<Object>();
//        Boolean drop = true;
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Object o = objects[i];
//            if (!predicate.test(o) || !drop) {
//                results.add(o);
//                drop = false;
//            }
//        }
//        return new ObjectSequence(results);
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
     * List<String> peopleNames = (List<String>) ObjectSequence.of(people)
     *     .mapTo(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable mapTo(final IOperator mapper) {
        return new ObjectSequence(SequencePipeline.mapTo(objects, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            results.add(mapper.apply(objects[i]));
//        }
//        return new ObjectSequence(results);
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
     * List<Integer> peopleAges = ObjectSequence.of(people)
     *     .mapToInt(getAge)
     *     .toList();
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.mapTo(objects, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            results.add((Integer) mapper.apply(objects[i]));
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
     * List<Long> peopleIds = ObjectSequence.of(people)
     *     .mapToLong(getId)
     *     .toList();
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.mapTo(objects, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            results.add((Long) mapper.apply(objects[i]));
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
     * List<Double> peopleHeights = ObjectSequence.of(people)
     *     .mapToDouble(getHeight)
     *     .toList();
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.mapTo(objects, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            results.add((Double) mapper.apply(objects[i]));
//        }
//        return DoubleSequence.of(results);
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
     * List<Contact> contacts = ObjectSequence.of(people)
     *     .mapToSObject(getAsContact)
     *     .toList();
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectSequence.of((List<SObject>) SequencePipeline.mapTo(objects, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            results.add((SObject) mapper.apply(objects[i]));
//        }
//        return SObjectSequence.of(results);
    }

    /**
     * @description Returns a new `ObjectSequence` with `Object` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `ObjectSequence`
     *
     * @example
     * List<Property> flattenedProperties = (List<Property>) ObjectSequence.of(people)
     *     .flatMapTo(getListProperty)
     *     .toList(List<Property>.class);
     *     
     * List<List<String>> containedStrings; // [ ['foo'], null, [], ['baz', 'bar'], [null] ]
     * List<String> flattenedStrings = (List<String>) ObjectSequence.of(containedStrings)
     *     .flatMapTo(Function.identity())
     *     .toList(List<String>.class); // ['foo', 'baz', 'bar', null]
     */
    public virtual override ObjectEnumerable flatMapTo(final IFunction mapper) {
        return new ObjectSequence(SequencePipeline.flatMapTo(objects, mapper, new List<Object>()));
//        Validate.notNull(mapper);
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Iterable<Object> result = (Iterable<Object>) mapper.apply(objects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toList(result));
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a new `IntSequence` with `Integer` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntSequence`
     *
     * @example
     * List<Integer> flattenedProperties = (List<Integer>) ObjectSequence.of(people)
     *     .flatMapToInt(getIntListProperty)
     *     .toList();
     *     
     * List<List<Integer>> containedInts; // [ [1], null, [], [0, 10], [null] ]
     * List<Integer> flattenedInts = ObjectSequence.of(containedInts)
     *     .flatMapToInt(Function.identity())
     *     .toList(); // [1, 0, 10, null]
     */
    public virtual override IntEnumerable flatMapToInt(final IFunction mapper) {
        return IntSequence.of((List<Integer>) SequencePipeline.flatMapTo(objects, mapper, new List<Integer>()));
//        Validate.notNull(mapper);
//        final List<Integer> results = new List<Integer>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Iterable<Integer> result = (Iterable<Integer>) mapper.apply(objects[i]);
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
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongSequence`
     *
     * @example
     * List<Long> flattenedProperties = (List<Long>) ObjectSequence.of(people)
     *     .flatMapToLong(getLongListProperty)
     *     .toList();
     *     
     * List<List<Long>> containedLongs; // [ [1L], null, [], [0L, 10L], [null] ]
     * List<Long> flattenedLongs = ObjectSequence.of(containedLongs)
     *     .flatMapToLong(Function.identity())
     *     .toList(); // [1L, 0L, 10L, null]
     */
    public virtual override LongEnumerable flatMapToLong(final IFunction mapper) {
        return LongSequence.of((List<Long>) SequencePipeline.flatMapTo(objects, mapper, new List<Long>()));
//        Validate.notNull(mapper);
//        final List<Long> results = new List<Long>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Iterable<Long> result = (Iterable<Long>) mapper.apply(objects[i]);
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
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleSequence`
     *
     * @example
     * List<Double> flattenedProperties = (List<Double>) ObjectSequence.of(people)
     *     .flatMapToDouble(getDoubleListProperty)
     *     .toList();
     *     
     * List<List<Double>> containedDoubles; // [ [1.0], null, [], [0.5, Math.PI], [null] ]
     * List<Double> flattenedDoubles = ObjectSequence.of(containedDoubles)
     *     .flatMapToDouble(Function.identity())
     *     .toList(); // [1.0, 0.5, Math.PI, null]
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleSequence.of((List<Double>) SequencePipeline.flatMapTo(objects, mapper, new List<Double>()));
//        Validate.notNull(mapper);
//        final List<Double> results = new List<Double>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Iterable<Double> result = (Iterable<Double>) mapper.apply(objects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toDoubleList(result.iterator()));
//            }
//        }
//        return DoubleSequence.of(results);
    }

    /**
     * @description Returns a new `SObjectSequence` with `SObject` elements as a result of
     * replacing each element of this sequence with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectSequence`
     *
     * @example
     * List<List<Account>> containedAccounts; // [ [acc1], null, [], [acc2, acc3], [null] ]
     * List<Account> flattenedAccounts = ObjectSequence.of(containedDoubles)
     *     .flatMapToSObject(Function.identity())
     *     .toList(); // [acc1, acc2, acc3, null]
     */
    public virtual override SObjectEnumerable flatMapToSObject(final IFunction mapper) {
        return SObjectSequence.of((List<SObject>) SequencePipeline.flatMapTo(objects, mapper, new List<SObject>()));
//        Validate.notNull(mapper);
//        final List<SObject> results = new List<SObject>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(objects[i]);
//            if (result != null) {
//                results.addAll(Iterators.toSObjectList(result.iterator()));
//            }
//        }
//        return SObjectSequence.of(results);
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
     * List<Person> editedPeople = (List<Person>) ObjectSequence.of(people)
     *     .forEach(setSomeProperty)
     *     .toList();
     */
    public virtual override ObjectEnumerable forEach(final IConsumer consumer) {
        SequencePipeline.forEach(objects, consumer);
//        Validate.notNull(consumer);
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            consumer.accept(objects[i]);
//        }
        return this;
    }

    /**
     * @description Returns a `ObjectSequence` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectSequence`
     *
     * @example
     * List<Person> distinctPeople = (List<Person>) ObjectSequence.of(people)
     *     .distinct()
     *     .toList();
     */
    public virtual override ObjectEnumerable distinct() {
        return new ObjectSequence(SequencePipeline.distinct(objects, new List<Object>()));
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            if (!results.contains(objects[i])) {
//                results.add(objects[i]);
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * List<Person> distinctPeopleByName = (List<Person>) ObjectSequence.of(people)
     *     .distinct(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable distinct(final IFunction classifier) {
        return new ObjectSequence(SequencePipeline.distinct(objects, classifier, new List<Object>()));
//        Validate.notNull(classifier);
//        final List<Object> results = new List<Object>();
//        final Set<Object> classifierResults = new Set<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            if (classifierResults.add(classifier.apply(objects[i]))) {
//                results.add(objects[i]);
//            }
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a `ObjectSequence` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectSequence`
     *
     * @example
     * List<Person> sortedPeople = (List<Person>) ObjectSequence.of(people)
     *     .sort()
     *     .toList();
     */
    public virtual override ObjectEnumerable sort() {
        return new ObjectSequence(SequencePipeline.sort(objects));
//        final List<Object> clone = objects.clone();
//        clone.sort();
//        return new ObjectSequence(clone);
    }

    /**
     * @description Returns a `ObjectSequence` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare sequence elements
     *
     * @return the `ObjectSequence`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) ObjectSequence.of(people)
     *     .sort(getName)
     *     .toList();
     */
    public virtual override ObjectEnumerable sort(final IComparer comparer) {
        return new ObjectSequence(SequencePipeline.sort(objects, comparer));
    }

    /**
     * @description Returns a `ObjectSequence` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `ObjectSequence`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Person> first100People = (List<Person>) ObjectSequence.of(people)
     *     .lim(100)
     *     .toList();
     */
    public virtual override ObjectEnumerable lim(final Integer lim) {
        return new ObjectSequence(SequencePipeline.lim(objects, lim, new List<Object>()));
//        Validate.notNull(lim);
//        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
//        if (lim == 0) { return ObjectSequence.empty(); }
//        if (lim >= objects.size()) { return this; }
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0; i < lim; i++) {
//            results.add(objects[i]);
//        }
//        return new ObjectSequence(results);
    }

    /**
     * @description Returns a new `ObjectSequence` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `ObjectSequence`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Person> restPeople = (List<Person>) ObjectSequence.of(people)
     *     .skip(100)
     *     .toList();
     */
    public virtual override ObjectEnumerable skip(final Integer n) {
        return new ObjectSequence(SequencePipeline.skip(objects, n, new List<Object>()));
//        Validate.notNull(n);
//        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
//        if (n == 0) { return this; }
//        if (n >= objects.size()) { return ObjectSequence.empty(); }
//        final List<Object> results = new List<Object>();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            if (i >= n) {
//                results.add(objects[i]);
//            }
//        }
//        return new ObjectSequence(results);
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
        return SequencePipeline.reduce(objects, identity, accumulator);
//        Validate.notNull(accumulator);
//        Object result = identity;
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            result = accumulator.apply(result, objects[i]);
//        }
//        return result;
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
     * Person eldestPerson = (Person) ObjectSequence.of(people)
     *     .reduce(maxBy(getAge))
     *     .get();
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable(SequencePipeline.reduce(objects, accumulator));
//        Validate.notNull(accumulator);
//        Object result;
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            result = i == 0 ? objects[i] : accumulator.apply(result, objects[i]);
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
//     * List<String> peopleNames = (List<String>) ObjectSequence.of(people)
//     *     .collect(
//     *         Supplier.of(List<String>.class),
//     *         ListObjectConsumers.addToList(getName)
//     *     );
//     */
//    public virtual override Object collect(final ISupplier supplier, final IBiConsumer accumulator) {
//        return SequencePipeline.collect(objects, Collector.of(supplier, accumulator));
//        Validate.notNull(supplier);
//        Validate.notNull(accumulator);
//        final Object container = supplier.get();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            accumulator.accept(container, objects[i]);
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
     *     ObjectSequence.of(people)
     *          .collect(Collectors.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
     *          
     * // Group people by city and by country, cascading two collectors
     * Map<String, Map<String, List<Person>>> peopleByCityByCountry
     *     = (Map<String, Map<String, List<Person>>>)
     *         ObjectSequence.of(people)
     *             .collect(Collectors.groupingByString(
     *                 getCountry,
     *                 Collectors.groupingByString(getCity)
     *             ).cast(Map<String, Map<String, List<Person>>>.class));
     */
    public virtual override Object collect(final ICollector collector) {
        return SequencePipeline.collect(objects, collector);
//        Validate.notNull(collector);
//        final Object container = collector.supplier().get();
//        final IBiConsumer accumulator = collector.accumulator();
//        final IFunction finisher = collector.finisher();
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            accumulator.accept(container, objects[i]);
//        }
//        return finisher == null ? container : finisher.apply(container);
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
     * Person firstActivePerson = (Person) ObjectSequence.of(people)
     *     .find(isActive)
     *     .get();
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable(SequencePipeline.find(objects, predicate));
//        Validate.notNull(predicate);
//        for (Integer i = 0, size = objects.size(); i < size; i++) {
//            final Object o = objects[i];
//            if (predicate.test(o)) {
//                return Optional.ofNullable(o);
//            }
//        }
//        return Optional.empty();
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isEveryPersonActive = ObjectSequence.of(people).every(isActive);
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return SequencePipeline.match(objects, predicate, 1);
//        Validate.notNull(predicate);
//        return match(predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ObjectSequence` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isSomePersonActive = ObjectSequence.of(people).some(isActive);
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return SequencePipeline.match(objects, predicate, 0);
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
        return objects.size();
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    public virtual override Boolean isEmpty() {
        return objects.isEmpty();
    }

    /**
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Object>` containing the sequence elements
     *
     * @example
     * List<Person> activePeople = (List<Person>) ObjectSequence.of(people)
     *     .filter(isActive)
     *     .toList();
     */
    public virtual override List<Object> toList() {
        return objects;
    }

    /**
     * @description Accumulates elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Object>` containing the sequence elements
     *
     * @example
     * List<Object> activePeople = ObjectSequence.of(people)
     *     .filter(isActive)
     *     .toSet();
     */
    public virtual override Set<Object> toSet() {
        return new Set<Object>(objects);
    }
    // @end-group
    //</editor-fold>

}
