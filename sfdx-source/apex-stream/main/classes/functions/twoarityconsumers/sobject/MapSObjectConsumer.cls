/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Provides common class level implementations, and related utilities for
 * `Map<T, Object> - SObject` two-arity consumers. Typically is used by collectors.
 */
public abstract inherited sharing class MapSObjectConsumer extends ObjectSObjectConsumer {

    //<editor-fold desc="Put to Map<?, ?> ObjectSObjectConsumers">
    // @start-group Put to Map<?, ?> ObjectSObjectConsumers
    /**
     * @description Returns a `ObjectSObjectConsumers` that casts the first input argument to
     * `Map<Boolean, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumers`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByBoolMap
     */
    public static ObjectSObjectConsumer putToObjectByBoolMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByBoolMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumers` that casts the first input argument to
     * `Map<Boolean, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumers`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByBoolMap
     */
    public static ObjectSObjectConsumer putToSObjectByBoolMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByBoolMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Id, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByIdMap
     */
    public static ObjectSObjectConsumer putToObjectByIdMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByIdMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Id, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByIdMap
     */
    public static ObjectSObjectConsumer putToSObjectByIdMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByIdMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<String, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByStringMap
     */
    public static ObjectSObjectConsumer putToObjectByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByStringMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<String, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByStringMap
     */
    public static ObjectSObjectConsumer putToSObjectByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByStringMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Blob, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByBlobMap
     */
    public static ObjectSObjectConsumer putToObjectByBlobMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByBlobMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Blob, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByBlobMap
     */
    public static ObjectSObjectConsumer putToSObjectByBlobMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByBlobMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Date, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDateMap
     */
    public static ObjectSObjectConsumer putToObjectByDateMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDateMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Date, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDateMap
     */
    public static ObjectSObjectConsumer putToSObjectByDateMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByDateMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Datetime, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDatetimeMap
     */
    public static ObjectSObjectConsumer putToObjectByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDatetimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Datetime, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDatetimeMap
     */
    public static ObjectSObjectConsumer putToSObjectByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByDatetimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Time, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByTimeMap
     */
    public static ObjectSObjectConsumer putToObjectByTimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByTimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Time, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByTimeMap
     */
    public static ObjectSObjectConsumer putToSObjectByTimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByTimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Integer, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByIntMap
     */
    public static ObjectSObjectConsumer putToObjectByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByIntMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Integer, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByIntMap
     */
    public static ObjectSObjectConsumer putToSObjectByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByIntMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Long, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByLongMap
     */
    public static ObjectSObjectConsumer putToObjectByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByLongMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Long, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByLongMap
     */
    public static ObjectSObjectConsumer putToSObjectByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByLongMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Double, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDoubleMap
     */
    public static ObjectSObjectConsumer putToObjectByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDoubleMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Double, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toByDoubleMap
     */
    public static ObjectSObjectConsumer putToSObjectByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByDoubleMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Object, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toMap
     */
    public static ObjectSObjectConsumer putToObjectByObjectMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByObjectMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Object, SObject>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @see SObjectCollector.toMap
     */
    public static ObjectSObjectConsumer putToSObjectByObjectMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToSObjectByObjectMap(keyMapper, valueMapper, merger);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Put to Map<?, ?<?>> ObjectSObjectConsumers">
    // @start-group Put to Map<?, ?> ObjectSObjectConsumers
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Boolean, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByBool
     */
    public static ObjectSObjectConsumer putToObjectsByBoolMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByBoolMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Id, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingById
     */
    public static ObjectSObjectConsumer putToObjectsByIdMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByIdMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<String, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByString
     */
    public static ObjectSObjectConsumer putToObjectsByStringMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByStringMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Blob, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByBlob
     */
    public static ObjectSObjectConsumer putToObjectsByBlobMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByBlobMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Date, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByDate
     */
    public static ObjectSObjectConsumer putToObjectsByDateMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDateMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Datetime, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByDatetime
     */
    public static ObjectSObjectConsumer putToObjectsByDatetimeMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDatetimeMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Time, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByTime
     */
    public static ObjectSObjectConsumer putToObjectsByTimeMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByTimeMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Integer, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByInt
     */
    public static ObjectSObjectConsumer putToObjectsByIntMap(
            final ISObjectCollector downstream,
            final ISObjectToIntFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByIntMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Long, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByLong
     */
    public static ObjectSObjectConsumer putToObjectsByLongMap(
            final ISObjectCollector downstream,
            final ISObjectToLongFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByLongMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Double, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingByDouble
     */
    public static ObjectSObjectConsumer putToObjectsByDoubleMap(
            final ISObjectCollector downstream,
            final ISObjectToDoubleFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDoubleMap(downstream, classifier);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `Map<Object, Object>` and groups input arguments according to a classification function.
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.groupingBy
     */
    public static ObjectSObjectConsumer putToObjectsByObjectMap(
            final ISObjectCollector downstream,
            final ISObjectFunction classifier
    ) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByObjectMap(downstream, classifier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Private Methods">
    // @start-group Private Methods
    private static Object mergeValue(
            final IBinaryOperator merger,
            final Object key,
            final Object oldValue,
            final Object newValue
    ) {
        Validate.validState(
                merger != null,
                Label.DuplicateKeyErrorMessage,
                new List<Object>{ key, oldValue, newValue }
        );
        return merger.apply(oldValue, newValue);
    }

    private static SObject mergeValue(
            final ISObjectBinaryOperator merger,
            final Object key,
            final SObject oldValue,
            final SObject newValue
    ) {
        Validate.validState(
                merger != null,
                Label.DuplicateKeyErrorMessage,
                new List<Object>{ key, oldValue, newValue }
        );
        return merger.apply(oldValue, newValue);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class PutToObjectByBoolMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByBoolMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) o);
            final Boolean key = (Boolean) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByBoolMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByBoolMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Boolean, SObject> m = ((Map<Boolean, SObject>) o);
            final Boolean key = (Boolean) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIdMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Id, Object> m = ((Map<Id, Object>) o);
            final Id key = (Id) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByIdMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByIdMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Id, SObject> m = ((Map<Id, SObject>) o);
            final Id key = (Id) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByStringMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByStringMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<String, Object> m = ((Map<String, Object>) o);
            final String key = (String) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByStringMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByStringMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<String, SObject> m = ((Map<String, SObject>) o);
            final String key = (String) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByBlobMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByBlobMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Blob, Object> m = ((Map<Blob, Object>) o);
            final Blob key = (Blob) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByBlobMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByBlobMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Blob, SObject> m = ((Map<Blob, SObject>) o);
            final Blob key = (Blob) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDateMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDateMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Date, Object> m = ((Map<Date, Object>) o);
            final Date key = (Date) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByDateMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByDateMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Date, SObject> m = ((Map<Date, SObject>) o);
            final Date key = (Date) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDatetimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDatetimeMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) o);
            final Datetime key = (Datetime) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByDatetimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByDatetimeMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Datetime, SObject> m = ((Map<Datetime, SObject>) o);
            final Datetime key = (Datetime) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByTimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByTimeMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Time, Object> m = ((Map<Time, Object>) o);
            final Time key = (Time) keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByTimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByTimeMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Time, SObject> m = ((Map<Time, SObject>) o);
            final Time key = (Time) keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIntMap extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByIntMap(
                ISObjectToIntFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Integer, Object> m = ((Map<Integer, Object>) o);
            final Integer key = keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByIntMap extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByIntMap(
                ISObjectToIntFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Integer, SObject> m = ((Map<Integer, SObject>) o);
            final Integer key = keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByLongMap extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByLongMap(
                ISObjectToLongFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Long, Object> m = ((Map<Long, Object>) o);
            final Long key = keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByLongMap extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByLongMap(
                ISObjectToLongFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Long, SObject> m = ((Map<Long, SObject>) o);
            final Long key = keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDoubleMap extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDoubleMap(
                ISObjectToDoubleFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Double, Object> m = ((Map<Double, Object>) o);
            final Double key = keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByDoubleMap extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByDoubleMap(
                ISObjectToDoubleFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Double, SObject> m = ((Map<Double, SObject>) o);
            final Double key = keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByObjectMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByObjectMap(
                ISObjectFunction keyMapper,
                ISObjectFunction valueMapper,
                IBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Object, Object> m = ((Map<Object, Object>) o);
            final Object key = keyMapper.apply(sObj);
            Object newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToSObjectByObjectMap extends ObjectSObjectConsumer {
        private final ISObjectFunction keyMapper;
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private PutToSObjectByObjectMap(
                ISObjectFunction keyMapper,
                ISObjectUnaryOperator valueMapper,
                ISObjectBinaryOperator merger
        ) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object o, SObject sObj) {
            final Map<Object, SObject> m = ((Map<Object, SObject>) o);
            final Object key = keyMapper.apply(sObj);
            SObject newValue = valueMapper.apply(sObj);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectsByBoolMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByBoolMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Boolean, Object> m = (Map<Boolean, Object>) container;
            final Boolean key = (Boolean) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByIdMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByIdMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Id, Object> m = (Map<Id, Object>) container;
            final Id key = (Id) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByStringMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByStringMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<String, Object> m = (Map<String, Object>) container;
            final String key = (String) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByBlobMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByBlobMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Blob, Object> m = (Map<Blob, Object>) container;
            final Blob key = (Blob) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByDateMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByDateMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Date, Object> m = (Map<Date, Object>) container;
            final Date key = (Date) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByDatetimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByDatetimeMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Datetime, Object> m = (Map<Datetime, Object>) container;
            final Datetime key = (Datetime) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByTimeMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByTimeMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Time, Object> m = (Map<Time, Object>) container;
            final Time key = (Time) classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByIntMap extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction classifier;
        private PutToObjectsByIntMap(ISObjectCollector downstream, ISObjectToIntFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Integer, Object> m = (Map<Integer, Object>) container;
            final Integer key = classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByLongMap extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction classifier;
        private PutToObjectsByLongMap(ISObjectCollector downstream, ISObjectToLongFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Long, Object> m = (Map<Long, Object>) container;
            final Long key = classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByDoubleMap extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction classifier;
        private PutToObjectsByDoubleMap(ISObjectCollector downstream, ISObjectToDoubleFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Double, Object> m = (Map<Double, Object>) container;
            final Double key = classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }

    private class PutToObjectsByObjectMap extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private PutToObjectsByObjectMap(ISObjectCollector downstream, ISObjectFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, SObject sObj) {
            final Map<Object, Object> m = (Map<Object, Object>) container;
            final Object key = classifier.apply(sObj);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), sObj);
        }
    }
    // @end-group
    //</editor-fold>

}
