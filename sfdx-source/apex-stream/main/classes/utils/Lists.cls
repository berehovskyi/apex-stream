/**
 * @author O. Berehovskyi
 * @group Utils
 * @description Contains static utility methods that operate Lists.
 */
public virtual inherited sharing class Lists {

    /**
     * @description Returns a sorted `List<SObject>` with sorted elements according to `comparator`.
     * @example 
     * List<Account> sortedAccountsByName = Lists.sort(accounts, SObjectComparator.comparing(Account.Name));
     * @param sObjects the elements to sort
     * @param comparator the comparator to compare elements
     * @return the sorted `List<SObject>`
     * @throws NullPointerException if `sObjects` or `comparator` is null
     */
    public static List<SObject> sort(final List<SObject> sObjects, final ISObjectComparator comparator) {
        Validate.notNull(sObjects);
        Validate.notNull(comparator);
        final List<SObjectComparable> comparables = wrap(sObjects, comparator);
        comparables.sort();
        return unwrap(comparables);
    }

    /**
     * @description Returns a sorted `List<Object>` with sorted elements according to `comparator`.
     * @example 
     * List<Person> sortedPeopleByName = (List<Person>) Lists.sort(people, Comparator.comparing(getName));
     * @param objects the elements to sort
     * @param comparator the comparator to compare elements
     * @return the sorted `List<Object>`
     * @throws NullPointerException if `objects` or `comparator` is null
     */
    public static List<Object> sort(final List<Object> objects, final IComparator comparator) {
        Validate.notNull(objects);
        Validate.notNull(comparator);
        final List<ObjectComparable> comparables = wrap(objects, comparator);
        comparables.sort();
        return unwrap(comparables, objects);
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) Lists.toList(accounts, SObjectFunction.get('Name'), List<String>.class);
     * @param sObjects the list
     * @param mapper the mapping function
     * @param listType the result type
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `sObjects`, `mapper` or `listType` is null
     */
    public static List<Object> toList(
            final List<SObject> sObjects,
            final ISObjectFunction mapper,
            final Type listType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(mapper);
        Validate.notNull(listType);
        final List<Object> results = (List<Object>) listType.newInstance();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return results;
    }

    /**
     * @description Accumulates `fieldName` values into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) Lists.toList(accounts, 'Name', List<String>.class);
     * @param sObjects the list
     * @param fieldName the field name
     * @param listType the type of list
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `sObjects` or `listType` is null, or `fieldName` is blank
     */
    public static List<Object> toList(final List<SObject> sObjects, final String fieldName, final Type listType) {
        return toList(sObjects, SObjectFunction.get(fieldName), listType);
    }

    /**
     * @description Accumulates `field` values into a `List<?>` of specific `listType`.
     * @example 
     * List<String> accNames = (List<String>) Lists.toList(accounts, Account.Name, List<String>.class);
     * @param sObjects the list
     * @param field the field
     * @param listType the type of list
     * @return the `List<Object>` which can be casted into `listType`
     * @throws NullPointerException if `sObjects`, `field` or `listType` is null
     */
    public static List<Object> toList(final List<SObject> sObjects, final SObjectField field, final Type listType) {
        return toList(sObjects, SObjectFunction.get(field), listType);
    }

    /**
     * @description Accumulates values returned by `mapper` into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Lists.toIdSet(accounts, SObjectFunction.get('ParentId'));
     * @param sObjects the list
     * @param mapper the mapping function
     * @return the `Set<Id>`
     * @throws NullPointerException if `sObjects` or `mapper` is null
     */
    public static Set<Id> toIdSet(final List<SObject> sObjects, final ISObjectFunction mapper) {
        Validate.notNull(sObjects);
        Validate.notNull(mapper);
        final Set<Id> ids = new Set<Id>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            ids.add((Id) mapper.apply(sObjects[i]));
        }
        return ids;
    }

    /**
     * @description Accumulates `fieldName` values into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Lists.toIdSet(accounts, 'ParentId');
     * @param sObjects the list
     * @param fieldName the field name
     * @return the `Set<Id>`
     * @throws NullPointerException if `sObjects` is null or `fieldName` is blank
     */
    public static Set<Id> toIdSet(final List<SObject> sObjects, final String fieldName) {
        return toIdSet(sObjects, SObjectFunction.get(fieldName));
    }

    /**
     * @description Accumulates `field` values into a `Set<Id>`.
     * @example 
     * Set<Id> parentIds = Lists.toIdSet(accounts, Account.ParentId);
     * @param sObjects the list
     * @param field the field
     * @return the `Set<Id>`
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Set<Id> toIdSet(final List<SObject> sObjects, final SObjectField field) {
        return toIdSet(sObjects, SObjectFunction.get(field));
    }

    /**
     * @description Accumulates values returned by `mapper` into a `Set<String>`.
     * @example 
     * Set<String> names = Lists.toStringSet(accounts, SObjectFunction.get('Name'));
     * @param sObjects the list
     * @param mapper the mapping function
     * @return the `Set<String>`
     * @throws NullPointerException if `sObjects` or `mapper` is null
     */
    public static Set<String> toStringSet(final List<SObject> sObjects, final ISObjectFunction mapper) {
        Validate.notNull(sObjects);
        Validate.notNull(mapper);
        final Set<String> strings = new Set<String>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            strings.add((String) mapper.apply(sObjects[i]));
        }
        return strings;
    }

    /**
     * @description Accumulates `fieldName` values into a `Set<String>`.
     * @example 
     * Set<String> names = Lists.toStringSet(accounts, 'Name');
     * @param sObjects the list
     * @param fieldName the field name
     * @return the `Set<Id>`
     * @throws NullPointerException if `sObjects` is null or `fieldName` is blank
     */
    public static Set<String> toStringSet(final List<SObject> sObjects, final String fieldName) {
        return toStringSet(sObjects, SObjectFunction.get(fieldName));
    }

    /**
     * @description Accumulates `field` values into a `Set<String>`.
     * @example 
     * Set<String> names = Lists.toStringSet(accounts, Account.Name);
     * @param sObjects the list
     * @param field the field
     * @return the `Set<Id>`
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Set<String> toStringSet(final List<SObject> sObjects, final SObjectField field) {
        return toStringSet(sObjects, SObjectFunction.get(field));
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * @example 
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
     *     .toByIdMap(contacts, SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects`, `keyMapper` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final List<SObject> sObjects,
            final ISObjectFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<Id, SObject> m = (Map<Id, SObject>) mapType.newInstance();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
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
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
     *     .toByIdMap(contacts, 'AccountId', Map<Id, Contact>.class);
     * @param sObjects the list
     * @param fieldName the field name
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects` or `listType` is null, or `fieldName` is blank
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final List<SObject> sObjects,
            final String fieldName,
            final Type mapType
    ) {
        return toByIdMap(sObjects, SObjectFunction.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * @example 
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
     *     .toByIdMap(contacts, Contact.AccountId, Map<Id, Contact>.class);
     * @param sObjects the list
     * @param field the field
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects`, `field` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<Id, SObject> toByIdMap(
            final List<SObject> sObjects,
            final SObjectField field,
            final Type mapType
    ) {
        return toByIdMap(sObjects, SObjectFunction.get(field), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * @example 
     * Map<String, Account> accountByName = (Map<String, Account>) Lists
     *     .toByIdMap(accounts, SObjectFunction.get('Name'), Map<String, Account>.class);
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     * @return the `Map<String, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects`, `keyMapper` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final List<SObject> sObjects,
            final ISObjectFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<String, SObject> m = (Map<String, SObject>) mapType.newInstance();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
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
     * Map<String, Account> accountByName = (Map<String, Account>) Lists
     *     .toByIdMap(accounts, 'Name', Map<String, Account>.class);
     * @param sObjects the list
     * @param fieldName the field name
     * @param mapType the type of map
     * @return the `Map<String, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects` or `listType` is null, or `fieldName` is blank
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final List<SObject> sObjects,
            final String fieldName,
            final Type mapType
    ) {
        return toByStringMap(sObjects, SObjectFunction.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are `field` values and values are `SObject` elements.
     * @example 
     * Map<String, Account> accountByName = (Map<String, Account>) Lists
     *     .toByIdMap(accounts, Account.Name, Map<String, Account>.class);
     * @param sObjects the list
     * @param field the field
     * @param mapType the type of map
     * @return the `Map<Id, SObject>` which can be casted into `mapType`
     * @throws NullPointerException if `sObjects`, `field` or `listType` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Map<String, SObject> toByStringMap(
            final List<SObject> sObjects,
            final SObjectField field,
            final Type mapType
    ) {
        return toByStringMap(sObjects, SObjectFunction.get(field), mapType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, SObjectFunction.get('AccountId'));
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` or `keyMapper` is blank
     */
    public static Map<Id, List<SObject>> groupById(final List<SObject> sObjects, final ISObjectFunction keyMapper) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        final Map<Id, List<SObject>> m = new Map<Id, List<SObject>>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
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
     * Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, 'AccountId');
     * @param sObjects the list
     * @param fieldName the field
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` is null, or `fieldName` is blank
     */
    public static Map<Id, List<SObject>> groupById(final List<SObject> sObjects, final String fieldName) {
        return groupById(sObjects, SObjectFunction.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, Contact.AccountId);
     * @param sObjects the list
     * @param field the field
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Map<Id, List<SObject>> groupById(final List<SObject> sObjects, final SObjectField field) {
        return groupById(sObjects, SObjectFunction.get(field));
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * @example
     * Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, SObjectFunction.get('Rating'));
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @return the `Map<Id, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` or `keyMapper` is null
     */
    public static Map<String, List<SObject>> groupByString(
            final List<SObject> sObjects,
            final ISObjectFunction keyMapper
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        final Map<String, List<SObject>> m = new Map<String, List<SObject>>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
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
     * Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, 'Rating');
     * @param sObjects the list
     * @param fieldName the field
     * @return the `Map<String, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` is null, or `fieldName` is blank
     */
    public static Map<String, List<SObject>> groupByString(final List<SObject> sObjects, final String fieldName) {
        return groupByString(sObjects, SObjectFunction.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * @example
     * Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, Account.Rating);
     * @param sObjects the list
     * @param field the field
     * @return the `Map<String, List<SObject>>` containing the elements
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Map<String, List<SObject>> groupByString(final List<SObject> sObjects, final SObjectField field) {
        return groupByString(sObjects, SObjectFunction.get(field));
    }

    /**
     * @description Partitions `SObject` elements by `predicate`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Lists.partition(accounts, SObjectPredicate.isEqual(Account.Rating, 'Hot'));
     * @param sObjects the list
     * @param predicate the predicate
     * @return the `Map<Boolean, List<SObject>>` containing the elements
     * @throws NullPointerException if `predicate` is null
     */
    public static Map<Boolean, List<SObject>> partition(
            final List<SObject> sObjects,
            final ISObjectPredicate predicate
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(predicate);
        final Map<Boolean, List<SObject>> m = new Map<Boolean, List<SObject>>{
                true => new List<SObject>(),
                false => new List<SObject>()
        };
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            m.get(predicate.test(sObj)).add(sObj);
        }
        return m;
    }

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Lists.partition(accounts, 'Rating', 'Hot');
     * @param sObjects the list
     * @param fieldName the field
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     * @throws NullPointerException if `sObjects` is null or `fieldName` is blank
     */
    public static Map<Boolean, List<SObject>> partition(
            final List<SObject> sObjects,
            final String fieldName,
            final Object value
    ) {
        return partition(sObjects, SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Partition `SObject` elements by `field` having `value`.
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Lists.partition(accounts, Account.Rating, 'Hot');
     * @param sObjects the list
     * @param field the field name
     * @param value the satisfying value
     * @return the `Map<Boolean, List<SObject>>` containing the partitioned elements
     * @throws NullPointerException if `sObjects` or `field` is null
     */
    public static Map<Boolean, List<SObject>> partition(
            final List<SObject> sObjects,
            final SObjectField field,
            final Object value
    ) {
        return partition(sObjects, SObjectPredicate.isEqual(field, value));
    }

    private static List<SObjectComparable> wrap(final List<SObject> sObjects, final ISObjectComparator comparator) {
        final List<SObjectComparable> comparables = new List<SObjectComparable>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            comparables.add(new SObjectComparable(sObjects[i], comparator));
        }
        return comparables;
    }

    private static List<ObjectComparable> wrap(final List<Object> objects, final IComparator comparator) {
        final List<ObjectComparable> comparables = new List<ObjectComparable>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            comparables.add(new ObjectComparable(objects[i], comparator));
        }
        return comparables;
    }

    private static List<SObject> unwrap(final List<SObjectComparable> comparables) {
        final List<SObject> sObjects = new List<SObject>();
        for (Integer i = 0, size = comparables.size(); i < size; i++) {
            sObjects.add(comparables[i].sObj);
        }
        return sObjects;
    }

    private static List<Object> unwrap(final List<ObjectComparable> comparables, final List<Object> objects) {
        final List<Object> results = objects.clone();
        results.clear(); // To keep it possible to downcast the result
        for (Integer i = 0, size = comparables.size(); i < size; i++) {
            results.add(comparables[i].o);
        }
        return results;
    }

    private class SObjectComparable implements Comparable {
        public final SObject sObj;
        private final ISObjectComparator comparator;
        private SObjectComparable(SObject sObj, ISObjectComparator comparator) {
            this.sObj = sObj;
            this.comparator = comparator;
        }
        public Integer compareTo(Object that) {
            return comparator.compare(this.sObj, ((SObjectComparable) that).sObj);
        }
    }

    private class ObjectComparable implements Comparable {
        public final Object o;
        private final IComparator comparator;
        private ObjectComparable(Object o, IComparator comparator) {
            this.o = o;
            this.comparator = comparator;
        }
        public Integer compareTo(Object that) {
            return comparator.compare(this.o, ((ObjectComparable) that).o);
        }
    }

}
