/**
 * @description Provides base implementations of {@link Collector}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseCollectors {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseCollectors() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Collector` that accumulates input arguments
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link Collector.cast}.</p>
     * <p>{@link IEnumerable.collect(BaseCollectors.toList())} can be replaced with
     * {@link IEnumerable.toList()}</p>
     *
     * @return the `Collector`
     *
     * @example
     * // Accumulates SObjects into a List
     * List<Object> people = (List<Object>) [ObjectEnumerable].of(persons)
     *     .collect(BaseCollectors.toList());
     * List<Account> accs = (List<Account>) [SObjectEnumerable].of(accounts)
     *     .collect(BaseCollectors.toList().cast(List<Account>.class));
     */
    public static Collector toList() {
        return toList(Function.identity());
    }

    /**
     * @description Returns a `Collector` that accumulates `T` input arguments
     * into a new `List<T>`.
     * <p>The result container can be cast to a specific `Type`.</p>
     *
     * @param elementType the type of the element
     *
     * @return the `Collector`
     * 
     * @throws NullPointerException if `elementType` is null
     *
     * @example
     * // Accumulates Objects into a String List
     * List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
     *     .collect(BaseCollectors.toList(String.class));
     * // is equivalent to
     * List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
     *     .collect(BaseCollectors.toList().cast(List<String>.class));
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
     * List<Object> names = (List<Object>) [ObjectEnumerable].of(people)
     *     .collect(BaseCollectors.toList(getNameFunction));
     * List<String> names = (List<String>) [ObjectEnumerable].of(people)
     *     .collect(BaseCollectors.toList(getNameFunction).cast(List<String>.class));
     */
    public static Collector toList(final IFunction mapper) {
        Validate.notNull(mapper);
        return Collector.of(Supplier.of(List<Object>.class), BaseListObjectConsumers.addToList(mapper));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is null.
     *
     * @param mapper the function extracting the Double value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(BaseCollectors.averagingLong(Functions.get('BillingLatitude')));
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
     * Long sumOfBillingLatitude = (Long) [SObjectEnumerable].of(accounts)
     *     .collect(BaseCollectors.summingDouble(Functions.get('BillingLatitude')));
     */
    public static Collector summingDouble(final IFunction mapper) {
        return Collector.of(
            BaseCollectorSuppliers.averagingDouble(),
            BaseListObjectConsumers.averagingDouble(mapper),
            BaseCollectorFunctions.summingDouble()
        );
    }
    // @end-group
    //</editor-fold>

}
