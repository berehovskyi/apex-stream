/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description An entry point that returns a stream of a certain type,
 * depending on the type of the parameter.
 * @see ObjectStream
 * @see SObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 */
public virtual inherited sharing class Stream {

    /**
     * @description Returns a `ObjectStream` created from `List<Object>`.
     * @example
     * IObjectIterable peopleStream = Stream.of(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable` is null
     */
    public static IObjectIterable of(final List<Object> objects) {
        return ObjectStream.of(objects);
    }

    /**
     * @description Returns a `SObjectStream` created from `sObjects`.
     * @example
     * ISObjectIterable accStream = Stream.of(new List<Account>(accounts));
     * @param sObjects the list
     * @return the new `SObjectStream`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final List<SObject> sObjects) {
        return SObjectStream.of(sObjects);
    }

    /**
     * @description Returns a `IntStream` created from `integers`.
     * @example
     * IIntIterable intStream = Stream.of(new List<Integer>{ 0, 5, 1, -10 });
     * @param integers the list
     * @return the new `IntStream`
     * @throws NullPointerException if `integers` is null
     */
    public static IIntIterable of(final List<Integer> integers) {
        return IntStream.of(integers);
    }

    /**
     * @description Returns a `LongStream` created from `longs`.
     * @example
     * ILongIterable longStream = Stream.of(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongStream`
     * @throws NullPointerException if `iterator` is null
     */
    public static ILongIterable of(final List<Long> longs) {
        return LongStream.of(longs);
    }

    /**
     * @description Returns a `DoubleStream` created from `doubles`.
     * @example
     * IDoubleIterable doubleStream = Stream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the list
     * @return the new `DoubleStream`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final List<Double> doubles) {
        return DoubleStream.of(doubles);
    }

    /**
     * @description Returns a `ObjectStream` created from `Set<Object>`.
     * @example
     * IObjectIterable peopleStream = Stream.of(new Set<Person>(people));
     * @param objects the set
     * @return the new `ObjectStream`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final Set<Object> objects) {
        return ObjectStream.of(objects);
    }

    /**
     * @description Returns a `SObjectStream` created from `sObjects`.
     * @example
     * ISObjectIterable accStream = Stream.of(new Set<SObject>(accounts));
     * @param sObjects the set
     * @return the new `SObjectStream`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final Set<SObject> sObjects) {
        return SObjectStream.of((Iterable<SObject>) sObjects);
    }

    /**
     * @description Returns a `IntStream` created from `integers`.
     * @example
     * IIntIterable intStream = Stream.of(new Set<Integer>{ 0, 5, 1, -10 });
     * @param integers the set
     * @return the new `IntStream`
     * @throws NullPointerException if `integers` is null
     */
    public static IIntIterable of(final Set<Integer> integers) {
        return IntStream.of((Iterable<Integer>) integers);
    }

    /**
     * @description Returns a `LongStream` created from `longs`.
     * @example
     * ILongIterable longStream = Stream.of(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the set
     * @return the new `LongStream`
     * @throws NullPointerException if `iterator` is null
     */
    public static ILongIterable of(final Set<Long> longs) {
        return LongStream.of((Iterable<Long>) longs);
    }

    /**
     * @description Returns a `DoubleStream` created from `doubles`.
     * @example
     * IDoubleIterable doubleStream = Stream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the set
     * @return the new `DoubleStream`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final Set<Double> doubles) {
        return DoubleStream.of((Iterable<Double>) doubles);
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     * @example
     * IObjectIterable peopleStream = Stream.ofNullable(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     */
    public static IObjectIterable ofNullable(final List<Object> objects) {
        return ObjectStream.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectStream` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectStream`.
     * @example
     * ISObjectIterable accStream = Stream.ofNullable(new List<Account>(accounts));
     * @param sObjects the list
     * @return the new `SObjectStream` if `iterable` is non-null,
     * otherwise an empty `SObjectStream`
     */
    public static ISObjectIterable ofNullable(final List<SObject> sObjects) {
        return SObjectStream.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntStream` created from `integers` if non-null,
     * otherwise returns an empty `IntStream`.
     * @example
     * IIntIterable intStream = Stream.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     * @param integers the list
     * @return the new `IntStream` if `integers` is non-null,
     * otherwise an empty `IntStream`
     */
    public static IIntIterable ofNullable(final List<Integer> integers) {
        return IntStream.ofNullable(integers);
    }

    /**
     * @description Returns a `LongStream` created from `longs` if non-null,
     * otherwise returns an empty `LongStream`.
     * @example
     * ILongIterable longStream = LongStream.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongStream` if `longs` is non-null,
     * otherwise an empty `LongStream`
     */
    public static ILongIterable ofNullable(final List<Long> longs) {
        return LongStream.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleStream` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleStream`.
     * @example
     * IDoubleIterable doubleStream = Stream.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the list
     * @return the new `DoubleStream` if `doubles` is non-null,
     * otherwise an empty `DoubleStream`
     */
    public static IDoubleIterable ofNullable(final List<Double> doubles) {
        return DoubleStream.ofNullable(doubles);
    }

    /**
     * @description Returns a `ObjectStream` created from `objects` if non-null,
     * otherwise returns an empty `ObjectStream`.
     * @example
     * IObjectIterable peopleStream = Stream.ofNullable(new Set<Object>(people));
     * @param objects the set
     * @return the new `ObjectStream` if `objects` is non-null,
     * otherwise an empty `ObjectStream`
     */
    public static IObjectIterable ofNullable(final Set<Object> objects) {
        return ObjectStream.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectStream` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectStream`.
     * @example
     * ISObjectIterable accStream = Stream.ofNullable(new Set<SObject>(accounts));
     * @param sObjects the set
     * @return the new `SObjectStream` if `iterable` is non-null,
     * otherwise an empty `SObjectStream`
     */
    public static ISObjectIterable ofNullable(final Set<SObject> sObjects) {
        return SObjectStream.ofNullable((Iterable<SObject>) sObjects);
    }

    /**
     * @description Returns a `IntStream` created from `integers` if non-null,
     * otherwise returns an empty `IntStream`.
     * @example
     * IIntIterable intStream = Stream.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     * @param integers the set
     * @return the new `IntStream` if `integers` is non-null,
     * otherwise an empty `IntStream`
     */
    public static IIntIterable ofNullable(final Set<Integer> integers) {
        return IntStream.ofNullable((Iterable<Integer>) integers);
    }

    /**
     * @description Returns a `LongStream` created from `longs` if non-null,
     * otherwise returns an empty `LongStream`.
     * @example
     * ILongIterable longStream = LongStream.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongStream` if `longs` is non-null,
     * otherwise an empty `LongStream`
     */
    public static ILongIterable ofNullable(final Set<Long> longs) {
        return LongStream.ofNullable((Iterable<Long>) longs);
    }

    /**
     * @description Returns a `DoubleStream` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleStream`.
     * @example
     * IDoubleIterable doubleStream = Stream.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the set
     * @return the new `DoubleStream` if `doubles` is non-null,
     * otherwise an empty `DoubleStream`
     */
    public static IDoubleIterable ofNullable(final Set<Double> doubles) {
        return DoubleStream.ofNullable((Iterable<Double>) doubles);
    }

    /**
     * @description Returns an infinite `ObjectStream` where each element is
     * generated by `supplier`.
     * @param supplier the supplier of generated elements
     * @return the new `ObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IObjectIterable generate(final ISupplier supplier) {
        return ObjectStream.generate(supplier);
    }

    /**
     * @description Returns an infinite `SObjectStream` where each element is
     * generated by `supplier`.
     * @example
     * ISObjectIterable accStream = Stream.generate(SObjectSupplier.of(Account.SObjectType));
     * @param supplier the supplier of generated elements
     * @return the new `SObjectStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static ISObjectIterable generate(final ISObjectSupplier supplier) {
        return SObjectStream.generate(supplier);
    }

    /**
     * @description Returns an infinite `IntStream` where each element is
     * generated by `supplier`.
     * @example 
     * IIntIterable fibonacciInfiniteStream = Stream.generate(IntSupplier.fibonacci());
     * @param supplier the supplier of generated elements
     * @return the new `IntStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IIntIterable generate(final IIntSupplier supplier) {
        return IntStream.generate(supplier);
    }

    /**
     * @description Returns an infinite `LongStream` where each element is
     * generated by `supplier`.
     * @example 
     * ILongIterable fibonacciInfiniteStream = Stream.generate(LongSupplier.fibonacci());
     * @param supplier the supplier of generated elements
     * @return the new `LongStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static ILongIterable generate(final ILongSupplier supplier) {
        return LongStream.generate(supplier);
    }

    /**
     * @description Returns an infinite `DoubleStream` where each element is
     * generated by `supplier`.
     * @example 
     * IDoubleIterable randomStream = Stream.generate(DoubleSupplier.random());
     * @param supplier the supplier of generated elements
     * @return the new `DoubleStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IDoubleIterable generate(final IDoubleSupplier supplier) {
        return DoubleStream.generate(supplier);
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
        return ObjectStream.iterate(seed, operator);
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
        return SObjectStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `IntStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `IntStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     * @example 
     * IIntIterable intIncrementalStream = Stream.iterate(0, IntUnaryOperator.add(1));
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `IntStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IIntIterable iterate(final Integer seed, final IIntUnaryOperator operator) {
        return IntStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `LongStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `LongStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     * @example 
     * ILongIterable longIncrementalStream = Stream.iterate(0L, LongUnaryOperator.add(1L));
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `LongStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static ILongIterable iterate(final Long seed, final ILongUnaryOperator operator) {
        return LongStream.iterate(seed, operator);
    }

    /**
     * @description Returns an infinite `DoubleStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `DoubleStream` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     * @example 
     * IDoubleIterable doubleIncrementalStream = Stream.iterate(0, DoubleUnaryOperator.add(1));
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `DoubleStream`
     * @throws NullPointerException if `supplier` is null
     */
    public static IDoubleIterable iterate(final Double seed, final IDoubleUnaryOperator operator) {
        return DoubleStream.iterate(seed, operator);
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
        return ObjectStream.iterate(seed, predicate, operator);
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
        return SObjectStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `IntStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `IntStream`
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static IIntIterable iterate(
            final Integer seed,
            final IIntPredicate predicate,
            final IIntUnaryOperator operator
    ) {
        return IntStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `LongStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `LongStream`
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static ILongIterable iterate(
            final Long seed,
            final ILongPredicate predicate,
            final ILongUnaryOperator operator
    ) {
        return LongStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns an infinite `DoubleStream` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     * @return the new `DoubleStream`
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static IDoubleIterable iterate(
            final Double seed,
            final IDoublePredicate predicate,
            final IDoubleUnaryOperator operator
    ) {
        return DoubleStream.iterate(seed, predicate, operator);
    }

    /**
     * @description Returns lazily concatenated `ObjectStream` whose elements are all the
     * elements of the first `IObjectIterable` followed by all the elements of the
     * second `IObjectIterable`.
     * @example
     * IObjectIterable peopleStream = Stream.concat(stream1, stream2);
     * @param iterable1 the first `IObjectIterable`
     * @param iterable2 the second `IObjectIterable`
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IObjectIterable concat(final IObjectIterable iterable1, final IObjectIterable iterable2) {
        return ObjectStream.concat(iterable1, iterable2);
    }

    /**
     * @description Returns lazily concatenated `SObjectStream` whose elements are all the
     * elements of the first `ISObjectIterable` followed by all the elements of the
     * second `ISObjectIterable`.
     * @example
     * ISObjectIterable accStream = Stream.concat(stream1, stream2);
     * @param iterable1 the first `ISObjectIterable`
     * @param iterable2 the second `ISObjectIterable`
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ISObjectIterable concat(final ISObjectIterable iterable1, final ISObjectIterable iterable2) {
        return SObjectStream.concat(iterable1, iterable2);
    }

    /**
     * @description Returns lazily concatenated `IntStream` whose elements are all the
     * elements of the first `IIntIterable` followed by all the elements of the
     * second `IIntIterable`.
     * @example
     * IIntIterable intStream = Stream.concat(stream1, stream2);
     * @param iterable1 the first `IIntIterable`
     * @param iterable2 the second `IIntIterable`
     * @return the new `IntStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IIntIterable concat(final IIntIterable iterable1, final IIntIterable iterable2) {
        return IntStream.concat(iterable1, iterable2);
    }

    /**
     * @description Returns lazily concatenated `LongStream` whose elements are all the
     * elements of the first `ILongIterable` followed by all the elements of the
     * second `ILongIterable`.
     * @example
     * ILongIterable longStream = Stream.concat(stream1, stream2);
     * @param iterable1 the first `ILongIterable`
     * @param iterable2 the second `ILongIterable`
     * @return the new `LongStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ILongIterable concat(final ILongIterable iterable1, final ILongIterable iterable2) {
        return LongStream.concat(iterable1, iterable2);
    }

    /**
     * @description Returns lazily concatenated `DoubleStream` whose elements are all the
     * elements of the first `IDoubleIterable` followed by all the elements of the
     * second `IDoubleIterable`.
     * @example
     * IDoubleIterable doubleStream = Stream.concat(stream1, stream2);
     * @param iterable1 the first `IDoubleIterable`
     * @param iterable2 the second `IDoubleIterable`
     * @return the new `DoubleStream`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IDoubleIterable concat(final IDoubleIterable iterable1, final IDoubleIterable iterable2) {
        return DoubleStream.concat(iterable1, iterable2);
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Object>>`.
     * @example
     * IObjectIterable peopleStream = Stream.concat(streams);
     * @param iterables the list of `Iterable<Object>`
     * @return the new `ObjectStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IObjectIterable concat(final List<Iterable<Object>> iterables) {
        return ObjectStream.concat(iterables);
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<SObject>>`.
     * @example
     * ISObjectIterable accStream = Stream.concat(streams);
     * @param iterables the list of `Iterable<SObject>`
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static ISObjectIterable concat(final List<Iterable<SObject>> iterables) {
        return SObjectStream.concat(iterables);
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Integer>>`.
     * @example
     * IIntIterable intStream = Stream.concat(streams);
     * @param iterables the list of `Iterable<Integer>`
     * @return the new `IntStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IIntIterable concat(final List<Iterable<Integer>> iterables) {
        return IntStream.concat(iterables);
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Long>>`.
     * @example
     * ILongIterable longStream = Stream.concat(streams);
     * @param iterables the list of `Iterable<Long>`
     * @return the new `LongStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static ILongIterable concat(final List<Iterable<Long>> iterables) {
        return LongStream.concat(iterables);
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<Double>>`.
     * @example
     * IDoubleIterable doubleStream = Stream.concat(streams);
     * @param iterables the list of `Iterable<Double>`
     * @return the new `DoubleStream`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IDoubleIterable concat(final List<Iterable<Double>> iterables) {
        return DoubleStream.concat(iterables);
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
        return ObjectStream.zip(iterable1, iterable2, combiner);
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
        return ObjectStream.zip(iterable1, iterable2, predicate, combiner);
    }

    /**
     * @description Returns a combined `IntStream` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `IntStream`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IIntIterable zip(
            final Iterable<Integer> iterable1,
            final Iterable<Integer> iterable2,
            final IIntBinaryOperator combiner
    ) {
        return IntStream.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `LongStream` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `LongStream`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ILongIterable zip(
            final Iterable<Long> iterable1,
            final Iterable<Long> iterable2,
            final ILongBinaryOperator combiner
    ) {
        return LongStream.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `DoubleStream` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `DoubleStream`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IDoubleIterable zip(
            final Iterable<Double> iterable1,
            final Iterable<Double> iterable2,
            final IDoubleBinaryOperator combiner
    ) {
        return DoubleStream.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position.
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueStream = Stream.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * ISObjectIterable accountsWithMinAnnualRevenueStream = Stream.zip(
     *     Stream.of(Trigger.old),
     *     Stream.of(Trigger.new),
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ISObjectIterable zip(
            final Iterable<SObject> iterable1,
            final Iterable<SObject> iterable2,
            final ISObjectBinaryOperator combiner
    ) {
        return SObjectStream.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueStream = Stream.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     * ISObjectIterable newAccountsWithChangedAnnualRevenueStream = Stream.zip(
     *     Stream.of(Trigger.old),
     *     Stream.of(Trigger.new),
     *     SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectStream`
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     */
    public static ISObjectIterable zip(
            final Iterable<SObject> iterable1,
            final Iterable<SObject> iterable2,
            final ISObjectBiPredicate predicate,
            final ISObjectBinaryOperator combiner
    ) {
        return SObjectStream.zip(iterable1, iterable2, predicate, combiner);
    }

}
