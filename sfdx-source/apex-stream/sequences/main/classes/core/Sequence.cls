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
 * @group Enumerables
 */
@SuppressWarnings('PMD.CognitiveComplexity')
public inherited sharing class Sequence {

    /**
     * @description Returns a `ObjectSequence` created from `List<Object>`.
     *
     * @param objects the list
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * ObjectEnumerable peopleSeq = Sequence.of(new List<Person>(people));
     */
    public static ObjectEnumerable of(final List<Object> objects) {
        return ObjectSequence.of(objects);
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
     * SObjectEnumerable accSeq = Sequence.of(new List<Account>(accounts));
     */
    public static SObjectEnumerable of(final List<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
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
     * IntEnumerable intSeq = Sequence.of(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final List<Integer> integers) {
        return IntSequence.of(integers);
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
     * LongEnumerable longSeq = Sequence.of(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final List<Long> longs) {
        return LongSequence.of(longs);
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
     * DoubleEnumerable doubleSeq = Sequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final List<Double> doubles) {
        return DoubleSequence.of(doubles);
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
     * ObjectEnumerable peopleSeq = Sequence.of(new Set<Person>(people));
     */
    public static ObjectEnumerable of(final Set<Object> objects) {
        return ObjectSequence.of(objects);
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
     * SObjectEnumerable accSeq = Sequence.of(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable of(final Set<SObject> sObjects) {
        return SObjectSequence.of(sObjects);
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
     * IntEnumerable intSeq = Sequence.of(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable of(final Set<Integer> integers) {
        return IntSequence.of(integers);
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
     * LongEnumerable longSeq = Sequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable of(final Set<Long> longs) {
        return LongSequence.of(longs);
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
     * DoubleEnumerable doubleSeq = Sequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable of(final Set<Double> doubles) {
        return DoubleSequence.of(doubles);
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
     * ObjectEnumerable peopleSeq = Sequence.ofNullable(new List<Person>(people));
     */
    public static ObjectEnumerable ofNullable(final List<Object> objects) {
        return ObjectSequence.ofNullable(objects);
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
     * SObjectEnumerable accSeq = Sequence.ofNullable(new List<Account>(accounts));
     */
    public static SObjectEnumerable ofNullable(final List<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
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
     * IntEnumerable intSeq = Sequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final List<Integer> integers) {
        return IntSequence.ofNullable(integers);
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
     * LongEnumerable longSeq = Sequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final List<Long> longs) {
        return LongSequence.ofNullable(longs);
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
     * DoubleEnumerable doubleSeq = Sequence.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final List<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
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
     * ObjectEnumerable peopleSeq = Sequence.ofNullable(new Set<Object>(people));
     */
    public static ObjectEnumerable ofNullable(final Set<Object> objects) {
        return ObjectSequence.ofNullable(objects);
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
     * SObjectEnumerable accSeq = Sequence.ofNullable(new Set<SObject>(accounts));
     */
    public static SObjectEnumerable ofNullable(final Set<SObject> sObjects) {
        return SObjectSequence.ofNullable(sObjects);
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
     * IntEnumerable intSeq = Sequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
     */
    public static IntEnumerable ofNullable(final Set<Integer> integers) {
        return IntSequence.ofNullable(integers);
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
     * LongEnumerable longSeq = Sequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
     */
    public static LongEnumerable ofNullable(final Set<Long> longs) {
        return LongSequence.ofNullable(longs);
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
     * DoubleEnumerable doubleSeq = Sequence.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
     */
    public static DoubleEnumerable ofNullable(final Set<Double> doubles) {
        return DoubleSequence.ofNullable(doubles);
    }

}
