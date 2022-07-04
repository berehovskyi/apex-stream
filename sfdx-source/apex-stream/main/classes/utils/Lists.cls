/**
 * @description Contains static utility methods that operate Lists.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class Lists {

    @TestVisible
    private Lists(){}

    /**
     * @description Returns a sorted `List<SObject>` with sorted elements according to `comparator`.
     *
     * @param sObjects the elements to sort
     * @param comparator the comparator to compare elements
     *
     * @return the sorted `List<SObject>`
     *
     * @throws NullPointerException if `sObjects` or `comparator` is null
     *
     * @example
     * List<Account> sortedAccountsByName = Lists.sort(accounts, SObjectComparator.comparing(Account.Name));
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
     *
     * @param objects the elements to sort
     * @param comparator the comparator to compare elements
     *
     * @return the sorted `List<Object>`
     *
     * @throws NullPointerException if `objects` or `comparator` is null
     *
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) Lists.sort(people, Comparator.comparing(getName));
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
     *
     * @param sObjects the list
     * @param mapper the mapping function
     * @param listType the result type
     *
     * @return the `List<Object>` which can be cast into `listType`
     *
     * @throws NullPointerException if `sObjects`, `mapper` or `listType` is null
     *
     * @example 
     * List<String> accNames = (List<String>) Lists.toList(accounts, SObjectFunctions.get('Name'), List<String>.class);
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
     * @description Accumulates values returned by `mapper` into a `Set<Object>`.
     *
     * @param sObjects the list
     * @param mapper the mapping function
     *
     * @return the `Set<Object>`
     *
     * @throws NullPointerException if `sObjects` or `mapper` is null
     *
     * @example
     * Set<Object> createdDates = Lists.toObjectSet(accounts, SObjectFunctions.get('CreatedDate'));
     */
    public static Set<Object> toObjectSet(final List<SObject> sObjects, final ISObjectFunction mapper) {
        Validate.notNull(sObjects);
        Validate.notNull(mapper);
        final Set<Object> results = new Set<Object>();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            results.add(mapper.apply(sObjects[i]));
        }
        return results;
    }

    /**
     * @description Accumulates values returned by `mapper` into a `Set<Id>`.
     *
     * @param sObjects the list
     * @param mapper the mapping function
     *
     * @return the `Set<Id>`
     *
     * @throws NullPointerException if `sObjects` or `mapper` is null
     *
     * @example
     * Set<Id> parentIds = Lists.toIdSet(accounts, SObjectFunctions.get('ParentId'));
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
     * @description Accumulates values returned by `mapper` into a `Set<String>`.
     *
     * @param sObjects the list
     * @param mapper the mapping function
     *
     * @return the `Set<String>`
     *
     * @throws NullPointerException if `sObjects` or `mapper` is null
     *
     * @example
     * Set<String> names = Lists.toStringSet(accounts, SObjectFunctions.get('Name'));
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
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     *
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     *
     * @return the `Map<Id, SObject>` which can be cast into `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `sObjects`, `keyMapper` or `listType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
     *     .toByIdMap(contacts, SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
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
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     *
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     * @param mapType the type of map
     *
     * @return the `Map<String, SObject>` which can be cast into `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `sObjects`, `keyMapper` or `listType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) Lists
     *     .toByIdMap(accounts, SObjectFunctions.get('Name'), Map<String, Account>.class);
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
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     *
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the elements
     *
     * @throws NullPointerException if `sObjects` or `keyMapper` is blank
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, SObjectFunctions.get('AccountId'));
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
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     *
     * @param sObjects the list
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the elements
     *
     * @throws NullPointerException if `sObjects` or `keyMapper` is null
     *
     * @example 
     * Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, SObjectFunctions.get('Rating'));
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
     * @description Partitions `SObject` elements by `predicate`.
     *
     * @param sObjects the list
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the elements
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = Lists.partition(accounts, SObjectPredicates.isEqual(Account.Rating, 'Hot'));
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
        results.clear(); // To keep it possible to cast the result
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
        public Integer compareTo(Object that) { return comparator.compare(sObj, ((SObjectComparable) that).sObj); }
    }

    private class ObjectComparable implements Comparable {
        public final Object o;
        private final IComparator comparator;
        private ObjectComparable(Object o, IComparator comparator) {
            this.o = o;
            this.comparator = comparator;
        }
        public Integer compareTo(Object that) { return comparator.compare(o, ((ObjectComparable) that).o); }
    }

}
