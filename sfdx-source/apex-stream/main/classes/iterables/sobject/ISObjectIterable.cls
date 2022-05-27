/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `SObject` elements supporting aggregate operations.
 * @see IObjectIterable
 * @see IIntIterable
 * @see ILongIterable
 * @see IDoubleIterable
 */
public interface ISObjectIterable extends ISObjectBaseIterable {

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable filter(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable filter(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable take(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable take(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable drop(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable drop(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the parent reference field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapTo(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the parent reference field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapTo(SObjectField field);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(String fieldName);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(SObjectField field);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `ILongIterable`
     */
    ILongIterable mapToLong(String fieldName);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `ILongIterable`
     */
    ILongIterable mapToLong(SObjectField field);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapToDouble(String fieldName);

    /**
     * @description Returns a new `ILongIterable` with `Double` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapToDouble(SObjectField field);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapToObject(String fieldName);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapToObject(SObjectField field);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of 
     * replacing each element with the contents of a mapped iterable 
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the child relationship field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable flatMapTo(String fieldName);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of 
     * replacing each element with the contents of a mapped iterable 
     * according to `childRelationshipField`.
     * <p>Intermediate Operation.</p>
     * @param field the child relationship field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable flatMapTo(SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `fieldName`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable forEach(String fieldName, Object value);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `field`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable forEach(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable distinct(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable distinct(SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(SortOrder order);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(String fieldName);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `fieldName` values considering `order`.
     * <p>Intermediate Operation.</p>
     * @param fieldName the field
     * @param order the sort order
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(String fieldName, SortOrder order);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(SObjectField field);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `field` values considering `order`.
     * <p>Intermediate Operation.</p>
     * @param field the field
     * @param order the sort order
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(SObjectField field, SortOrder order);

    /**
     * @description Returns a new `ISObjectIterable` with first `lim` `SObject` elements.
     * <p>Intermediate Operation.</p>
     * @param lim the number of elements to limit
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable lim(Integer lim);

    /**
     * @description Returns a new `ISObjectIterable` that skips first `n` `SObject` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     * @param n the number of elements to skip
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Returns an `OptionalSObject` describing the first element
     * which has `value` of `fieldName`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param fieldName the field
     * @param value the field value
     * @return the `OptionalSObject`
     */
    OptionalSObject find(String fieldName, Object value);

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param field the field
     * @param value the field value
     * @return the `OptionalSObject`
     */
    OptionalSObject find(SObjectField field, Object value);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean every(String fieldName, Object value);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean every(SObjectField field, Object value);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean some(String fieldName, Object value);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean some(SObjectField field, Object value);

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean none(String fieldName, Object value);

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     */
    Boolean none(SObjectField field, Object value);

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject max(String fieldName);

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject max(SObjectField field);

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject min(String fieldName);

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject min(SObjectField field);

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field to sum values
     * @return the sum of field values
     */
    Double sum(String fieldName);

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field to sum values
     * @return field sum of field values
     */
    Double sum(SObjectField field);

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field to sum values
     * @return the arithmetic mean of field values
     */
    OptionalDouble avg(String fieldName);

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field to sum values
     * @return field arithmetic mean of field values
     */
    OptionalDouble avg(SObjectField field);

    /**
     * @description Accumulates elements returned by `mapper` into a `List<Object>`.
     * <p>Terminal Operation.</p>
     * @param mapper the mapping function
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(ISObjectFunction mapper);

    /**
     * @description Accumulates `Object` elements into a `List<Object>` 
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(String fieldName);

    /**
     * @description Accumulates `Object` elements into a `List<Object>` 
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(SObjectField field);

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * <p>Terminal Operation.</p>
     * @param mapper the mapping function
     * @param listType result type
     * @return the `List<Object>` containing the collected elements, which can be casted to `listType`
     */
    List<Object> toList(ISObjectFunction mapper, Type listType);

    /**
     * @description Accumulates `Object` elements into a `List<?>` of specific `listType`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @param listType result type
     * @return the `List<Object>` containing the collected elements, which can be casted to `listType`
     */
    List<Object> toList(String fieldName, Type listType);

    /**
     * @description Accumulates `Object` elements into a `List<?>` of specific `listType`
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @param listType result type
     * @return the `List<Object>` containing the collected elements, which can be casted to `listType`
     */
    List<Object> toList(SObjectField field, Type listType);

    /**
     * @description Accumulates `SObject` elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     * @return the `Set<SObject>` containing the collected elements
     */
    Set<SObject> toSet();

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet();

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     * @param mapper the mapping function
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(ISObjectFunction mapper);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(String fieldName);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(SObjectField field);

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     * @param mapper the mapping function
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(ISObjectFunction mapper);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(String fieldName);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `Set<String>`containing the collected elements
     */
    Set<String> toStringSet(SObjectField field);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     * @return the `Map<Id, SObject>` containing the iterable elements
     */
    Map<Id, SObject> toMap();

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<Id, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<Id, SObject> toByIdMap(ISObjectFunction keyMapper, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @param mapType result type
     * @return the `Map<Id, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<Id, SObject> toByIdMap(String fieldName, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @param mapType result type
     * @return the `Map<Id, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<Id, SObject> toByIdMap(SObjectField field, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param keyMapper the mapping function producing keys
     * @param mapType result type
     * @return the `Map<String, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<String, SObject> toByStringMap(ISObjectFunction keyMapper, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @param mapType result type
     * @return the `Map<String, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<String, SObject> toByStringMap(String fieldName, Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @param mapType result type
     * @return the `Map<String, SObject>` containing the collected elements, which can be casted to `mapType`
     */
    Map<String, SObject> toByStringMap(SObjectField field, Type mapType);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the iterable elements
     */
    Map<Id, List<SObject>> groupById(ISObjectFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `Map<Id, List<SObject>>` containing the collected elements
     */
    Map<Id, List<SObject>> groupById(String fieldName);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `Map<Id, List<SObject>>` containing the grouped elements
     */
    Map<Id, List<SObject>> groupById(SObjectField field);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param keyMapper the mapping function producing keys
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(ISObjectFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(String fieldName);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @return the `Map<String, List<SObject>>` containing the grouped elements
     */
    Map<String, List<SObject>> groupByString(SObjectField field);

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     * @param predicate the predicate
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(ISObjectPredicate predicate);

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * <p>Terminal Operation.</p>
     * @param fieldName the field
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(String fieldName, Object value);

    /**
     * @description Partition `SObject` elements by `field` having `value`.
     * <p>Terminal Operation.</p>
     * @param field the field
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     */
    Map<Boolean, List<SObject>> partition(SObjectField field, Object value);
    //</editor-fold>

}
