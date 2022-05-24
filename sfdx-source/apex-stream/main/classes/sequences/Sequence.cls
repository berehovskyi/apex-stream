/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description An entry point that returns a sequence of a certain type,
 * depending on the type of the parameter.
 * @see ObjectSequence
 * @see SObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 */
public virtual inherited sharing class Sequence {

    /**
     * @description Returns a `ObjectSequence` created from `List<Object>`.
     * @example
     * IObjectIterable peopleSeq = Sequence.of(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterable` is null
     */
    public static IObjectIterable of(final List<Object> objects) {
        return ObjectSequence.of(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects`.
     * @example
     * ISObjectIterable accSeq = Sequence.of(new List<Account>(accounts));
     * @param sObjects the list
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final List<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers`.
     * @example
     * IIntIterable intSeq = Sequence.of(new List<Integer>{ 0, 5, 1, -10 });
     * @param integers the list
     * @return the new `IntSequence`
     * @throws NullPointerException if `integers` is null
     */
    public static IIntIterable of(final List<Integer> integers) {
        return IntSequence.of(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs`.
     * @example
     * ILongIterable longSeq = Sequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterator` is null
     */
    public static ILongIterable of(final List<Long> longs) {
        return LongSequence.of(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the list
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final List<Double> doubles) {
        return DoubleSequence.of(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `Set<Object>`.
     * @example
     * IObjectIterable peopleSeq = Sequence.of(new Set<Person>(people));
     * @param objects the set
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `objects` is null
     */
    public static IObjectIterable of(final Set<Object> objects) {
        return ObjectSequence.of(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects`.
     * @example
     * ISObjectIterable accSeq = Sequence.of(new Set<SObject>(accounts));
     * @param sObjects the set
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `sObjects` is null
     */
    public static ISObjectIterable of(final Set<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers`.
     * @example
     * IIntIterable intSeq = Sequence.of(new Set<Integer>{ 0, 5, 1, -10 });
     * @param integers the set
     * @return the new `IntSequence`
     * @throws NullPointerException if `integers` is null
     */
    public static IIntIterable of(final Set<Integer> integers) {
        return IntSequence.of(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs`.
     * @example
     * ILongIterable longSeq = Sequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the set
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterator` is null
     */
    public static ILongIterable of(final Set<Long> longs) {
        return LongSequence.of(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the set
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `doubles` is null
     */
    public static IDoubleIterable of(final Set<Double> doubles) {
        return DoubleSequence.of(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` if non-null,
     * otherwise returns an empty `ObjectSequence`.
     * @example
     * IObjectIterable peopleSeq = Sequence.ofNullable(new List<Person>(people));
     * @param objects the list
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     */
    public static IObjectIterable ofNullable(final List<Object> objects) {
        return ObjectSequence.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectSequence`.
     * @example
     * ISObjectIterable accSeq = Sequence.ofNullable(new List<Account>(accounts));
     * @param sObjects the list
     * @return the new `SObjectSequence` if `iterable` is non-null,
     * otherwise an empty `SObjectSequence`
     */
    public static ISObjectIterable ofNullable(final List<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` if non-null,
     * otherwise returns an empty `IntSequence`.
     * @example
     * IIntIterable intSeq = Sequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     * @param integers the list
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     */
    public static IIntIterable ofNullable(final List<Integer> integers) {
        return IntSequence.ofNullable(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` if non-null,
     * otherwise returns an empty `LongSequence`.
     * @example
     * ILongIterable longSeq = Sequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     */
    public static ILongIterable ofNullable(final List<Long> longs) {
        return LongSequence.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleSequence`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the list
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     */
    public static IDoubleIterable ofNullable(final List<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` if non-null,
     * otherwise returns an empty `ObjectSequence`.
     * @example
     * IObjectIterable peopleSeq = Sequence.ofNullable(new Set<Object>(people));
     * @param objects the set
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     */
    public static IObjectIterable ofNullable(final Set<Object> objects) {
        return ObjectSequence.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectSequence`.
     * @example
     * ISObjectIterable accSeq = Sequence.ofNullable(new Set<SObject>(accounts));
     * @param sObjects the set
     * @return the new `SObjectSequence` if `iterable` is non-null,
     * otherwise an empty `SObjectSequence`
     */
    public static ISObjectIterable ofNullable(final Set<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` if non-null,
     * otherwise returns an empty `IntSequence`.
     * @example
     * IIntIterable intSeq = Sequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     * @param integers the set
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     */
    public static IIntIterable ofNullable(final Set<Integer> integers) {
        return IntSequence.ofNullable(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` if non-null,
     * otherwise returns an empty `LongSequence`.
     * @example
     * ILongIterable longSeq = Sequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     * @param longs the list
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     */
    public static ILongIterable ofNullable(final Set<Long> longs) {
        return LongSequence.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleSequence`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     * @param doubles the set
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     */
    public static IDoubleIterable ofNullable(final Set<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
    }

    /**
     * @description Returns eagerly concatenated `ObjectSequence` whose elements are all the
     * elements of the first `IObjectIterable` followed by all the elements of the
     * second `IObjectIterable`.
     * @example
     * IObjectIterable peopleSeq = Sequence.concat(stream1, stream2);
     * @param iterable1 the first `IObjectIterable`
     * @param iterable2 the second `IObjectIterable`
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IObjectIterable concat(final IObjectIterable iterable1, final IObjectIterable iterable2) {
        return ObjectSequence.concat(iterable1, iterable2);
    }

    /**
     * @description Returns eagerly concatenated `SObjectSequence` whose elements are all the
     * elements of the first `Iterable<SObject>` followed by all the elements of the
     * second `Iterable<SObject>`.
     * @example
     * ISObjectIterable accSeq = Sequence.concat(stream1, stream2);
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ISObjectIterable concat(final Iterable<SObject> iterable1, final Iterable<SObject> iterable2) {
        return SObjectSequence.concat(iterable1, iterable2);
    }

    /**
     * @description Returns eagerly concatenated `IntSequence` whose elements are all the
     * elements of the first `IIntIterable` followed by all the elements of the
     * second `IIntIterable`.
     * @example
     * IIntIterable intSeq = Sequence.concat(stream1, stream2);
     * @param iterable1 the first `IIntIterable`
     * @param iterable2 the second `IIntIterable`
     * @return the new `IntSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IIntIterable concat(final IIntIterable iterable1, final IIntIterable iterable2) {
        return IntSequence.concat(iterable1, iterable2);
    }

    /**
     * @description Returns eagerly concatenated `LongSequence` whose elements are all the
     * elements of the first `ILongIterable` followed by all the elements of the
     * second `ILongIterable`.
     * @example
     * ILongIterable longSeq = Sequence.concat(stream1, stream2);
     * @param iterable1 the first `ILongIterable`
     * @param iterable2 the second `ILongIterable`
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static ILongIterable concat(final ILongIterable iterable1, final ILongIterable iterable2) {
        return LongSequence.concat(iterable1, iterable2);
    }

    /**
     * @description Returns eagerly concatenated `DoubleSequence` whose elements are all the
     * elements of the first `IDoubleIterable` followed by all the elements of the
     * second `IDoubleIterable`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.concat(stream1, stream2);
     * @param iterable1 the first `IDoubleIterable`
     * @param iterable2 the second `IDoubleIterable`
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     */
    public static IDoubleIterable concat(final IDoubleIterable iterable1, final IDoubleIterable iterable2) {
        return DoubleSequence.concat(iterable1, iterable2);
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Object>>`.
     * @example
     * IObjectIterable peopleSeq = Sequence.concat(streams);
     * @param iterables the list of `Iterable<Object>`
     * @return the new `ObjectSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IObjectIterable concat(final List<Iterable<Object>> iterables) {
        return ObjectSequence.concat(iterables);
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<SObject>>`.
     * @example
     * ISObjectIterable accSeq = Sequence.concat(streams);
     * @param iterables the list of `Iterable<SObject>`
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static ISObjectIterable concat(final List<Iterable<SObject>> iterables) {
        return SObjectSequence.concat(iterables);
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Integer>>`.
     * @example
     * IIntIterable intSeq = Sequence.concat(streams);
     * @param iterables the list of `Iterable<Integer>`
     * @return the new `IntSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IIntIterable concat(final List<Iterable<Integer>> iterables) {
        return IntSequence.concat(iterables);
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Long>>`.
     * @example
     * ILongIterable longSeq = Sequence.concat(streams);
     * @param iterables the list of `Iterable<Long>`
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static ILongIterable concat(final List<Iterable<Long>> iterables) {
        return LongSequence.concat(iterables);
    }

    /**
     * @description Returns eagerly concatenates `List<Iterable<Double>>`.
     * @example
     * IDoubleIterable doubleSeq = Sequence.concat(streams);
     * @param iterables the list of `Iterable<Double>`
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterables` or some element in a list is null
     */
    public static IDoubleIterable concat(final List<Iterable<Double>> iterables) {
        return DoubleSequence.concat(iterables);
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
        return ObjectSequence.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `SObjectSequence` by applying `combiner` function
     * to each element at the same position.
     * @example
     * ISObjectIterable accountsWithMinAnnualRevenueSeq = Sequence.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * ISObjectIterable accountsWithMinAnnualRevenueSeq = Sequence.zip(
     *     Sequence.of(Trigger.old),
     *     Sequence.of(Trigger.new),
     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
     * );
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `SObjectSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ISObjectIterable zip(
            final Iterable<SObject> iterable1,
            final Iterable<SObject> iterable2,
            final ISObjectBinaryOperator combiner
    ) {
        return SObjectSequence.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `IntSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Integer>`
     * @param iterable2 the second `Iterable<Integer>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `IntSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IIntIterable zip(
            final Iterable<Integer> iterable1,
            final Iterable<Integer> iterable2,
            final IIntBinaryOperator combiner
    ) {
        return IntSequence.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `LongSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Long>`
     * @param iterable2 the second `Iterable<Long>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `LongSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static ILongIterable zip(
            final Iterable<Long> iterable1,
            final Iterable<Long> iterable2,
            final ILongBinaryOperator combiner
    ) {
        return LongSequence.zip(iterable1, iterable2, combiner);
    }

    /**
     * @description Returns a combined `DoubleSequence` by applying `combiner` function
     * to each element at the same position.
     * @param iterable1 the first `Iterable<Double>`
     * @param iterable2 the second `Iterable<Double>`
     * @param combiner the binary operator to be applied to each element at the same position
     * @return the new `DoubleSequence`
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     */
    public static IDoubleIterable zip(
            final Iterable<Double> iterable1,
            final Iterable<Double> iterable2,
            final IDoubleBinaryOperator combiner
    ) {
        return DoubleSequence.zip(iterable1, iterable2, combiner);
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
        return ObjectSequence.zip(iterable1, iterable2, predicate, combiner);
    }

    /**
     * @description Returns a combined `SObjectStream` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     * @example
     * ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = Sequence.zip(
     *     Trigger.old,
     *     Trigger.new,
     *     SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
     *     SObjectBinaryOperator.right()
     * );
     * ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = Sequence.zip(
     *     Sequence.of(Trigger.old),
     *     Sequence.of(Trigger.new),
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
        return SObjectSequence.zip(iterable1, iterable2, predicate, combiner);
    }

}
