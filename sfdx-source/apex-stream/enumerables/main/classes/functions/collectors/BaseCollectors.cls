/**
 * @description
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class BaseCollectors {

    @TestVisible
    protected BaseCollectors() {}

    /**
     * @description Returns a `Collector` that accumulates SObject input arguments
     * into a new `List<SObject>`.
     * <p>The result container can be cast to a specific `SObjectType`.</p>
     * <p>{@link IObjectEnumerable.collect(Collectors.toList())} can be replaced with
     * {@link ISObjectEnumerable.toList()}</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates SObjects into a List
     * List<SObject> sObjs = (List<SObject>) Stream.of(sObjects).collect(Collectors.toList());
     * List<Account> accs = (List<Account>) Stream.of(accounts).collect(Collectors.toList());
     */
    public static Collector toList() {
        return toList(Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates SObject input arguments
     * into a new `List<T>`.
     *
     * @param elementType the type of the element
     *
     * @return the `Collector`
     * 
     * @throws NullPointerException if `elementType` is null
     *
     * @example
     * // Accumulates Objects into a String List
     * List<String> strs = (List<String>) Stream.of(strings)
     *     .collect(Collectors.toList(String.class));
     * // is equivalent to
     * List<String> strs = (List<String>) Stream.of(strings)
     *     .collect(Collectors.toList().cast(List<String>.class));
     */
    public static Collector toList(final Type elementType) {
        Validate.notNull(elementType);
        return Collector.of(
            Supplier.of(Type.forName('List<' + elementType + '>')),
            BaseListObjectConsumers.addToList(Function.identity())
        );
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
        Validate.notNull(mapper);
        return Collector.of(Supplier.of(List<Object>.class), BaseListObjectConsumers.addToList(mapper));
    }

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
     * Double averageBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(Collectors.averagingLong(Functions.get('BillingLatitude')));
     */
    public static Collector averagingDouble(final IFunction mapper) {
        return Collector.of(
            BaseCollectorSuppliers.averagingDouble(),
            BaseListObjectConsumers.averagingDouble(mapper),
            BaseCollectorFunctions.averagingDouble()
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
     * Long sumOfBillingLatitude = (Long) Stream.of(accounts)
     *     .collect(Collectors.summingDouble(Functions.get('BillingLatitude')));
     */
    public static Collector summingDouble(final IFunction mapper) {
        return Collector.of(
            BaseCollectorSuppliers.averagingDouble(),
            BaseListObjectConsumers.averagingDouble(mapper),
            BaseCollectorFunctions.summingDouble()
        );
    }

}
