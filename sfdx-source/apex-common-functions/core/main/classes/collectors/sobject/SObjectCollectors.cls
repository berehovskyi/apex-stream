/**
 * @description Provides common implementations of SObject {@link Collector}
 * and related utilities.
 *
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
@SuppressWarnings('PMD')
public virtual inherited sharing class SObjectCollectors extends Collectors {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectCollectors() {}
    
    //<editor-fold desc="Built-Ins">

    //<editor-fold desc="List<?> Collectors">
    // @start-group List<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates the values of `fieldName`
     * into a new `List<Object>`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container can be cast to a specific type using {@link Collector.cast}.</p>
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a List
     * List<Object> accountNames = (List<Object>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toList('Name'));
     * List<String> parentAccountNames = (List<String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toList('Parent?.Name').cast(List<String>.class));
     */
    public static Collector toList(final String fieldName) {
        return toList(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the values of `field`
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link Collector.cast}.</p>
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * List<Object> accountNames = (List<Object>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toList(Account.Name));
     * List<String> accountNames = (List<String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toList(Account.Name).cast(List<String>.class));
     */
    public static Collector toList(final SObjectField field) {
        return toList(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Set<?> Collectors">
    // @start-group Set<?> Collectors
    /**
     * @description Returns a `Collector` that accumulates the Boolean values of `fieldName`
     * into a new `Set<Boolean>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Boolean> doNotCalls = (Set<Boolean>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toBoolSet('DoNotCall'));
     * Set<Boolean> parentDoNotCalls = (Set<Boolean>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toBoolSet('Parent?.DoNotCall'));
     */
    public static Collector toBoolSet(final String fieldName) {
        return toBoolSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Boolean values of `field`
     * into a new `Set<Boolean>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * List<Boolean> accountNames = (List<Boolean>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toBoolSet(Contact.DoNotCall));
     */
    public static Collector toBoolSet(final SObjectField field) {
        return toBoolSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Boolean values of `fieldName`
     * into a new `Set<Boolean>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Id> ids = (Set<Id>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIdSet('Id'));
     * Set<Id> parentOwnerIds = (Set<Id>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIdSet('Parent?.OwnerId'));
     */
    public static Collector toIdSet(final String fieldName) {
        return toIdSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Id values of `field`
     * into a new `Set<Id>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Id> ids = (Set<Id>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIdSet(Account.Id));
     */
    public static Collector toIdSet(final SObjectField field) {
        return toIdSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the String values of `fieldName`
     * into a new `Set<String>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<String> names = (Set<String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toStringSet('Name'));
     * Set<String> parentNames = (Set<String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toStringSet('Parent?.Name'));
     */
    public static Collector toStringSet(final String fieldName) {
        return toStringSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the String values of `field`
     * into a new `Set<String>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<String> names = (Set<String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toStringSet(Account.Name));
     */
    public static Collector toStringSet(final SObjectField field) {
        return toStringSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Blob values of `fieldName`
     * into a new `Set<Blob>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Blob> bodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toBlobSet('Body'));
     * Set<Blob> parentBodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toBlobSet('Parent?.Body'));
     */
    public static Collector toBlobSet(final String fieldName) {
        return toBlobSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Blob values of `field`
     * into a new `Set<Blob>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Blob> bodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toBlobSet(Attachment.Body));
     */
    public static Collector toBlobSet(final SObjectField field) {
        return toBlobSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Date values of `fieldName`
     * into a new `Set<Date>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Date> birthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toDateSet('Birthdate'));
     * Set<Date> parentBirthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toDateSet('Parent?.Birthdate'));
     */
    public static Collector toDateSet(final String fieldName) {
        return toDateSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Date values of `field`
     * into a new `Set<Date>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Date> birthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toDateSet(Contact.Birthdate));
     */
    public static Collector toDateSet(final SObjectField field) {
        return toDateSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Datetime values of `fieldName`
     * into a new `Set<Datetime>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toDatetimeSet('ActivityDateTime'));
     * Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toDatetimeSet('Parent?.ActivityDateTime'));
     */
    public static Collector toDatetimeSet(final String fieldName) {
        return toDatetimeSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Datetime values of `field`
     * into a new `Set<Datetime>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toDatetimeSet(Event.ActivityDateTime));
     */
    public static Collector toDatetimeSet(final SObjectField field) {
        return toDatetimeSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Time values
     * returned by `mapper` into a new `Set<Time>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toTimeSet(SObjectFunctions.get('StartTime')));
     */
    public static Collector toTimeSet(final IFunction mapper) {
        return Collector.of(Supplier.of(Set<Time>.class), SetObjectConsumers.addToTimeSet(mapper));
    }

    /**
     * @description Returns a `Collector` that accumulates the Time values of `fieldName`
     * into a new `Set<Time>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toTimeSet('StartTime'));
     * Set<Time> parentStartTimes = (Set<Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toTimeSet('Parent?.StartTime'));
     */
    public static Collector toTimeSet(final String fieldName) {
        return toTimeSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Time values of `field`
     * into a new `Set<Time>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toTimeSet(TimeSlot.StartTime));
     */
    public static Collector toTimeSet(final SObjectField field) {
        return toTimeSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Integer values of `fieldName`
     * into a new `Set<Integer>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Integer> numberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIntSet('NumberOfEmployees'));
     * Set<Integer> parentNumberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIntSet('Parent?.NumberOfEmployees'));
     */
    public static Collector toIntSet(final String fieldName) {
        return toIntSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Integer values of `field`
     * into a new `Set<Integer>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Integer> numberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toIntSet(Account.NumberOfEmployees));
     */
    public static Collector toIntSet(final SObjectField field) {
        return toIntSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Long values of `fieldName`
     * into a new `Set<Long>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Long> numberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toLongSet('NumberOfEmployees'));
     * Set<Long> parentNumberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toLongSet('Parent?.NumberOfEmployees'));
     */
    public static Collector toLongSet(final String fieldName) {
        return toLongSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Long values of `field`
     * into a new `Set<Long>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Long> numberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toLongSet(Account.NumberOfEmployees));
     */
    public static Collector toLongSet(final SObjectField field) {
        return toLongSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Double values of `fieldName`
     * into a new `Set<Double>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Double> billingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet('BillingLatitude'));
     * Set<Double> parentBillingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet('Parent?.BillingLatitude'));
     */
    public static Collector toDoubleSet(final String fieldName) {
        return toDoubleSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Double values of `field`
     * into a new `Set<Double>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Double> billingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet(Account.BillingLatitude));
     */
    public static Collector toDoubleSet(final SObjectField field) {
        return toDoubleSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that accumulates the Object values of `fieldName`
     * into a new `Set<Double>`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollectors.toIdSet}, {@link SObjectCollectors.toStringSet}, etc.</p>
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Object> birthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toObjectSet('Birthdate'));
     * Set<Object> parentBirthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toObjectSet('Parent?.Birthdate'));
     */
    public static Collector toObjectSet(final String fieldName) {
        return toObjectSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates the Object values of `field`
     * into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollectors.toIdSet}, {@link SObjectCollectors.toStringSet}, etc.</p>
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Object> birthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toObjectSet(Contact.Birthdate));
     */
    public static Collector toObjectSet(final SObjectField field) {
        return toObjectSet(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<?, ?> Collectors">

    //<editor-fold desc="Map<Id, SObject> Collectors">
    // @start-group Map<Id, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates the SObject values
     * into a `Map<Id, SObject>`
     * <p>The result container value type can be cast to a specific `SObjectType`
     * using {@link Collector.cast}.</p>
     * <p>{@link SObjectEnumerable.collect(SObjectCollectors.toByIdMap())} can be replaced with
     * {@link ISObjectEnumerable.toByIdMap()}</p>
     *
     * @return the `Collector`
     *
     * @see SObjectCollectors.toByIdMap
     *
     * @example
     * // Accumulates SObjects into a List
     * Map<Id, SObject> sObjs = (Map<Id, SObject>) [SObjectEnumerable].of(sObjects)
     *     .collect(SObjectCollectors.toByIdMap());
     * Map<Id, Account> accs = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIdMap().cast(Map<Id, Account));
     */
    public static Collector toByIdMap() {
        return toByIdMap('Id');
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, Object> Collectors">
    // @start-group Map<Boolean, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
     */
    public static Collector toByBoolMap(final String keyFieldName, final String valueFieldName) {
        return toByBoolMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         Contact.DoNotCall,
     *         Contact.LastName
     *    ).cast(Map<Boolean, String>.class));
     */
    public static Collector toByBoolMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBoolMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, SObject> Collectors">
    // @start-group Map<Boolean, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall'));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
     */
    public static Collector toByBoolMap(final String keyFieldName) {
        return toByBoolMap(SObjectFunctions.get(keyFieldName), Function.identity(), null, Supplier.of(Map<Boolean, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
     */
    public static Collector toByBoolMap(final SObjectField keyField) {
        return toByBoolMap(SObjectFunctions.get(keyField), Function.identity(), null, Supplier.of(Map<Boolean, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, Object> Collectors">
    // @start-group Map<Id, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         'AccountId',
     *         'LastName'
     *     ).cast(Map<Id, String>.class));
     */
    public static Collector toByIdMap(final String keyFieldName, final String valueFieldName) {
        return toByIdMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         Contact.AccountId,
     *         Contact.LastName
     *     ).cast(Map<Id, String>.class));
     */
    public static Collector toByIdMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIdMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, SObject> Collectors">
    // @start-group Map<Id, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap('AccountId'));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
     */
    public static Collector toByIdMap(final String keyFieldName) {
        return toByIdMap(SObjectFunctions.get(keyFieldName), Function.identity(), null, Supplier.of(Map<Id, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(Contact.AccountId));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
     */
    public static Collector toByIdMap(final SObjectField keyField) {
        return toByIdMap(SObjectFunctions.get(keyField), Function.identity(), null, Supplier.of(Map<Id, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, Object> Collectors">
    // @start-group Map<String, Object> Collectors

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<String, String> lastNameByFirstName = (Map<String, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         'FirstName',
     *         'LastName'
     *     ).cast(Map<String, String>.class));
     */
    public static Collector toByStringMap(final String keyFieldName, final String valueFieldName) {
        return toByStringMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<String, String> lastNameByFirstName = (Map<String, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         Contact.FirstName,
     *         Contact.LastName
     *     ).cast(Map<String, String>.class));
     */
    public static Collector toByStringMap(final SObjectField keyField, final SObjectField valueField) {
        return toByStringMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, SObject> Collectors">
    // @start-group Map<String, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<String, SObject> contactByFirstName = (Map<String, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap('FirstName'));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap('FirstName').cast(Map<String, Contact>.class));
     */
    public static Collector toByStringMap(final String keyFieldName) {
        return toByStringMap(SObjectFunctions.get(keyFieldName), Function.identity(), null, Supplier.of(Map<String, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<String, SObject> contactByFirstName = (Map<String, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(Contact.FirstName));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
     */
    public static Collector toByStringMap(final SObjectField keyField) {
        return toByStringMap(SObjectFunctions.get(keyField), Function.identity(), null, Supplier.of(Map<String, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, Object> Collectors">
    // @start-group Map<Blob, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Blob, String> nameByBody = (Map<Blob, String>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         'Body',
     *         'Name'
     *     ).cast(Map<Blob, String>.class));
     */
    public static Collector toByBlobMap(final String keyFieldName, final String valueFieldName) {
        return toByBlobMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Blob, String> nameByBody = (Map<Blob, String>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         Attachment.Body,
     *         Attachment.Name
     *     ).cast(Map<Blob, String>.class));
     */
    public static Collector toByBlobMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBlobMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, SObject> Collectors">
    // @start-group Map<Blob, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap('Body'));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
     */
    public static Collector toByBlobMap(final String keyFieldName) {
        return toByBlobMap(SObjectFunctions.get(keyFieldName), Function.identity(), null, Supplier.of(Map<Blob, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(Attachment.Body));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) [SObjectEnumerable].of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
     */
    public static Collector toByBlobMap(final SObjectField keyField) {
        return toByBlobMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Blob, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, Object> Collectors">
    // @start-group Map<Date, Object> Collectors

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         'Birthdate',
     *         'LastName'
     *     ).cast(Map<Date, String>.class));
     */
    public static Collector toByDateMap(final String keyFieldName, final String valueFieldName) {
        return toByDateMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Date, String>.class));
     */
    public static Collector toByDateMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDateMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, SObject> Collectors">
    // @start-group Map<Date, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap('Birthdate'));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
     */
    public static Collector toByDateMap(final String keyFieldName) {
        return toByDateMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Date, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(Contact.Birthdate));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
     */
    public static Collector toByDateMap(final SObjectField keyField) {
        return toByDateMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Date, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, Object> Collectors">
    // @start-group Map<Datetime, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         'ActivityDateTime',
     *         'Description'
     *     ).cast(Map<Datetime, String>.class));
     */
    public static Collector toByDatetimeMap(final String keyFieldName, final String valueFieldName) {
        return toByDatetimeMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         Event.ActivityDateTime,
     *         Event.Description
     *     ).cast(Map<Datetime, String>.class));
     */
    public static Collector toByDatetimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDatetimeMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, SObject> Collectors">
    // @start-group Map<Datetime, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime'));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
     */
    public static Collector toByDatetimeMap(final String keyFieldName) {
        return toByDatetimeMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Datetime, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) [SObjectEnumerable].of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
     */
    public static Collector toByDatetimeMap(final SObjectField keyField) {
        return toByDatetimeMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Datetime, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, Object> Collectors">
    // @start-group Map<Time, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         'StartTime',
     *         'EndTime'
     *     ).cast(Map<Time, Time>.class));
     */
    public static Collector toByTimeMap(final String keyFieldName, final String valueFieldName) {
        return toByTimeMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         TimeSlot.StartTime,
     *         TimeSlot.EndTime
     *     ).cast(Map<Time, Time>.class));
     */
    public static Collector toByTimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByTimeMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, SObject> Collectors">
    // @start-group Map<Time, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Time, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap('StartTime'));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
     */
    public static Collector toByTimeMap(final String keyFieldName) {
        return toByTimeMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Time, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) [SObjectEnumerable].of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
     */
    public static Collector toByTimeMap(final SObjectField keyField) {
        return toByTimeMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Time, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, Object> Collectors">
    // @start-group Map<Integer, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Integer, String>.class));
     */
    public static Collector toByIntMap(final String keyFieldName, final String valueFieldName) {
        return toByIntMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Integer, String>.class));
     */
    public static Collector toByIntMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIntMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, SObject> Collectors">
    // @start-group Map<Integer, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap('NumberOfEmployees'));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
     */
    public static Collector toByIntMap(final String keyFieldName) {
        return toByIntMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Integer, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
     */
    public static Collector toByIntMap(final SObjectField keyField) {
        return toByIntMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Integer, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, Object> Collectors">
    // @start-group Map<Long, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Long, String>.class));
     */
    public static Collector toByLongMap(final String keyFieldName, final String valueFieldName) {
        return toByLongMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Long, String>.class));
     */
    public static Collector toByLongMap(final SObjectField keyField, final SObjectField valueField) {
        return toByLongMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, SObject> Collectors">
    // @start-group Map<Long, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByLongMap('NumberOfEmployees'));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
     */
    public static Collector toByLongMap(final String keyFieldName) {
        return toByLongMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Long, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
     */
    public static Collector toByLongMap(final SObjectField keyField) {
        return toByLongMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Long, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, Object> Collectors">
    // @start-group Map<Double, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         'BillingLatitude',
     *         'Name'
     *     ).cast(Map<Double, String>.class));
     */
    public static Collector toByDoubleMap(final String keyFieldName, final String valueFieldName) {
        return toByDoubleMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         Account.BillingLatitude,
     *         Account.Name
     *     ).cast(Map<Double, String>.class));
     */
    public static Collector toByDoubleMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDoubleMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, SObject> Collectors">
    // @start-group Map<Double, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap('BillingLatitude'));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
     */
    public static Collector toByDoubleMap(final String keyFieldName) {
        return toByDoubleMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Double, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
     */
    public static Collector toByDoubleMap(final SObjectField keyField) {
        return toByDoubleMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Double, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, Object> Collectors">
    // @start-group Map<Object, Object> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap(
     *         'Birthdate',
     *         'LastName'
     *     ).cast(Map<Object, String>.class));
     */
    public static Collector toByObjectMap(final String keyFieldName, final String valueFieldName) {
        return toByObjectMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Object, String>.class));
     */
    public static Collector toByObjectMap(final SObjectField keyField, final SObjectField valueField) {
        return toByObjectMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, SObject> Collectors">
    // @start-group Map<Object, SObject> Collectors
    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap('Birthdate'));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap('Birthdate').cast(Map<Double, Contact>.class));
     */
    public static Collector toByObjectMap(final String keyFieldName) {
        return toByObjectMap(SObjectFunctions.get(keyFieldName), Function.identity(),null, Supplier.of(Map<Object, SObject>.class));
    }

    /**
     * @description Returns a `Collector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap(Contact.Birthdate));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.toByObjectMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
     */
    public static Collector toByObjectMap(final SObjectField keyField) {
        return toByObjectMap(SObjectFunctions.get(keyField), Function.identity(),null, Supplier.of(Map<Object, SObject>.class));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Grouping By Map<?, ?<?>> Collectors">

    //<editor-fold desc="Map<Boolean, ?<Object>> Collectors">
    // @start-group Map<Boolean, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             'DoNotCall',
     *             'LastName'
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static Collector groupingByBool(final String keyFieldName, final String valueFieldName) {
        return groupingByBool(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             Contact.DoNotCall,
     *             Contact.LastName
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static Collector groupingByBool(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBool(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, List<SObject>> Collectors">
    // @start-group Map<Boolean, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBool('DoNotCall'));
     */
    public static Collector groupingByBool(final String fieldName) {
        return groupingByBool(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Boolean, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(Contact.DoNotCall));
     */
    public static Collector groupingByBool(final SObjectField field) {
        return groupingByBool(
            SObjectFunctions.get(field),
            Supplier.of(Map<Boolean, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, List<Object>> Collectors">
    // @start-group Map<Id, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             'AccountId',
     *             'LastName'
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static Collector groupingById(final String keyFieldName, final String valueFieldName) {
        return groupingById(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             Contact.AccountId,
     *             Contact.LastName
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static Collector groupingById(final SObjectField keyField, final SObjectField valueField) {
        return groupingById(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, List<SObject>> Collectors">
    // @start-group Map<Id, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingById('AccountId'));
     */
    public static Collector groupingById(final String fieldName) {
        return groupingById(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Id, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByAccountId = (Map<String, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingById(Contact.AccountId));
     */
    public static Collector groupingById(final SObjectField field) {
        return groupingById(
            SObjectFunctions.get(field),
            Supplier.of(Map<Id, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, List<Object>> Collectors">
    // @start-group Map<String, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             'OtherCity',
     *             'LastName'
     *         ).cast(Map<String, List<String>>.class));
     */
    public static Collector groupingByString(final String keyFieldName, final String valueFieldName) {
        return groupingByString(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             Contact.OtherCity,
     *             Contact.LastName
     *         ).cast(Map<String, List<String>>.class));
     */
    public static Collector groupingByString(final SObjectField keyField, final SObjectField valueField) {
        return groupingByString(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, List<SObject>> Collectors">
    // @start-group Map<String, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByString('OtherCity'));
     */
    public static Collector groupingByString(final String fieldName) {
        return groupingByString(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<String, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByString(Contact.OtherCity));
     */
    public static Collector groupingByString(final SObjectField field) {
        return groupingByString(
            SObjectFunctions.get(field),
            Supplier.of(Map<String, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, List<Object>> Collectors">
    // @start-group Map<Blob, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
     *     [SObjectEnumerable].of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             'Body',
     *             'Name'
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static Collector groupingByBlob(final String keyFieldName, final String valueFieldName) {
        return groupingByBlob(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
     *     [SObjectEnumerable].of(attachments)
     *         .collect(SObjectCollectors.groupingByString(
     *             Attachment.Body,
     *             Attachment.Name
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static Collector groupingByBlob(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBlob(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, List<SObject>> Collectors">
    // @start-group Map<Blob, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBlob('Body'));
     */
    public static Collector groupingByBlob(final String fieldName) {
        return groupingByBlob(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Blob, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByBlob(Attachment.Body));
     */
    public static Collector groupingByBlob(final SObjectField field) {
        return groupingByBlob(
            SObjectFunctions.get(field),
            Supplier.of(Map<Blob, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, List<Object>> Collectors">
    // @start-group Map<Date, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static Collector groupingByDate(final String keyFieldName, final String valueFieldName) {
        return groupingByDate(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static Collector groupingByDate(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDate(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, List<SObject>> Collectors">
    // @start-group Map<Date, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByDate('Birthdate'));
     */
    public static Collector groupingByDate(final String fieldName) {
        return groupingByDate(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Date, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(Contact.Birthdate));
     */
    public static Collector groupingByDate(final SObjectField field) {
        return groupingByDate(
            SObjectFunctions.get(field),
            Supplier.of(Map<Date, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, List<Object>> Collectors">
    // @start-group Map<Datetime, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             'ActivityDateTime',
     *             'Description'
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static Collector groupingByDatetime(final String keyFieldName, final String valueFieldName) {
        return groupingByDatetime(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
     *     [SObjectEnumerable].of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             Event.ActivityDateTime,
     *             Event.Description
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static Collector groupingByDatetime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDatetime(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, List<SObject>> Collectors">
    // @start-group Map<Datetime, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     [SObjectEnumerable].of(events)
     *         .collect(SObjectCollectors.groupingByDatetime('ActivityDateTime'));
     */
    public static Collector groupingByDatetime(final String fieldName) {
        return groupingByDatetime(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Datetime, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     [SObjectEnumerable].of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(Event.ActivityDateTime));
     */
    public static Collector groupingByDatetime(final SObjectField field) {
        return groupingByDatetime(
            SObjectFunctions.get(field),
            Supplier.of(Map<Datetime, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, List<Object>> Collectors">
    // @start-group Map<Time, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, List<String>> namesByStartTime = (Map<Time, List<String>>)
     *     [SObjectEnumerable].of(slots)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             'StartTime',
     *             'Name'
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static Collector groupingByTime(final String keyFieldName, final String valueFieldName) {
        return groupingByTime(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<String>> descriptionsByActivityDateTime = (Map<Time, List<String>>)
     *     [SObjectEnumerable].of(slots)
     *         .collect(SObjectCollectors.groupingByTime(
     *             TimeSlot.StartTime,
     *             TimeSlot.Description
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static Collector groupingByTime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByTime(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, List<SObject>> Collectors">
    // @start-group Map<Time, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     [SObjectEnumerable].of(slots)
     *         .collect(SObjectCollectors.groupingByTime('StartTime'));
     */
    public static Collector groupingByTime(final String fieldName) {
        return groupingByTime(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Time, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     [SObjectEnumerable].of(slots)
     *         .collect(SObjectCollectors.groupingByTime(TimeSlot.StartTime));
     */
    public static Collector groupingByTime(final SObjectField field) {
        return groupingByTime(
            SObjectFunctions.get(field),
            Supplier.of(Map<Time, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, List<Object>> Collectors">
    // @start-group Map<Integer, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static Collector groupingByInt(final String keyFieldName, final String valueFieldName) {
        return groupingByInt(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static Collector groupingByInt(final SObjectField keyField, final SObjectField valueField) {
        return groupingByInt(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, List<SObject>> Collectors">
    // @start-group Map<Integer, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByInt('NumberOfEmployees'));
     */
    public static Collector groupingByInt(final String fieldName) {
        return groupingByInt(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Integer, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(Account.NumberOfEmployees));
     */
    public static Collector groupingByInt(final SObjectField field) {
        return groupingByInt(
            SObjectFunctions.get(field),
            Supplier.of(Map<Integer, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, List<Object>> Collectors">
    // @start-group Map<Long, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static Collector groupingByLong(final String keyFieldName, final String valueFieldName) {
        return groupingByLong(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static Collector groupingByLong(final SObjectField keyField, final SObjectField valueField) {
        return groupingByLong(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, List<SObject>> Collectors">
    // @start-group Map<Long, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByLong('NumberOfEmployees'));
     */
    public static Collector groupingByLong(final String fieldName) {
        return groupingByLong(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Long, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(Account.NumberOfEmployees));
     */
    public static Collector groupingByLong(final SObjectField field) {
        return groupingByLong(
            SObjectFunctions.get(field),
            Supplier.of(Map<Long, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, List<Object>> Collectors">
    // @start-group Map<Double, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             'BillingLatitude',
     *             'Name'
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static Collector groupingByDouble(final String keyFieldName, final String valueFieldName) {
        return groupingByDouble(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             Account.BillingLatitude,
     *             Account.Name
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static Collector groupingByDouble(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDouble(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, List<SObject>> Collectors">
    // @start-group Map<Double, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble('BillingLatitude'));
     */
    public static Collector groupingByDouble(final String fieldName) {
        return groupingByDouble(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Double, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(Account.BillingLatitude));
     */
    public static Collector groupingByDouble(final SObjectField field) {
        return groupingByDouble(
            SObjectFunctions.get(field),
            Supplier.of(Map<Double, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, List<Object>> Collectors">
    // @start-group Map<Object, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByObject(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static Collector groupingByObject(final String keyFieldName, final String valueFieldName) {
        return groupingByObject(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `Collector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link Collector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByObject(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static Collector groupingByObject(final SObjectField keyField, final SObjectField valueField) {
        return groupingByObject(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, List<SObject>> Collectors">
    // @start-group Map<Object, ?> Collectors
    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByObject('Birthdate'));
     */
    public static Collector groupingByObject(final String fieldName) {
        return groupingByObject(
            SObjectFunctions.get(fieldName),
            Supplier.of(Map<Object, List<SObject>>.class),
            toList(SObject.class)
        );
    }

    /**
     * @description Returns a `Collector` that performs grouping of SObject input arguments
     * according to `field`.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param field the field value to accumulate as key
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
     *     [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.groupingByObject(Contact.Birthdate));
     */
    public static Collector groupingByObject(final SObjectField field) {
        return groupingByObject(
            SObjectFunctions.get(field),
            Supplier.of(Map<Object, List<SObject>>.class),
            toList(SObject.class)
        );
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Partitioning By Collectors">
    // @start-group Partitioning By Collectors
    /**
     * @description Returns a `Collector` that partitions the SObject input arguments
     * according to whether `fieldName` is equal to `value` and organizes them
     * into a `Map<Boolean, List<SObject>>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to test
     * @param value the expected value
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * 
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.partitioningBy('OtherCountry', 'UK'));
     */
    public static Collector partitioningBy(final String fieldName, final Object value) {
        final ICollector downstream = toList(SObject.class);
        return Collector.of(
            Supplier.of(Map<Boolean, List<SObject>>.class),
            MapObjectConsumers.putToObjectsByBoolMap(
                downstream,
                Function.compose(SObjectPredicates.isEqual(fieldName, value))
            ),
            downstream.finisher()
        );
    }

    /**
     * @description Returns a `Collector` that partitions the SObject input arguments
     * according to whether `field` is equal to `value` and organizes them
     * into a `Map<Boolean, List<SObject>>`.
     *
     * @param field the field value to test
     * @param value the expected value
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     * 
     * @see SObjectPredicates.isEqual
     *
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) [SObjectEnumerable].of(contacts)
     *         .collect(SObjectCollectors.partitioningBy(Contact.OtherCountry, 'UK'));
     */
    public static Collector partitioningBy(final SObjectField field, final Object value) {
        final ICollector downstream = toList(SObject.class);
        return Collector.of(
            Supplier.of(Map<Boolean, List<SObject>>.class),
            MapObjectConsumers.putToObjectsByBoolMap(
                downstream,
                Function.compose(SObjectPredicates.isEqual(field, value))
            ),
            downstream.finisher()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Joining">
    // @start-group Joining
    /**
     * @description Returns a `Collector` that concatenates `fieldName` String values
     * of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to concatenate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts).collect(SObjectCollectors.joining('LastName'));
     */
    public static Collector joining(final String fieldName) {
        return joining(fieldName, '');
    }

    /**
     * @description Returns a `Collector` that concatenates `fieldName` String values
     * of the SObject input arguments.
     *
     * @param field the field value to concatenate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts).collect(SObjectCollectors.joining(Contact.LastName));
     */
    public static Collector joining(final SObjectField field) {
        return joining(field, '');
    }

    /**
     * @description Returns a `Collector` that concatenates `fieldName` String values
     * of the SObject input arguments, separated by the `delimiter`.
     *
     * @param fieldName the field value to concatenate
     * @param delimiter the delimiter between each element
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException `delimiter` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts)
     *      .collect(SObjectCollectors.joining('LastName', '; '));
     */
    public static Collector joining(final String fieldName, final String delimiter) {
        return joining(fieldName, delimiter, '', '');
    }

    /**
     * @description Returns a `Collector` that concatenates `field` String values
     * of the SObject input arguments, separated by the `delimiter`.
     *
     * @param field the field value to concatenate
     * @param delimiter the delimiter between each element
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` or `delimiter` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts)
     *     .collect(SObjectCollectors.joining(Contact.LastName, '; '));
     */
    public static Collector joining(final SObjectField field, final String delimiter) {
        return joining(field, delimiter, '', '');
    }

    /**
     * @description Returns a `Collector` that concatenates `fieldName` String values
     * of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.
     *
     * @param fieldName the field value to concatenate
     * @param delimiter the delimiter between each element
     * @param prefix the prefix
     * @param suffix the suffix
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `delimiter`, `prefix` or `suffix` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts)
     *      .collect(SObjectCollectors.joining('LastName', '; ', 'prefix', 'suffix'));
     */
    public static Collector joining(
        final String fieldName,
        final String delimiter,
        final String prefix,
        final String suffix
    ) {
        return joining(SObjectFunctions.get(fieldName), delimiter, prefix, suffix);
    }

    /**
     * @description Returns a `Collector` that concatenates `field` String values
     * of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.
     *
     * @param field the field value to concatenate
     * @param delimiter the delimiter between each element
     * @param prefix the prefix
     * @param suffix the suffix
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field`, `delimiter`, `prefix` or `suffix` is null
     *
     * @example
     * String lastNames = (String) [SObjectEnumerable].of(contacts)
     *      .collect(SObjectCollectors.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
     */
    public static Collector joining(
        final SObjectField field,
        final String delimiter,
        final String prefix,
        final String suffix
    ) {
        return joining(SObjectFunctions.get(field), delimiter, prefix, suffix);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Int Collectors">
    // @start-group Int Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to average
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingInt('NumberOfEmployees'));
     */
    public static Collector averagingInt(final String fieldName) {
        return averagingInt(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingInt(Account.NumberOfEmployees));
     */
    public static Collector averagingInt(final SObjectField field) {
        return averagingInt(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that counts the number of input elements.
     * If no elements are present, the result is 0.
     *
     * @return the `Collector`
     *
     * @example
     * Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.counting());
     */
    public static Collector counting() {
        return summingInt(Function.constant(1));
    }
    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is null.
     *
     * @param fieldName the field value to sum
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingInt('NumberOfEmployees'));
     */
    public static Collector summingInt(final String fieldName) {
        return summingInt(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingInt(Account.NumberOfEmployees));
     */
    public static Collector summingInt(final SObjectField field) {
        return summingInt(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Long Collectors">
    // @start-group Long Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is null.
     *
     * @param fieldName the field value to average
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingLong('NumberOfEmployees'));
     */
    public static Collector averagingLong(final String fieldName) {
        return averagingLong(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingLong(Account.NumberOfEmployees));
     */
    public static Collector averagingLong(final SObjectField field) {
        return averagingLong(SObjectFunctions.get(field));
    }
    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is null.
     *
     * @param fieldName the field value to sum
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingLong('NumberOfEmployees'));
     */
    public static Collector summingLong(final String fieldName) {
        return summingLong(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to sum
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingLong(Account.NumberOfEmployees));
     */
    public static Collector summingLong(final SObjectField field) {
        return summingLong(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Double Collectors">
    // @start-group Double Collectors
    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is null.
     *
     * @param fieldName the field value to average
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingDouble('BillingLatitude'));
     */
    public static Collector averagingDouble(final String fieldName) {
        return averagingDouble(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to average
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.averagingDouble(Account.BillingLatitude));
     */
    public static Collector averagingDouble(final SObjectField field) {
        return averagingDouble(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is null.
     *
     * @param fieldName the field value to sum
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double sumOfBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingDouble('BillingLatitude'));
     */
    public static Collector summingDouble(final String fieldName) {
        return summingDouble(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `Collector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is null.
     *
     * @param field the field value to BillingLatitude
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double sumOfBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.summingDouble(Account.NumberOfEmployees));
     */
    public static Collector summingDouble(final SObjectField field) {
        return summingDouble(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Collectors">
    // @start-group Intermediate Collectors
    /**
     * @description Adapts a `Collector` to one accepting elements by testing of
     * `fieldName` is equal to `value` to each input element and only accumulating if it is true.
     *
     * @param fieldName the field value to test input arguments
     * @param value the expected value
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * 
     * @see SObjectPredicates.isEqual
     *
     * @example
     * // Get accounts with hot Rating
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.filtering('Rating', 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
     *        .collect(
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.filtering('Rating', 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static Collector filtering(final String fieldName, final Object value) {
        return filtering(SObjectPredicates.isEqual(fieldName, value), toList(SObject.class));
    }

    /**
     * @description Adapts a `Collector` to one accepting elements by testing of
     * `field` is equal to `value` to each input element and only accumulating if it is true.
     *
     * @param field the field value to test input arguments
     * @param value the expected value
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     * 
     * @example
     * // Get accounts with hot Rating
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.filtering(Account.Rating, 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
     *        .collect(
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.filtering(Account.Rating, 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static Collector filtering(final SObjectField field, final Object value) {
        return filtering(SObjectPredicates.isEqual(field, value), toList(SObject.class));
    }

    /**
     * @description Adapts a `Collector` to one accepting `fieldName`
     * values to each input element before accumulation.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.mapping('Name').cast(List<String>.class));
     */
    public static Collector mapping(final String fieldName) {
        return mapping(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Adapts a `Collector` to one accepting `field`
     * values to each input element before accumulation.
     *
     * @param field the field value to accumulate
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.mapping(Account.Name).cast(List<String>.class));
     */
    public static Collector mapping(final SObjectField field) {
        return mapping(SObjectFunctions.get(field));
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable according to
     * child relationship `fieldName` before accumulation.
     *
     * @param fieldName the child relationship field
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Contact> contacts = (List<Contact>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.flatMapping('Contacts').cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping('Contacts')
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static Collector flatMapping(final String fieldName) {
        return flatMapping(SObjectFunctions.getSObjects(fieldName));
    }

    /**
     * @description Adapts a `Collector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable according to
     * child relationship `field` before accumulation.
     *
     * @param field the child relationship field
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Contact> contacts = (List<Contact>) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.flatMapping(Contact.AccountId).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping(Contact.AccountId)
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static Collector flatMapping(final SObjectField field) {
        return flatMapping(SObjectFunctions.getSObjects(field));
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
     * Account accountWithSummedNumberOfEmployees = (Account) [SObjectEnumerable].of(accounts)
     *     .collect(SObjectCollectors.reducing(
     *         new Account(NumberOfEmployees = 0),
     *         sumIntFieldReducer
     *     ));
     */
    public static Collector reducing(final SObject identity, final IBiOperator accumulator) {
        return Collector.of(
            CollectorSuppliers.box(identity),
            ListObjectConsumers.reducing(accumulator),
            IterableFunctions.get(0)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Optional Collectors">
    // @start-group Optional Collectors
    /**
     * @description Returns a `Collector` which produces the maximal element
     * according to `fieldName`, described as an `Optional` SObject .
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>
     *
     * @param fieldName the field value to compare
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.maximizing('NumberOfEmployees')
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     ((Optional) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
     */
    public static Collector maximizing(final String fieldName) {
        return maximizing(Comparer.comparing(SObjectFunctions.get(fieldName)));
    }

    /**
     * @description Returns a `Collector` which produces the maximal element
     * according to `field`, described as an `Optional` SObject .
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>
     *
     * @param field the field value to compare
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get(Account.Type),
     *             SObjectCollectors.maximizing(Account.NumberOfEmployees)
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     ((Optional) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
     */
    public static Collector maximizing(final SObjectField field) {
        return maximizing(Comparer.comparing(SObjectFunctions.get(field)));
    }
    /**
     * @description Returns a `Collector` which produces the minimal element
     * according to `fieldName`, described as an `Optional` SObject .
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>
     *
     * @param fieldName the field value to compare
     *
     * @return the `Collector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.maximizing('NumberOfEmployees')
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     ((Optional) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
     */
    public static Collector minimizing(final String fieldName) {
        return minimizing(Comparer.comparing(SObjectFunctions.get(fieldName)));
    }

    /**
     * @description Returns a `Collector` which produces the maximal element
     * according to `field`, described as an `Optional` SObject .
     * <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>
     *
     * @param field the field value to compare
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     [SObjectEnumerable].of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get(Account.Type),
     *             SObjectCollectors.maximizing(Account.NumberOfEmployees)
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     ((Optional) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
     */
    public static Collector minimizing(final SObjectField field) {
        return minimizing(Comparer.comparing(SObjectFunctions.get(field)));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>
    
}
