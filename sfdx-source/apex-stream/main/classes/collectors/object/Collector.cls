/**
 * @author O. Berehovskyi
 * @group Collectors
 * @description Inherits {@link ICollector} interface and provides default methods,
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class Collector implements ICollector {

    //<editor-fold desc="Functions">
    // @start-group Functions
    public abstract ISupplier supplier();

    public abstract IBiConsumer accumulator();

    public abstract IFunction finisher();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `Collector` by the given `supplier` and `accumulator`.
     * @param supplier the supplier function for the `Collector`
     * @param accumulator the accumulator function for the `Collector`
     * @return the `Collector`
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static Collector of(final ISupplier supplier, final IBiConsumer accumulator) {
        return of(supplier, accumulator, null);
    }

    /**
     * @description Returns a `Collector` by the given `supplier`, `accumulator`,
     * and `finisher`.
     * @param supplier the supplier function for the `Collector`
     * @param accumulator the accumulator function for the `Collector`
     * @param finisher the final transformation function for the `Collector`
     * @return the `Collector`
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static Collector of(final ISupplier supplier, final IBiConsumer accumulator, final IFunction finisher) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        return new CollectorOf(supplier, accumulator, finisher);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a `Collector` that recursively reconstructs collector's suppliers
     * and returns a new `Collector` according to a given container type.
     * <p>Supports casting list type for methods:</p>
     * <ul>
     *     <li>{@link #toList()}</li>
     *     <li>{@link #toList(IFunction)}</li>
     * </ul>
     * <p>Supports casting map value type (but not map key type) for methods:</p>
     * <ul>
     *     <li>{@link #toBy<T>map(IFunction)}</li>
     *     <li>{@link #groupingBy<T>(IFunction)}</li>
     *     <li>{@link #partitioningBy(IPredicate)}</li>
     *     <li>{@link #partitioningBy(IPredicate, ICollector)}</li>
     * </ul>
     * @example
     * Collector.toList(getNameFunction).cast(List<String>.class);
     * @param t the Type to cast the result container to
     * @return the `Collector`
     * @throws NullPointerException if `t` is null
     * @throws TypeException if invalid `t` is provided
     */
    public virtual Collector cast(final Type t) {
        Validate.notNull(t);
        BiConsumer accumulator = (BiConsumer) this.accumulator();
        String typeName = String.valueOf(t);
        while (accumulator?.downstream != null) {
            typeName = typeName.substringAfter(',').substringBeforeLast('>');
            if (!typeName.startsWith('Map') && !typeName.startsWith('List') && !typeName.startsWith('Set')) { break; }
            accumulator.downstream = new CollectorOf(
                    Supplier.of(Type.forName(typeName)),
                    accumulator.downstream.accumulator(),
                    accumulator.downstream.finisher()
            );
            accumulator = (BiConsumer) accumulator.downstream?.accumulator();
        }
        return new CollectorOf(Supplier.of(t), this.accumulator(), this.finisher());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">

    //<editor-fold desc="List<?> Collectors">
    // @start-group List<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates SObject input arguments
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific `Type`.</p>
     * <p>{@link IObjectIterable.collect(Collector.toList())} can be replaced with
     * {@link IObjectIterable.toList()}</p>
     * @example
     * // Accumulates Objects into a List
     * List<Object> strs = (List<Object>) Stream.of(strings)
     *     .collect(Collector.toList());
     * List<String> strs = (List<String>) Stream.of(strings)
     *     .collect(Collector.toList().cast(List<String>.class));
     * @return the `Collector`
     */
    public static Collector toList() {
        return Collector.of(Supplier.of(List<Object>.class), ListObjectConsumer.addToList());
    }

    /**
     * @description Returns a `Collector` that accumulates the values returned by `mapper`
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link Collector.cast}.</p>
     * @example
     * // Accumulates values returned by mapper into a List
     * List<Object> names = (List<Object>) Stream.of(people)
     *     .collect(Collector.toList(getNameFunction));
     * List<String> names = (List<String>) Stream.of(people)
     *     .collect(Collector.toList(getNameFunction).cast(List<String>.class));
     * @param mapper the function that returns values to accumulate
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector toList(final IFunction mapper) {
        return Collector.of(Supplier.of(List<Object>.class), ListObjectConsumer.addToList(mapper));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Set<?> Collectors">
    // @start-group Set<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * <p>{@link IObjectIterable.collect(Collector.toSet())} can be replaced with
     * {@link IObjectIterable.toSet()}</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Object> ppl = (Set<Object>) Stream.of(people).collect(Collector.toSet());
     * @return the `Collector`
     */
    public static Collector toSet() {
        return Collector.of(Supplier.of(Set<Object>.class), SetObjectConsumer.addToSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Boolean>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Boolean> bools = (Set<Boolean>) Stream.of(booleans).collect(Collector.toBoolSet());
     * @return the `Collector`
     */
    public static Collector toBoolSet() {
        return Collector.of(Supplier.of(Set<Boolean>.class), SetObjectConsumer.addToBoolSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Id>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Boolean> ids = (Set<Boolean>) Stream.of(ids).collect(Collector.toIdSet());
     * @return the `Collector`
     */
    public static Collector toIdSet() {
        return Collector.of(Supplier.of(Set<Id>.class), SetObjectConsumer.addToIdSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<String>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<String> strs = (Set<String>) Stream.of(strings).collect(Collector.toStringSet());
     * @return the `Collector`
     */
    public static Collector toStringSet() {
        return Collector.of(Supplier.of(Set<String>.class), SetObjectConsumer.addToStringSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Blob>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Blob> blbs = (Set<Blob>) Stream.of(blobs).collect(Collector.toBlobSet());
     * @return the `Collector`
     */
    public static Collector toBlobSet() {
        return Collector.of(Supplier.of(Set<Blob>.class), SetObjectConsumer.addToBlobSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Date>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Date> dts = (Set<Date>) Stream.of(dates).collect(Collector.toDateSet());
     * @return the `Collector`
     */
    public static Collector toDateSet() {
        return Collector.of(Supplier.of(Set<Date>.class), SetObjectConsumer.addToDateSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Datetime>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Datetime> dts = (Set<Datetime>) Stream.of(datetimes).collect(Collector.toDatetimeSet());
     * @return the `Collector`
     */
    public static Collector toDatetimeSet() {
        return Collector.of(Supplier.of(Set<Datetime>.class), SetObjectConsumer.addToDatetimeSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Time>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Time> tms = (Set<Time>) Stream.of(times).collect(Collector.toTimeSet());
     * @return the `Collector`
     */
    public static Collector toTimeSet() {
        return Collector.of(Supplier.of(Set<Time>.class), SetObjectConsumer.addToTimeSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Integer>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Integer> ints = (Set<Integer>) Stream.of(integers).collect(Collector.toIntSet());
     * @return the `Collector`
     */
    public static Collector toIntSet() {
        return Collector.of(Supplier.of(Set<Integer>.class), SetObjectConsumer.addToIntSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Long>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Long> ls = (Set<Long>) Stream.of(longs).collect(Collector.toLongSet());
     * @return the `Collector`
     */
    public static Collector toLongSet() {
        return Collector.of(Supplier.of(Set<Long>.class), SetObjectConsumer.addToLongSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<Double>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<Double> ds = (Set<Double>) Stream.of(doubles).collect(Collector.toDoubleSet());
     * @return the `Collector`
     */
    public static Collector toDoubleSet() {
        return Collector.of(Supplier.of(Set<Double>.class), SetObjectConsumer.addToDoubleSet());
    }

    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `Set<SObject>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>
     * @example
     * // Accumulates input arguments into a List
     * Set<SObject> sObjects = (Set<SObject>) Stream.of(accounts).collect(Collector.toSObjectSet());
     * @return the `Collector`
     */
    public static Collector toSObjectSet() {
        return Collector.of(Supplier.of(Set<SObject>.class), SetObjectConsumer.addToSObjectSet());
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
     * use {@link Collector.toByBoolMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Boolean, Object> personByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getBoolProperty));
     * Map<Boolean, Comparable> personByBoolProperty = (Map<Boolean, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getBoolProperty).cast(Map<Boolean, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByBoolMap(final IFunction keyMapper) {
        return toByBoolMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByBoolMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getBoolProperty, getStringProperty));
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getBoolProperty, getStringProperty).cast(Map<Boolean, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Boolean, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(
     *         getBoolProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Boolean, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Boolean, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByBoolMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectByBoolMap(keyMapper, valueMapper, merger)
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
     * use {@link Collector.toByIdMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Id, Object> personByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collector.toByIdMap(getIdProperty));
     * Map<Id, Comparable> personByIdProperty = (Map<Id, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getIdProperty).cast(Map<Id, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByIdMap(final IFunction keyMapper) {
        return toByIdMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByIdMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collector.toByIdMap(getIdProperty, getStringProperty));
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collector.toByIdMap(getIdProperty, getStringProperty).cast(Map<Id, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collector.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collector.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Id, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
     *     .collect(Collector.toByIdMap(
     *         getIdProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Id, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Id, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByIdMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectByIdMap(keyMapper, valueMapper, merger)
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
     * use {@link Collector.toByStringMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<String, Object> personByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collector.toByStringMap(getStringProperty));
     * Map<String, Comparable> personByStringProperty = (Map<String, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getStringProperty).cast(Map<String, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByStringMap(final IFunction keyMapper) {
        return toByStringMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByStringMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collector.toByStringMap(getStringProperty, getStringProperty));
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collector.toByStringMap(getStringProperty, getStringProperty).cast(Map<String, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collector.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collector.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<String, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
     *     .collect(Collector.toByStringMap(
     *         getStringProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<String, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<String, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByStringMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectByStringMap(keyMapper, valueMapper, merger)
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
     * use {@link Collector.toByBlobMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, Object> personByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(getBlobProperty));
     * Map<Blob, Comparable> personByBlobProperty = (Map<Blob, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getBlobProperty).cast(Map<Blob, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByBlobMap(final IFunction keyMapper) {
        return toByBlobMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByBlobMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(getBlobProperty, getStringProperty));
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(getBlobProperty, getStringProperty).cast(Map<Blob, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Blob, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
     *     .collect(Collector.toByBlobMap(
     *         getBlobProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Blob, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Blob, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByBlobMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectByBlobMap(keyMapper, valueMapper, merger)
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
     * use {@link Collector.toByDateMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Date, Object> personByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collector.toByDateMap(getDateProperty));
     * Map<Date, Comparable> personByDateProperty = (Map<Date, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getDateProperty).cast(Map<Date, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByDateMap(final IFunction keyMapper) {
        return toByDateMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByDateMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collector.toByDateMap(getDateProperty, getStringProperty));
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collector.toByDateMap(getDateProperty, getStringProperty).cast(Map<Date, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collector.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collector.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Date, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
     *     .collect(Collector.toByDateMap(
     *         getDateProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Date, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Date, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByDateMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByDateMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toByDatetimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, Object> personByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(getDatetimeProperty));
     * Map<Datetime, Comparable> personByDatetimeProperty = (Map<Datetime, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getDatetimeProperty).cast(Map<Datetime, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByDatetimeMap(final IFunction keyMapper) {
        return toByDatetimeMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByDatetimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(getDatetimeProperty, getStringProperty));
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(getDatetimeProperty, getStringProperty).cast(Map<Datetime, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Datetime, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
     *     .collect(Collector.toByDatetimeMap(
     *         getDatetimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Datetime, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Datetime, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByDatetimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByDatetimeMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toByTimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Time, Object> personByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(getTimeProperty));
     * Map<Time, Comparable> personByTimeProperty = (Map<Time, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getTimeProperty).cast(Map<Time, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByTimeMap(final IFunction keyMapper) {
        return toByTimeMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByTimeMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(getTimeProperty, getStringProperty));
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(getTimeProperty, getStringProperty).cast(Map<Time, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Time, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Time, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Time, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByTimeMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByTimeMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toByIntMap(IToIntFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, Object> personByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collector.toByIntMap(getIntProperty));
     * Map<Integer, Comparable> personByIntProperty = (Map<Integer, Comparable>) Stream.of(people)
     *     .collect(Collector.toByIntMap(getIntProperty).cast(Map<Integer, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByIntMap(final IToIntFunction keyMapper) {
        return toByIntMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByIntMap(IToIntFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Object> stringPropertyByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collector.toByIntMap(getIntProperty, getStringProperty));
     * Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collector.toByIntMap(getIntProperty, getStringProperty).cast(Map<Integer, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Object> stringPropertyByTimeProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collector.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Integer, String> stringPropertyByTimeProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collector.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Integer, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
     *     .collect(Collector.toByIntMap(
     *         getIntProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Integer, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Integer, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByIntMap(
            final IToIntFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByIntMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toByLongMap(IToLongFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Long, Object> personByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collector.toByLongMap(getLongProperty));
     * Map<Long, Comparable> personByLongProperty = (Map<Long, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getLongProperty).cast(Map<Long, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByLongMap(final IToLongFunction keyMapper) {
        return toByLongMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByLongMap(IToLongFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collector.toByLongMap(getLongProperty, getStringProperty));
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collector.toByLongMap(getLongProperty, getStringProperty).cast(Map<Long, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collector.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collector.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Long, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
     *     .collect(Collector.toByLongMap(
     *         getLongProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Long, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Long, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByLongMap(
            final IToLongFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByLongMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Double, Object> personByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(getDoubleProperty));
     * Map<Double, Comparable> personByDoubleProperty = (Map<Double, Comparable>) Stream.of(people)
     *     .collect(Collector.toByBoolMap(getDoubleProperty).cast(Map<Double, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toByDoubleMap(final IToDoubleFunction keyMapper) {
        return toByDoubleMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(getDoubleProperty, getStringProperty));
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(getDoubleProperty, getStringProperty).cast(Map<Double, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Double, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
     *     .collect(Collector.toByDoubleMap(
     *         getDoubleProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Double, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Double, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toByDoubleMap(
            final IToDoubleFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByDoubleMap(keyMapper, valueMapper, merger));
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
     * use {@link Collector.toMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link Collector.toByIdMap}, {@link Collector.toByStringMap}, etc.</p>
     * @example
     * // Maps values by keys provided by field
     * Map<Object, Object> personByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collector.toMap(getTimeProperty));
     * Map<Object, Comparable> personByTimeProperty = (Map<Object, Comparable>) Stream.of(people)
     *     .collect(Collector.toMap(getTimeProperty).cast(Map<Object, Comparable>.class));
     * @param keyMapper the field value to accumulate as key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
     */
    public static Collector toMap(final IFunction keyMapper) {
        return toMap(keyMapper, Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the input arguments.
     * If the mapped keys might have duplicates,
     * use {@link Collector.toMap(IFunction, IFunction, IBinaryOperator)} instead.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link Collector.toByIdMap}, {@link Collector.toByStringMap}, etc.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collector.toMap(getTimeProperty, getStringProperty));
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collector.toMap(getTimeProperty, getStringProperty).cast(Map<Object, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     * @throws IllegalStateException if mapped keys contain duplicates
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
     * such as {@link Collector.toByIdMap}, {@link Collector.toByStringMap}, etc.</p>
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ));
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collector.toByTimeMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right()
     *     ).cast(Map<Object, String>.class));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
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
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
     *     .collect(Collector.toMap(
     *         getTimeProperty,
     *         getStringProperty,
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Object, String>.class)
     *     ));
     * @param keyMapper the field value to accumulate as key
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Object, ?>`
     * into which the results are inserted
     * @return the `Collector`
     * @throws NullPointerException if `keyMapper`, `valueMapper` or `mapSupplier` is null
     */
    public static Collector toMap(
            final IFunction keyMapper,
            final IFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return Collector.of(mapSupplier, MapObjectConsumer.putToObjectByObjectMap(keyMapper, valueMapper, merger));
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
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, List<Object>> personsByBoolProperty = (Map<Boolean, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBool(getBoolProperty));
     * Map<Boolean, List<Comparable>> personsByBoolProperty = (Map<Boolean, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByBool(getBoolProperty).cast(Map<Boolean, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByBool(final IFunction classifier) {
        return groupingByBool(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Object> personsByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
     *     .collect(Collector.groupingByBool(
     *         getBoolProperty,
     *         Collector.toSet()
     *     ));
     * Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBool(
     *         getBoolProperty,
     *         Collector.toSet()
     *     ).cast(Map<Boolean, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBool(
     *         getBoolProperty,
     *         Supplier.of(Map<Boolean, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Boolean, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByBool(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByBoolMap(downstream, classifier),
                CollectorFunction.groupByBool(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Id, List<Object>> personsByIdProperty = (Map<Id, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingById(getIdProperty));
     * Map<Id, List<Comparable>> personsByIdProperty = (Map<Id, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingById(getIdProperty).cast(Map<Id, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingById(final IFunction classifier) {
        return groupingById(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Id, Object> personsByIdProperty = (Map<Id, Object>) Stream.of(people)
     *     .collect(Collector.groupingById(
     *         getIdProperty,
     *         Collector.toSet()
     *     ));
     * Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingById(
     *         getIdProperty,
     *         Collector.toSet()
     *     ).cast(Map<Id, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingById(
     *         getIdProperty,
     *         Supplier.of(Map<Id, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Id, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingById(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByIdMap(downstream, classifier),
                CollectorFunction.groupById(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<String, List<Object>> personsByStringProperty = (Map<String, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByString(getStringProperty));
     * Map<String, List<Comparable>> personsByStringProperty = (Map<String, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByString(getStringProperty).cast(Map<String, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByString(final IFunction classifier) {
        return groupingByString(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<String, Object> personsByStringProperty = (Map<String, Object>) Stream.of(people)
     *     .collect(Collector.groupingByString(
     *         getStringProperty,
     *         Collector.toSet()
     *     ));
     * Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByString(
     *         getStringProperty,
     *         Collector.toSet()
     *     ).cast(Map<String, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByString(
     *         getStringProperty,
     *         Supplier.of(Map<String, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<String, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByString(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByStringMap(downstream, classifier),
                CollectorFunction.groupByString(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Blob, List<Object>> personsByBlobProperty = (Map<Blob, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBlob(getBlobProperty));
     * Map<Blob, List<Comparable>> personsByBlobProperty = (Map<Blob, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByBlob(getBlobProperty).cast(Map<Blob, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByBlob(final IFunction classifier) {
        return groupingByBlob(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Object> personsByBlobProperty = (Map<Blob, Object>) Stream.of(people)
     *     .collect(Collector.groupingByBlob(
     *         getBlobProperty,
     *         Collector.toSet()
     *     ));
     * Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBlob(
     *         getBlobProperty,
     *         Collector.toSet()
     *     ).cast(Map<Blob, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByBlob(
     *         getBlobProperty,
     *         Supplier.of(Map<Blob, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Blob, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByBlob(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByBlobMap(downstream, classifier),
                CollectorFunction.groupByBlob(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Date, List<Object>> personsByDateProperty = (Map<Date, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDate(getDateProperty));
     * Map<Date, List<Comparable>> personsByDateProperty = (Map<Date, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByDate(getDateProperty).cast(Map<Date, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByDate(final IFunction classifier) {
        return groupingByDate(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Date, Object> personsByDateProperty = (Map<Date, Object>) Stream.of(people)
     *     .collect(Collector.groupingByDate(
     *         getDateProperty,
     *         Collector.toSet()
     *     ));
     * Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDate(
     *         getDateProperty,
     *         Collector.toSet()
     *     ).cast(Map<Date, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDate(
     *         getDateProperty,
     *         Supplier.of(Map<Date, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Date, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByDate(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByDateMap(downstream, classifier),
                CollectorFunction.groupByDate(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, List<Object>> personsByDatetimeProperty = (Map<Datetime, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDatetime(getDatetimeProperty));
     * Map<Datetime, List<Comparable>> personsByDatetimeProperty = (Map<Datetime, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByDatetime(getDatetimeProperty).cast(Map<Datetime, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByDatetime(final IFunction classifier) {
        return groupingByDatetime(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Object> personsByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
     *     .collect(Collector.groupingByDatetime(
     *         getDatetimeProperty,
     *         Collector.toSet()
     *     ));
     * Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDatetime(
     *         getDatetimeProperty,
     *         Collector.toSet()
     *     ).cast(Map<Datetime, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDatetime(
     *         getDatetimeProperty,
     *         Supplier.of(Map<Datetime, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Datetime, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByDatetime(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByDatetimeMap(downstream, classifier),
                CollectorFunction.groupByDatetime(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Time, List<Object>> personsByTimeProperty = (Map<Time, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByTime(getTimeProperty));
     * Map<Time, List<Comparable>> personsByTimeProperty = (Map<Time, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByTime(getTimeProperty).cast(Map<Time, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByTime(final IFunction classifier) {
        return groupingByTime(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Time, Object> personsByTimeProperty = (Map<Time, Object>) Stream.of(people)
     *     .collect(Collector.groupingByTime(
     *         getTimeProperty,
     *         Collector.toSet()
     *     ));
     * Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByTime(
     *         getTimeProperty,
     *         Collector.toSet()
     *     ).cast(Map<Time, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByTime(
     *         getTimeProperty,
     *         Supplier.of(Map<Time, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Time, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByTime(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByTimeMap(downstream, classifier),
                CollectorFunction.groupByTime(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Integer, List<Object>> personsByIntProperty = (Map<Integer, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByInt(getIntProperty));
     * Map<Integer, List<Comparable>> personsByIntProperty = (Map<Integer, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByInt(getIntProperty).cast(Map<Integer, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByInt(final IToIntFunction classifier) {
        return groupingByInt(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Object> personsByIntProperty = (Map<Integer, Object>) Stream.of(people)
     *     .collect(Collector.groupingByInt(
     *         getIntProperty,
     *         Collector.toSet()
     *     ));
     * Map<Integer, Set<Object>> personsByTimeProperty = (Map<Integer, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByInt(
     *         getIntProperty,
     *         Collector.toSet()
     *     ).cast(Map<Integer, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Set<Object>> personsByIntProperty = (Map<Integer, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByInt(
     *         getIntProperty,
     *         Supplier.of(Map<Integer, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Integer, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByInt(
            final IToIntFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByIntMap(downstream, classifier),
                CollectorFunction.groupByInt(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Long, List<Object>> personsByLongProperty = (Map<Long, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByLong(getLongProperty));
     * Map<Long, List<Comparable>> personsByLongProperty = (Map<Long, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByLong(getLongProperty).cast(Map<Long, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByLong(final IToLongFunction classifier) {
        return groupingByLong(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Long, Object> personsByLongProperty = (Map<Long, Object>) Stream.of(people)
     *     .collect(Collector.groupingByLong(
     *         getLongProperty,
     *         Collector.toSet()
     *     ));
     * Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByLong(
     *         getLongProperty,
     *         Collector.toSet()
     *     ).cast(Map<Long, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByLong(
     *         getLongProperty,
     *         Supplier.of(Map<Long, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Long, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByLong(
            final IToLongFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByLongMap(downstream, classifier),
                CollectorFunction.groupByLong(downstream.finisher())
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
     * @example
     * // Group values by keys provided by function
     * Map<Double, List<Object>> personsByDoubleProperty = (Map<Double, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDouble(getDoubleProperty));
     * Map<Double, List<Comparable>> personsByDoubleProperty = (Map<Double, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingByDouble(getDoubleProperty).cast(Map<Double, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingByDouble(final IToDoubleFunction classifier) {
        return groupingByDouble(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Double, Object> personsByDoubleProperty = (Map<Double, Object>) Stream.of(people)
     *     .collect(Collector.groupingByDouble(
     *         getDoubleProperty,
     *         Collector.toSet()
     *     ));
     * Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDouble(
     *         getDoubleProperty,
     *         Collector.toSet()
     *     ).cast(Map<Double, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingByDouble(
     *         getDoubleProperty,
     *         Supplier.of(Map<Double, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Double, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingByDouble(
            final IToDoubleFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByDoubleMap(downstream, classifier),
                CollectorFunction.groupByDouble(downstream.finisher())
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
     * such as {@link Collector.groupingById}, {@link Collector.groupingByString}, etc.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Object, List<Object>> personsByTimeProperty = (Map<Object, List<Object>>) Stream.of(people)
     *     .collect(Collector.groupingBy(getTimeProperty));
     * Map<Object, List<Comparable>> personsByTimeProperty = (Map<Object, List<Comparable>>) Stream.of(people)
     *     .collect(Collector.groupingBy(getTimeProperty).cast(Map<Object, List<Comparable>>.class));
     * @param classifier the function that returns keys
     * @return the `Collector`
     * @throws NullPointerException if `classifier` is null
     */
    public static Collector groupingBy(final IFunction classifier) {
        return groupingBy(classifier, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` Collector.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link Collector.groupingById}, {@link Collector.groupingByString}, etc.</p>
     * @example
     * // Group values by keys provided by function
     * Map<Object, Object> personsByTimeProperty = (Map<Object, Object>) Stream.of(people)
     *     .collect(Collector.groupingBy(
     *         getTimeProperty,
     *         Collector.toSet()
     *     ));
     * Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingBy(
     *         getTimeProperty,
     *         Collector.toSet()
     *     ).cast(Map<Object, Set<Object>>.class));
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier` or `downstream` is null
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
     * @example
     * // Group values by keys provided by function
     * Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
     *     .collect(Collector.groupingBy(
     *         getTimeProperty,
     *         Supplier.of(Map<Object, Set<Object>>.class),
     *         Collector.toSet()
     *     ));
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Object, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     */
    public static Collector groupingBy(
            final IFunction classifier,
            final ISupplier mapSupplier,
            final ICollector downstream
    ) {
        return Collector.of(
                mapSupplier,
                MapObjectConsumer.putToObjectsByObjectMap(downstream, classifier),
                CollectorFunction.groupByObject(downstream.finisher())
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
     * @example
     * Map<Boolean, Object> personsPartitionedByPredicate = (Map<Boolean, Object>)
     *     Stream.of(people)
     *         .collect(Collector.partitioningBy(predicate));
     * Map<Boolean, List<Comparable>> personsPartitionedByPredicate = (Map<Boolean, List<Comparable>>)
     *     Stream.of(people)
     *         .collect(Collector.partitioningBy(predicate).cast(Map<Boolean, List<Comparable>>.class));
     * @param predicate the predicate that classifies input arguments (true or false)
     * @return the `Collector`
     * @throws NullPointerException if `predicate` is null
     */
    public static Collector partitioningBy(final IPredicate predicate) {
        return partitioningBy(predicate, Collector.toList());
    }

    /**
     * @description Returns a `Collector` that partitions the SObject input arguments
     * according to `predicate` and organizes them into a `Map<Boolean, Object>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * @example
     * Map<Boolean, Set<String>> personNamesPartitionedByPredicate = (Map<Boolean, Set<String>>)
     *     Stream.of(people)
     *         .collect(Collector.partitioningBy(
     *             predicate,
     *             Collector.toStringSet(getStringProperty)
     *         ).cast(Map<Boolean, Set<String>>.class));
     * @param predicate the predicate that classifies input arguments (true or false)
     * @param downstream the downstream reduction collector
     * @return the `Collector`
     * @throws NullPointerException if `predicate` or `downstream` is null
     */
    public static Collector partitioningBy(final IPredicate predicate, final ICollector downstream) {
        return Collector.of(
                Supplier.of(Map<Boolean, Object>.class),
                MapObjectConsumer.putToObjectsByBoolMap(
                        downstream,
                        Function.forPredicate(predicate)
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
    * @example
    * String concatenatedStrings = (String) Stream.of(strings).collect(Collector.joining());
    * @return the `Collector`
    */
    public static Collector joining() {
        return joining('');
    }

    /**
    * @description Returns a `Collector` that concatenates String input arguments,
    * separated by `delimiter`.
    * @example
    * String concatenatedStrings = (String) Stream.of(strings).collect(Collector.joining('; '));
    * @param delimiter the delimiter between each element
    * @return the `Collector`
    * @throws NullPointerException if `delimiter` is null
    */
    public static Collector joining(final String delimiter) {
        return joining(delimiter, '', '');
    }

    /**
    * @description Returns a `Collector` that concatenates String input arguments,
    * separated by `delimiter`.
    * @example
    * String concatenatedStrings = (String) Stream.of(strings)
    *     .collect(Collector.joining('; ', 'prefix', 'suffix'));
    * @param delimiter the delimiter between each element
    * @param prefix the prefix
    * @param suffix the suffix
    * @return the `Collector`
    * @throws NullPointerException if `delimiter`, `prefix` or `suffix` is null
    */
    public static Collector joining(final String delimiter, final String prefix, final String suffix) {
        return Collector.of(
                Supplier.joiningString(),
                ListObjectConsumer.joining(delimiter, prefix),
                CollectorFunction.append(suffix)
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
     * @example
     * Double averageOfIntProperties = (Double) Stream.of(people)
     *     .collect(Collector.averagingInt(getIntProperty));
     * @param mapper the function extracting the Integer value to average
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector averagingInt(final IToIntFunction mapper) {
        return Collector.of(
                Supplier.averagingInt(),
                ListObjectConsumer.averagingInt(mapper),
                CollectorFunction.averagingInt()
        );
    }

    /**
     * @description Returns a `Collector` that counts the number of input elements.
     * If no elements are present, the result is 0.
     * @example
     * Integer numberOfPeople = (Integer) Stream.of(people).collect(Collector.counting());
     * @return the `Collector`
     */
    public static Collector counting() {
        return summingInt(ToIntFunction.downcast(Function.constant(1)));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     * @example
     * Integer sumOfIntProperties = (Integer) Stream.of(people)
     *     .collect(Collector.summingInt(getIntProperty));
     * @param mapper the function extracting the Integer value to sum
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector summingInt(final IToIntFunction mapper) {
        return Collector.of(
                Supplier.summingInt(),
                ListObjectConsumer.summingInt(mapper),
                ListFunction.get(0)
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
     * @example
     * Double averageOfLongProperties = (Double) Stream.of(people)
     *     .collect(Collector.averagingLong(getLongProperty));
     * @param mapper the function extracting the Long value to average
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector averagingLong(final IToLongFunction mapper) {
        return Collector.of(
                Supplier.averagingLong(),
                ListObjectConsumer.averagingLong(mapper),
                CollectorFunction.averagingLong()
        );
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     * @example
     * Long sumOfLongProperties = (Long) Stream.of(people)
     *     .collect(Collector.summingLong(getLongProperty));
     * @param mapper the function extracting the Long value to sum
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector summingLong(final IToLongFunction mapper) {
        return Collector.of(
                Supplier.summingLong(),
                ListObjectConsumer.summingLong(mapper),
                ListFunction.get(0)
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
     * @example
     * Double averageOfDoubleProperties = (Double) Stream.of(people)
     *     .collect(Collector.averagingDouble(getDoubleProperty));
     * @param mapper the function extracting the Double value to average
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector averagingDouble(final IToDoubleFunction mapper) {
        return Collector.of(
                Supplier.averagingDouble(),
                ListObjectConsumer.averagingDouble(mapper),
                CollectorFunction.averagingDouble()
        );
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     * @example
     * Double sumOfDoubleProperties = (Double) Stream.of(people)
     *     .collect(Collector.summingDouble(getDoubleProperty));
     * @param mapper the function extracting the Double value to sum
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector summingDouble(final IToDoubleFunction mapper) {
        return Collector.of(
                Supplier.summingDouble(),
                ListObjectConsumer.summingDouble(mapper),
                CollectorFunction.summingDouble()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Collectors">
    // @start-group Intermediate Collectors
    /**
     * @description Adapts a `Collector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     * @example
     * // Get people matched by predicate
     * List<Object> filteredPeople = (List<Object>) Stream.of(people)
     *     .collect(Collector.filtering(predicate));
     * // Group people matched by predicate
     * Map<String, List<Comparable>> filteredPeopleByStringProperty =
     *     (Map<String, List<Comparable>>) Stream.of(people)
     *        .collect(
     *             Collector.groupingByString(
     *                 getStringProperty,
     *                 Collector.filtering(predicate)
     *        ).cast(Map<String, List<Comparable>>.class));
     * @param predicate the predicate to test input arguments
     * @return the `Collector`
     * @throws NullPointerException if `predicate` is null
     */
    public static Collector filtering(final IPredicate predicate) {
        return filtering(predicate, Collector.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     * @example
     * // Get people String properties matched by predicate
     * List<String> filteredStringProperties = (List<String>) Stream.of(people)
     *     .collect(Collector.filtering(
     *         predicate,
     *         Collector.toList(getStringProperty)
     *     ).cast(List<String>.class));
     * @param predicate the predicate to test input arguments
     * @param downstream the collector that accumulates only matched values
     * @return the `Collector`
     * @throws NullPointerException if `predicate` is null
     */
    public static Collector filtering(final IPredicate predicate, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumer.filtering(predicate, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(people)
     *         .collect(Collector.mapping(getStringProperty).cast(List<String>.class));
     * @param mapper the function to return the value to accumulate
     * @return the `Collector`
     * @throws NullPointerException if `mapper` is null
     */
    public static Collector mapping(final IFunction mapper) {
        return mapping(mapper, Collector.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     * @example
     * Map<String, Set<String>> otherStringPropertiesByStringProperty = (Map<String, Set<String>>)
     *     Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getStringProperty,
     *             Collector.mapping(
     *                 getOtherStringProperty,
     *                 Collector.toStringSet()
     *             )
     *         ).cast(Map<String, Set<String>>.class));
     * @param mapper the function to return the value to accumulate
     * @param downstream the collector which accepts mapped values
     * @return the `Collector`
     * @throws NullPointerException if `mapper` or `downstream` is null
     */
    public static Collector mapping(final IFunction mapper, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumer.mapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of 
     * replacing each input element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element before accumulation.
     * @example
     * List<String> flattenedStringProperties = (List<String>) Stream.of(people)
     *     .collect(
     *         Collector.flatMapping(getStringListProperty)
     *     ).cast(List<String>.class));
     * 
     * Map<String, List<String>> flattenedStringPropertiesByOtherStringProperty
     *     = (Map<String, List<String>>) Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getOtherStringProperty,
     *             Collector.flatMapping(getStringListProperty)
     *         ).cast(Map<String, List<String>>.class));
     * @param mapper the function which must produce `Iterable<Object>`
     * @return the `Collector`
     * @throws NullPointerException if `mapper` or `downstream` is null
     */
    public static Collector flatMapping(final IFunction mapper) {
        return flatMapping(mapper, Collector.toList());
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of 
     * replacing each input element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element before accumulation.
     * @example
     * Set<String> contacts = (Set<String>) Stream.of(people)
     *     .collect(Collector.flatMapping(
     *         getStringListProperty,
     *         Collector.toStringSet()
     *     ));
     *     
     * Map<String, Set<String>> flattenedStringPropertiesByOtherStringProperty
     *    = (Map<String, Set<String>>) Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getOtherStringProperty,
     *             Collector.flatMapping(
     *                 getStringListProperty,
     *                 Collector.toStringSet()
     *         ).cast(Map<String, Set<String>>.class));
     * @param mapper the function which must produce `Iterable<Object>`
     * @param downstream the collector which accepts mapped values
     * @return the `Collector`
     * @throws NullPointerException if `mapper` or `downstream` is null
     */
    public static Collector flatMapping(final IFunction mapper, final ICollector downstream) {
        return Collector.of(
                downstream.supplier(),
                BiConsumer.flatMapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Returns a `Collector` which performs a reduction of its input elements
     * under `accumulator` using `identity`.
     * @example
     * Person personWithSummedIntProperties = (Person) Stream.of(people)
     *     .collect(Collector.reducing(
     *         new Person(IntProperty = 0),
     *         sumIntPropertyReducer
     *      ));
     * @param identity the identity value for the reduction
     * @param accumulator the input arguments reducer
     * @return the `Collector`
     * @throws NullPointerException if `accumulator` is null
     */
    public static Collector reducing(final Object identity, final IBinaryOperator accumulator) {
        return Collector.of(Supplier.box(identity), ListObjectConsumer.reducing(accumulator), ListFunction.get(0));
    }

    /**
     * @description Returns a `Collector` which performs a reduction of its input elements
     * under `mapper` function and `accumulator`.
     * @example
     * Person personWithSummedIntProperties = (Person) Stream.of(people)
     *     .collect(Collector.reducing(
     *         new Person(IntProperty = 0),
     *         Function.identity(),
     *         sumIntPropertyReducer
     *      ));
     * @param identity the identity value for the reduction
     * @param mapper the function to return the value to accumulate
     * @param accumulator the input arguments reducer
     * @return the `Collector`
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static Collector reducing(final Object identity, IFunction mapper, final IBinaryOperator accumulator) {
        return Collector.of(
                Supplier.box(identity),
                ListObjectConsumer.reducing(accumulator, mapper),
                ListFunction.get(0)
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
     * @example
     * Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getStringProperty,
     *             Collector.reducing(BinaryOperator.maxBy(Comparator.comparing(getIntProperty)))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
     * @param accumulator the input arguments reducer
     * @return the `Collector`
     * @throws NullPointerException if `accumulator` is null
     */
    public static Collector reducing(final IBinaryOperator accumulator) {
        return Collector.of(
                Supplier.of(List<Object>.class),
                ListObjectConsumer.reducingOptional(accumulator),
                CollectorFunction.reducingOptional()
        );
    }

    /**
     * @description Returns a `Collector` which produces the maximal element
     * according to `comparator`. The result is described as an `Optional`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>
     * @example
     * Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getStringProperty,
     *             Collector.maximizing(Comparator.comparing(getIntProperty)))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
     * @param comparator the comparator
     * @return the `Collector`
     * @throws NullPointerException if `comparator` is null
     */
    public static Collector maximizing(final IComparator comparator) {
        return reducing(BinaryOperator.maxBy(comparator));
    }

    /**
     * @description Returns a `Collector` which produces the minimal element
     * according to `comparator`. The result is described as an `Optional`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>
     * @example
     * Map<String, Object> optionalPersonWithMinIntPropertyByStringProperty = (Map<String, Object>)
     *     Stream.of(people)
     *         .collect(Collector.groupingByString(
     *             getStringProperty,
     *             Collector.minimizing(Comparator.comparing(getIntProperty))
     *         ));
     * Person personWithMaxIntProperty = (Person)
     *     optionalPersonWithMinIntPropertyByStringProperty.get('SomePropertyValues').get();
     * @param comparator the comparator
     * @return the `Collector`
     * @throws NullPointerException if `comparator` is null
     */
    public static Collector minimizing(final IComparator comparator) {
        return reducing(BinaryOperator.minBy(comparator));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class CollectorOf extends Collector {
        private final ISupplier supplier;
        private final IBiConsumer accumulator;
        private final IFunction finisher;
        private CollectorOf(ISupplier supplier, IBiConsumer accumulator, IFunction finisher) {
            this.supplier = supplier;
            this.accumulator = accumulator;
            this.finisher = finisher;
        }
        public override ISupplier supplier() { return supplier; }
        public override IBiConsumer accumulator() { return accumulator; }
        public override IFunction finisher() { return finisher; }
    }
    // @end-group
    //</editor-fold>

}
