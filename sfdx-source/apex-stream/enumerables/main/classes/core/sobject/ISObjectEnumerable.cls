/**
 * @description A sequence of `SObject` elements supporting aggregate operations.
 *
 * @see IObjectEnumerable
 * @see IIntEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface ISObjectEnumerable extends IEnumerable<SObject> {

    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<SObject> iterator();
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable, String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable, String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable, String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable distinct(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable distinct(SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable filter(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable filter(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable take(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable take(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable drop(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable drop(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the parent reference field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable mapTo(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the parent reference field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable mapTo(SObjectField field);

    /**
     * @description Returns a new `IIntEnumerable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapToInt(IFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IIntIterable`
     */
    IIntEnumerable mapToInt(String fieldName);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IIntIterable`
     */
    IIntEnumerable mapToInt(SObjectField field);

    /**
     * @description Returns a new `ILongEnumerable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(IFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ILongIterable`
     */
    ILongEnumerable mapToLong(String fieldName);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ILongIterable`
     */
    ILongEnumerable mapToLong(SObjectField field);

    /**
     * @description Returns a new `IDoubleEnumerable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(IFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IDoubleIterable`
     */
    IDoubleEnumerable mapToDouble(String fieldName);

    /**
     * @description Returns a new `ILongIterable` with `Double` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IDoubleIterable`
     */
    IDoubleEnumerable mapToDouble(SObjectField field);

    /**
     * @description Returns a new `IObjectEnumerable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapToObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IObjectIterable`
     */
    IObjectEnumerable mapToObject(String fieldName);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IObjectIterable`
     */
    IObjectEnumerable mapToObject(SObjectField field);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the child relationship field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable flatMapTo(String fieldName);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to `childRelationshipField`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the child relationship field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable flatMapTo(SObjectField field);

    /**
     * @description Returns a new `IIntEnumerable` with `Integer` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable flatMapToInt(IFunction mapper);

    /**
     * @description Returns a new `ILongEnumerable` with `Long` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable flatMapToLong(IFunction mapper);

    /**
     * @description Returns a new `IDoubleEnumerable` with `Double` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable flatMapToDouble(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `IObjectIterable`
     */
    IObjectEnumerable flatMapToObject(IFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `fieldName`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable forEach(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `field`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable forEach(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable sort(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `fieldName` values considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param order the sort order
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable sort(String fieldName, SortOrder order);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable sort(SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `field` values considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param order the sort order
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable sort(SObjectField field, SortOrder order);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `SObject` result of the reduction
     */
    SObject reduce(SObject identity, IBiOperator accumulator);
    
    /**
     * @description Returns an `Optional` describing the first element
     * which has `value` of `fieldName`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return the `Optional`
     */
    Optional find(String fieldName, Object value);

    /**
     * @description Returns an `Optional` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return the `Optional`
     */
    Optional find(SObjectField field, Object value);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean every(String fieldName, Object value);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean every(SObjectField field, Object value);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean some(String fieldName, Object value);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean some(SObjectField field, Object value);

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean none(String fieldName, Object value);

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     */
    Boolean none(SObjectField field, Object value);

    /**
     * @description Returns an `Optional` describing the maximum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Optional` describing the result
     */
    Optional max(String fieldName);

    /**
     * @description Returns an `Optional` describing the maximum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Optional` describing the result
     */
    Optional max(SObjectField field);

    /**
     * @description Returns an `Optional` describing the minimum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Optional` describing the result
     */
    Optional min(String fieldName);

    /**
     * @description Returns an `Optional` describing the minimum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Optional` describing the result
     */
    Optional min(SObjectField field);

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field to sum values
     *
     * @return the sum of field values
     */
    Double sum(String fieldName);

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum values
     *
     * @return field sum of field values
     */
    Double sum(SObjectField field);

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field to sum values
     *
     * @return the arithmetic mean of field values
     */
    Optional avg(String fieldName);

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum values
     *
     * @return field arithmetic mean of field values
     */
    Optional avg(SObjectField field);

    /**
     * @description Accumulates elements returned by `mapper` into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(IFunction mapper);

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(String fieldName);

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(SObjectField field);

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `elementType`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     * @param elementType result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `elementType`
     */
    List<Object> toList(IFunction mapper, Type elementType);

    /**
     * @description Accumulates `Object` elements into a `List<?>` of specific `listType`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param listType result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `listType`
     */
    List<Object> toList(String fieldName, Type listType);

    /**
     * @description Accumulates `Object` elements into a `List<?>` of specific `listType`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param listType result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `listType`
     */
    List<Object> toList(SObjectField field, Type listType);

    /**
     * @description Accumulates `Object` elements returned by `mapper` into a `Set<?>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<?>` containing the collected elements
     */
    Object toSet(IFunction mapper);

    /**
     * @description Accumulates `Object` elements into a `Set<?>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<?>` containing the collected elements
     */
    Object toSet(String fieldName);

    /**
     * @description Accumulates `Object` elements into a `Set<?>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<?>` containing the collected elements
     */
    Object toSet(SObjectField field);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet();

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(IFunction mapper);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(String fieldName);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(SObjectField field);

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(IFunction mapper);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(String fieldName);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<String>`containing the collected elements
     */
    Set<String> toStringSet(SObjectField field);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Map<Id, SObject>` containing the iterable elements
     */
    Map<Id, SObject> toMap();

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<Id, SObject> toByIdMap(IFunction keyMapper, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param mapType result type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<Id, SObject> toByIdMap(String fieldName, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param mapType result type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<Id, SObject> toByIdMap(SObjectField field, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<String, SObject> toByStringMap(IFunction keyMapper, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param mapType result type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<String, SObject> toByStringMap(String fieldName, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param mapType result type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`
     */
    Map<String, SObject> toByStringMap(SObjectField field, Type mapType);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the iterable elements
     */
    Map<Id, List<SObject>> groupById(IFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<Id, List<SObject>>` containing the collected elements
     */
    Map<Id, List<SObject>> groupById(String fieldName);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<Id, List<SObject>>` containing the grouped elements
     */
    Map<Id, List<SObject>> groupById(SObjectField field);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(IFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(String fieldName);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(SObjectField field);

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(IPredicate predicate);

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(String fieldName, Object value);

    /**
     * @description Partition `SObject` elements by `field` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(SObjectField field, Object value);
    //</editor-fold>

}
