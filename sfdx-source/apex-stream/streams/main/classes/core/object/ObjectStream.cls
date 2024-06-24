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
 * @see SObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * Double sumAnnualRevenueOfUniquePeopleFromLondon
 *     = ObjectStream.of(people)
 *         .filter(isPersonFromLondonPredicate)
 *         .distinct()
 *         .mapToDouble(getAnnualRevenueToDoubleFunction)
 *         .sum();
 */
@SuppressWarnings(
    'PMD.CognitiveComplexity, PMD.CyclomaticComplexity, PMD.ExcessiveClassLength, PMD.ExcessivePublicCount'
)
public virtual inherited sharing class ObjectStream extends ObjectEnumerable implements IRunnable {

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

    //<editor-fold desc="Iterator">
    // @start-group Iterator
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
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `ObjectEnumerable` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * ObjectEnumerable peopleStream = ObjectStream.of(new List<Person>(people).iterator());
     * ObjectEnumerable peopleStream = ObjectStream.of(new Set<Person>(people).iterator());
     * ObjectEnumerable peopleStream = ObjectStream.of(otherStream.iterator());
     */
    public static ObjectEnumerable of(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        return new ObjectStream(iterator);
    }

    /**
     * @description Returns a `ObjectEnumerable` created from `Iterable<Object>`.
     *
     * @param iterable the iterable
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * ObjectEnumerable peopleStream = ObjectStream.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final Iterable<Object> iterable) {
        Validate.notNull(iterable);
        return new ObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `ObjectEnumerable` created from `Iterable<Object>` if non-null,
     * otherwise returns an empty `ObjectEnumerable`.
     *
     * @param iterable the iterable
     *
     * @return the new `ObjectEnumerable` if `iterable` is non-null,
     * otherwise an empty `ObjectEnumerable`
     *
     * @example
     * ObjectEnumerable peopleStream = ObjectStream.ofNullable(new List<Person>(people));
     * ObjectEnumerable emptyStream = ObjectStream.ofNullable(null);
     */
    public static ObjectEnumerable ofNullable(final Iterable<Object> iterable) {
        if (iterable == null) { return empty(); }
        return new ObjectStream(iterable.iterator());
    }

    /**
     * @description Returns an empty `ObjectEnumerable`.
     *
     * @return the empty `ObjectEnumerable`
     */
    public static ObjectEnumerable empty() {
        return new ObjectStream();
    }

    /**
     * @description Returns an infinite `ObjectEnumerable` where each element is
     * generated by `supplier`.
     *
     * @param supplier the supplier of generated elements
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static ObjectEnumerable generate(final ISupplier supplier) {
        return new ObjectStream(StreamPipeline.generate(supplier));
    }

    /**
     * @description Returns an infinite `ObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `ObjectEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static ObjectEnumerable iterate(final Object seed, final IOperator operator) {
        return new ObjectStream(StreamPipeline.iterate(seed, operator));
    }

    /**
     * @description Returns an infinite `ObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static ObjectEnumerable iterate(final Object seed, final IPredicate predicate, final IOperator operator) {
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `ObjectEnumerable` whose elements are all the
     * elements of the first `Iterable<Object>` followed by all the elements of the
     * second `Iterable<Object>`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> append = (List<String>) ObjectStream.concat(strs1, strs2)
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
     */
    public static ObjectEnumerable concat(final Iterable<Object> iterable1, final Iterable<Object> iterable2) {
        return concat(new List<Iterable<Object>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Object>>`.
     *
     * @param iterables the list of `Iterable<Object>`
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> concat = (List<String>) ObjectStream.concat(new List<Iterable<Object>>{ strs1, strs2 })
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
     */
    public static ObjectEnumerable concat(final List<Iterable<Object>> iterables) {
        return new ObjectStream(StreamPipeline.concat(iterables, Object.class));
    }

    /**
     * @description Returns a combined `ObjectEnumerable` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * public class ConcatBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (String) o1 + '-' + (String) o2; }
     * }
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> zip = ObjectStream.zip(strs1, strs2, new ConcatBiOperator())
     *     .toList();
     * // ['foo-qux', 'bar-fred', 'baz-foo']
     */
    public static ObjectEnumerable zip(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiOperator combiner
    ) {
        return new ObjectStream(StreamPipeline.zip(iterable1, iterable2, combiner));
    }

    /**
     * @description Returns a combined `ObjectEnumerable` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<Object>`
     * @param iterable2 the second `Iterable<Object>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     *
     * @example
     * public class ContainsAnyBiPredicate extends BiPredicate {
     *     private final String s;
     *     public ContainsAnyBiPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o1, Object o2) {
     *         return ((String) o1).contains(s) || ((String) o2).contains(s);
     *     }
     * }
     * public class ConcatBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (String) o1 + '-' + (String) o2; }
     * }
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> zip = (List<String>) ObjectStream.zip(
     *     strs1,
     *     strs2,
     *     new ContainsAnyBiPredicate('a'),
     *     new ConcatBiOperator()
     * )
     *     .toList(String.class);
     * // ['bar-fred', 'baz-foo']
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static ObjectEnumerable zip(
            final Iterable<Object> iterable1,
            final Iterable<Object> iterable2,
            final IBiPredicate predicate,
            final IBiOperator combiner
    ) {
        return new ObjectStream(StreamPipeline.zip(iterable1, iterable2, predicate, combiner));
    }

    /**
     * @description Returns new `ObjectEnumerable` by appending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Object>` to append to the current stream
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> append = (List<String>) ObjectStream.of(strs1)
     *     .append(strs2)
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
     */
    public virtual override ObjectEnumerable append(final Iterable<Object> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `ObjectEnumerable` by prepending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<Object>` to prepend to the current stream
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> union = (List<String>) ObjectStream.of(strs1)
     *     .union(strs2)
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred']
     */
    public virtual override ObjectEnumerable prepend(final Iterable<Object> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns a `ObjectEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> filtered = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .filter(new ContainsPredicate('a'))
     *     .toList(String.class); // ['bar', 'baz']
     */
    public virtual override ObjectEnumerable filter(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.filter(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> firstMatched = (List<String>)
     *     ObjectStream.of(new List<String>{ 'bar', 'baz', 'foo' })
     *     .take(new ContainsPredicate('a'))
     *     .toList(String.class); // ['bar', 'baz']
     */
    public virtual override ObjectEnumerable take(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.take(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> rest = (List<String>)
     *     ObjectStream.of(new List<String>{ 'bar', 'baz', 'foo' })
     *     .take(new ContainsPredicate('a'))
     *     .toList(String.class); // ['foo']
     */
    public virtual override ObjectEnumerable drop(final IPredicate predicate) {
        return new ObjectStream(StreamPipeline.drop(iterator(), predicate));
    }

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<String> normalizedStrings = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .mapTo(new ToLowerCaseOperator())
     *     .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
     */
    public virtual override ObjectEnumerable mapTo(final IOperator mapper) {
        return new ObjectStream(StreamPipeline.mapTo(iterator(), (IFunction) mapper));
    }

    /**
     * @description Returns a `IntEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return ((String) o).length(); }
     * }
     * List<Integer> ints = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToInt(new LengthFunction())
     *     .toList(); // [1, 2, 3]
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `LongEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return (Long) ((String) o).length(); }
     * }
     * List<Long> longs = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToLong(new LengthFunction())
     *     .toList(); // [1L, 2L, 3L]
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return (Double) ((String) o).length(); }
     * }
     * List<Double> doubles = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToDouble(new LengthFunction())
     *     .toList(); // [1.0, 2.0, 3.0]
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object o) { return new Account(Name = (String) o); }
     * }
     * List<Account> accounts = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public virtual override SObjectEnumerable mapToSObject(final IFunction mapper) {
        return SObjectStream.of((Iterator<SObject>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `ObjectEnumerable` with `Object` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `ObjectEnumerable`
     *
     * @example
     * public class ToLowerCaseFunction extends Function {
     *     public override Object apply(Object o) { return new List<String>{ ((String) o).toLowerCase() }; }
     * }
     * List<String> normalizedStrings = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .flatMapTo(new ToLowerCaseFunction())
     *     .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
     */
    public virtual override ObjectEnumerable flatMapTo(final IFunction mapper) {
        return new ObjectStream(StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `IntEnumerable` with `Integer` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Integer>{ ((String) o).length() }; }
     * }
     * List<Integer> ints = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToInt(new LengthFunction())
     *     .toList(); // [1, 2, 3]
     */
    public virtual override IntEnumerable flatMapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `LongEnumerable` with `Long` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Long>{ ((String) o).length() }; }
     * }
     * List<Long> longs = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToLong(new LengthFunction())
     *     .toList(); // [1L, 2L, 3L]
     */
    public virtual override LongEnumerable flatMapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `DoubleEnumerable` with `Double` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Double>{ ((String) o).length() }; }
     * }
     * List<Double> doubles = ObjectStream.of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToDouble(new LengthFunction())
     *     .toList(); // [1.0, 2.0, 3.0]
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `SObjectEnumerable` with `SObject` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectEnumerable`
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object o) { return new List<Account>{ new Account(Name = (String) o) }; }
     * }
     * List<Account> accounts = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .flatMapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public virtual override SObjectEnumerable flatMapToSObject(final IFunction mapper) {
        return SObjectStream.of((Iterator<SObject>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectEnumerable` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<String> strings = (List<String>) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .forEach(new DebugConsumer()) // prints 'foo', 'bar', 'baz'
     *     .toList(String.class); // ['foo', 'bar', 'baz']
     */
    public virtual override ObjectEnumerable forEach(final IConsumer consumer) {
        return new ObjectStream(StreamPipeline.forEach(iterator(), consumer));
    }

    /**
     * @description Returns a `ObjectEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectEnumerable`
     *
     * @example
     * List<String> distinct = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'foo', 'bar' })
     *     .distinct()
     *     .toList(String.class); // ['foo', 'bar', 'baz']
     */
    public virtual override ObjectEnumerable distinct() {
        return new ObjectStream(StreamPipeline.distinct(iterator()));
    }

    /**
     * @description Returns a `ObjectEnumerable` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<String> distinct = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .distinct(new ToLowerCaseOperator())
     *     .toList(String.class); // ['foo', 'Bar', 'baz']
     */
    public virtual override ObjectEnumerable distinct(final IFunction classifier) {
        return new ObjectStream(StreamPipeline.distinct(iterator(), classifier));
    }

    /**
     * @description Returns a `ObjectEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectEnumerable`
     *
     * @example
     * List<String> sorted = (List<String>) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', null })
     *     .sort()
     *     .toList(String.class); // [null, 'bar', 'baz', 'foo']
     */
    public virtual override ObjectEnumerable sort() {
        return new ObjectStream(StreamPipeline.sort(iterator()));
    }

    /**
     * @description Returns a `ObjectEnumerable` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare stream elements
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * public class SecondLetterComparer extends Comparer {
     *     public override Integer compare(Object o1, Object o2) {
     *         String s1 = (String) o1;
     *         String s2 = (String) o2;
     *         if (s1.length() > 1 && s2.length() > 1) {
     *             return s1.split('')[1].compareTo(s2.split('')[1]);
     *         }
     *         return s1.length() <= 1 ? -1 : 1;
     *     }
     * }
     * List<String> sorted = (List<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .sort(new SecondCharComparer())
     *     .toList(String.class); // ['Bar', 'baz', 'bar', 'foo', 'Foo']
     */
    public virtual override ObjectEnumerable sort(final IComparer comparer) {
        return new ObjectStream(StreamPipeline.sort(iterator(), comparer));
    }

    /**
     * @description Returns a `ObjectEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `ObjectEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<String> first2 = (List<String>) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .lim(2)
     *     .toList(String.class); // ['foo', 'baz']
     */
    public virtual override ObjectEnumerable lim(final Integer lim) {
        return new ObjectStream(StreamPipeline.lim(iterator(), lim));
    }

    /**
     * @description Returns a new `ObjectEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `ObjectEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<String> rest = (List<String>) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .skip(1)
     *     .toList(String.class); // ['bar', 'baz']
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
     *
     * @example
     * public class ConcatenateBiOperator extends BiOperator {
     *     private final String separator;
     *     public ConcatenateBiOperator(String separator) { this.separator = separator; }
     *     public override Object apply(Object o1, Object o2) {
     *         return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
     *     }
     * }
     * String concatenated = (String) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce('', new ConcatenateBiOperator('-')); // 'foo-bar-baz'
     * String concatenated1 = (String) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce('seed', new ConcatenateBiOperator(';')); // 'seed;foo;bar;baz'
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
     * public class ConcatenateBiOperator extends BiOperator {
     *     private final String separator;
     *     public ConcatenateBiOperator(String separator) { this.separator = separator; }
     *     public override Object apply(Object o1, Object o2) {
     *         return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
     *     }
     * }
     * String concatenated = (String) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce(new ConcatenateBiOperator('-'))
     *     .get(); // 'foo-bar-baz'
     * String concatenated1 = (String) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce(new ConcatenateBiOperator(';'))
     *     .get(); // 'seed;foo;bar;baz'
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable(StreamPipeline.reduce(iterator(), accumulator));
    }

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
     * // Simple collecting
     * public class AddToStringSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
     * }
     * Set<String> strings = (Set<String>)
     *     ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer()));
     * // ['foo', 'bar', 'baz', 'quux', 'a']
     * // Cascaded operation
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return ((String) o).length(); }
     * }
     * public class PutToObjectsByIntMap extends BiConsumer {
     *     private final IFunction classifier;
     *     public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
     *         this.downstream = downstream;
     *         this.classifier = classifier;
     *     }
     *     public override void accept(Object container, Object o) {
     *         final Map<Integer, Set<String>> m = (Map<Integer, Set<String>>) container;
     *         final Integer key = (Integer) classifier.apply(o);
     *         if (!m.containsKey(key)) { m.put(key, (Set<String>) downstream.supplier().get()); }
     *         downstream.accumulator().accept(m.get(key), o);
     *     }
     * }
     * // the classifier function mapping input elements to keys.
     * IFunction classificationFunction = new LengthFunction();
     * // the supplier providing a new empty Map into which the results will be inserted.
     * ISupplier mapSupplier = Supplier.of(Map<Integer, Set<String>>.class);
     * // the Collector implementing the downstream reduction.
     * ICollector downstreamCollector = Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer());
     * // the function that folds an element into a result container.
     * IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, new LengthFunction());
     * // the Collector implementing the cascaded group-by operation.
     * ICollector groupByLengthCollector = Collector.of(mapSupplier, accumulator);
     * Map<Integer, Set<String>> stringsByLength = (Map<Integer, Set<String>>)
     *     ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(groupByLengthCollector); //
     * {
     *   1: ['a'],
     *   3: ['foo', 'bar', 'baz'],
     *   4: ['quux']
     * }
     * // The same result can be obtained by using built-in Collectors
     * Map<Integer, Set<String>> stringsByLength1 = (Map<Integer, Set<String>>)
     *     ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(
     *         Collectors.groupingByInt(new LengthFunction(), Collectors.toStringSet())
     *             .cast(Map<Integer, Set<String>>.class)
     *     );
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
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * String firstFound = (String) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .find(new ContainsPredicate('a'))
     *     .get(); // 'bar'
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable(StreamPipeline.find(iterator(), predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * Boolean doesEveryStringContainA = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .every(new ContainsPredicate('a')); // false
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * Boolean doesSomeStringContainA = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .some(new ContainsPredicate('a')); // true
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .count(); // 3
     */
    public virtual override Integer count() {
        return StreamPipeline.count(iterator());
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .isEmpty(); // false
     * ObjectStream.of(new List<String>())
     *     .isEmpty(); // true
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
     * List<Object> strings = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
     *     .skip(1)
     *     .toList(); // ['bar', 'baz', 'qux']
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
     * Set<Object> strings = ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz', 'qux', 'foo', 'bar' })
     *     .skip(1)
     *     .toSet(); // ['bar', 'baz', 'qux']
     */
    public virtual override Set<Object> toSet() {
        return StreamPipeline.toObjectSet(iterator());
    }

    /**
     * @description Advances the iterator to its end.
     * <p>Terminal Operation.</p>
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * IRunnable strStream = (IRunnable) ObjectStream.of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .forEach(new DebugConsumer());
     * // the `forEach` intermediate operation will not be performed until a terminal operation is initiated
     * strStream.run(); // prints 'foo', 'bar', 'baz'
     */
    public void run() {
        StreamPipeline.run(iterator());
    }
    // @end-group
    //</editor-fold>

}
