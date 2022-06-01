/**
 * @description Provides common class level implementations, and related utilities for
 * `Map<T, Object> - T` two-arity consumers. Typically is used by collectors.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class MapObjectConsumer extends BiConsumer {

    //<editor-fold desc="Put to Map<?, ?> BiConsumers">
    // @start-group Put to Map<?, ?> BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Boolean, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByBoolMap
     */
    public static BiConsumer putToObjectByBoolMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByBoolMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Id, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByIdMap
     */
    public static BiConsumer putToObjectByIdMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByIdMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<String, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByStringMap
     */
    public static BiConsumer putToObjectByStringMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByStringMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Blob, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByBlobMap
     */
    public static BiConsumer putToObjectByBlobMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByBlobMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Date, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByDateMap
     */
    public static BiConsumer putToObjectByDateMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDateMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Datetime, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByDatetimeMap
     */
    public static BiConsumer putToObjectByDatetimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDatetimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Datetime, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByDatetimeMap
     */
    public static BiConsumer putToObjectByTimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByTimeMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Integer, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByIntMap
     */
    public static BiConsumer putToObjectByIntMap(
            final IToIntFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByIntMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Long, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByLongMap
     */
    public static BiConsumer putToObjectByLongMap(
            final IToLongFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByLongMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Double, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toByDoubleMap
     */
    public static BiConsumer putToObjectByDoubleMap(
            final IToDoubleFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByDoubleMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Object, Object>` and puts an entry returned by the `keyMapper`
     * and `valueMapper`. If a key is already contained in the `Map` results
     * are merged using the provided `merger`.
     *
     * @param keyMapper the mapping function producing keys
     * @param valueMapper the mapping function producing values
     * @param merger the merge function to resolve possible key collisions
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalStateException if the the `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if the `keyMapper` or the `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toMap
     */
    public static BiConsumer putToObjectByObjectMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        Validate.notNull(keyMapper);
        Validate.notNull(valueMapper);
        return new PutToObjectByObjectMap(keyMapper, valueMapper, merger);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Put to Map<?, <?>> BiConsumers">
    // @start-group Put to Map<?, ?> BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Boolean, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByBool
     */
    public static BiConsumer putToObjectsByBoolMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByBoolMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Id, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingById
     */
    public static BiConsumer putToObjectsByIdMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByIdMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<String, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByString
     */
    public static BiConsumer putToObjectsByStringMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByStringMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Blob, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByBlob
     */
    public static BiConsumer putToObjectsByBlobMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByBlobMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Date, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByDate
     */
    public static BiConsumer putToObjectsByDateMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDateMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Datetime, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByDatetime
     */
    public static BiConsumer putToObjectsByDatetimeMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDatetimeMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Time, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByTime
     */
    public static BiConsumer putToObjectsByTimeMap(final ICollector downstream, final IFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByTimeMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Integer, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByInt
     */
    public static BiConsumer putToObjectsByIntMap(final ICollector downstream, final IToIntFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByIntMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Long, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByLong
     */
    public static BiConsumer putToObjectsByLongMap(final ICollector downstream, final IToLongFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByLongMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Double, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingByDouble
     */
    public static BiConsumer putToObjectsByDoubleMap(final ICollector downstream, final IToDoubleFunction classifier) {
        Validate.notNull(downstream);
        Validate.notNull(classifier);
        return new PutToObjectsByDoubleMap(downstream, classifier);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Object, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `downstream` or the `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.groupingBy
     */
    public static BiConsumer putToObjectsByObjectMap(final ICollector downstream, final IFunction classifier) {
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
            final Object newValue)
    {
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
    private class PutToObjectByBoolMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByBoolMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) container);
            final Boolean key = (Boolean) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIdMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByIdMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = ((Map<Id, Object>) container);
            final Id key = (Id) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByStringMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByStringMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = ((Map<String, Object>) container);
            final String key = (String) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByBlobMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByBlobMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = ((Map<Blob, Object>) container);
            final Blob key = (Blob) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDateMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDateMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = ((Map<Date, Object>) container);
            final Date key = (Date) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDatetimeMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) container);
            final Datetime key = (Datetime) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByTimeMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByTimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = ((Map<Time, Object>) container);
            final Time key = (Time) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIntMap extends BiConsumer {
        private final IToIntFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByIntMap(IToIntFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = ((Map<Integer, Object>) container);
            final Integer key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByLongMap extends BiConsumer {
        private final IToLongFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByLongMap(IToLongFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = ((Map<Long, Object>) container);
            final Long key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDoubleMap extends BiConsumer {
        private final IToDoubleFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByDoubleMap(IToDoubleFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = ((Map<Double, Object>) container);
            final Double key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByObjectMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBinaryOperator merger;
        private PutToObjectByObjectMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Object, Object> m = ((Map<Object, Object>) container);
            final Object key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectsByBoolMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByBoolMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = (Map<Boolean, Object>) container;
            final Boolean key = (Boolean) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIdMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByIdMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = (Map<Id, Object>) container;
            final Id key = (Id) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByStringMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByStringMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = (Map<String, Object>) container;
            final String key = (String) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByBlobMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByBlobMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = (Map<Blob, Object>) container;
            final Blob key = (Blob) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDateMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByDateMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = (Map<Date, Object>) container;
            final Date key = (Date) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDatetimeMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByDatetimeMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = (Map<Datetime, Object>) container;
            final Datetime key = (Datetime) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByTimeMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByTimeMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = (Map<Time, Object>) container;
            final Time key = (Time) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIntMap extends BiConsumer {
        private final IToIntFunction classifier;
        private PutToObjectsByIntMap(ICollector downstream, IToIntFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = (Map<Integer, Object>) container;
            final Integer key = classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByLongMap extends BiConsumer {
        private final IToLongFunction classifier;
        private PutToObjectsByLongMap(ICollector downstream, IToLongFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = (Map<Long, Object>) container;
            final Long key = classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDoubleMap extends BiConsumer {
        private final IToDoubleFunction classifier;
        private PutToObjectsByDoubleMap(ICollector downstream, IToDoubleFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = (Map<Double, Object>) container;
            final Double key = classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByObjectMap extends BiConsumer {
        private final IFunction classifier;
        private PutToObjectsByObjectMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Object, Object> m = (Map<Object, Object>) container;
            final Object key = classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }
    // @end-group
    //</editor-fold>

}
