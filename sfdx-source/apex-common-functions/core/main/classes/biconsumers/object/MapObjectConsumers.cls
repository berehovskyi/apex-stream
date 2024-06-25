/**
 * @description Provides common implementations of `Map<T, Object> - T` {@link BiConsumer}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see BiConsumer
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
@SuppressWarnings('PMD.CognitiveComplexity')
public virtual inherited sharing class MapObjectConsumers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected MapObjectConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByBoolMap
     */
    public static BiConsumer putToObjectByBoolMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByIdMap
     */
    public static BiConsumer putToObjectByIdMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByStringMap
     */
    public static BiConsumer putToObjectByStringMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByBlobMap
     */
    public static BiConsumer putToObjectByBlobMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByDateMap
     */
    public static BiConsumer putToObjectByDateMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByDatetimeMap
     */
    public static BiConsumer putToObjectByDatetimeMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByDatetimeMap
     */
    public static BiConsumer putToObjectByTimeMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByIntMap
     */
    public static BiConsumer putToObjectByIntMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByLongMap
     */
    public static BiConsumer putToObjectByLongMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByDoubleMap
     */
    public static BiConsumer putToObjectByDoubleMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
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
     * @throws IllegalStateException if `merger` is null and mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toByObjectMap
     */
    public static BiConsumer putToObjectByObjectMap(
        final IFunction keyMapper,
        final IFunction valueMapper,
        final IBiOperator merger
    ) {
        return new PutToObjectByObjectMap(keyMapper, valueMapper, merger);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `Map<Boolean, Object>` and groups input arguments according to a classification function.
     *
     * @param downstream the collector implementing the downstream reduction
     * @param classifier the classifier function mapping input elements to keys
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByBool
     */
    public static BiConsumer putToObjectsByBoolMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingById
     */
    public static BiConsumer putToObjectsByIdMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByString
     */
    public static BiConsumer putToObjectsByStringMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByBlob
     */
    public static BiConsumer putToObjectsByBlobMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByDate
     */
    public static BiConsumer putToObjectsByDateMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByDatetime
     */
    public static BiConsumer putToObjectsByDatetimeMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByTime
     */
    public static BiConsumer putToObjectsByTimeMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByInt
     */
    public static BiConsumer putToObjectsByIntMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByLong
     */
    public static BiConsumer putToObjectsByLongMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByDouble
     */
    public static BiConsumer putToObjectsByDoubleMap(final ICollector downstream, final IFunction classifier) {
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
     * @throws NullPointerException if `downstream` or `classifier` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.groupingByObject
     */
    public static BiConsumer putToObjectsByObjectMap(final ICollector downstream, final IFunction classifier) {
        return new PutToObjectsByObjectMap(downstream, classifier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Private Methods">
    // @start-group Private Methods
    @SuppressWarnings('PMD.ExcessiveParameterList')
    private static Object mergeValue(
        final IBiOperator merger,
        final Object key,
        final Object oldValue,
        final Object newValue
    ) {
        Validate.state(
            merger != null,
            Label.ACF_ErrorMessage_DuplicateKey,
            new List<Object>{ key, oldValue, newValue }
        );
        return merger.apply(oldValue, newValue);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class PutToMap extends BiConsumer {
        protected final IFunction keyMapper;
        protected final IFunction valueMapper;
        protected final IBiOperator merger;
        protected PutToMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            Validate.notNull(keyMapper);
            Validate.notNull(valueMapper);
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
    }

    private abstract class PutToDownstreamMap extends BiConsumer {
        protected final IFunction classifier;
        protected PutToDownstreamMap(ICollector downstream, IFunction classifier) {
            Validate.notNull(downstream);
            Validate.notNull(classifier);
            this.downstream = downstream;
            this.classifier = classifier;
        }
    }

    private class PutToObjectByBoolMap extends PutToMap {
        private PutToObjectByBoolMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) container);
            final Boolean key = (Boolean) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIdMap extends PutToMap {
        private PutToObjectByIdMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = ((Map<Id, Object>) container);
            final Id key = (Id) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByStringMap extends PutToMap {
        private PutToObjectByStringMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = ((Map<String, Object>) container);
            final String key = (String) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByBlobMap extends PutToMap {
        private PutToObjectByBlobMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = ((Map<Blob, Object>) container);
            final Blob key = (Blob) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDateMap extends PutToMap {
        private PutToObjectByDateMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = ((Map<Date, Object>) container);
            final Date key = (Date) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDatetimeMap extends PutToMap {
        private PutToObjectByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) container);
            final Datetime key = (Datetime) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByTimeMap extends PutToMap {
        private PutToObjectByTimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = ((Map<Time, Object>) container);
            final Time key = (Time) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIntMap extends PutToMap {
        private PutToObjectByIntMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = ((Map<Integer, Object>) container);
            final Integer key = (Integer) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByLongMap extends PutToMap {
        private PutToObjectByLongMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = ((Map<Long, Object>) container);
            final Long key = (Long) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDoubleMap extends PutToMap {
        private PutToObjectByDoubleMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = ((Map<Double, Object>) container);
            final Double key = (Double) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByObjectMap extends PutToMap {
        private PutToObjectByObjectMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            super(keyMapper, valueMapper, merger);
        }
        public override void accept(Object container, Object o) {
            final Map<Object, Object> m = ((Map<Object, Object>) container);
            final Object key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectsByBoolMap extends PutToDownstreamMap {
        private PutToObjectsByBoolMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = (Map<Boolean, Object>) container;
            final Boolean key = (Boolean) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIdMap extends PutToDownstreamMap {
        private PutToObjectsByIdMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = (Map<Id, Object>) container;
            final Id key = (Id) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByStringMap extends PutToDownstreamMap {
        private PutToObjectsByStringMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = (Map<String, Object>) container;
            final String key = (String) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByBlobMap extends PutToDownstreamMap {
        private PutToObjectsByBlobMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = (Map<Blob, Object>) container;
            final Blob key = (Blob) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDateMap extends PutToDownstreamMap {
        private PutToObjectsByDateMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = (Map<Date, Object>) container;
            final Date key = (Date) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDatetimeMap extends PutToDownstreamMap {
        private PutToObjectsByDatetimeMap(ICollector downstream, IFunction classifier) {
            super(downstream, classifier);
        }
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = (Map<Datetime, Object>) container;
            final Datetime key = (Datetime) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByTimeMap extends PutToDownstreamMap {
        private PutToObjectsByTimeMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = (Map<Time, Object>) container;
            final Time key = (Time) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIntMap extends PutToDownstreamMap {
        private PutToObjectsByIntMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = (Map<Integer, Object>) container;
            final Integer key = (Integer) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByLongMap extends PutToDownstreamMap {
        private PutToObjectsByLongMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = (Map<Long, Object>) container;
            final Long key = (Long) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDoubleMap extends PutToDownstreamMap {
        private PutToObjectsByDoubleMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = (Map<Double, Object>) container;
            final Double key = (Double) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByObjectMap extends PutToDownstreamMap {
        private PutToObjectsByObjectMap(ICollector downstream, IFunction classifier) { super(downstream, classifier); }
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
