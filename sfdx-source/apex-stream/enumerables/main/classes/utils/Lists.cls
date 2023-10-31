/**
 * @description Contains static utility methods that operate Lists.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class Lists {

    @TestVisible
    private Lists() {}

//    /**
//     * @description Returns a sorted `List<SObject>` with sorted elements according to `comparer`.
//     *
//     * @param sObjects the elements to sort
//     * @param comparer the comparer to compare elements
//     *
//     * @return the sorted `List<SObject>`
//     *
//     * @throws NullPointerException if `sObjects` or `comparer` is null
//     *
//     * @example
//     * List<Account> sortedAccountsByName = Lists.sort(accounts, SObjectComparer.comparing(Account.Name));
//     */
//    public static List<SObject> sort(final List<SObject> sObjects, final ISObjectComparer comparer) {
//        Validate.notNull(sObjects);
//        Validate.notNull(comparer);
//        final List<SObjectComparable> comparables = wrap(sObjects, comparer);
//        comparables.sort();
//        return unwrap(comparables);
//    }

    /**
     * @description Returns a sorted `List<Object>` with sorted elements according to `comparer`.
     *
     * @param objects the elements to sort
     * @param comparer the comparer to compare elements
     *
     * @return the sorted `List<Object>`
     *
     * @throws NullPointerException if `objects` or `comparer` is null
     *
     * @example
     * List<Person> sortedPeopleByName = (List<Person>) Lists.sort(people, Comparer.comparing(getName));
     */
    public static List<Object> sort(final List<Object> objects, final IComparer comparer) {
        Validate.notNull(objects);
        Validate.notNull(comparer);
        final List<ObjectComparable> comparables = wrap(objects, comparer);
        comparables.sort();
        return unwrap(comparables, objects);
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `elementType`.
     *
     * @param sObjects the list
     * @param mapper the mapping function
     * @param elementType the result type
     *
     * @return the `List<Object>` which can be cast into `elementType`
     *
     * @throws NullPointerException if `sObjects`, `mapper` or `elementType` is null
     *
     * @example 
     * List<String> accNames = (List<String>) Lists.toList(accounts, SObjectFunctions.get('Name'), List<String>.class);
     */
    public static List<Object> toList(
            final List<SObject> sObjects,
            final IFunction mapper,
            final Type elementType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(mapper);
        Validate.notNull(elementType);
        final List<Object> results = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
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
    public static Set<Object> toObjectSet(final List<SObject> sObjects, final IFunction mapper) {
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
    public static Set<Id> toIdSet(final List<SObject> sObjects, final IFunction mapper) {
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
    public static Set<String> toStringSet(final List<SObject> sObjects, final IFunction mapper) {
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
     * @throws NullPointerException if `sObjects`, `keyMapper` or `elementType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
     *     .toByIdMap(contacts, SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
     */
    public static Map<Id, SObject> toByIdMap(
            final List<SObject> sObjects,
            final IFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<Id, SObject> m = (Map<Id, SObject>) mapType.newInstance();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            final Id k = (Id) keyMapper.apply(sObj);
            Validate.state(
                    !m.containsKey(k),
                    Label.AS_ErrorMessage_DuplicateKey,
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
     * @throws NullPointerException if `sObjects`, `keyMapper` or `elementType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) Lists
     *     .toByIdMap(accounts, SObjectFunctions.get('Name'), Map<String, Account>.class);
     */
    public static Map<String, SObject> toByStringMap(
            final List<SObject> sObjects,
            final IFunction keyMapper,
            final Type mapType
    ) {
        Validate.notNull(sObjects);
        Validate.notNull(keyMapper);
        Validate.notNull(mapType);
        final Map<String, SObject> m = (Map<String, SObject>) mapType.newInstance();
        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
            final SObject sObj = sObjects[i];
            final String k = (String) keyMapper.apply(sObj);
            Validate.state(
                    !m.containsKey(k),
                    Label.AS_ErrorMessage_DuplicateKey,
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
    public static Map<Id, List<SObject>> groupById(final List<SObject> sObjects, final IFunction keyMapper) {
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
            final IFunction keyMapper
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
            final IPredicate predicate
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
//
//    private static List<SObjectComparable> wrap(final List<SObject> sObjects, final ISObjectComparer comparer) {
//        final List<SObjectComparable> comparables = new List<SObjectComparable>();
//        for (Integer i = 0, size = sObjects.size(); i < size; i++) {
//            comparables.add(new SObjectComparable(sObjects[i], comparer));
//        }
//        return comparables;
//    }

    private static List<ObjectComparable> wrap(final List<Object> objects, final IComparer comparer) {
        final List<ObjectComparable> comparables = new List<ObjectComparable>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            comparables.add(new ObjectComparable(objects[i], comparer));
        }
        return comparables;
    }

//    private static List<SObject> unwrap(final List<SObjectComparable> comparables) {
//        final List<SObject> sObjects = new List<SObject>();
//        for (Integer i = 0, size = comparables.size(); i < size; i++) {
//            sObjects.add(comparables[i].sObj);
//        }
//        return sObjects;
//    }

    private static List<Object> unwrap(final List<ObjectComparable> comparables, final List<Object> objects) {
        final List<Object> results = objects.clone();
        results.clear(); // To keep it possible to cast the result
        for (Integer i = 0, size = comparables.size(); i < size; i++) {
            results.add(comparables[i].o);
        }
        return results;
    }

//    private class SObjectComparable implements Comparable {
//        public final SObject sObj;
//        private final ISObjectComparer comparer;
//        private SObjectComparable(SObject sObj, ISObjectComparer comparer) {
//            this.sObj = sObj;
//            this.comparer = comparer;
//        }
//        public Integer compareTo(Object that) { return comparer.compare(sObj, ((SObjectComparable) that).sObj); }
//    }

    private class ObjectComparable implements Comparable {
        public final Object o;
        private final IComparer comparer;
        private ObjectComparable(Object o, IComparer comparer) {
            this.o = o;
            this.comparer = comparer;
        }
        public Integer compareTo(Object that) { return comparer.compare(o, ((ObjectComparable) that).o); }
    }

}