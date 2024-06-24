/**
 * @description An entry point that returns a stream of a certain type,
 * depending on the type of the parameter.
 *
 * @see ObjectStream
 * @see SObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public inherited sharing class Stream {

    /**
     * @description Returns a `ObjectEnumerable` created from `List<Object>`.
     *
     * @param objects the list
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ObjectEnumerable peopleStream = Stream.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final List<Object> objects) {
        return ObjectStream.of(objects);
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `sObjects`.
     *
     * @param sObjects the list
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * SObjectEnumerable accStream = Stream.of(new List<Account>(accounts));
     */
    public static SObjectEnumerable of(final List<SObject> sObjects) {
        return SObjectStream.of(sObjects);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers`.
     *
     * @param integers the list
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IntEnumerable intStream = Stream.of(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final List<Integer> integers) {
        return IntStream.of(integers);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs`.
     *
     * @param longs the list
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * LongEnumerable longStream = Stream.of(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final List<Long> longs) {
        return LongStream.of(longs);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles`.
     *
     * @param doubles the list
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * DoubleEnumerable doubleStream = Stream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final List<Double> doubles) {
        return DoubleStream.of(doubles);
    }

    /**
     * @description Returns a `ObjectEnumerable` created from `Set<Object>`.
     *
     * @param objects the set
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * ObjectEnumerable peopleStream = Stream.of(new Set<Person>(people));
     */
    public static ObjectEnumerable of(final Set<Object> objects) {
        return ObjectStream.of(objects);
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `sObjects`.
     *
     * @param sObjects the set
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * SObjectEnumerable accStream = Stream.of(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable of(final Set<SObject> sObjects) {
        return SObjectStream.of(sObjects);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers`.
     *
     * @param integers the set
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IntEnumerable intStream = Stream.of(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final Set<Integer> integers) {
        return IntStream.of(integers);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs`.
     *
     * @param longs the set
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * LongEnumerable longStream = Stream.of(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final Set<Long> longs) {
        return LongStream.of(longs);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles`.
     *
     * @param doubles the set
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * DoubleEnumerable doubleStream = Stream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Set<Double> doubles) {
        return DoubleStream.of(doubles);
    }

    /**
     * @description Returns a `ObjectEnumerable` created from `objects` if non-null,
     * otherwise returns an empty `ObjectEnumerable`.
     *
     * @param objects the list
     *
     * @return the new `ObjectEnumerable` if `objects` is non-null,
     * otherwise an empty `ObjectEnumerable`
     *
     * @example
     * ObjectEnumerable peopleStream = Stream.ofNullable(new List<Person>(people));
     */
    public static ObjectEnumerable ofNullable(final List<Object> objects) {
        return ObjectStream.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectEnumerable`.
     *
     * @param sObjects the list
     *
     * @return the new `SObjectEnumerable` if `iterable` is non-null,
     * otherwise an empty `SObjectEnumerable`
     *
     * @example
     * SObjectEnumerable accStream = Stream.ofNullable(new List<Account>(accounts));
     */
    public static SObjectEnumerable ofNullable(final List<SObject> sObjects) {
        return SObjectStream.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers` if non-null,
     * otherwise returns an empty `IntEnumerable`.
     *
     * @param integers the list
     *
     * @return the new `IntEnumerable` if `integers` is non-null,
     * otherwise an empty `IntEnumerable`
     *
     * @example
     * IntEnumerable intStream = Stream.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final List<Integer> integers) {
        return IntStream.ofNullable(integers);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs` if non-null,
     * otherwise returns an empty `LongEnumerable`.
     *
     * @param longs the list
     *
     * @return the new `LongEnumerable` if `longs` is non-null,
     * otherwise an empty `LongEnumerable`
     *
     * @example
     * LongEnumerable longStream = LongStream.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final List<Long> longs) {
        return LongStream.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleEnumerable`.
     *
     * @param doubles the list
     *
     * @return the new `DoubleEnumerable` if `doubles` is non-null,
     * otherwise an empty `DoubleEnumerable`
     *
     * @example
     * DoubleEnumerable doubleStream = Stream.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final List<Double> doubles) {
        return DoubleStream.ofNullable(doubles);
    }

    /**
     * @description Returns a `ObjectEnumerable` created from `objects` if non-null,
     * otherwise returns an empty `ObjectEnumerable`.
     *
     * @param objects the set
     *
     * @return the new `ObjectEnumerable` if `objects` is non-null,
     * otherwise an empty `ObjectEnumerable`
     *
     * @example
     * ObjectEnumerable peopleStream = Stream.ofNullable(new Set<Object>(people));
     */
    public static ObjectEnumerable ofNullable(final Set<Object> objects) {
        return ObjectStream.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectEnumerable`.
     *
     * @param sObjects the set
     *
     * @return the new `SObjectEnumerable` if `iterable` is non-null,
     * otherwise an empty `SObjectEnumerable`
     *
     * @example
     * SObjectEnumerable accStream = Stream.ofNullable(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable ofNullable(final Set<SObject> sObjects) {
        return SObjectStream.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntEnumerable` created from `integers` if non-null,
     * otherwise returns an empty `IntEnumerable`.
     *
     * @param integers the set
     *
     * @return the new `IntEnumerable` if `integers` is non-null,
     * otherwise an empty `IntEnumerable`
     *
     * @example
     * IntEnumerable intStream = Stream.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final Set<Integer> integers) {
        return IntStream.ofNullable(integers);
    }

    /**
     * @description Returns a `LongEnumerable` created from `longs` if non-null,
     * otherwise returns an empty `LongEnumerable`.
     *
     * @param longs the list
     *
     * @return the new `LongEnumerable` if `longs` is non-null,
     * otherwise an empty `LongEnumerable`
     *
     * @example
     * LongEnumerable longStream = LongStream.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final Set<Long> longs) {
        return LongStream.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleEnumerable` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleEnumerable`.
     *
     * @param doubles the set
     *
     * @return the new `DoubleEnumerable` if `doubles` is non-null,
     * otherwise an empty `DoubleEnumerable`
     *
     * @example
     * DoubleEnumerable doubleStream = Stream.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final Set<Double> doubles) {
        return DoubleStream.ofNullable(doubles);
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
        return ObjectStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `SObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `SObjectEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IOperator operator) {
        return SObjectStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `IntEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `IntEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * IntEnumerable intIncrementalStream = Stream.iterate(0, IntUnaryOperators.add(1));
     */
    public static IntEnumerable iterate(final Integer seed, final IOperator operator) {
        return IntStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `LongEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `LongEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * LongEnumerable longIncrementalStream = Stream.iterate(0L, LongUnaryOperators.add(1L));
     */
    public static LongEnumerable iterate(final Long seed, final IOperator operator) {
        return LongStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `DoubleEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `DoubleEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * DoubleEnumerable doubleIncrementalStream = Stream.iterate(0, DoubleUnaryOperators.add(1));
     */
    public static DoubleEnumerable iterate(final Double seed, final IOperator operator) {
        return DoubleStream.iterate(seed, operator);
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
        return ObjectStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `SObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IPredicate predicate, final IOperator operator) {
        return SObjectStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `IntEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static IntEnumerable iterate(final Integer seed, final IPredicate predicate, final IOperator operator) {
        return IntStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `LongEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static LongEnumerable iterate(final Long seed, final IPredicate predicate, final IOperator operator) {
        return LongStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `DoubleEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static DoubleEnumerable iterate(final Double seed, final IPredicate predicate, final IOperator operator) {
        return DoubleStream.iterate(seed, predicate, operator);
    }

}
