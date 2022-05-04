/**
 * @author O. Berehovskyi
 * @group Utils
 * @description Contains static utility methods that operate Iterators.
 */
public virtual inherited sharing class Iterators {

    /**
     * @description Returns a `List<SObject>` created from `iterator`.
     * @param iterator the iterator
     * @return the `List<SObject>`
     * @throws NullPointerException if `iterator` is null
     */
    public static List<SObject> toSObjectList(final Iterator<SObject> iterator) {
        Validate.notNull(iterator);
        final List<SObject> sObjects = new List<SObject>();
        while (iterator.hasNext()) {
            sObjects.add(iterator.next());
        }
        return sObjects;
    }

    /**
     * @description Returns a `Set<SObject>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Set<SObject>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Set<SObject> toSObjectSet(final Iterator<SObject> iterator) {
        Validate.notNull(iterator);
        final Set<SObject> sObjects = new Set<SObject>();
        while (iterator.hasNext()) {
            sObjects.add(iterator.next());
        }
        return sObjects;
    }

    /**
     * @description Returns a `Map<Id, SObject>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Map<Id, SObject>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Map<Id, SObject> toSObjectMap(final Iterator<SObject> iterator) {
        return new Map<Id, SObject>(toSObjectList(iterator));
    }

    /**
     * @description Returns a `List<Object>` created from `iterator`.
     * @param iterator the iterator
     * @return the `List<Object>`
     * @throws NullPointerException if `iterator` is null
     */
    public static List<Object> toObjectList(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        final List<Object> objects = new List<Object>();
        while (iterator.hasNext()) {
            objects.add(iterator.next());
        }
        return objects;
    }

    /**
     * @description Returns a `Set<Object>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Set<Object>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Set<Object> toObjectSet(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        final Set<Object> objects = new Set<Object>();
        while (iterator.hasNext()) {
            objects.add(iterator.next());
        }
        return objects;
    }

    /**
     * @description Returns a `List<Integer>` created from `iterator`.
     * @param iterator the iterator
     * @return the `List<Integer>`
     * @throws NullPointerException if `iterator` is null
     */
    public static List<Integer> toIntList(final Iterator<Integer> iterator) {
        Validate.notNull(iterator);
        final List<Integer> integers = new List<Integer>();
        while (iterator.hasNext()) {
            integers.add(iterator.next());
        }
        return integers;
    }

    /**
     * @description Returns a `Set<Integer>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Set<Integer>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Set<Integer> toIntSet(final Iterator<Integer> iterator) {
        Validate.notNull(iterator);
        final Set<Integer> integers = new Set<Integer>();
        while (iterator.hasNext()) {
            integers.add(iterator.next());
        }
        return integers;
    }

    /**
     * @description Returns a `List<Long>` created from `iterator`.
     * @param iterator the iterator
     * @return the `List<Long>`
     * @throws NullPointerException if `iterator` is null
     */
    public static List<Long> toLongList(final Iterator<Long> iterator) {
        Validate.notNull(iterator);
        final List<Long> longs = new List<Long>();
        while (iterator.hasNext()) {
            longs.add(iterator.next());
        }
        return longs;
    }

    /**
     * @description Returns a `Set<Long>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Set<Long>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Set<Long> toLongSet(final Iterator<Long> iterator) {
        Validate.notNull(iterator);
        final Set<Long> longs = new Set<Long>();
        while (iterator.hasNext()) {
            longs.add(iterator.next());
        }
        return longs;
    }

    /**
     * @description Returns a `List<Double>` created from `iterator`.
     * @param iterator the iterator
     * @return the `List<Double>`
     * @throws NullPointerException if `iterator` is null
     */
    public static List<Double> toDoubleList(final Iterator<Double> iterator) {
        Validate.notNull(iterator);
        final List<Double> doubles = new List<Double>();
        while (iterator.hasNext()) {
            doubles.add(iterator.next());
        }
        return doubles;
    }

    /**
     * @description Returns a `Set<Double>` created from `iterator`.
     * @param iterator the iterator
     * @return the `Set<Double>`
     * @throws NullPointerException if `iterator` is null
     */
    public static Set<Double> toDoubleSet(final Iterator<Double> iterator) {
        Validate.notNull(iterator);
        final Set<Double> doubles = new Set<Double>();
        while (iterator.hasNext()) {
            doubles.add(iterator.next());
        }
        return doubles;
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) 
     *     Iterators.toList(accIterator, SObjectFunction.get('Name'), List<String>.class);
     * @param iterator the iterator
     * @param mapper the mapping function
     * @param listType the result type
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `iterator`, `mapper` or `listType` is null
     */
    public static List<Object> toList(
            final Iterator<SObject> iterator,
            final ISObjectFunction mapper,
            final Type listType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        Validate.notNull(listType);
        final List<Object> results = (List<Object>) listType.newInstance();
        while (iterator.hasNext()) {
            results.add(mapper.apply(iterator.next()));
        }
        return results;
    }

    /**
     * @description Accumulates `fieldName` values into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) Iterators.toList(accIterator, 'Name', List<String>.class);
     * @param iterator the iterator
     * @param fieldName the field name
     * @param listType the type of list
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `sObjects` or `iterator` is null, or `fieldName` is blank
     */
    public static List<Object> toList(final Iterator<SObject> iterator, final String fieldName, final Type listType) {
        return toList(iterator, SObjectFunction.get(fieldName), listType);
    }

    /**
     * @description Accumulates `field` values into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) Iterators.toList(accIterator, Account.Name, List<String>.class);
     * @param iterator the iterator
     * @param field the field
     * @param listType the type of list
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `iterator`, `field` or `listType` is null
     */
    public static List<Object> toList(
            final Iterator<SObject> iterator,
            final SObjectField field,
            final Type listType
    ) {
        return toList(iterator, SObjectFunction.get(field), listType);
    }

    /**
     * @description Accumulates values returned by `mapper` into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Iterators.toIdSet(accIterator, SObjectFunction.get('ParentId'));
     * @param iterator the iterator
     * @param mapper the mapping function
     * @return the `Set<Id>`
     * @throws NullPointerException if `iterator` or `mapper` is null
     */
    public static Set<Id> toIdSet(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        final Set<Id> ids = new Set<Id>();
        while (iterator.hasNext()) {
            ids.add((Id) mapper.apply(iterator.next()));
        }
        return ids;
    }

    /**
     * @description Accumulates `fieldName` values into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Iterators.toIdSet(accIterator, 'ParentId');
     * @param iterator the iterator
     * @param fieldName the field name
     * @return the `Set<Id>`
     * @throws NullPointerException if `iterator` is null or `fieldName` is blank
     */
    public static Set<Id> toIdSet(final Iterator<SObject> iterator, final String fieldName) {
        return toIdSet(iterator, SObjectFunction.get(fieldName));
    }

    /**
     * @description Accumulates `field` values into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Iterators.toIdSet(accIterator, Account.ParentId);
     * @param iterator the iterator
     * @param field the field
     * @return the `Set<Id>`
     * @throws NullPointerException if `iterator` or `field` is null
     */
    public static Set<Id> toIdSet(final Iterator<SObject> iterator, final SObjectField field) {
        return toIdSet(iterator, SObjectFunction.get(field));
    }

    /**
     * @description Accumulates values returned by `mapper` into a `Set<String>`.
     * @example 
     * Set<String> names = Iterators.toStringSet(accIterator, SObjectFunction.get('Name'));
     * @param iterator the iterator
     * @param mapper the mapping function
     * @return the `Set<String>`
     * @throws NullPointerException if `iterator` or `mapper` is null
     */
    public static Set<String> toStringSet(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        final Set<String> strings = new Set<String>();
        while (iterator.hasNext()) {
            strings.add((String) mapper.apply(iterator.next()));
        }
        return strings;
    }

    /**
     * @description Accumulates `fieldName` values into a `Set<String>`.
     * @example 
     * Set<String> names = Iterators.toStringSet(accIterator, 'Name');
     * @param iterator the iterator
     * @param fieldName the field name
     * @return the `Set<Id>`
     * @throws NullPointerException if `iterator` is null or `fieldName` is blank
     */
    public static Set<String> toStringSet(final Iterator<SObject> iterator, final String fieldName) {
        return toStringSet(iterator, SObjectFunction.get(fieldName));
    }

    /**
     * @description Accumulates `field` values into a `Set<String>`.
     * @example 
     * Set<String> names = Iterators.toStringSet(accIterator, Account.Name);
     * @param iterator the iterator
     * @param field the field
     * @return the `Set<Id>`
     * @throws NullPointerException if `iterator` or `field` is null
     */
    public static Set<String> toStringSet(final Iterator<SObject> iterator, final SObjectField field) {
        return toStringSet(iterator, SObjectFunction.get(field));
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * @example 
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
     *     .toByIdMap(contIterator, SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
     * @param iterator the iterator
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator`, `keyMapper` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final Iterator<SObject> iterator,
            final ISObjectFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<Id, SObject> m = (Map<Id, SObject>) mapType.newInstance();
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            final Id k = (Id) keyMapper.apply(sObj);
            Validate.validState(
                    !m.containsKey(k),
                    Label.DuplicateKeyErrorMessage,
                    new List<Object>{ k, m.get(k), sObj }
            );
            m.put(k, sObj);
        }
        return m;
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * @example 
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
     *     .toByIdMap(contIterator, 'AccountId', Map<Id, Contact>.class);
     * @param iterator the iterator
     * @param fieldName the field name
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator` or `listType` is null, or `fieldName` is blank
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final Iterator<SObject> iterator,
            final String fieldName,
            final Type mapType
    ) {
        return toByIdMap(iterator, SObjectFunction.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * @example 
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
     *     .toByIdMap(contIterator, Contact.AccountId, Map<Id, Contact>.class);
     * @param iterator the iterator
     * @param field the field
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator`, `field` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final Iterator<SObject> iterator,
            final SObjectField field,
            final Type mapType
    ) {
        return toByIdMap(iterator, SObjectFunction.get(field), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * @example 
     * Map<String, Account> accountByName = (Map<String, Account>) Iterators
     *     .toByIdMap(accIterator, SObjectFunction.get('Name'), Map<String, Account>.class);
     * @param iterator the iterator
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     * @return the `Map<String, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator`, `keyMapper` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final Iterator<SObject> iterator,
            final ISObjectFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<String, SObject> m = (Map<String, SObject>) mapType.newInstance();
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            final String k = (String) keyMapper.apply(sObj);
            Validate.validState(
                    !m.containsKey(k),
                    Label.DuplicateKeyErrorMessage,
                    new List<Object>{ k, m.get(k), sObj }
            );
            m.put(k, sObj);
        }
        return m;
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * @example 
     * Map<String, Account> accountByName = (Map<String, Account>) Iterators
     *     .toByIdMap(accIterator, 'Name', Map<String, Account>.class);
     * @param iterator the iterator
     * @param fieldName the field name
     * @param mapType the type of map
     * @return the `Map<String, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator` or `listType` is null, or `fieldName` is blank
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final Iterator<SObject> iterator,
            final String fieldName,
            final Type mapType
    ) {
        return toByStringMap(iterator, SObjectFunction.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * @example 
     * Map<String, Account> accountByName = (Map<String, Account>) Iterators
     *     .toByIdMap(accIterator, Account.Name, Map<String, Account>.class);
     * @param iterator the iterator
     * @param field the field
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `iterator`, `field` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final Iterator<SObject> iterator,
            final SObjectField field,
            final Type mapType
    ) {
        return toByStringMap(iterator, SObjectFunction.get(field), mapType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, SObjectFunction.get('AccountId'));
     * @param iterator the iterator
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` or `keyMapper` is blank
     */
    public static Map<Id, List<SObject>> groupById(final Iterator<SObject> iterator, final ISObjectFunction keyMapper) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        final Map<Id, List<SObject>> m = new Map<Id, List<SObject>>();
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            final Id k = (Id) keyMapper.apply(sObj);
            List<SObject> container = m.get(k);
            if (!m.containsKey(k)) {
                container = new List<SObject>();
                m.put(k, container);
            }
            container.add(sObj);
        }
        return m;
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, 'AccountId');
     * @param iterator the list
     * @param fieldName the field
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` is null, or `fieldName` is blank
     */
    public static Map<Id, List<SObject>> groupById(final Iterator<SObject> iterator, final String fieldName) {
        return groupById(iterator, SObjectFunction.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, Contact.AccountId);
     * @param iterator the iterator
     * @param field the field
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` or `field` is null
     */
    public static Map<Id, List<SObject>> groupById(final Iterator<SObject> iterator, final SObjectField field) {
        return groupById(iterator, SObjectFunction.get(field));
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * @example
     * Map<String, List<Account>> accountsByRating = Iterators
     *     .groupByString(accIterator, SObjectFunction.get('Rating'));
     * @param iterator the iterator
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` or `keyMapper` is null
     */
    public static Map<String, List<SObject>> groupByString(
            final Iterator<SObject> iterator,
            final ISObjectFunction keyMapper
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        final Map<String, List<SObject>> m = new Map<String, List<SObject>>();
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            final String k = (String) keyMapper.apply(sObj);
            List<SObject> container = m.get(k);
            if (!m.containsKey(k)) {
                container = new List<SObject>();
                m.put(k, container);
            }
            container.add(sObj);
        }
        return m;
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * @example
     * Map<String, List<Account>> accountsByRating = Iterators.groupByString(accIterator, 'Rating');
     * @param iterator the iterator
     * @param fieldName the field
     * @return the `Map<String, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` is null, or `fieldName` is blank
     */
    public static Map<String, List<SObject>> groupByString(Iterator<SObject> iterator, final String fieldName) {
        return groupByString(iterator, SObjectFunction.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * @example
     * Map<String, List<Account>> accountsByRating = Iterators.groupByString(accIterator, Account.Rating);
     * @param iterator the iterator
     * @param field the field
     * @return the `Map<String, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` or `field` is null
     */
    public static Map<String, List<SObject>> groupByString(Iterator<SObject> iterator, final SObjectField field) {
        return groupByString(iterator, SObjectFunction.get(field));
    }

    /**
     * @description Partitions `SObject` elements by `predicate`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Iterators.partition(accIterator, SObjectPredicate.isEqual(Account.Rating, 'Hot'));
     * @param iterator the iterator
     * @param predicate the predicate
     * @return the `Map<Boolean, List<SObject>>` containing the elements
     * @throws NullPointerException if `iterator` or `predicate` is null
     */
    public static Map<Boolean, List<SObject>> partition(
            final Iterator<SObject> iterator,
            final ISObjectPredicate predicate
    ) {
        Validate.notNull(iterator);
        Validate.notNull(predicate);
        final Map<Boolean, List<SObject>> m = new Map<Boolean, List<SObject>>{
                true => new List<SObject>(),
                false => new List<SObject>()
        };
        while (iterator.hasNext()) {
            final SObject sObj = iterator.next();
            m.get(predicate.test(sObj)).add(sObj);
        }
        return m;
    }

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Iterators.partition(accIterator, 'Rating', 'Hot');
     * @param iterator the iterator
     * @param fieldName the field
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     * @throws NullPointerException if `sObjects` is null or `fieldName` is blank
     */
    public static Map<Boolean, List<SObject>> partition(
            final Iterator<SObject> iterator,
            final String fieldName,
            final Object value
    ) {
        return partition(iterator, SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Partition `SObject` elements by `field` having `value`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Iterators.partition(accIterator, Account.Rating, 'Hot');
     * @param iterator the iterator
     * @param field the field name
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Map<Boolean, List<SObject>> partition(
            final Iterator<SObject> iterator,
            final SObjectField field,
            final Object value
    ) {
        return partition(iterator, SObjectPredicate.isEqual(field, value));
    }

}
