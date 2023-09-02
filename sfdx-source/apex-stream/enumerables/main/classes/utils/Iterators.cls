/**
 * @description Contains static utility methods that operate Iterators.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class Iterators {

    @TestVisible
    private Iterators() {}

    /**
     * @description Returns a `List<SObject>` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the `List<SObject>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `Set<SObject>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `Map<Id, SObject>`
     *
     * @throws NullPointerException if `iterator` is null
     */
    public static Map<Id, SObject> toSObjectMap(final Iterator<SObject> iterator) {
        return new Map<Id, SObject>(toSObjectList(iterator));
    }

    /**
     * @description Returns a `List<Object>` created from `iterator`.
     *
     * @param iterable the iterator
     *
     * @return the `List<Object>`
     *
     * @throws NullPointerException if `iterator` is null
     */
    public static List<Object> toList(final Iterable<Object> iterable, final Type elementType) {
        Validate.notNull(iterable);
        Validate.notNull(elementType);
//        String elementTypeName = elementType == null ? Schemas.parseTypeName(iterable) : String.valueOf(elementType);
//        System.debug(LoggingLevel.ERROR,elementTypeName);
        final List<Object> objects = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        final Iterator<Object> iterator = iterable.iterator();
        while (iterator.hasNext()) {
            objects.add(iterator.next());
        }
        return objects;
    }

//    public static List<Object> toList(final Iterable<Object> iterable) {
//        return toList(iterable, Object.class);
//    }

//    public static List<Object> toList(final Iterator<Object> iterator, final Type elementType) {
//        Validate.notNull(iterator);
//        String elementTypeName = elementType == null ? Schemas.parseTypeName(iterator) : String.valueOf(elementType);
//        System.debug(LoggingLevel.ERROR,elementTypeName);
//        final List<Object> objects = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
//        while (iterator.hasNext()) {
//            objects.add(iterator.next());
//        }
//        return objects;
//    }

//    public static List<Object> toList(final Iterator<Object> iterator) {
//        return toList(iterator, Object.class);
//    }
    
//    public static List<Object> toList(final Iterable<Object> iterable) {
//        Validate.notNull(iterable);
//        System.debug(LoggingLevel.ERROR, Schemas.parseTypeName(iterable));
//        final List<Object> objects = (List<Object>) Type.forName('List<' + Schemas.parseTypeName(iterable) + '>').newInstance();
//        final Iterator<Object> iterator = iterable.iterator();
//        while (iterator.hasNext()) {
//            objects.add(iterator.next());
//        }
//        return objects;
//    }

    /**
     * @description Returns a `Set<Object>` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the `Set<Object>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `List<Integer>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `Set<Integer>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `List<Long>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `Set<Long>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `List<Double>`
     *
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
     *
     * @param iterator the iterator
     *
     * @return the `Set<Double>`
     *
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
     * @description Accumulates values returned by `mapper` into a `Set<Object>`.
     *
     * @param iterator the iterator
     * @param mapper the mapping function
     *
     * @return the `Set<Object>`
     *
     * @throws NullPointerException if `iterator` or `mapper` is null
     */
    public static Set<Object> toObjectSet(final Iterator<Object> iterator, final IFunction mapper) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        final Set<Object> results = new Set<Object>();
        while (iterator.hasNext()) {
            results.add(mapper.apply(iterator.next()));
        }
        return results;
    }

//    /**
//     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
//     * whose keys are produced by `keyMapper` and values are `SObject` elements.
//     *
//     * @param iterator the iterator
//     * @param keyMapper the mapping function producing keys
//     * @param mapType the type of map
//     *
//     * @return the `Map<Id, SObject>` which can be cast into `mapType`
//     *
//     * @throws IllegalStateException if mapped keys contain duplicates
//     * @throws NullPointerException if `iterator`, `keyMapper` or `listType` is null
//     *
//     * @example
//     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
//     *     .toByIdMap(contIterator, SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
//     */
//    public static Map<Id, SObject> toByIdMap(
//            final Iterator<SObject> iterator,
//            final ISObjectFunction keyMapper,
//            final Type mapType
//    ) {
//        Validate.notNull(iterator);
//        Validate.notNull(keyMapper);
//        Validate.notNull(mapType);
//        final Map<Id, SObject> m = (Map<Id, SObject>) mapType.newInstance();
//        while (iterator.hasNext()) {
//            final SObject sObj = iterator.next();
//            final Id k = (Id) keyMapper.apply(sObj);
//            Validate.state(
//                    !m.containsKey(k),
//                    Label.AS_ErrorMessage_DuplicateKey,
//                    new List<Object>{ k, m.get(k), sObj }
//            );
//            m.put(k, sObj);
//        }
//        return m;
//    }

//    /**
//     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
//     * whose keys are produced by `keyMapper` and values are `SObject` elements.
//     *
//     * @param iterator the iterator
//     * @param keyMapper the mapping function producing keys
//     * @param mapType the type of map
//     *
//     * @return the `Map<String, SObject>` which can be cast into `mapType`
//     *
//     * @throws IllegalStateException if mapped keys contain duplicates
//     * @throws NullPointerException if `iterator`, `keyMapper` or `listType` is null
//     *
//     * @example
//     * Map<String, Account> accountByName = (Map<String, Account>) Iterators
//     *     .toByIdMap(accIterator, SObjectFunctions.get('Name'), Map<String, Account>.class);
//     */
//    public static Map<String, SObject> toByStringMap(
//            final Iterator<SObject> iterator,
//            final ISObjectFunction keyMapper,
//            final Type mapType
//    ) {
//        Validate.notNull(iterator);
//        Validate.notNull(keyMapper);
//        Validate.notNull(mapType);
//        final Map<String, SObject> m = (Map<String, SObject>) mapType.newInstance();
//        while (iterator.hasNext()) {
//            final SObject sObj = iterator.next();
//            final String k = (String) keyMapper.apply(sObj);
//            Validate.state(
//                    !m.containsKey(k),
//                    Label.AS_ErrorMessage_DuplicateKey,
//                    new List<Object>{ k, m.get(k), sObj }
//            );
//            m.put(k, sObj);
//        }
//        return m;
//    }

//    /**
//     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
//     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
//     *
//     * @param iterator the iterator
//     * @param keyMapper the mapping function producing keys
//     *
//     * @return the `Map<Id, List<SObject>>` containing the elements
//     *
//     * @throws NullPointerException if `iterator` or `keyMapper` is blank
//     *
//     * @example 
//     * Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, SObjectFunctions.get('AccountId'));
//     */
//    public static Map<Id, List<SObject>> groupById(
//            final Iterator<SObject> iterator,
//            final ISObjectFunction keyMapper
//    ) {
//        Validate.notNull(iterator);
//        Validate.notNull(keyMapper);
//        final Map<Id, List<SObject>> m = new Map<Id, List<SObject>>();
//        while (iterator.hasNext()) {
//            final SObject sObj = iterator.next();
//            final Id k = (Id) keyMapper.apply(sObj);
//            List<SObject> container = m.get(k);
//            if (!m.containsKey(k)) {
//                container = new List<SObject>();
//                m.put(k, container);
//            }
//            container.add(sObj);
//        }
//        return m;
//    }

//    /**
//     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
//     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
//     *
//     * @param iterator the iterator
//     * @param keyMapper the mapping function producing keys
//     *
//     * @return the `Map<Id, List<SObject>>` containing the elements
//     *
//     * @throws NullPointerException if `iterator` or `keyMapper` is null
//     *
//     * @example
//     * Map<String, List<Account>> accountsByRating = Iterators
//     *     .groupByString(accIterator, SObjectFunctions.get('Rating'));
//     */
//    public static Map<String, List<SObject>> groupByString(
//            final Iterator<SObject> iterator,
//            final ISObjectFunction keyMapper
//    ) {
//        Validate.notNull(iterator);
//        Validate.notNull(keyMapper);
//        final Map<String, List<SObject>> m = new Map<String, List<SObject>>();
//        while (iterator.hasNext()) {
//            final SObject sObj = iterator.next();
//            final String k = (String) keyMapper.apply(sObj);
//            List<SObject> container = m.get(k);
//            if (!m.containsKey(k)) {
//                container = new List<SObject>();
//                m.put(k, container);
//            }
//            container.add(sObj);
//        }
//        return m;
//    }

//    /**
//     * @description Partitions `SObject` elements by `predicate`.
//     *
//     * @param iterator the iterator
//     * @param predicate the predicate
//     *
//     * @return the `Map<Boolean, List<SObject>>` containing the elements
//     *
//     * @throws NullPointerException if `iterator` or `predicate` is null
//     *
//     * @example
//     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
//     *     = Iterators.partition(accIterator, SObjectPredicates.isEqual(Account.Rating, 'Hot'));
//     */
//    public static Map<Boolean, List<SObject>> partition(
//            final Iterator<SObject> iterator,
//            final ISObjectPredicate predicate
//    ) {
//        Validate.notNull(iterator);
//        Validate.notNull(predicate);
//        final Map<Boolean, List<SObject>> m = new Map<Boolean, List<SObject>>{
//                true => new List<SObject>(),
//                false => new List<SObject>()
//        };
//        while (iterator.hasNext()) {
//            final SObject sObj = iterator.next();
//            m.get(predicate.test(sObj)).add(sObj);
//        }
//        return m;
//    }

}
