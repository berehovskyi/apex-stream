/**
 * @description Provides common implementations of {@link Collector}
 * and related utilities.
 *
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class Collectors {

    @TestVisible
    private Collectors() {}

    //<editor-fold desc="Built-Ins">

    //<editor-fold desc="List<?> Collectors">
    // @start-group List<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates SObject input arguments
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific `Type`.</p>
     * <p>{@link IObjectIterable.collect(Collectors.toList())} can be replaced with
     * {@link IObjectIterable.toList()}</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates Objects into a List
     * List<Object> strs = (List<Object>) Stream.of(strings)
     *     .collect(Collectors.toList());
     * List<String> strs = (List<String>) Stream.of(strings)
     *     .collect(Collectors.toList().cast(List<String>.class));
     */
    public static Collector toList() {
        return Collector.of(Supplier.of(List<Object>.class), ListObjectBaseConsumers.addToList());
    }

    /**
     * @description Returns a `Collector` that accumulates the values returned by `mapper`
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link Collector.cast}.</p>
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a List
     * List<Object> names = (List<Object>) Stream.of(people)
     *     .collect(Collectors.toList(getNameFunction));
     * List<String> names = (List<String>) Stream.of(people)
     *     .collect(Collectors.toList(getNameFunction).cast(List<String>.class));
     */
    public static Collector toList(final IFunction mapper) {
        return Collector.of(Supplier.of(List<Object>.class), ListObjectConsumers.addToList(mapper));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Set<?> Collectors">
    // @start-group Set<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * <p>{@link IObjectIterable.collect(Collectors.toSet())} can be replaced with
     * {@link IObjectIterable.toSet()}</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Object> ppl = (Set<Object>) Stream.of(people).collect(Collectors.toSet());
     */
    public static Collector toSet() {
        return Collector.of(Supplier.of(Set<Object>.class), SetObjectConsumers.addToSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Boolean>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Boolean> bools = (Set<Boolean>) Stream.of(booleans).collect(Collectors.toBoolSet());
     */
    public static Collector toBoolSet() {
        return Collector.of(Supplier.of(Set<Boolean>.class), SetObjectConsumers.addToBoolSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Id>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Boolean> ids = (Set<Boolean>) Stream.of(ids).collect(Collectors.toIdSet());
     */
    public static Collector toIdSet() {
        return Collector.of(Supplier.of(Set<Id>.class), SetObjectConsumers.addToIdSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<String>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<String> strs = (Set<String>) Stream.of(strings).collect(Collectors.toStringSet());
     */
    public static Collector toStringSet() {
        return Collector.of(Supplier.of(Set<String>.class), SetObjectConsumers.addToStringSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Blob>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Blob> blbs = (Set<Blob>) Stream.of(blobs).collect(Collectors.toBlobSet());
     */
    public static Collector toBlobSet() {
        return Collector.of(Supplier.of(Set<Blob>.class), SetObjectConsumers.addToBlobSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Date>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Date> dts = (Set<Date>) Stream.of(dates).collect(Collectors.toDateSet());
     */
    public static Collector toDateSet() {
        return Collector.of(Supplier.of(Set<Date>.class), SetObjectConsumers.addToDateSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Datetime>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Datetime> dts = (Set<Datetime>) Stream.of(datetimes).collect(Collectors.toDatetimeSet());
     */
    public static Collector toDatetimeSet() {
        return Collector.of(Supplier.of(Set<Datetime>.class), SetObjectConsumers.addToDatetimeSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Time>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Time> tms = (Set<Time>) Stream.of(times).collect(Collectors.toTimeSet());
     */
    public static Collector toTimeSet() {
        return Collector.of(Supplier.of(Set<Time>.class), SetObjectConsumers.addToTimeSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Integer>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Integer> ints = (Set<Integer>) Stream.of(integers).collect(Collectors.toIntSet());
     */
    public static Collector toIntSet() {
        return Collector.of(Supplier.of(Set<Integer>.class), SetObjectConsumers.addToIntSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Long>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Long> ls = (Set<Long>) Stream.of(longs).collect(Collectors.toLongSet());
     */
    public static Collector toLongSet() {
        return Collector.of(Supplier.of(Set<Long>.class), SetObjectConsumers.addToLongSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Double>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<Double> ds = (Set<Double>) Stream.of(doubles).collect(Collectors.toDoubleSet());
     */
    public static Collector toDoubleSet() {
        return Collector.of(Supplier.of(Set<Double>.class), SetObjectConsumers.addToDoubleSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<SObject>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates input arguments into a List
     * Set<SObject> sObjects = (Set<SObject>) Stream.of(accounts).collect(Collectors.toSObjectSet());
     */
    public static Collector toSObjectSet() {
        return Collector.of(Supplier.of(Set<SObject>.class), SetObjectConsumers.addToSObjectSet());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<?, ?> Collectors">

    //<editor-fold desc="Map<Boolean, Object> Collectors">
    // @start-group Map<Boolean, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByBoolMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Boolean, Object> personByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getBoolProperty));
     * Map<Boolean, Comparable> personByBoolProperty = (Map<Boolean, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getBoolProperty).cast(Map<Boolean, Comparable>.class));
     */
    public static Collector toByBoolMap(final IFunction keyMapper) {
        return toByBoolMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByBoolMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty));
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty).cast(Map<Boolean, String>.class));
     */
    public static Collector toByBoolMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByBoolMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Boolean, String>.class));
     */
    public static Collector toByBoolMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByBoolMap(keyMapper, valueMapper, merger, Supplier.of(Map<Boolean, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Boolean, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Boolean, String>.class)
     *     ));
     */
    public static Collector toByBoolMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectByBoolMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, Object> Collectors">
    // @start-group Map<Id, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByIdMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Id, Object> personByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(getIdProperty));
     * Map<Id, Comparable> personByIdProperty = (Map<Id, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getIdProperty).cast(Map<Id, Comparable>.class));
     */
    public static Collector toByIdMap(final IFunction keyMapper) {
        return toByIdMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByIdMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(getIdProperty, getStringProperty));
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(getIdProperty, getStringProperty).cast(Map<Id, String>.class));
     */
    public static Collector toByIdMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByIdMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Id, String>.class));
     */
    public static Collector toByIdMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByIdMap(keyMapper, valueMapper, merger, Supplier.of(Map<Id, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Id, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collectors.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Id, String>.class)
     *     ));
     */
    public static Collector toByIdMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectByIdMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, Object> Collectors">
    // @start-group Map<String, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByStringMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<String, Object> personByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(getStringProperty));
     * Map<String, Comparable> personByStringProperty = (Map<String, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getStringProperty).cast(Map<String, Comparable>.class));
     */
    public static Collector toByStringMap(final IFunction keyMapper) {
        return toByStringMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByStringMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(getStringProperty, getStringProperty));
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(getStringProperty, getStringProperty).cast(Map<String, String>.class));
     */
    public static Collector toByStringMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByStringMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<String, String>.class));
     */
    public static Collector toByStringMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByStringMap(keyMapper, valueMapper, merger, Supplier.of(Map<String, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<String, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collectors.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<String, String>.class)
     *     ));
     */
    public static Collector toByStringMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectByStringMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, Object> Collectors">
    // @start-group Map<Blob, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByBlobMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, Object> personByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(getBlobProperty));
     * Map<Blob, Comparable> personByBlobProperty = (Map<Blob, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getBlobProperty).cast(Map<Blob, Comparable>.class));
     */
    public static Collector toByBlobMap(final IFunction keyMapper) {
        return toByBlobMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByBlobMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty));
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty).cast(Map<Blob, String>.class));
     */
    public static Collector toByBlobMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByBlobMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Blob, String>.class));
     */
    public static Collector toByBlobMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByBlobMap(keyMapper, valueMapper, merger, Supplier.of(Map<Blob, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Blob, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collectors.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Blob, String>.class)
     *     ));
     */
    public static Collector toByBlobMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectByBlobMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, Object> Collectors">
    // @start-group Map<Date, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDateMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Date, Object> personByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(getDateProperty));
     * Map<Date, Comparable> personByDateProperty = (Map<Date, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getDateProperty).cast(Map<Date, Comparable>.class));
     */
    public static Collector toByDateMap(final IFunction keyMapper) {
        return toByDateMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDateMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(getDateProperty, getStringProperty));
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(getDateProperty, getStringProperty).cast(Map<Date, String>.class));
     */
    public static Collector toByDateMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByDateMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Date, String>.class));
     */
    public static Collector toByDateMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDateMap(keyMapper, valueMapper, merger, Supplier.of(Map<Date, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Date, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collectors.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Date, String>.class)
     *     ));
     */
    public static Collector toByDateMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByDateMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, Object> Collectors">
    // @start-group Map<Datetime, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDatetimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, Object> personByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(getDatetimeProperty));
     * Map<Datetime, Comparable> personByDatetimeProperty = (Map<Datetime, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getDatetimeProperty).cast(Map<Datetime, Comparable>.class));
     */
    public static Collector toByDatetimeMap(final IFunction keyMapper) {
        return toByDatetimeMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDatetimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty));
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty)
     *         .cast(Map<Datetime, String>.class)
     *     );
     */
    public static Collector toByDatetimeMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByDatetimeMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Datetime, String>.class));
     */
    public static Collector toByDatetimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDatetimeMap(keyMapper, valueMapper, merger, Supplier.of(Map<Datetime, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Datetime, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collectors.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Datetime, String>.class)
     *     ));
     */
    public static Collector toByDatetimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByDatetimeMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, Object> Collectors">
    // @start-group Map<Time, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByTimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Time, Object> personByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(getTimeProperty));
     * Map<Time, Comparable> personByTimeProperty = (Map<Time, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getTimeProperty).cast(Map<Time, Comparable>.class));
     */
    public static Collector toByTimeMap(final IFunction keyMapper) {
        return toByTimeMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByTimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty));
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty).cast(Map<Time, String>.class));
     */
    public static Collector toByTimeMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toByTimeMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Time, String>.class));
     */
    public static Collector toByTimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByTimeMap(keyMapper, valueMapper, merger, Supplier.of(Map<Time, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Time, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Time, String>.class)
     *     ));
     */
    public static Collector toByTimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByTimeMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, Object> Collectors">
    // @start-group Map<Integer, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByIntMap(IToIntFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, Object> personByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(getIntProperty));
     * Map<Integer, Comparable> personByIntProperty = (Map<Integer, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(getIntProperty).cast(Map<Integer, Comparable>.class));
     */
    public static Collector toByIntMap(final IToIntFunction keyMapper) {
        return toByIntMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByIntMap(IToIntFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Object> stringPropertyByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(getIntProperty, getStringProperty));
     * Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(getIntProperty, getStringProperty).cast(Map<Integer, String>.class));
     */
    public static Collector toByIntMap(final IToIntFunction keyMapper, final IFunction valueMapper) {
        return toByIntMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Object> stringPropertyByTimeProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Integer, String> stringPropertyByTimeProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Integer, String>.class));
     */
    public static Collector toByIntMap(
            final IToIntFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByIntMap(keyMapper, valueMapper, merger, Supplier.of(Map<Integer, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Integer, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collectors.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Integer, String>.class)
     *     ));
     */
    public static Collector toByIntMap(
            final IToIntFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByIntMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, Object> Collectors">
    // @start-group Map<Long, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByLongMap(IToLongFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, Object> personByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(getLongProperty));
     * Map<Long, Comparable> personByLongProperty = (Map<Long, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getLongProperty).cast(Map<Long, Comparable>.class));
     */
    public static Collector toByLongMap(final IToLongFunction keyMapper) {
        return toByLongMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByLongMap(IToLongFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(getLongProperty, getStringProperty));
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(getLongProperty, getStringProperty).cast(Map<Long, String>.class));
     */
    public static Collector toByLongMap(final IToLongFunction keyMapper, final IFunction valueMapper) {
        return toByLongMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Long, String>.class));
     */
    public static Collector toByLongMap(
            final IToLongFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByLongMap(keyMapper, valueMapper, merger, Supplier.of(Map<Long, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Long, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collectors.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Long, String>.class)
     *     ));
     */
    public static Collector toByLongMap(
            final IToLongFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByLongMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, Object> Collectors">
    // @start-group Map<Double, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, Object> personByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(getDoubleProperty));
     * Map<Double, Comparable> personByDoubleProperty = (Map<Double, Comparable>) Stream.of(people)
     *     .collect(Collectors.toByBoolMap(getDoubleProperty).cast(Map<Double, Comparable>.class));
     */
    public static Collector toByDoubleMap(final IToDoubleFunction keyMapper) {
        return toByDoubleMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty));
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty).cast(Map<Double, String>.class));
     */
    public static Collector toByDoubleMap(final IToDoubleFunction keyMapper, final IFunction valueMapper) {
        return toByDoubleMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Double, String>.class));
     */
    public static Collector toByDoubleMap(
            final IToDoubleFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDoubleMap(keyMapper, valueMapper, merger, Supplier.of(Map<Double, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Double, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collectors.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Double, String>.class)
     *     ));
     */
    public static Collector toByDoubleMap(
            final IToDoubleFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByDoubleMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, Object> Collectors">
    // @start-group Map<Object, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys are values returned by `keyMapper`
     * and values are values of the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link Collectors.toByIdMap}, {@link Collectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Object, Object> personByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collectors.toMap(getTimeProperty));
     * Map<Object, Comparable> personByTimeProperty = (Map<Object, Comparable>) Stream.of(people)
     *     .collect(Collectors.toMap(getTimeProperty).cast(Map<Object, Comparable>.class));
     */
    public static Collector toMap(final IFunction keyMapper) {
        return toMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collectors.toMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link Collectors.toByIdMap}, {@link Collectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collectors.toMap(getTimeProperty, getStringProperty));
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collectors.toMap(getTimeProperty, getStringProperty).cast(Map<Object, String>.class));
     */
    public static Collector toMap(final IFunction keyMapper, final IFunction valueMapper) {
        return toMap(keyMapper, valueMapper, null);
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link Collectors.toByIdMap}, {@link Collectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collectors.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Object, String>.class));
     */
    public static Collector toMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toMap(keyMapper, valueMapper, merger, Supplier.of(Map<Object, Object>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Object, ?>`
     * into which the results are inserted
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collectors.toMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Object, String>.class)
     *     ));
     */
    public static Collector toMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumers.putToObjectByObjectMap(keyMapper, valueMapper, merger));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Grouping By Map<?, ?> Collectors">

    //<editor-fold desc="Grouping By Map<Boolean, ?> Collectors">
    // @start-group Map<Boolean, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, List<Object>> personsByBoolProperty = (Map<Boolean, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBool(getBoolProperty));
     * Map<Boolean, List<Comparable>> personsByBoolProperty = (Map<Boolean, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByBool(getBoolProperty).cast(Map<Boolean, List<Comparable>>.class));
     */
    public static Collector groupingByBool(final IFunction classifier) {
        return groupingByBool(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Object> personsByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByBool(
     *         getBoolProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBool(
     *         getBoolProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Boolean, Set<Object>>.class));
     */
    public static Collector groupingByBool(final IFunction classifier, final ICollector downstream) {
        return groupingByBool(classifier, Supplier.of(Map<Boolean, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Boolean, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBool(
     *         getBoolProperty,
     *         Supplier.of(Map<Boolean, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByBool(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByBoolMap(downstream, classifier),
                CollectorBaseFunctions.groupByBool(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Id, ?> Collectors">
    // @start-group Grouping By Map<Id, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, List<Object>> personsByIdProperty = (Map<Id, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingById(getIdProperty));
     * Map<Id, List<Comparable>> personsByIdProperty = (Map<Id, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingById(getIdProperty).cast(Map<Id, List<Comparable>>.class));
     */
    public static Collector groupingById(final IFunction classifier) {
        return groupingById(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, Object> personsByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collectors.groupingById(
     *         getIdProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingById(
     *         getIdProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Id, Set<Object>>.class));
     */
    public static Collector groupingById(final IFunction classifier, final ICollector downstream) {
        return groupingById(classifier, Supplier.of(Map<Id, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Id, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingById(
     *         getIdProperty,
     *         Supplier.of(Map<Id, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingById(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByIdMap(downstream, classifier),
                CollectorBaseFunctions.groupById(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<String, ?> Collectors">
    // @start-group Grouping By Map<String, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<String, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, List<Object>> personsByStringProperty = (Map<String, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByString(getStringProperty));
     * Map<String, List<Comparable>> personsByStringProperty = (Map<String, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByString(getStringProperty).cast(Map<String, List<Comparable>>.class));
     */
    public static Collector groupingByString(final IFunction classifier) {
        return groupingByString(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, Object> personsByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByString(
     *         getStringProperty,
     *         Collectors.toSet()
     *     ));
     * Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByString(
     *         getStringProperty,
     *         Collectors.toSet()
     *     ).cast(Map<String, Set<Object>>.class));
     */
    public static Collector groupingByString(final IFunction classifier, final ICollector downstream) {
        return groupingByString(classifier, Supplier.of(Map<String, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<String, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByString(
     *         getStringProperty,
     *         Supplier.of(Map<String, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByString(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByStringMap(downstream, classifier),
                CollectorBaseFunctions.groupByString(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Blob, ?> Collectors">
    // @start-group Grouping By Map<Blob, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, List<Object>> personsByBlobProperty = (Map<Blob, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBlob(getBlobProperty));
     * Map<Blob, List<Comparable>> personsByBlobProperty = (Map<Blob, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByBlob(getBlobProperty).cast(Map<Blob, List<Comparable>>.class));
     */
    public static Collector groupingByBlob(final IFunction classifier) {
        return groupingByBlob(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Object> personsByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByBlob(
     *         getBlobProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBlob(
     *         getBlobProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Blob, Set<Object>>.class));
     */
    public static Collector groupingByBlob(final IFunction classifier, final ICollector downstream) {
        return groupingByBlob(classifier, Supplier.of(Map<Blob, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Blob, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByBlob(
     *         getBlobProperty,
     *         Supplier.of(Map<Blob, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByBlob(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByBlobMap(downstream, classifier),
                CollectorBaseFunctions.groupByBlob(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Date, ?> Collectors">
    // @start-group Grouping By Map<Date, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, List<Object>> personsByDateProperty = (Map<Date, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDate(getDateProperty));
     * Map<Date, List<Comparable>> personsByDateProperty = (Map<Date, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByDate(getDateProperty).cast(Map<Date, List<Comparable>>.class));
     */
    public static Collector groupingByDate(final IFunction classifier) {
        return groupingByDate(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, Object> personsByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByDate(
     *         getDateProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDate(
     *         getDateProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Date, Set<Object>>.class));
     */
    public static Collector groupingByDate(final IFunction classifier, final ICollector downstream) {
        return groupingByDate(classifier, Supplier.of(Map<Date, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Date, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDate(
     *         getDateProperty,
     *         Supplier.of(Map<Date, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByDate(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByDateMap(downstream, classifier),
                CollectorBaseFunctions.groupByDate(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Datetime, ?> Collectors">
    // @start-group Grouping By Map<Datetime, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, List<Object>> personsByDatetimeProperty = (Map<Datetime, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDatetime(getDatetimeProperty));
     * Map<Datetime, List<Comparable>> personsByDatetimeProperty = (Map<Datetime, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByDatetime(getDatetimeProperty).cast(Map<Datetime, List<Comparable>>.class));
     */
    public static Collector groupingByDatetime(final IFunction classifier) {
        return groupingByDatetime(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Object> personsByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByDatetime(
     *         getDatetimeProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDatetime(
     *         getDatetimeProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Datetime, Set<Object>>.class));
     */
    public static Collector groupingByDatetime(final IFunction classifier, final ICollector downstream) {
        return groupingByDatetime(classifier, Supplier.of(Map<Datetime, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Datetime, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDatetime(
     *         getDatetimeProperty,
     *         Supplier.of(Map<Datetime, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByDatetime(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByDatetimeMap(downstream, classifier),
                CollectorBaseFunctions.groupByDatetime(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Time, ?> Collectors">
    // @start-group Grouping By Map<Time, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, List<Object>> personsByTimeProperty = (Map<Time, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByTime(getTimeProperty));
     * Map<Time, List<Comparable>> personsByTimeProperty = (Map<Time, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByTime(getTimeProperty).cast(Map<Time, List<Comparable>>.class));
     */
    public static Collector groupingByTime(final IFunction classifier) {
        return groupingByTime(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, Object> personsByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByTime(
     *         getTimeProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByTime(
     *         getTimeProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Time, Set<Object>>.class));
     */
    public static Collector groupingByTime(final IFunction classifier, final ICollector downstream) {
        return groupingByTime(classifier, Supplier.of(Map<Time, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Time, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByTime(
     *         getTimeProperty,
     *         Supplier.of(Map<Time, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByTime(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByTimeMap(downstream, classifier),
                CollectorBaseFunctions.groupByTime(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Integer, ?> Collectors">
    // @start-group Grouping By Map<Integer, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, List<Object>> personsByIntProperty = (Map<Integer, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByInt(getIntProperty));
     * Map<Integer, List<Comparable>> personsByIntProperty = (Map<Integer, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByInt(getIntProperty).cast(Map<Integer, List<Comparable>>.class));
     */
    public static Collector groupingByInt(final IToIntFunction classifier) {
        return groupingByInt(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Object> personsByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByInt(
     *         getIntProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Integer, Set<Object>> personsByTimeProperty = (Map<Integer, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByInt(
     *         getIntProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Integer, Set<Object>>.class));
     */
    public static Collector groupingByInt(final IToIntFunction classifier, final ICollector downstream) {
        return groupingByInt(classifier, Supplier.of(Map<Integer, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Integer, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Set<Object>> personsByIntProperty = (Map<Integer, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByInt(
     *         getIntProperty,
     *         Supplier.of(Map<Integer, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByInt(
            final IToIntFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByIntMap(downstream, classifier),
                CollectorBaseFunctions.groupByInt(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Long, ?> Collectors">
    // @start-group Grouping By Map<Long, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, List<Object>> personsByLongProperty = (Map<Long, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByLong(getLongProperty));
     * Map<Long, List<Comparable>> personsByLongProperty = (Map<Long, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByLong(getLongProperty).cast(Map<Long, List<Comparable>>.class));
     */
    public static Collector groupingByLong(final IToLongFunction classifier) {
        return groupingByLong(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, Object> personsByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByLong(
     *         getLongProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByLong(
     *         getLongProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Long, Set<Object>>.class));
     */
    public static Collector groupingByLong(final IToLongFunction classifier, final ICollector downstream) {
        return groupingByLong(classifier, Supplier.of(Map<Long, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Long, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByLong(
     *         getLongProperty,
     *         Supplier.of(Map<Long, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByLong(
            final IToLongFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByLongMap(downstream, classifier),
                CollectorBaseFunctions.groupByLong(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Double, ?> Collectors">
    // @start-group Grouping By Map<Double, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, List<Object>> personsByDoubleProperty = (Map<Double, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDouble(getDoubleProperty));
     * Map<Double, List<Comparable>> personsByDoubleProperty = (Map<Double, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingByDouble(getDoubleProperty).cast(Map<Double, List<Comparable>>.class));
     */
    public static Collector groupingByDouble(final IToDoubleFunction classifier) {
        return groupingByDouble(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, Object> personsByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collectors.groupingByDouble(
     *         getDoubleProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDouble(
     *         getDoubleProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Double, Set<Object>>.class));
     */
    public static Collector groupingByDouble(final IToDoubleFunction classifier, final ICollector downstream) {
        return groupingByDouble(classifier, Supplier.of(Map<Double, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Double, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingByDouble(
     *         getDoubleProperty,
     *         Supplier.of(Map<Double, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingByDouble(
            final IToDoubleFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByDoubleMap(downstream, classifier),
                CollectorBaseFunctions.groupByDouble(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Grouping By Map<Double, ?> Collectors">
    // @start-group Grouping By Map<Double, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link Collectors.groupingById}, {@link Collectors.groupingByString}, etc.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, List<Object>> personsByTimeProperty = (Map<Object, List<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingBy(getTimeProperty));
     * Map<Object, List<Comparable>> personsByTimeProperty = (Map<Object, List<Comparable>>) Stream.of(people)
     *     .collect(Collectors.groupingBy(getTimeProperty).cast(Map<Object, List<Comparable>>.class));
     */
    public static Collector groupingBy(final IFunction classifier) {
        return groupingBy(classifier, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link Collectors.groupingById}, {@link Collectors.groupingByString}, etc.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, Object> personsByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collectors.groupingBy(
     *         getTimeProperty,
     *         Collectors.toSet()
     *     ));
     * Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingBy(
     *         getTimeProperty,
     *         Collectors.toSet()
     *     ).cast(Map<Object, Set<Object>>.class));
     */
    public static Collector groupingBy(final IFunction classifier, final ICollector downstream) {
        return groupingBy(classifier, Supplier.of(Map<Object, Object>.class), downstream);
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Object, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
     *     .collect(Collectors.groupingBy(
     *         getTimeProperty,
     *         Supplier.of(Map<Object, Set<Object>>.class),
     *         Collectors.toSet()
     *     ));
     */
    public static Collector groupingBy(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumers.putToObjectsByObjectMap(downstream, classifier),
                CollectorBaseFunctions.groupByObject(downstream.finisher())
        );
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Partitioning By Collectors">
    // @start-group Partitioning By Collectors
    /**
     * @description Returns a `Collector` that partitions the SObject input arguments
     * according to `predicate` and organizes them into a `Map<Boolean, Object>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param predicate the predicate that classifies input arguments (true or false)
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, Object> personsPartitionedByPredicate = (Map<Boolean, Object>)
     *     Stream.of(people)
     *         .collect(Collectors.partitioningBy(predicate));
     * Map<Boolean, List<Comparable>> personsPartitionedByPredicate = (Map<Boolean, List<Comparable>>)
     *     Stream.of(people)
     *         .collect(Collectors.partitioningBy(predicate).cast(Map<Boolean, List<Comparable>>.class));
     */
    public static Collector partitioningBy(final IPredicate predicate) {
        return partitioningBy(predicate, Collectors.toList());
    }

    /**
     * @description Returns a `Collector` that partitions the SObject input arguments
     * according to `predicate` and organizes them into a `Map<Boolean, Object>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param predicate the predicate that classifies input arguments (true or false)
     * @param downstream the downstream reduction collector
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `predicate` or `downstream` is null
     *
     * @example
     * Map<Boolean, Set<String>> personNamesPartitionedByPredicate = (Map<Boolean, Set<String>>)
     *     Stream.of(people)
     *         .collect(Collectors.partitioningBy(
     *             predicate,
     *             Collectors.toStringSet(getStringProperty)
     *         ).cast(Map<Boolean, Set<String>>.class));
     */
    public static Collector partitioningBy(final IPredicate predicate, final ICollector downstream) {
        return Collector.of(
                Supplier.of(Map<Boolean, Object>.class),
                MapObjectConsumers.putToObjectsByBoolMap(
                        downstream,
                        Function.compose(predicate)
                ),
                downstream.finisher()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Joining">
    // @start-group Joining
    /**
     * @description Returns a `Collector` that concatenates String input arguments.
     *
     * @return the `Collector`
     *
     * @example
     * String concatenatedStrings = (String) Stream.of(strings).collect(Collectors.joining());
     */
    public static Collector joining() {
        return joining('');
    }

    /**
     * @description Returns a `Collector` that concatenates String input arguments,
     * separated by `delimiter`.
     *
     * @param delimiter the delimiter between each element
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `delimiter` is null
     *
     * @example
     * String concatenatedStrings = (String) Stream.of(strings).collect(Collectors.joining('; '));
     */
    public static Collector joining(final String delimiter) {
        return joining(delimiter, '', '');
    }

    /**
     * @description Returns a `Collector` that concatenates String input arguments,
     * separated by `delimiter`.
     *
     * @param delimiter the delimiter between each element
     * @param prefix the prefix
     * @param suffix the suffix
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `delimiter`, `prefix` or `suffix` is null
     *
     * @example
     * String concatenatedStrings = (String) Stream.of(strings)
     *     .collect(Collectors.joining('; ', 'prefix', 'suffix'));
     */
    public static Collector joining(final String delimiter, final String prefix, final String suffix) {
        return Collector.of(
                CollectorBaseSuppliers.joiningString(),
                ListObjectConsumers.joining(delimiter, prefix),
                CollectorBaseFunctions.append(suffix)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Int Collectors">
    // @start-group Int Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Integer value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageOfIntProperties = (Double) Stream.of(people)
     *     .collect(Collectors.averagingInt(getIntProperty));
     */
    public static Collector averagingInt(final IToIntFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.averagingInt(),
                ListObjectConsumers.averagingInt(mapper),
                CollectorBaseFunctions.averagingInt()
        );
    }

    /**
     * @description Returns a `Collector` that counts the number of input elements.
     * If no elements are present, the result is 0.
     *
     * @return the `Collector`
     *
     * @example
     * Integer numberOfPeople = (Integer) Stream.of(people).collect(Collectors.counting());
     */
    public static Collector counting() {
        return summingInt(ToIntFunction.compose(Function.constant(1)));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Integer value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Integer sumOfIntProperties = (Integer) Stream.of(people)
     *     .collect(Collectors.summingInt(getIntProperty));
     */
    public static Collector summingInt(final IToIntFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.summingInt(),
                ListObjectConsumers.summingInt(mapper),
                ListFunctions.get(0)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Long Collectors">
    // @start-group Long Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageOfLongProperties = (Double) Stream.of(people)
     *     .collect(Collectors.averagingLong(getLongProperty));
     */
    public static Collector averagingLong(final IToLongFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.averagingLong(),
                ListObjectConsumers.averagingLong(mapper),
                CollectorBaseFunctions.averagingLong()
        );
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Long sumOfLongProperties = (Long) Stream.of(people)
     *     .collect(Collectors.summingLong(getLongProperty));
     */
    public static Collector summingLong(final IToLongFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.summingLong(),
                ListObjectConsumers.summingLong(mapper),
                ListFunctions.get(0)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Double Collectors">
    // @start-group Double Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Double value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageOfDoubleProperties = (Double) Stream.of(people)
     *     .collect(Collectors.averagingDouble(getDoubleProperty));
     */
    public static Collector averagingDouble(final IToDoubleFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.averagingDouble(),
                ListObjectConsumers.averagingDouble(mapper),
                CollectorBaseFunctions.averagingDouble()
        );
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Double value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double sumOfDoubleProperties = (Double) Stream.of(people)
     *     .collect(Collectors.summingDouble(getDoubleProperty));
     */
    public static Collector summingDouble(final IToDoubleFunction mapper) {
        return Collector.of(
                CollectorBaseSuppliers.summingDouble(),
                ListObjectConsumers.summingDouble(mapper),
                CollectorBaseFunctions.summingDouble()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Collectors">
    // @start-group Intermediate Collectors
    /**
     * @description Adapts a `Collector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     *
     * @param predicate the predicate to test input arguments
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * // Get people matched by predicate
     * List<Object> filteredPeople = (List<Object>) Stream.of(people)
     *     .collect(Collectors.filtering(predicate));
     * // Group people matched by predicate
     * Map<String, List<Comparable>> filteredPeopleByStringProperty =
     *     (Map<String, List<Comparable>>) Stream.of(people)
     *        .collect(
     *             Collectors.groupingByString(
     *                 getStringProperty,
     *                 Collectors.filtering(predicate)
     *        ).cast(Map<String, List<Comparable>>.class));
     */
    public static Collector filtering(final IPredicate predicate) {
        return filtering(predicate, Collectors.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     *
     * @param predicate the predicate to test input arguments
     * @param downstream the collector that accumulates only matched values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * // Get people String properties matched by predicate
     * List<String> filteredStringProperties = (List<String>) Stream.of(people)
     *     .collect(Collectors.filtering(
     *         predicate,
     *         Collectors.toList(getStringProperty)
     *     ).cast(List<String>.class));
     */
    public static Collector filtering(final IPredicate predicate, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumers.filtering(predicate, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     *
     * @param mapper the function to return the value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(people)
     *         .collect(Collectors.mapping(getStringProperty).cast(List<String>.class));
     */
    public static Collector mapping(final IFunction mapper) {
        return mapping(mapper, Collectors.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     *
     * @param mapper the function to return the value to accumulate
     * @param downstream the collector which accepts mapped values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * Map<String, Set<String>> otherStringPropertiesByStringProperty = (Map<String, Set<String>>)
     *     Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getStringProperty,
     *             Collectors.mapping(
     *                 getOtherStringProperty,
     *                 Collectors.toStringSet()
     *             )
     *         ).cast(Map<String, Set<String>>.class));
     */
    public static Collector mapping(final IFunction mapper, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumers.mapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element before accumulation.
     *
     * @param mapper the function which must produce `Iterable<Object>`
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * List<String> flattenedStringProperties = (List<String>) Stream.of(people)
     *     .collect(Collectors.flatMapping(getStringListProperty).cast(List<String>.class));
     * Map<String, List<String>> flattenedStringPropertiesByOtherStringProperty
     *     = (Map<String, List<String>>) Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getOtherStringProperty,
     *             Collectors.flatMapping(getStringListProperty)
     *         ).cast(Map<String, List<String>>.class));
     */
    public static Collector flatMapping(final IFunction mapper) {
        return flatMapping(mapper, Collectors.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element before accumulation.
     *
     * @param mapper the function which must produce `Iterable<Object>`
     * @param downstream the collector which accepts mapped values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * Set<String> contacts = (Set<String>) Stream.of(people)
     *     .collect(Collectors.flatMapping(
     *         getStringListProperty,
     *         Collectors.toStringSet()
     *     ));
     * Map<String, Set<String>> flattenedStringPropertiesByOtherStringProperty
     *    = (Map<String, Set<String>>) Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getOtherStringProperty,
     *             Collectors.flatMapping(
     *                 getStringListProperty,
     *                 Collectors.toStringSet()
     *         )).cast(Map<String, Set<String>>.class));
     */
    public static Collector flatMapping(final IFunction mapper, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumers.flatMapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Returns a `Collector` which performs a reduction of its input elements
     * under `accumulator` using `identity`.
     *
     * @param identity the identity value for the reduction
     * @param accumulator the input arguments reducer
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Person personWithSummedIntProperties = (Person) Stream.of(people)
     *     .collect(Collectors.reducing(
     *         new Person(IntProperty = 0),
     *         sumIntPropertyReducer
     *      ));
     */
    public static Collector reducing(final Object identity, final IBinaryOperator accumulator) {
        return Collector.of(
                CollectorSuppliers.box(identity),
                ListObjectConsumers.reducing(accumulator),
                ListFunctions.get(0)
        );
    }

    /**
     * @description Returns a `Collector` which performs a reduction of its input elements
     * under `mapper` function and `accumulator`.
     *
     * @param identity the identity value for the reduction
     * @param mapper the function to return the value to accumulate
     * @param accumulator the input arguments reducer
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` or `accumulator` is null
     *
     * @example
     * Person personWithSummedIntProperties = (Person) Stream.of(people)
     *     .collect(Collectors.reducing(
     *         new Person(IntProperty = 0),
     *         Function.identity(),
     *         sumIntPropertyReducer
     *      ));
     */
    public static Collector reducing(final Object identity, IFunction mapper, final IBinaryOperator accumulator) {
        return Collector.of(
                CollectorSuppliers.box(identity),
                ListObjectConsumers.reducing(accumulator, mapper),
                ListFunctions.get(0)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Optional Collectors">
    // @start-group Optional Collectors
    /**
     * @description Returns a `Collector` which performs a reduction of its input elements
     * under `accumulator`. The result is described as an `Optional`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>
     *
     * @param accumulator the input arguments reducer
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getStringProperty,
     *             Collectors.reducing(BinaryOperator.maxBy(Comparator.comparing(getIntProperty)))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
     */
    public static Collector reducing(final IBinaryOperator accumulator) {
        return Collector.of(
                Supplier.of(List<Object>.class),
                ListObjectConsumers.reducingOptional(accumulator),
                CollectorFunctions.reducingOptional()
        );
    }

    /**
     * @description Returns a `Collector` which produces the maximal element
     * according to `comparator`. The result is described as an `Optional`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>
     *
     * @param comparator the comparator
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `comparator` is null
     *
     * @example
     * Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getStringProperty,
     *             Collectors.maximizing(Comparator.comparing(getIntProperty))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
     */
    public static Collector maximizing(final IComparator comparator) {
        return reducing(BinaryOperator.maxBy(comparator));
    }

    /**
     * @description Returns a `Collector` which produces the minimal element
     * according to `comparator`. The result is described as an `Optional`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>
     *
     * @param comparator the comparator
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `comparator` is null
     *
     * @example
     * Map<String, Object> optionalPersonWithMinIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collectors.groupingByString(
     *             getStringProperty,
     *             Collectors.minimizing(Comparator.comparing(getIntProperty))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMinIntPropertyByStringProperty.get('SomePropertyValues').get();
     */
    public static Collector minimizing(final IComparator comparator) {
        return reducing(BinaryOperator.minBy(comparator));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>
    
}
