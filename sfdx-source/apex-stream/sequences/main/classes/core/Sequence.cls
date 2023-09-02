/**
 * @description An entry point that returns a sequence of a certain type,
 * depending on the type of the parameter.
 *
 * @see ObjectSequence
 * @see SObjectSequence
 * @see IntSequence
 * @see LongSequence
 * @see DoubleSequence
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public inherited sharing class Sequence {

    @TestVisible
    private Sequence() {}

    /**
     * @description Returns a `ObjectSequence` created from `List<Object>`.
     *
     * @param objects the list
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * IObjectEnumerable peopleSeq = Sequence.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final List<Object> objects) {
        return ObjectSequence.of(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects`.
     *
     * @param sObjects the list
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * ISObjectEnumerable accSeq = Sequence.of(new List<Account>(accounts));
     */
    public static SObjectEnumerable of(final List<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers`.
     *
     * @param integers the list
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IIntEnumerable intSeq = Sequence.of(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final List<Integer> integers) {
        return IntSequence.of(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs`.
     *
     * @param longs the list
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * ILongEnumerable longSeq = Sequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final List<Long> longs) {
        return LongSequence.of(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles`.
     *
     * @param doubles the list
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * IDoubleEnumerable doubleSeq = Sequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final List<Double> doubles) {
        return DoubleSequence.of(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `Set<Object>`.
     *
     * @param objects the set
     *
     * @return the new `ObjectSequence`
     *
     * @throws NullPointerException if `objects` is null
     *
     * @example
     * IObjectEnumerable peopleSeq = Sequence.of(new Set<Person>(people));
     */
    public static ObjectEnumerable of(final Set<Object> objects) {
        return ObjectSequence.of(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects`.
     *
     * @param sObjects the set
     *
     * @return the new `SObjectSequence`
     *
     * @throws NullPointerException if `sObjects` is null
     *
     * @example
     * ISObjectEnumerable accSeq = Sequence.of(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable of(final Set<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers`.
     *
     * @param integers the set
     *
     * @return the new `IntSequence`
     *
     * @throws NullPointerException if `integers` is null
     *
     * @example
     * IIntEnumerable intSeq = Sequence.of(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final Set<Integer> integers) {
        return IntSequence.of(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs`.
     *
     * @param longs the set
     *
     * @return the new `LongSequence`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * ILongEnumerable longSeq = Sequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final Set<Long> longs) {
        return LongSequence.of(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles`.
     *
     * @param doubles the set
     *
     * @return the new `DoubleSequence`
     *
     * @throws NullPointerException if `doubles` is null
     *
     * @example
     * IDoubleEnumerable doubleSeq = Sequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Set<Double> doubles) {
        return DoubleSequence.of(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` if non-null,
     * otherwise returns an empty `ObjectSequence`.
     *
     * @param objects the list
     *
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     *
     * @example
     * IObjectEnumerable peopleSeq = Sequence.ofNullable(new List<Person>(people));
     */
    public static ObjectEnumerable ofNullable(final List<Object> objects) {
        return ObjectSequence.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectSequence`.
     *
     * @param sObjects the list
     *
     * @return the new `SObjectSequence` if `iterable` is non-null,
     * otherwise an empty `SObjectSequence`
     *
     * @example
     * ISObjectEnumerable accSeq = Sequence.ofNullable(new List<Account>(accounts));
     */
    public static SObjectEnumerable ofNullable(final List<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` if non-null,
     * otherwise returns an empty `IntSequence`.
     *
     * @param integers the list
     *
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     *
     * @example
     * IIntEnumerable intSeq = Sequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final List<Integer> integers) {
        return IntSequence.ofNullable(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` if non-null,
     * otherwise returns an empty `LongSequence`.
     *
     * @param longs the list
     *
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     *
     * @example
     * ILongEnumerable longSeq = Sequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final List<Long> longs) {
        return LongSequence.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleSequence`.
     *
     * @param doubles the list
     *
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     *
     * @example
     * IDoubleEnumerable doubleSeq = Sequence.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final List<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
    }

    /**
     * @description Returns a `ObjectSequence` created from `objects` if non-null,
     * otherwise returns an empty `ObjectSequence`.
     *
     * @param objects the set
     *
     * @return the new `ObjectSequence` if `objects` is non-null,
     * otherwise an empty `ObjectSequence`
     *
     * @example
     * IObjectEnumerable peopleSeq = Sequence.ofNullable(new Set<Object>(people));
     */
    public static ObjectEnumerable ofNullable(final Set<Object> objects) {
        return ObjectSequence.ofNullable(objects);
    }

    /**
     * @description Returns a `SObjectSequence` created from `sObjects` if non-null,
     * otherwise returns an empty `SObjectSequence`.
     *
     * @param sObjects the set
     *
     * @return the new `SObjectSequence` if `iterable` is non-null,
     * otherwise an empty `SObjectSequence`
     *
     * @example
     * ISObjectEnumerable accSeq = Sequence.ofNullable(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable ofNullable(final Set<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
    }

    /**
     * @description Returns a `IntSequence` created from `integers` if non-null,
     * otherwise returns an empty `IntSequence`.
     *
     * @param integers the set
     *
     * @return the new `IntSequence` if `integers` is non-null,
     * otherwise an empty `IntSequence`
     *
     * @example
     * IIntEnumerable intSeq = Sequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final Set<Integer> integers) {
        return IntSequence.ofNullable(integers);
    }

    /**
     * @description Returns a `LongSequence` created from `longs` if non-null,
     * otherwise returns an empty `LongSequence`.
     *
     * @param longs the list
     *
     * @return the new `LongSequence` if `longs` is non-null,
     * otherwise an empty `LongSequence`
     *
     * @example
     * ILongEnumerable longSeq = Sequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final Set<Long> longs) {
        return LongSequence.ofNullable(longs);
    }

    /**
     * @description Returns a `DoubleSequence` created from `doubles` if non-null,
     * otherwise returns an empty `DoubleSequence`.
     *
     * @param doubles the set
     *
     * @return the new `DoubleSequence` if `doubles` is non-null,
     * otherwise an empty `DoubleSequence`
     *
     * @example
     * IDoubleEnumerable doubleSeq = Sequence.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final Set<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
    }

//    /**
//     * @description Returns eagerly concatenated `ObjectSequence` whose elements are all the
//     * elements of the first `IObjectEnumerable` followed by all the elements of the
//     * second `IObjectEnumerable`.
//     *
//     * @param iterable1 the first `IObjectEnumerable`
//     * @param iterable2 the second `IObjectEnumerable`
//     *
//     * @return the new `ObjectSequence`
//     *
//     * @throws NullPointerException if `iterable1` or `iterable2` is null
//     *
//     * @example
//     * IObjectEnumerable peopleSeq = Sequence.concat(stream1, stream2);
//     */
//    public static IObjectEnumerable concat(final IObjectEnumerable iterable1, final IObjectEnumerable iterable2) {
//        return ObjectSequence.concat(iterable1, iterable2);
//    }
//
//    /**
//     * @description Returns eagerly concatenated `SObjectSequence` whose elements are all the
//     * elements of the first `ISObjectEnumerable` followed by all the elements of the
//     * second `ISObjectEnumerable`.
//     *
//     * @param iterable1 the first `ISObjectEnumerable`
//     * @param iterable2 the second `ISObjectEnumerable`
//     *
//     * @return the new `SObjectSequence`
//     *
//     * @throws NullPointerException if `iterable1` or `iterable2` is null
//     *
//     * @example
//     * ISObjectEnumerable accSeq = Sequence.concat(stream1, stream2);
//     */
//    public static ISObjectEnumerable concat(final ISObjectEnumerable iterable1, final ISObjectEnumerable iterable2) {
//        return SObjectSequence.concat(iterable1, iterable2);
//    }
//
//    /**
//     * @description Returns eagerly concatenated `IntSequence` whose elements are all the
//     * elements of the first `IIntEnumerable` followed by all the elements of the
//     * second `IIntEnumerable`.
//     *
//     * @param iterable1 the first `IIntEnumerable`
//     * @param iterable2 the second `IIntEnumerable`
//     *
//     * @return the new `IntSequence`
//     *
//     * @throws NullPointerException if `iterable1` or `iterable2` is null
//     *
//     * @example
//     * IIntEnumerable intSeq = Sequence.concat(stream1, stream2);
//     */
//    public static IIntEnumerable concat(final IIntEnumerable iterable1, final IIntEnumerable iterable2) {
//        return IntSequence.concat(iterable1, iterable2);
//    }
//
//    /**
//     * @description Returns eagerly concatenated `LongSequence` whose elements are all the
//     * elements of the first `ILongEnumerable` followed by all the elements of the
//     * second `ILongEnumerable`.
//     *
//     * @param iterable1 the first `ILongEnumerable`
//     * @param iterable2 the second `ILongEnumerable`
//     *
//     * @return the new `LongSequence`
//     *
//     * @throws NullPointerException if `iterable1` or `iterable2` is null
//     *
//     * @example
//     * ILongEnumerable longSeq = Sequence.concat(stream1, stream2);
//     */
//    public static ILongEnumerable concat(final ILongEnumerable iterable1, final ILongEnumerable iterable2) {
//        return LongSequence.concat(iterable1, iterable2);
//    }
//
//    /**
//     * @description Returns eagerly concatenated `DoubleSequence` whose elements are all the
//     * elements of the first `IDoubleEnumerable` followed by all the elements of the
//     * second `IDoubleEnumerable`.
//     *
//     * @param iterable1 the first `IDoubleEnumerable`
//     * @param iterable2 the second `IDoubleEnumerable`
//     *
//     * @return the new `DoubleSequence`
//     *
//     * @throws NullPointerException if `iterable1` or `iterable2` is null
//     *
//     * @example
//     * IDoubleEnumerable doubleSeq = Sequence.concat(stream1, stream2);
//     */
//    public static IDoubleEnumerable concat(final IDoubleEnumerable iterable1, final IDoubleEnumerable iterable2) {
//        return DoubleSequence.concat(iterable1, iterable2);
//    }
//
//    /**
//     * @description Returns eagerly concatenates `List<Iterable<Object>>`.
//     *
//     * @param iterables the list of `Iterable<Object>`
//     *
//     * @return the new `ObjectSequence`
//     *
//     * @throws NullPointerException if `iterables` or some element in a list is null
//     *
//     * @example
//     * IObjectEnumerable peopleSeq = Sequence.concat(streams);
//     */
//    public static IObjectEnumerable concat(final List<Iterable<Object>> iterables) {
//        return ObjectSequence.concat(iterables);
//    }
//
//    /**
//     * @description Returns eagerly concatenates `List<Iterable<SObject>>`.
//     *
//     * @param iterables the list of `Iterable<SObject>`
//     *
//     * @return the new `SObjectSequence`
//     *
//     * @throws NullPointerException if `iterables` or some element in a list is null
//     *
//     * @example
//     * ISObjectEnumerable accSeq = Sequence.concat(streams);
//     */
//    public static ISObjectEnumerable concat(final List<Iterable<SObject>> iterables) {
//        return SObjectSequence.concat(iterables);
//    }
//
//    /**
//     * @description Returns eagerly concatenates `List<Iterable<Integer>>`.
//     *
//     * @param iterables the list of `Iterable<Integer>`
//     *
//     * @return the new `IntSequence`
//     *
//     * @throws NullPointerException if `iterables` or some element in a list is null
//     *
//     * @example
//     * IIntEnumerable intSeq = Sequence.concat(streams);
//     */
//    public static IIntEnumerable concat(final List<Iterable<Integer>> iterables) {
//        return IntSequence.concat(iterables);
//    }
//
//    /**
//     * @description Returns eagerly concatenates `List<Iterable<Long>>`.
//     *
//     * @param iterables the list of `Iterable<Long>`
//     *
//     * @return the new `LongSequence`
//     *
//     * @throws NullPointerException if `iterables` or some element in a list is null
//     *
//     * @example
//     * ILongEnumerable longSeq = Sequence.concat(streams);
//     */
//    public static ILongEnumerable concat(final List<Iterable<Long>> iterables) {
//        return LongSequence.concat(iterables);
//    }
//
//    /**
//     * @description Returns eagerly concatenates `List<Iterable<Double>>`.
//     *
//     * @param iterables the list of `Iterable<Double>`
//     *
//     * @return the new `DoubleSequence`
//     *
//     * @throws NullPointerException if `iterables` or some element in a list is null
//     *
//     * @example
//     * IDoubleEnumerable doubleSeq = Sequence.concat(streams);
//     */
//    public static IDoubleEnumerable concat(final List<Iterable<Double>> iterables) {
//        return DoubleSequence.concat(iterables);
//    }
//
//    /**
//     * @description Returns a combined `ObjectSequence` by applying `combiner` function
//     * to each element at the same position.
//     *
//     * @param iterable1 the first `Iterable<Object>`
//     * @param iterable2 the second `Iterable<Object>`
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `ObjectSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
//     */
//    public static IObjectEnumerable zip(
//            final Iterable<Object> iterable1,
//            final Iterable<Object> iterable2,
//            final IBiOperator combiner
//    ) {
//        return ObjectSequence.zip(iterable1, iterable2, combiner);
//    }
//
//    /**
//     * @description Returns a combined `SObjectSequence` by applying `combiner` function
//     * to each element at the same position.
//     *
//     * @param iterable1 the first `Iterable<SObject>`
//     * @param iterable2 the second `Iterable<SObject>`
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `SObjectSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
//     *
//     * @example
//     * ISObjectEnumerable accountsWithMinAnnualRevenueSeq = Sequence.zip(
//     *     Trigger.old,
//     *     Trigger.new,
//     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
//     * );
//     * ISObjectEnumerable accountsWithMinAnnualRevenueSeq = Sequence.zip(
//     *     Sequence.of(Trigger.old),
//     *     Sequence.of(Trigger.new),
//     *     SObjectBinaryOperator.minBy(Account.AnnualRevenue)
//     * );
//     */
//    public static ISObjectEnumerable zip(
//            final Iterable<SObject> iterable1,
//            final Iterable<SObject> iterable2,
//            final IBiOperator combiner
//    ) {
//        return SObjectSequence.zip(iterable1, iterable2, combiner);
//    }
//
//    /**
//     * @description Returns a combined `IntSequence` by applying `combiner` function
//     * to each element at the same position.
//     *
//     * @param iterable1 the first `Iterable<Integer>`
//     * @param iterable2 the second `Iterable<Integer>`
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `IntSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
//     */
//    public static IIntEnumerable zip(
//            final Iterable<Integer> iterable1,
//            final Iterable<Integer> iterable2,
//            final IBiOperator combiner
//    ) {
//        return IntSequence.zip(iterable1, iterable2, combiner);
//    }
//
//    /**
//     * @description Returns a combined `LongSequence` by applying `combiner` function
//     * to each element at the same position.
//     *
//     * @param iterable1 the first `Iterable<Long>`
//     * @param iterable2 the second `Iterable<Long>`
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `LongSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
//     */
//    public static ILongEnumerable zip(
//            final Iterable<Long> iterable1,
//            final Iterable<Long> iterable2,
//            final IBiOperator combiner
//    ) {
//        return LongSequence.zip(iterable1, iterable2, combiner);
//    }
//
//    /**
//     * @description Returns a combined `DoubleSequence` by applying `combiner` function
//     * to each element at the same position.
//     *
//     * @param iterable1 the first `Iterable<Double>`
//     * @param iterable2 the second `Iterable<Double>`
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `DoubleSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
//     */
//    public static IDoubleEnumerable zip(
//            final Iterable<Double> iterable1,
//            final Iterable<Double> iterable2,
//            final IBiOperator combiner
//    ) {
//        return DoubleSequence.zip(iterable1, iterable2, combiner);
//    }
//
//    /**
//     * @description Returns a combined `ObjectSequence` by applying `combiner` function
//     * to each element at the same position, conditioned on satisfying `predicate`.
//     *
//     * @param iterable1 the first `Iterable<Object>`
//     * @param iterable2 the second `Iterable<Object>`
//     * @param predicate the binary predicate
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `ObjectSequence`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2`,
//     * `predicate` or `combiner` is null
//     */
//    public static IObjectEnumerable zip(
//            final Iterable<Object> iterable1,
//            final Iterable<Object> iterable2,
//            final IBiPredicate predicate,
//            final IBiOperator combiner
//    ) {
//        return ObjectSequence.zip(iterable1, iterable2, predicate, combiner);
//    }
//
//    /**
//     * @description Returns a combined `SObjectStream` by applying `combiner` function
//     * to each element at the same position, conditioned on satisfying `predicate`.
//     *
//     * @param iterable1 the first `Iterable<SObject>`
//     * @param iterable2 the second `Iterable<SObject>`
//     * @param predicate the binary predicate
//     * @param combiner the binary operator to be applied to each element at the same position
//     *
//     * @return the new `SObjectStream`
//     *
//     * @throws NullPointerException if `iterable1`, `iterable2`,
//     * `predicate` or `combiner` is null
//     *
//     * @example
//     * ISObjectEnumerable newAccountsWithChangedAnnualRevenueSeq = Sequence.zip(
//     *     Trigger.old,
//     *     Trigger.new,
//     *     SObjectBiPredicates.areEqual(Account.AnnualRevenue).negate(),
//     *     SObjectBinaryOperator.right()
//     * );
//     * ISObjectEnumerable newAccountsWithChangedAnnualRevenueSeq = Sequence.zip(
//     *     Sequence.of(Trigger.old),
//     *     Sequence.of(Trigger.new),
//     *     SObjectBiPredicates.areEqual(Account.AnnualRevenue).negate(),
//     *     SObjectBinaryOperator.right()
//     * );
//     */
//    public static ISObjectEnumerable zip(
//            final Iterable<SObject> iterable1,
//            final Iterable<SObject> iterable2,
//            final IBiPredicate predicate,
//            final IBiOperator combiner
//    ) {
//        return SObjectSequence.zip(iterable1, iterable2, predicate, combiner);
//    }

}
