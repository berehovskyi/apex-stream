/**
 * @description Provides common implementations of {@link SObjectCollector}
 * and related utilities.
 *
 * @see SObjectCollector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectCollectors {

    @TestVisible
    private SObjectCollectors() {}
    
    //<editor-fold desc="Built-Ins">

    //<editor-fold desc="List<?> Collectors">
    // @start-group List<?> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates SObject input arguments
     * into a new `List<SObject>`.
     * <p>The result container can be cast to a specific `SObjectType`.</p>
     * <p>{@link ISObjectBaseIterable.collect(SObjectCollectors.toList())} can be replaced with
     * {@link ISObjectIterable.toList()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @example
     * // Accumulates SObjects into a List
     * List<SObject> sObjs = (List<SObject>) Stream.of(sObjects).collect(SObjectCollectors.toList());
     * List<Account> accs = (List<Account>) Stream.of(accounts).collect(SObjectCollectors.toList());
     */
    public static SObjectCollector toList() {
        return SObjectCollector.of(
                Supplier.of(List<SObject>.class),
                ListSObjectConsumers.addToList(SObjectFunction.identity())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the values returned by `mapper`
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link SObjectCollector.cast}.</p>
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a List
     * List<Object> accountNames = (List<Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList(SObjectFunctions.get('Name')));
     * List<String> accountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList(SObjectFunctions.get('Name')).cast(List<String>.class));
     */
    public static SObjectCollector toList(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(List<Object>.class), ListSObjectConsumers.addToList(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the values of `fieldName`
     * into a new `List<Object>`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container can be cast to a specific type using {@link SObjectCollector.cast}.</p>
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a List
     * List<Object> accountNames = (List<Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList('Name'));
     * List<String> parentAccountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList('Parent?.Name').cast(List<String>.class));
     */
    public static SObjectCollector toList(final String fieldName) {
        return toList(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the values of `field`
     * into a new `List<Object>`.
     * <p>The result container can be cast to a specific type using {@link SObjectCollector.cast}.</p>
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * List<Object> accountNames = (List<Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList(Account.Name));
     * List<String> accountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toList(Account.Name).cast(List<String>.class));
     */
    public static SObjectCollector toList(final SObjectField field) {
        return toList(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Set<?> Collectors">
    // @start-group Set<?> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates SObject input arguments
     * into a new `Set<SObject>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `SObjectType`.</p>
     * <p>{@link ISObjectBaseIterable.collect(SObjectCollectors.toSet())} can be replaced with
     * {@link ISObjectIterable.toSet()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @example
     * // Accumulates SObjects into a List
     * Set<SObject> sObjs = (Set<SObject>) Stream.of(sObjects).collect(SObjectCollectors.toSet());
     */
    public static SObjectCollector toSet() {
        return SObjectCollector.of(
                Supplier.of(Set<SObject>.class),
                SetSObjectConsumers.addToSObjectSet(SObjectUnaryOperator.identity())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Boolean values
     * returned by `mapper` into a new `Set<Boolean>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Boolean> doNotCalls = (Set<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toBoolSet(SObjectFunctions.get('DoNotCall')));
     */
    public static SObjectCollector toBoolSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Boolean>.class), SetSObjectConsumers.addToBoolSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Boolean values of `fieldName`
     * into a new `Set<Boolean>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Boolean> doNotCalls = (Set<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toBoolSet('DoNotCall'));
     * Set<Boolean> parentDoNotCalls = (Set<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toBoolSet('Parent?.DoNotCall'));
     */
    public static SObjectCollector toBoolSet(final String fieldName) {
        return toBoolSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Boolean values of `field`
     * into a new `Set<Boolean>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * List<Boolean> accountNames = (List<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toBoolSet(Contact.DoNotCall));
     */
    public static SObjectCollector toBoolSet(final SObjectField field) {
        return toBoolSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Id values
     * returned by `mapper` into a new `Set<Id>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Id> ids = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIdSet(SObjectFunctions.get('Id')));
     */
    public static SObjectCollector toIdSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Id>.class), SetSObjectConsumers.addToIdSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Boolean values of `fieldName`
     * into a new `Set<Boolean>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Id> ids = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIdSet('Id'));
     * Set<Id> parentOwnerIds = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIdSet('Parent?.OwnerId'));
     */
    public static SObjectCollector toIdSet(final String fieldName) {
        return toIdSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Id values of `field`
     * into a new `Set<Id>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Id> ids = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIdSet(Account.Id));
     */
    public static SObjectCollector toIdSet(final SObjectField field) {
        return toIdSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the String values
     * returned by `mapper` into a new `Set<String>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<String> names = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toStringSet(SObjectFunctions.get('Name')));
     */
    public static SObjectCollector toStringSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<String>.class), SetSObjectConsumers.addToStringSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the String values of `fieldName`
     * into a new `Set<String>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<String> names = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toStringSet('Name'));
     * Set<String> parentNames = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toStringSet('Parent?.Name'));
     */
    public static SObjectCollector toStringSet(final String fieldName) {
        return toStringSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the String values of `field`
     * into a new `Set<String>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<String> names = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toStringSet(Account.Name));
     */
    public static SObjectCollector toStringSet(final SObjectField field) {
        return toStringSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Blob values
     * returned by `mapper` into a new `Set<Blob>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toBlobSet(SObjectFunctions.get('Body')));
     */
    public static SObjectCollector toBlobSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Blob>.class), SetSObjectConsumers.addToBlobSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Blob values of `fieldName`
     * into a new `Set<Blob>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toBlobSet('Body'));
     * Set<Blob> parentBodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toBlobSet('Parent?.Body'));
     */
    public static SObjectCollector toBlobSet(final String fieldName) {
        return toBlobSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Blob values of `field`
     * into a new `Set<Blob>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toBlobSet(Attachment.Body));
     */
    public static SObjectCollector toBlobSet(final SObjectField field) {
        return toBlobSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Date values
     * returned by `mapper` into a new `Set<Date>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toDateSet(SObjectFunctions.get('Birthdate')));
     */
    public static SObjectCollector toDateSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Date>.class), SetSObjectConsumers.addToDateSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Date values of `fieldName`
     * into a new `Set<Date>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toDateSet('Birthdate'));
     * Set<Date> parentBirthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toDateSet('Parent?.Birthdate'));
     */
    public static SObjectCollector toDateSet(final String fieldName) {
        return toDateSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Date values of `field`
     * into a new `Set<Date>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toDateSet(Contact.Birthdate));
     */
    public static SObjectCollector toDateSet(final SObjectField field) {
        return toDateSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Datetime values
     * returned by `mapper` into a new `Set<Datetime>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollectors.toDatetimeSet(SObjectFunctions.get('ActivityDateTime')));
     */
    public static SObjectCollector toDatetimeSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Datetime>.class), SetSObjectConsumers.addToDatetimeSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Datetime values of `fieldName`
     * into a new `Set<Datetime>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollectors.toDatetimeSet('ActivityDateTime'));
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollectors.toDatetimeSet('Parent?.ActivityDateTime'));
     */
    public static SObjectCollector toDatetimeSet(final String fieldName) {
        return toDatetimeSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Datetime values of `field`
     * into a new `Set<Datetime>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollectors.toDatetimeSet(Event.ActivityDateTime));
     */
    public static SObjectCollector toDatetimeSet(final SObjectField field) {
        return toDatetimeSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Time values
     * returned by `mapper` into a new `Set<Time>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Time> startTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toTimeSet(SObjectFunctions.get('StartTime')));
     */
    public static SObjectCollector toTimeSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Time>.class), SetSObjectConsumers.addToTimeSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Time values of `fieldName`
     * into a new `Set<Time>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Time> startTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toTimeSet('StartTime'));
     * Set<Time> parentStartTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toTimeSet('Parent?.StartTime'));
     */
    public static SObjectCollector toTimeSet(final String fieldName) {
        return toTimeSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Time values of `field`
     * into a new `Set<Time>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Time> startTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toTimeSet(TimeSlot.StartTime));
     */
    public static SObjectCollector toTimeSet(final SObjectField field) {
        return toTimeSet(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Integer values
     * returned by `mapper` into a new `Set<Integer>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIntSet(SObjectToIntFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector toIntSet(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Integer>.class), SetSObjectConsumers.addToIntSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Integer values of `fieldName`
     * into a new `Set<Integer>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIntSet('NumberOfEmployees'));
     * Set<Integer> parentNumberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIntSet('Parent?.NumberOfEmployees'));
     */
    public static SObjectCollector toIntSet(final String fieldName) {
        return toIntSet(SObjectToIntFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Integer values of `field`
     * into a new `Set<Integer>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toIntSet(Account.NumberOfEmployees));
     */
    public static SObjectCollector toIntSet(final SObjectField field) {
        return toIntSet(SObjectToIntFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Long values
     * returned by `mapper` into a new `Set<Long>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toLongSet(SObjectToLongFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector toLongSet(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Long>.class), SetSObjectConsumers.addToLongSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Long values of `fieldName`
     * into a new `Set<Long>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toLongSet('NumberOfEmployees'));
     * Set<Long> parentNumberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toLongSet('Parent?.NumberOfEmployees'));
     */
    public static SObjectCollector toLongSet(final String fieldName) {
        return toLongSet(SObjectToLongFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Long values of `field`
     * into a new `Set<Long>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toLongSet(Account.NumberOfEmployees));
     */
    public static SObjectCollector toLongSet(final SObjectField field) {
        return toLongSet(SObjectToLongFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Double values
     * returned by `mapper` into a new `Set<Double>`.
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet(SObjectToDoubleFunctions.get('BillingLatitude')));
     */
    public static SObjectCollector toDoubleSet(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Double>.class), SetSObjectConsumers.addToDoubleSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Double values of `fieldName`
     * into a new `Set<Double>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet('BillingLatitude'));
     * Set<Double> parentBillingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet('Parent?.BillingLatitude'));
     */
    public static SObjectCollector toDoubleSet(final String fieldName) {
        return toDoubleSet(SObjectToDoubleFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Double values of `field`
     * into a new `Set<Double>`.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toDoubleSet(Account.BillingLatitude));
     */
    public static SObjectCollector toDoubleSet(final SObjectField field) {
        return toDoubleSet(SObjectToDoubleFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values
     * returned by `mapper` into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollectors.toIdSet}, {@link SObjectCollectors.toStringSet}, etc.</p>
     *
     * @param mapper the function that returns values to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * // Accumulates values returned by mapper into a Set
     * Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toSet(SObjectFunctions.get('Birthdate')));
     */
    public static SObjectCollector toSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Object>.class), SetSObjectConsumers.addToObjectSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values of `fieldName`
     * into a new `Set<Double>`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollectors.toIdSet}, {@link SObjectCollectors.toStringSet}, etc.</p>
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toSet('Birthdate'));
     * Set<Object> parentBirthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toSet('Parent?.Birthdate'));
     */
    public static SObjectCollector toSet(final String fieldName) {
        return toSet(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values of `field`
     * into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollectors.toIdSet}, {@link SObjectCollectors.toStringSet}, etc.</p>
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Accumulates values of field into a List
     * Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toSet(Contact.Birthdate));
     */
    public static SObjectCollector toSet(final SObjectField field) {
        return toSet(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<?, ?> Collectors">

    //<editor-fold desc="Map<Id, SObject> Collectors">
    // @start-group Map<Id, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates the SObject values
     * into a `Map<Id, SObject>`
     * <p>The result container value type can be cast to a specific `SObjectType`
     * using {@link SObjectCollector.cast}.</p>
     * <p>{@link ISObjectBaseIterable.collect(SObjectCollectors.toMap())} can be replaced with
     * {@link ISObjectIterable.toMap()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @see SObjectCollectors.toByIdMap
     *
     * @example
     * // Accumulates SObjects into a List
     * Map<Id, SObject> sObjs = (Map<Id, SObject>) Stream.of(sObjects)
     *     .collect(SObjectCollectors.toMap());
     * Map<Id, Account> accs = (Map<Id, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toMap().cast(Map<Id, Account));
     */
    public static SObjectCollector toMap() {
        return toByIdMap('Id');
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, Object> Collectors">
    // @start-group Map<Boolean, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Object> contactByDoNotCall = (Map<Boolean, Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Boolean, Contact>.class));
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectFunctions.get('LastName')
     *     ).cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toByBoolMap(keyMapper, valueMapper, null, Supplier.of(Map<Boolean, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right()
     *     ).cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByBoolMap(keyMapper, valueMapper, merger, Supplier.of(Map<Boolean, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Boolean, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Boolean, String>.class)
     *     ));
     */
    public static SObjectCollector toByBoolMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByBoolMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(final String keyFieldName, final String valueFieldName) {
        return toByBoolMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         Contact.DoNotCall,
     *         Contact.LastName
     *    ).cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBoolMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, SObject> Collectors">
    // @start-group Map<Boolean, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall'));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(final String keyFieldName) {
        return toByBoolMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(final SObjectField keyField) {
        return toByBoolMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall')
     *     ));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall')
     *     ).cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(final ISObjectFunction keyMapper) {
        return toByBoolMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByBoolMap(
     *         SObjectFunctions.get('DoNotCall'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, SObject>.class),
                MapSObjectConsumers.putToSObjectByBoolMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, Object> Collectors">
    // @start-group Map<Id, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Object> contactByAccountId = (Map<Id, Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Id, Contact>.class));
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectFunctions.get('LastName')
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toByIdMap(keyMapper, valueMapper, null, Supplier.of(Map<Id, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right()
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByIdMap(keyMapper, valueMapper, merger, Supplier.of(Map<Id, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Id, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Id, String>.class)
     *     ));
     */
    public static SObjectCollector toByIdMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(mapSupplier, MapSObjectConsumers.putToObjectByIdMap(keyMapper, valueMapper, merger));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         'AccountId',
     *         'LastName'
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(final String keyFieldName, final String valueFieldName) {
        return toByIdMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         Contact.AccountId,
     *         Contact.LastName
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIdMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, SObject> Collectors">
    // @start-group Map<Id, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap('AccountId'));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(final String keyFieldName) {
        return toByIdMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(Contact.AccountId));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(final SObjectField keyField) {
        return toByIdMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(SObjectFunctions.get('AccountId')));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(SObjectFunctions.get('AccountId')).cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(final ISObjectFunction keyMapper) {
        return toByIdMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByIdMap(
     *         SObjectFunctions.get('AccountId'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Id, SObject>.class),
                MapSObjectConsumers.putToSObjectByIdMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, Object> Collectors">
    // @start-group Map<String, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Object> contactByFirstName = (Map<String, Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectFunction.identity()
     *     ));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectFunction.identity()
     *     ).cast(Map<String, Contact>.class));
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectFunctions.get('LastName')
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper
    ) {
        return toByStringMap(keyMapper, valueMapper, null, Supplier.of(Map<String, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right()
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByStringMap(keyMapper, valueMapper, merger, Supplier.of(Map<String, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<String, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<String, String>.class)
     *     ));
     */
    public static SObjectCollector toByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByStringMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         'FirstName',
     *         'LastName'
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(final String keyFieldName, final String valueFieldName) {
        return toByStringMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         Contact.FirstName,
     *         Contact.LastName
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(final SObjectField keyField, final SObjectField valueField) {
        return toByStringMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, SObject> Collectors">
    // @start-group Map<String, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap('FirstName'));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap('FirstName').cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(final String keyFieldName) {
        return toByStringMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(Contact.FirstName));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(final SObjectField keyField) {
        return toByStringMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName')
     *     ));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName')
     *     ).cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(final ISObjectFunction keyMapper) {
        return toByStringMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByStringMap(
     *         SObjectFunctions.get('FirstName'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<String, SObject>.class),
                MapSObjectConsumers.putToSObjectByStringMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, Object> Collectors">
    // @start-group Map<Blob, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Object> attachmentByBody = (Map<Blob, Object>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Blob, Attachment>.class));
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectFunctions.get('Name')
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toByBlobMap(keyMapper, valueMapper, null, Supplier.of(Map<Blob, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right()
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByBlobMap(keyMapper, valueMapper, merger, Supplier.of(Map<Blob, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Blob, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Blob, String>.class)
     *     ));
     */
    public static SObjectCollector toByBlobMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByBlobMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         'Body',
     *         'Name'
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(final String keyFieldName, final String valueFieldName) {
        return toByBlobMap(
                SObjectFunctions.get(keyFieldName),
                SObjectFunctions.get(valueFieldName),
                null
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         Attachment.Body,
     *         Attachment.Name
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBlobMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, SObject> Collectors">
    // @start-group Map<Blob, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap('Body'));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(final String keyFieldName) {
        return toByBlobMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(Attachment.Body));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(final SObjectField keyField) {
        return toByBlobMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body')
     *     ));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body')
     *     ).cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(final ISObjectFunction keyMapper) {
        return toByBlobMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollectors.toByBlobMap(
     *         SObjectFunctions.get('Body'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Blob, SObject>.class),
                MapSObjectConsumers.putToSObjectByBlobMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, Object> Collectors">
    // @start-group Map<Date, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Object> contactByBirthdate = (Map<Date, Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Date, Contact>.class));
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName')
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toByDateMap(keyMapper, valueMapper, null, Supplier.of(Map<Date, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right()
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDateMap(keyMapper, valueMapper, merger, Supplier.of(Map<Date, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Date, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Date, String>.class)
     *     ));
     */
    public static SObjectCollector toByDateMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByDateMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         'Birthdate',
     *         'LastName'
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(final String keyFieldName, final String valueFieldName) {
        return toByDateMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDateMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, SObject> Collectors">
    // @start-group Map<Date, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap('Birthdate'));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(final String keyFieldName) {
        return toByDateMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(Contact.Birthdate));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(final SObjectField keyField) {
        return toByDateMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate')
     *     ));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate')
     *     ).cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(final ISObjectFunction keyMapper) {
        return toByDateMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toByDateMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Date, SObject>.class),
                MapSObjectConsumers.putToSObjectByDateMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, Object> Collectors">
    // @start-group Map<Datetime, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Object> eventByActivityDateTime = (Map<Datetime, Object>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Datetime, Event>.class));
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectFunctions.get('Description')
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper
    ) {
        return toByDatetimeMap(keyMapper, valueMapper, null, Supplier.of(Map<Datetime, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectFunctions.get('Description'),
     *         BinaryOperator.right()
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDatetimeMap(keyMapper, valueMapper, merger, Supplier.of(Map<Datetime, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Datetime, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectFunctions.get('Description'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Datetime, String>.class)
     *     ));
     */
    public static SObjectCollector toByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByDatetimeMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         'ActivityDateTime',
     *         'Description'
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(final String keyFieldName, final String valueFieldName) {
        return toByDatetimeMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         Event.ActivityDateTime,
     *         Event.Description
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDatetimeMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, SObject> Collectors">
    // @start-group Map<Datetime, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime'));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(final String keyFieldName) {
        return toByDatetimeMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(final SObjectField keyField) {
        return toByDatetimeMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime')
     *     ));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime')
     *     ).cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(final ISObjectFunction keyMapper) {
        return toByDatetimeMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollectors.toByDatetimeMap(
     *         SObjectFunctions.get('ActivityDateTime'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Datetime, SObject>.class),
                MapSObjectConsumers.putToSObjectByDatetimeMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, Object> Collectors">
    // @start-group Map<Time, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Object> timeSlotByStartTime = (Map<Time, Object>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Time, TimeSlot>.class));
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectFunctions.get('EndTime')
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toByTimeMap(keyMapper, valueMapper, null, Supplier.of(Map<Time, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectFunctions.get('EndTime'),
     *         BinaryOperator.right()
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByTimeMap(keyMapper, valueMapper, merger, Supplier.of(Map<Time, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Time, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectFunctions.get('EndTime'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Time, Time>.class)
     *     ));
     */
    public static SObjectCollector toByTimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByTimeMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         'StartTime',
     *         'EndTime'
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(final String keyFieldName, final String valueFieldName) {
        return toByTimeMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         TimeSlot.StartTime,
     *         TimeSlot.EndTime
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByTimeMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, SObject> Collectors">
    // @start-group Map<Time, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap('StartTime'));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(final String keyFieldName) {
        return toByTimeMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(final SObjectField keyField) {
        return toByTimeMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime')
     *     ));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime')
     *     ).cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(final ISObjectFunction keyMapper) {
        return toByTimeMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollectors.toByTimeMap(
     *         SObjectFunctions.get('StartTime'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Time, SObject>.class),
                MapSObjectConsumers.putToSObjectByTimeMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, Object> Collectors">
    // @start-group Map<Integer, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Object> accountByNumberOfEmployees = (Map<Integer, Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Integer, Account>.class));
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name')
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectFunction valueMapper
    ) {
        return toByIntMap(keyMapper, valueMapper, null, Supplier.of(Map<Integer, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right()
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByIntMap(keyMapper, valueMapper, merger, Supplier.of(Map<Integer, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Integer, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Integer, String>.class)
     *     ));
     */
    public static SObjectCollector toByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByIntMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(final String keyFieldName, final String valueFieldName) {
        return toByIntMap(SObjectToIntFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIntMap(SObjectToIntFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, SObject> Collectors">
    // @start-group Map<Integer, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap('NumberOfEmployees'));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(final String keyFieldName) {
        return toByIntMap(SObjectToIntFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(final SObjectField keyField) {
        return toByIntMap(SObjectToIntFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees')
     *     ));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees')
     *     ).cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(final ISObjectToIntFunction keyMapper) {
        return toByIntMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         SObjectToIntFunctions.get('NumberOfEmployees'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(
            final ISObjectToIntFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Integer, SObject>.class),
                MapSObjectConsumers.putToSObjectByIntMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, Object> Collectors">
    // @start-group Map<Long, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Object> accountByNumberOfEmployees = (Map<Long, Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Long, Account>.class));
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name')
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectFunction valueMapper
    ) {
        return toByLongMap(keyMapper, valueMapper, null, Supplier.of(Map<Long, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right()
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByLongMap(keyMapper, valueMapper, merger, Supplier.of(Map<Long, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Long, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Long, String>.class)
     *     ));
     */
    public static SObjectCollector toByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByLongMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(final String keyFieldName, final String valueFieldName) {
        return toByLongMap(SObjectToLongFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(final SObjectField keyField, final SObjectField valueField) {
        return toByLongMap(SObjectToLongFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, SObject> Collectors">
    // @start-group Map<Long, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap('NumberOfEmployees'));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(final String keyFieldName) {
        return toByLongMap(SObjectToLongFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(final SObjectField keyField) {
        return toByLongMap(SObjectToLongFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByLongMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectFunctions.get('NumberOfEmployees')
     *     ));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectFunctions.get('NumberOfEmployees')
     *     ).cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(final ISObjectToLongFunction keyMapper) {
        return toByLongMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByLongMap(
     *         SObjectToLongFunctions.get('NumberOfEmployees'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(
            final ISObjectToLongFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Long, SObject>.class),
                MapSObjectConsumers.putToSObjectByLongMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, Object> Collectors">
    // @start-group Map<Double, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Object> accountByBillingLatitude = (Map<Double, Object>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Double, Account>.class));
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectFunctions.get('Name')
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectFunction valueMapper
    ) {
        return toByDoubleMap(keyMapper, valueMapper, null, Supplier.of(Map<Double, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right()
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toByDoubleMap(keyMapper, valueMapper, merger, Supplier.of(Map<Double, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Double, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectFunctions.get('Name'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Double, String>.class)
     *     ));
     */
    public static SObjectCollector toByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByDoubleMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         'BillingLatitude',
     *         'Name'
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(final String keyFieldName, final String valueFieldName) {
        return toByDoubleMap(
                SObjectToDoubleFunctions.get(keyFieldName),
                SObjectFunctions.get(valueFieldName),
                null
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         Account.BillingLatitude,
     *         Account.Name
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDoubleMap(
                SObjectToDoubleFunctions.get(keyField),
                SObjectFunctions.get(valueField),
                null
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, SObject> Collectors">
    // @start-group Map<Double, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap('BillingLatitude'));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(final String keyFieldName) {
        return toByDoubleMap(SObjectToDoubleFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(final SObjectField keyField) {
        return toByDoubleMap(SObjectToDoubleFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toByLongMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude')
     *     ));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude')
     *     ).cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(final ISObjectToDoubleFunction keyMapper) {
        return toByDoubleMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.toByDoubleMap(
     *         SObjectToDoubleFunctions.get('BillingLatitude'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(
            final ISObjectToDoubleFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Double, SObject>.class),
                MapSObjectConsumers.putToSObjectByDoubleMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, Object> Collectors">
    // @start-group Map<Object, Object> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Object> contactByBirthdate = (Map<Object, Object>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Object, Contact>.class));
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName')
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(final ISObjectFunction keyMapper, final ISObjectFunction valueMapper) {
        return toMap(keyMapper, valueMapper, null, Supplier.of(Map<Object, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right()
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger
    ) {
        return toMap(keyMapper, valueMapper, merger, Supplier.of(Map<Object, Object>.class));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     * @param mapSupplier the function that returns a `Map<Object, ?>`
     * into which the results will be inserted
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper`, `valueMapper`, or `mapSupplier` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectFunctions.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Object, String>.class)
     *     ));
     */
    public static SObjectCollector toMap(
            final ISObjectFunction keyMapper,
            final ISObjectFunction valueMapper,
            final IBinaryOperator merger,
            final ISupplier mapSupplier
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectByObjectMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         'Birtdate',
     *         'LastName'
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(final String keyFieldName, final String valueFieldName) {
        return toMap(SObjectFunctions.get(keyFieldName), SObjectFunctions.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Maps values by keys provided by fields
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(final SObjectField keyField, final SObjectField valueField) {
        return toMap(SObjectFunctions.get(keyField), SObjectFunctions.get(valueField), null);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, SObject> Collectors">
    // @start-group Map<Object, SObject> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values of `keyFieldName`
     * and values are values of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyFieldName` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap('Birthdate'));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap('Birthdate').cast(Map<Double, Contact>.class));
     */
    public static SObjectCollector toMap(final String keyFieldName) {
        return toMap(SObjectFunctions.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyField` is null
     *
     * @example
     * // Maps values by keys provided by field
     * Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(Contact.Birthdate));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
     */
    public static SObjectCollector toMap(final SObjectField keyField) {
        return toMap(SObjectFunctions.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping function
     * Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate')
     *     ));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate')
     *     ).cast(Map<Object, Contact>.class));
     */
    public static SObjectCollector toMap(final ISObjectFunction keyMapper) {
        return toMap(keyMapper, SObjectUnaryOperator.identity(), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys and values are the result of
     * applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollectors.toByIdMap}, {@link SObjectCollectors.toByStringMap}, etc.</p>
     *
     * @param keyMapper the function that returns keys
     * @param valueMapper the function that returns values
     * @param merger the merge function to resolve collisions between values associated with the same key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyMapper` or `valueMapper` is null
     *
     * @example
     * // Maps values by keys provided by mapping functions
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollectors.toMap(
     *         SObjectFunctions.get('Birthdate'),
     *         SObjectUnaryOperator.identity(),
     *         BinaryOperator.right()
     *     ).cast(Map<Object, Contact>.class));
     */
    public static SObjectCollector toMap(
            final ISObjectFunction keyMapper,
            final ISObjectUnaryOperator valueMapper,
            final ISObjectBinaryOperator merger
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Object, SObject>.class),
                MapSObjectConsumers.putToSObjectByObjectMap(keyMapper, valueMapper, merger)
        );
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Grouping By Map<?, ?<?>> Collectors">

    //<editor-fold desc="Map<Boolean, ?<Object>> Collectors">
    // @start-group Map<Boolean, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, List<Object>> contactsByDoNotCall = (Map<Boolean, List<Object>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             SObjectFunctions.get('DoNotCall')
     *         ));
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             SObjectFunctions.get('DoNotCall')
     *         ).cast(Map<Boolean, List<Contact>>.class));
     */
    public static SObjectCollector groupingByBool(final ISObjectFunction classifier) {
        return groupingByBool(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Object> contactsByDoNotCall = (Map<Boolean, Object>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             SObjectFunctions.get('DoNotCall'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             SObjectFunctions.get('DoNotCall'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Boolean, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByBool(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByBool(classifier, Supplier.of(Map<Boolean, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Boolean, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             SObjectFunctions.get('DoNotCall'),
     *             Supplier.of(Map<Boolean, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByBool(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByBoolMap(downstream, classifier),
                CollectorBaseFunctions.groupByBool(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             'DoNotCall',
     *             'LastName'
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static SObjectCollector groupingByBool(final String keyFieldName, final String valueFieldName) {
        return groupingByBool(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             Contact.DoNotCall,
     *             Contact.LastName
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static SObjectCollector groupingByBool(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBool(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Boolean, List<SObject>> Collectors">
    // @start-group Map<Boolean, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool('DoNotCall'));
     */
    public static SObjectCollector groupingByBool(final String fieldName) {
        return groupingByBool(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Boolean, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(Contact.DoNotCall));
     */
    public static SObjectCollector groupingByBool(final SObjectField field) {
        return groupingByBool(
                SObjectFunctions.get(field),
                Supplier.of(Map<Boolean, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, List<Object>> Collectors">
    // @start-group Map<Id, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, List<Object>> contactsByAccountId = (Map<Id, List<Object>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             SObjectFunctions.get('AccountId')
     *         ));
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             SObjectFunctions.get('AccountId')
     *         ).cast(Map<Id, List<Contact>>.class));
     */
    public static SObjectCollector groupingById(final ISObjectFunction classifier) {
        return groupingById(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, Object> contactsByAccountId = (Map<Id, Object>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             SObjectFunctions.get('AccountId'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             SObjectFunctions.get('AccountId'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Id, Set<SObject>>.class));
     */
    public static SObjectCollector groupingById(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingById(classifier, Supplier.of(Map<Id, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Id, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             SObjectFunctions.get('AccountId'),
     *             Supplier.of(Map<Id, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingById(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByIdMap(downstream, classifier),
                CollectorBaseFunctions.groupById(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(
     *             'AccountId',
     *             'LastName'
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static SObjectCollector groupingById(final String keyFieldName, final String valueFieldName) {
        return groupingById(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBool(
     *             Contact.AccountId,
     *             Contact.LastName
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static SObjectCollector groupingById(final SObjectField keyField, final SObjectField valueField) {
        return groupingById(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Id, List<SObject>> Collectors">
    // @start-group Map<Id, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById('AccountId'));
     */
    public static SObjectCollector groupingById(final String fieldName) {
        return groupingById(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Id, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByAccountId = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingById(Contact.AccountId));
     */
    public static SObjectCollector groupingById(final SObjectField field) {
        return groupingById(
                SObjectFunctions.get(field),
                Supplier.of(Map<Id, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, List<Object>> Collectors">
    // @start-group Map<String, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<String, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, List<Object>> contactsByOtherCity = (Map<String, List<Object>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('OtherCity')
     *         ));
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('OtherCity')
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector groupingByString(final ISObjectFunction classifier) {
        return groupingByString(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, Object> contactsByOtherCity = (Map<String, Object>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('OtherCity'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('OtherCity'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<String, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByString(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByString(classifier, Supplier.of(Map<String, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<String, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('OtherCity'),
     *             Supplier.of(Map<String, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByString(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByStringMap(downstream, classifier),
                CollectorBaseFunctions.groupByString(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             'OtherCity',
     *             'LastName'
     *         ).cast(Map<String, List<String>>.class));
     */
    public static SObjectCollector groupingByString(final String keyFieldName, final String valueFieldName) {
        return groupingByString(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(
     *             Contact.OtherCity,
     *             Contact.LastName
     *         ).cast(Map<String, List<String>>.class));
     */
    public static SObjectCollector groupingByString(final SObjectField keyField, final SObjectField valueField) {
        return groupingByString(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<String, List<SObject>> Collectors">
    // @start-group Map<String, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString('OtherCity'));
     */
    public static SObjectCollector groupingByString(final String fieldName) {
        return groupingByString(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<String, List<SObject>>.class), SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByString(Contact.OtherCity));
     */
    public static SObjectCollector groupingByString(final SObjectField field) {
        return groupingByString(
                SObjectFunctions.get(field),
                Supplier.of(Map<String, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, List<Object>> Collectors">
    // @start-group Map<Blob, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, List<Object>> attachmentsByOtherCity = (Map<Blob, List<Object>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             SObjectFunctions.get('Body')
     *         ));
     * Map<Blob, List<Attachment>> attachmentsByOtherCity = (Map<Blob, List<Attachment>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             SObjectFunctions.get('Body')
     *         ).cast(Map<Blob, List<Attachment>>.class));
     */
    public static SObjectCollector groupingByBlob(final ISObjectFunction classifier) {
        return groupingByBlob(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Object> attachmentsByOtherCity = (Map<Blob, Object>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             SObjectFunctions.get('Body'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             SObjectFunctions.get('Body'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Blob, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByBlob(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByBlob(classifier, Supplier.of(Map<Blob, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Blob, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             SObjectFunctions.get('Body'),
     *             Supplier.of(Map<String, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByBlob(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByBlobMap(downstream, classifier),
                CollectorBaseFunctions.groupByBlob(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByBlob(
     *             'Body',
     *             'Name'
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static SObjectCollector groupingByBlob(final String keyFieldName, final String valueFieldName) {
        return groupingByBlob(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollectors.groupingByString(
     *             Attachment.Body,
     *             Attachment.Name
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static SObjectCollector groupingByBlob(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBlob(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Blob, List<SObject>> Collectors">
    // @start-group Map<Blob, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBlob('Body'));
     */
    public static SObjectCollector groupingByBlob(final String fieldName) {
        return groupingByBlob(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Blob, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByBlob(Attachment.Body));
     */
    public static SObjectCollector groupingByBlob(final SObjectField field) {
        return groupingByBlob(
                SObjectFunctions.get(field),
                Supplier.of(Map<Blob, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, List<Object>> Collectors">
    // @start-group Map<Date, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, List<Object>> contactsByBirthdate = (Map<Date, List<Object>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             SObjectFunctions.get('Birthdate')
     *         ));
     * Map<Date, List<Contact>> contactsByBirthdate = (Map<Date, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             SObjectFunctions.get('Birthdate')
     *         ).cast(Map<Date, List<Contact>>.class));
     */
    public static SObjectCollector groupingByDate(final ISObjectFunction classifier) {
        return groupingByDate(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, Object> contactsByBirthdate = (Map<Date, Object>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             SObjectFunctions.get('Birthdate'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             SObjectFunctions.get('Birthdate'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Date, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByDate(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByDate(classifier, Supplier.of(Map<Date, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Date, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date,Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             SObjectFunctions.get('Birthdate'),
     *             Supplier.of(Map<Date, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDate(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByDateMap(downstream, classifier),
                CollectorBaseFunctions.groupByDate(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static SObjectCollector groupingByDate(final String keyFieldName, final String valueFieldName) {
        return groupingByDate(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static SObjectCollector groupingByDate(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDate(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Date, List<SObject>> Collectors">
    // @start-group Map<Date, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate('Birthdate'));
     */
    public static SObjectCollector groupingByDate(final String fieldName) {
        return groupingByDate(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Date, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDate(Contact.Birthdate));
     */
    public static SObjectCollector groupingByDate(final SObjectField field) {
        return groupingByDate(
                SObjectFunctions.get(field),
                Supplier.of(Map<Date, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, List<Object>> Collectors">
    // @start-group Map<Datetime, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, List<Object>> eventsByActivityDateTime = (Map<Datetime, List<Object>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             SObjectFunctions.get('ActivityDateTime')
     *         ));
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             SObjectFunctions.get('ActivityDateTime')
     *         ).cast(Map<Datetime, List<Event>>.class));
     */
    public static SObjectCollector groupingByDatetime(final ISObjectFunction classifier) {
        return groupingByDatetime(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Object> eventsByActivityDateTime = (Map<Datetime, Object>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             SObjectFunctions.get('ActivityDateTime'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             SObjectFunctions.get('ActivityDateTime'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Datetime, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByDatetime(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByDatetime(classifier, Supplier.of(Map<Datetime, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Datetime, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             SObjectFunctions.get('ActivityDateTime'),
     *             Supplier.of(Map<Datetime, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDatetime(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByDatetimeMap(downstream, classifier),
                CollectorBaseFunctions.groupByDatetime(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             'ActivityDateTime',
     *             'Description'
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static SObjectCollector groupingByDatetime(final String keyFieldName, final String valueFieldName) {
        return groupingByDatetime(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             Event.ActivityDateTime,
     *             Event.Description
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static SObjectCollector groupingByDatetime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDatetime(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Datetime, List<SObject>> Collectors">
    // @start-group Map<Datetime, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime('ActivityDateTime'));
     */
    public static SObjectCollector groupingByDatetime(final String fieldName) {
        return groupingByDatetime(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Datetime, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByDatetime(Event.ActivityDateTime));
     */
    public static SObjectCollector groupingByDatetime(final SObjectField field) {
        return groupingByDatetime(
                SObjectFunctions.get(field),
                Supplier.of(Map<Datetime, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, List<Object>> Collectors">
    // @start-group Map<Time, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, List<Object>> slotsByStartTime = (Map<Time, List<Object>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByTime(
     *             SObjectFunctions.get('StartTime')
     *         ));
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByTime(
     *             SObjectFunctions.get('StartTime')
     *         ).cast(Map<Time, List<TimeSlot>>.class));
     */
    public static SObjectCollector groupingByTime(final ISObjectFunction classifier) {
        return groupingByTime(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, Object> slotsByStartTime = (Map<Time, Object>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByTime(
     *             SObjectFunctions.get('StartTime'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByTime(
     *             SObjectFunctions.get('StartTime'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Time, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByTime(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByTime(classifier, Supplier.of(Map<Time, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Time, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollectors.groupingByTime(
     *             SObjectFunctions.get('StartTime'),
     *             Supplier.of(Map<Time, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByTime(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByTimeMap(downstream, classifier),
                CollectorBaseFunctions.groupByTime(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Time, List<String>> namesByStartTime = (Map<Time, List<String>>)
     *     Stream.of(slots)
     *         .collect(SObjectCollectors.groupingByDatetime(
     *             'StartTime',
     *             'Name'
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static SObjectCollector groupingByTime(final String keyFieldName, final String valueFieldName) {
        return groupingByTime(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<String>> descriptionsByActivityDateTime = (Map<Time, List<String>>)
     *     Stream.of(slots)
     *         .collect(SObjectCollectors.groupingByTime(
     *             TimeSlot.StartTime,
     *             TimeSlot.Description
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static SObjectCollector groupingByTime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByTime(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Time, List<SObject>> Collectors">
    // @start-group Map<Time, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     Stream.of(slots)
     *         .collect(SObjectCollectors.groupingByTime('StartTime'));
     */
    public static SObjectCollector groupingByTime(final String fieldName) {
        return groupingByTime(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Time, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     Stream.of(slots)
     *         .collect(SObjectCollectors.groupingByTime(TimeSlot.StartTime));
     */
    public static SObjectCollector groupingByTime(final SObjectField field) {
        return groupingByTime(
                SObjectFunctions.get(field),
                Supplier.of(Map<Time, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, List<Object>> Collectors">
    // @start-group Map<Integer, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, List<Object>> accountsByNumberOfEmployees = (Map<Integer, List<Object>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToIntFunctions.get('NumberOfEmployees')
     *         ));
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToIntFunctions.get('NumberOfEmployees')
     *         ).cast(Map<Integer, List<Account>>.class));
     */
    public static SObjectCollector groupingByInt(final ISObjectToIntFunction classifier) {
        return groupingByInt(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Object> accountsByNumberOfEmployees = (Map<Integer, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToIntFunctions.get('NumberOfEmployees'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToIntFunctions.get('NumberOfEmployees'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Integer, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByInt(
            final ISObjectToIntFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByInt(classifier, Supplier.of(Map<Integer, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Integer, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToIntFunctions.get('NumberOfEmployees'),
     *             Supplier.of(Map<Integer, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByInt(
            final ISObjectToIntFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByIntMap(downstream, classifier),
                CollectorBaseFunctions.groupByInt(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static SObjectCollector groupingByInt(final String keyFieldName, final String valueFieldName) {
        return groupingByInt(SObjectToIntFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static SObjectCollector groupingByInt(final SObjectField keyField, final SObjectField valueField) {
        return groupingByInt(SObjectToIntFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Integer, List<SObject>> Collectors">
    // @start-group Map<Integer, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt('NumberOfEmployees'));
     */
    public static SObjectCollector groupingByInt(final String fieldName) {
        return groupingByInt(
                SObjectToIntFunctions.get(fieldName),
                Supplier.of(Map<Integer, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector groupingByInt(final SObjectField field) {
        return groupingByInt(
                SObjectToIntFunctions.get(field),
                Supplier.of(Map<Integer, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, List<Object>> Collectors">
    // @start-group Map<Long, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, List<Object>> accountsByNumberOfEmployees = (Map<Long, List<Object>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             SObjectToLongFunctions.get('NumberOfEmployees')
     *         ));
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             SObjectToLongFunctions.get('NumberOfEmployees')
     *         ).cast(Map<Long, List<Account>>.class));
     */
    public static SObjectCollector groupingByLong(final ISObjectToLongFunction classifier) {
        return groupingByLong(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, Object> accountsByNumberOfEmployees = (Map<Long, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             SObjectToLongFunctions.get('NumberOfEmployees'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToLongFunctions.get('NumberOfEmployees'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Long, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByLong(
            final ISObjectToLongFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByLong(classifier, Supplier.of(Map<Long, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Long, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByInt(
     *             SObjectToLongFunctions.get('NumberOfEmployees'),
     *             Supplier.of(Map<Long, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByLong(
            final ISObjectToLongFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByLongMap(downstream, classifier),
                CollectorBaseFunctions.groupByLong(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static SObjectCollector groupingByLong(final String keyFieldName, final String valueFieldName) {
        return groupingByLong(SObjectToLongFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static SObjectCollector groupingByLong(final SObjectField keyField, final SObjectField valueField) {
        return groupingByLong(SObjectToLongFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Long, List<SObject>> Collectors">
    // @start-group Map<Long, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong('NumberOfEmployees'));
     */
    public static SObjectCollector groupingByLong(final String fieldName) {
        return groupingByLong(
                SObjectToLongFunctions.get(fieldName),
                Supplier.of(Map<Long, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector groupingByLong(final SObjectField field) {
        return groupingByLong(
                SObjectToLongFunctions.get(field),
                Supplier.of(Map<Long, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Double, List<Object>> Collectors">
    // @start-group Map<Double, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, List<Object>> accountsByBillingLatitude = (Map<Double, List<Object>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             SObjectToDoubleFunctions.get('BillingLatitude')
     *         ));
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             SObjectToDoubleFunctions.get('BillingLatitude')
     *         ).cast(Map<Double, List<Account>>.class));
     */
    public static SObjectCollector groupingByDouble(final ISObjectToDoubleFunction classifier) {
        return groupingByDouble(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, Object> accountsByBillingLatitude = (Map<Double, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             SObjectToDoubleFunctions.get('BillingLatitude'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             SObjectToDoubleFunctions.get('BillingLatitude'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Double, Set<SObject>>.class));
     */
    public static SObjectCollector groupingByDouble(
            final ISObjectToDoubleFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingByDouble(classifier, Supplier.of(Map<Double, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Double, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             SObjectToDoubleFunctions.get('BillingLatitude'),
     *             Supplier.of(Map<Double, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDouble(
            final ISObjectToDoubleFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByDoubleMap(downstream, classifier),
                CollectorBaseFunctions.groupByDouble(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             'BillingLatitude',
     *             'Name'
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static SObjectCollector groupingByDouble(final String keyFieldName, final String valueFieldName) {
        return groupingByDouble(
                SObjectToDoubleFunctions.get(keyFieldName),
                SObjectCollectors.toList(valueFieldName)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(
     *             Account.BillingLatitude,
     *             Account.Name
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static SObjectCollector groupingByDouble(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDouble(SObjectToDoubleFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, List<SObject>> Collectors">
    // @start-group Map<Object, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble('BillingLatitude'));
     */
    public static SObjectCollector groupingByDouble(final String fieldName) {
        return groupingByDouble(
                SObjectToDoubleFunctions.get(fieldName),
                Supplier.of(Map<Double, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByDouble(Account.BillingLatitude));
     */
    public static SObjectCollector groupingByDouble(final SObjectField field) {
        return groupingByDouble(
                SObjectToDoubleFunctions.get(field),
                Supplier.of(Map<Double, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, List<Object>> Collectors">
    // @start-group Map<Object, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param classifier the function that returns keys
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, List<Object>> contactsByBirthdate = (Map<Object, List<Object>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             SObjectFunctions.get('Birthdate')
     *         ));
     * Map<Object, List<Contact>> contactsByBirthdate = (Map<Object, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             SObjectFunctions.get('Birthdate')
     *         ).cast(Map<Object, List<Contact>>.class));
     */
    public static SObjectCollector groupingBy(final ISObjectFunction classifier) {
        return groupingBy(classifier, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param classifier the function that returns keys
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, Object> contactsByBirthdate = (Map<Object, Object>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             SObjectFunctions.get('Birthdate'),
     *             SObjectCollectors.toSet()
     *         ));
     * Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             SObjectFunctions.get('Birthdate'),
     *             SObjectCollectors.toSet()
     *         ).cast(Map<Object, Set<SObject>>.class));
     */
    public static SObjectCollector groupingBy(
            final ISObjectFunction classifier,
            final ISObjectCollector downstream
    ) {
        return groupingBy(classifier, Supplier.of(Map<Object, Object>.class), downstream);
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * The Map container is created by `mapSupplier`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param classifier the function that returns keys
     * @param mapSupplier the supplier that returns a `Map<Object, ?>` container
     * into which the results will be inserted
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `classifier`, `mapSupplier` or `downstream` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object,Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             SObjectFunctions.get('Birthdate'),
     *             Supplier.of(Map<Object, Set<SObject>>.class),
     *             SObjectCollectors.toSet()
     *         ));
     */
    public static SObjectCollector groupingBy(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumers.putToObjectsByObjectMap(downstream, classifier),
                CollectorBaseFunctions.groupByObject(downstream.finisher())
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyFieldName` and `valueFieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param keyFieldName the field value to accumulate as key
     * @param valueFieldName the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyFieldName` or `valueFieldName` is null
     *
     * @example
     * // Group values by keys provided by function
     * Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static SObjectCollector groupingBy(final String keyFieldName, final String valueFieldName) {
        return groupingBy(SObjectFunctions.get(keyFieldName), SObjectCollectors.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param keyField the field value to accumulate as key
     * @param valueField the field value to accumulate as values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `keyField` or `valueField` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static SObjectCollector groupingBy(final SObjectField keyField, final SObjectField valueField) {
        return groupingBy(SObjectFunctions.get(keyField), SObjectCollectors.toList(valueField));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Map<Object, List<SObject>> Collectors">
    // @start-group Map<Object, ?> Collectors
    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy('Birthdate'));
     */
    public static SObjectCollector groupingBy(final String fieldName) {
        return groupingBy(
                SObjectFunctions.get(fieldName),
                Supplier.of(Map<Object, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollectors.groupingById}, {@link SObjectCollectors.groupingByString}, etc.</p>
     *
     * @param field the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollectors.groupingBy(Contact.Birthdate));
     */
    public static SObjectCollector groupingBy(final SObjectField field) {
        return groupingBy(
                SObjectFunctions.get(field),
                Supplier.of(Map<Object, List<SObject>>.class),
                SObjectCollectors.toList()
        );
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Partitioning By Collectors">
    // @start-group Partitioning By Collectors
    /**
     * @description Returns a `SObjectCollector` that partitions the SObject input arguments
     * according to `predicate` and organizes them into a `Map<Boolean, Object>`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param predicate the predicate that classifies input arguments (true or false)
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, Object> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.partitioningBy(
     *             SObjectPredicates.isGreater('NumberOfEmployees', 100)
     *         ));
     * Map<Boolean, List<Account>> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.partitioningBy(
     *             SObjectPredicates.isGreater('NumberOfEmployees', 100)
     *         ).cast(Map<Boolean, List<Account>>.class));
     */
    public static SObjectCollector partitioningBy(final ISObjectPredicate predicate) {
        return partitioningBy(predicate, SObjectCollectors.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that partitions the SObject input arguments
     * according to `predicate`, reduces the values in each partition according to `downstream` Collector,
     * and organizes them into a `Map<Boolean, Object>` whose values are the result of the downstream reduction.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     *
     * @param predicate the predicate that classifies input arguments (true or false)
     * @param downstream the downstream reduction collector
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `predicate` or `downstream` is null
     *
     * @example
     * Map<Boolean, Set<String>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, Set<String>>) Stream.of(accounts)
     *         .collect(SObjectCollectors.partitioningBy(
     *             SObjectPredicates.isGreater('NumberOfEmployees', 100),
     *             SObjectCollectors.toStringSet('Name')
     *         ).cast(Map<Boolean, Set<Account>>.class));
     */
    public static SObjectCollector partitioningBy(
            final ISObjectPredicate predicate,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, Object>.class),
                MapSObjectConsumers.putToObjectsByBoolMap(downstream, SObjectFunction.compose(predicate)),
                downstream.finisher()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that partitions the SObject input arguments
     * according to whether `fieldName` is equal to `value` and organizes them
     * into a `Map<Boolean, List<SObject>>`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to test
     * @param value the expected value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * 
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) Stream.of(contacts)
     *         .collect(SObjectCollectors.partitioningBy('OtherCountry', 'UK'));
     */
    public static SObjectCollector partitioningBy(final String fieldName, final Object value) {
        final ISObjectCollector downstream = SObjectCollectors.toList();
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, List<SObject>>.class),
                MapSObjectConsumers.putToObjectsByBoolMap(
                        downstream,
                        SObjectFunction.compose(SObjectPredicates.isEqual(fieldName, value))
                ),
                downstream.finisher()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that partitions the SObject input arguments
     * according to whether `field` is equal to `value` and organizes them
     * into a `Map<Boolean, List<SObject>>`.
     *
     * @param field the field value to test
     * @param value the expected value
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     * 
     * @see SObjectPredicates.isEqual
     *
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) Stream.of(contacts)
     *         .collect(SObjectCollectors.partitioningBy(Contact.OtherCountry, 'UK'));
     */
    public static SObjectCollector partitioningBy(final SObjectField field, final Object value) {
        final ISObjectCollector downstream = SObjectCollectors.toList();
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, List<SObject>>.class),
                MapSObjectConsumers.putToObjectsByBoolMap(
                        downstream,
                        SObjectFunction.compose(SObjectPredicates.isEqual(field, value))
                ),
                downstream.finisher()
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Joining">
    // @start-group Joining
    /**
     * @description Returns a `SObjectCollector` that concatenates `fieldName` String values
     * of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field value to concatenate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts).collect(SObjectCollectors.joining('LastName'));
     */
    public static SObjectCollector joining(final String fieldName) {
        return joining(fieldName, '');
    }

    /**
     * @description Returns a `SObjectCollector` that concatenates `fieldName` String values
     * of the SObject input arguments.
     *
     * @param field the field value to concatenate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts).collect(SObjectCollectors.joining(Contact.LastName));
     */
    public static SObjectCollector joining(final SObjectField field) {
        return joining(field, '');
    }

    /**
     * @description Returns a `SObjectCollector` that concatenates `fieldName` String values
     * of the SObject input arguments, separated by the `delimiter`.
     *
     * @param fieldName the field value to concatenate
     * @param delimiter the delimiter between each element
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException `delimiter` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *      .collect(SObjectCollectors.joining('LastName', '; '));
     */
    public static SObjectCollector joining(final String fieldName, final String delimiter) {
        return joining(fieldName, delimiter, '', '');
    }

    /**
     * @description Returns a `SObjectCollector` that concatenates `field` String values
     * of the SObject input arguments, separated by the `delimiter`.
     *
     * @param field the field value to concatenate
     * @param delimiter the delimiter between each element
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` or `delimiter` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *     .collect(SObjectCollectors.joining(Contact.LastName, '; '));
     */
    public static SObjectCollector joining(final SObjectField field, final String delimiter) {
        return joining(field, delimiter, '', '');
    }

    /**
     * @description Returns a `SObjectCollector` that concatenates `fieldName` String values
     * of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.
     *
     * @param fieldName the field value to concatenate
     * @param delimiter the delimiter between each element
     * @param prefix the prefix
     * @param suffix the suffix
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `delimiter`, `prefix` or `suffix` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *      .collect(SObjectCollectors.joining('LastName', '; ', 'prefix', 'suffix'));
     */
    public static SObjectCollector joining(
            final String fieldName,
            final String delimiter,
            final String prefix,
            final String suffix
    ) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.joiningString(),
                ListSObjectConsumers.joining(SObjectFunctions.get(fieldName), delimiter, prefix),
                CollectorBaseFunctions.append(suffix)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that concatenates `field` String values
     * of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.
     *
     * @param field the field value to concatenate
     * @param delimiter the delimiter between each element
     * @param prefix the prefix
     * @param suffix the suffix
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field`, `delimiter`, `prefix` or `suffix` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *      .collect(SObjectCollectors.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
     */
    public static SObjectCollector joining(
            final SObjectField field,
            final String delimiter,
            final String prefix,
            final String suffix
    ) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.joiningString(),
                ListSObjectConsumers.joining(SObjectFunctions.get(field), delimiter, prefix),
                CollectorBaseFunctions.append(suffix)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Int Collectors">
    // @start-group Int Collectors
    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Integer value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingInt(SObjectToIntFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector averagingInt(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.averagingInt(),
                ListSObjectConsumers.averagingInt(mapper),
                CollectorBaseFunctions.averagingInt()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingInt('NumberOfEmployees'));
     */
    public static SObjectCollector averagingInt(final String fieldName) {
        return averagingInt(SObjectToIntFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector averagingInt(final SObjectField field) {
        return averagingInt(SObjectToIntFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that counts the number of input elements.
     * If no elements are present, the result is 0.
     *
     * @return the `SObjectCollector`
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.counting());
     */
    public static SObjectCollector counting() {
        return summingInt(SObjectToIntFunction.compose(SObjectFunction.constant(1)));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Integer value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingInt(SObjectToIntFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector summingInt(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.summingInt(),
                ListSObjectConsumers.summingInt(mapper),
                ListFunctions.get(0)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingInt('NumberOfEmployees'));
     */
    public static SObjectCollector summingInt(final String fieldName) {
        return summingInt(SObjectToIntFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingInt(final SObjectField field) {
        return summingInt(SObjectToIntFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Long Collectors">
    // @start-group Long Collectors
    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingLong(SObjectToLongFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector averagingLong(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.averagingLong(),
                ListSObjectConsumers.averagingLong(mapper),
                CollectorBaseFunctions.averagingLong()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingLong('NumberOfEmployees'));
     */
    public static SObjectCollector averagingLong(final String fieldName) {
        return averagingLong(SObjectToLongFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector averagingLong(final SObjectField field) {
        return averagingLong(SObjectToLongFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingLong(SObjectToLongFunctions.get('NumberOfEmployees')));
     */
    public static SObjectCollector summingLong(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.summingLong(),
                ListSObjectConsumers.summingLong(mapper),
                ListFunctions.get(0)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingLong('NumberOfEmployees'));
     */
    public static SObjectCollector summingLong(final String fieldName) {
        return summingLong(SObjectToLongFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingLong(final SObjectField field) {
        return summingLong(SObjectToLongFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Double Collectors">
    // @start-group Double Collectors
    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Double value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingLong(SObjectToDoubleFunctions.get('BillingLatitude')));
     */
    public static SObjectCollector averagingDouble(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.averagingDouble(),
                ListSObjectConsumers.averagingDouble(mapper),
                CollectorBaseFunctions.averagingDouble()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingDouble('BillingLatitude'));
     */
    public static SObjectCollector averagingDouble(final String fieldName) {
        return averagingDouble(SObjectToDoubleFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic mean
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to average
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double averageBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.averagingDouble(Account.BillingLatitude));
     */
    public static SObjectCollector averagingDouble(final SObjectField field) {
        return averagingDouble(SObjectToDoubleFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of values returned by `mapper`.
     * If no elements are present, the result is 0.
     *
     * @param mapper the function extracting the Long value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Long sumOfBillingLatitude = (Long) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingDouble(SObjectToDoubleFunctions.get('BillingLatitude')));
     */
    public static SObjectCollector summingDouble(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.summingDouble(),
                ListSObjectConsumers.summingDouble(mapper),
                ListFunctions.get(0)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `fieldName` values.
     * If no elements are present, the result is 0.
     *
     * @param fieldName the field value to sum
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double sumOfBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingDouble('BillingLatitude'));
     */
    public static SObjectCollector summingDouble(final String fieldName) {
        return summingDouble(SObjectToDoubleFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that returns the arithmetic sum
     * of `field` values.
     * If no elements are present, the result is 0.
     *
     * @param field the field value to BillingLatitude
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double sumOfBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollectors.summingDouble(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingDouble(final SObjectField field) {
        return summingDouble(SObjectToDoubleFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Collectors">
    // @start-group Intermediate Collectors
    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     *
     * @param predicate the predicate to test input arguments
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * // Get accounts with more than 100 employees
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.filtering(SObjectPredicates.isGreater('NumberOfEmployees', 100)));
     * // Group accounts with more than 100 employees by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.filtering(SObjectPredicates.isGreater('NumberOfEmployees', 100))
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final ISObjectPredicate predicate) {
        return filtering(predicate, SObjectCollectors.toList());
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by applying
     * `predicate` to each input element and only accumulating if it returns true.
     *
     * @param predicate the predicate to test input arguments
     * @param downstream the collector that accumulates only matched values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `predicate` or `downstream` is null
     *
     * @example
     * // Get accounts with more than 100 employees
     * List<String> accountNamesHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.filtering(
     *         SObjectPredicates.isGreater('NumberOfEmployees', 100),
     *         SObjectCollectors.toList('Name')
     *      ).cast(List<String>.class));
     * // Group accounts names with more than 100 employees by type
     * Map<String, List<String>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<String>>) Stream.of(accounts)
     *     .collect(
     *         SObjectCollectors.filtering(
     *             SObjectPredicates.isGreater('NumberOfEmployees', 100),
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.toList('Name')
     *             ).cast(Map<String, List<String>>.class)
     *      ));
     */
    public static SObjectCollector filtering(final ISObjectPredicate predicate, final ISObjectCollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ObjectSObjectConsumers.filtering(predicate, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by testing of
     * `fieldName` is equal to `value` to each input element and only accumulating if it is true.
     *
     * @param fieldName the field value to test input arguments
     * @param value the expected value
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * 
     * @see SObjectPredicates.isEqual
     *
     * @example
     * // Get accounts with hot Rating
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.filtering('Rating', 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.filtering('Rating', 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final String fieldName, final Object value) {
        return filtering(SObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by testing of
     * `field` is equal to `value` to each input element and only accumulating if it is true.
     *
     * @param field the field value to test input arguments
     * @param value the expected value
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     * 
     * @example
     * // Get accounts with hot Rating
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
     *     .collect(SObjectCollectors.filtering(Account.Rating, 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollectors.groupingByString(
     *                 SObjectFunctions.get('Type'),
     *                 SObjectCollectors.filtering(Account.Rating, 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final SObjectField field, final Object value) {
        return filtering(SObjectPredicates.isEqual(field, value));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     *
     * @param mapper the function to return the value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.mapping(SObjectFunctions.get('Name')).cast(List<String>.class));
     */
    public static SObjectCollector mapping(final ISObjectFunction mapper) {
        return mapping(mapper, Collector.of(Supplier.of(List<Object>.class), ListObjectBaseConsumers.addToList()));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements by
     * applying `mapper` function to each input element before accumulation.
     *
     * @param mapper the function to return the value to accumulate
     * @param downstream the collector which accepts mapped values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * Map<String, Set<String>> namesByType = (Map<String, Set<String>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.mapping(
     *                 SObjectFunctions.get('Name'),
     *                 Collector.toStringSet()
     *             )
     *         ).cast(Map<String, Set<String>>.class));
     */
    public static SObjectCollector mapping(final ISObjectFunction mapper, final ICollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ObjectSObjectConsumers.mapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting `fieldName`
     * values to each input element before accumulation.
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.mapping('Name').cast(List<String>.class));
     */
    public static SObjectCollector mapping(final String fieldName) {
        return mapping(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting `field`
     * values to each input element before accumulation.
     *
     * @param field the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.mapping(Account.Name).cast(List<String>.class));
     */
    public static SObjectCollector mapping(final SObjectField field) {
        return mapping(SObjectFunctions.get(field));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element before accumulation.
     *
     * @param mapper the function which must produce `Iterable<SObject>`
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * List<Contact> contacts = (List<Contact>) Stream.of(accounts)
     *     .collect(SObjectCollectors.flatMapping(SObjectFunctions.getSObjects('Contacts')).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping(SObjectFunctions.getSObjects('Contacts'))
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final ISObjectFunction mapper) {
        return flatMapping(mapper, Collector.of(Supplier.of(List<Object>.class), ListObjectBaseConsumers.addToList()));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element before accumulation.
     *
     * @param mapper the function which must produce `Iterable<SObject>`
     * @param downstream the collector which accepts mapped values
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `mapper` or `downstream` is null
     *
     * @example
     * Set<SObject> contacts = (Set<SObject>) Stream.of(accounts)
     *     .collect(SObjectCollectors.flatMapping(
     *         SObjectFunctions.getSObjects('Contacts'),
     *         Collector.toSObjectSet()
     *     ));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping(
     *                 SObjectFunctions.getSObjects('Contacts'),
     *                 Collector.toSObjectList()
     *             )
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final ISObjectFunction mapper, final ICollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ObjectSObjectConsumers.flatMapping(mapper, downstream.accumulator()),
                downstream.finisher()
        );
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable according to
     * child relationship `fieldName` before accumulation.
     *
     * @param fieldName the child relationship field
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Contact> contacts = (List<Contact>) Stream.of(accounts)
     *     .collect(SObjectCollectors.flatMapping('Contacts').cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping('Contacts')
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final String fieldName) {
        return flatMapping(SObjectFunctions.getSObjects(fieldName));
    }

    /**
     * @description Adapts a `SObjectCollector` to one accepting elements as a result of
     * replacing each input element with the contents of a mapped iterable according to
     * child relationship `field` before accumulation.
     *
     * @param field the child relationship field
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Contact> contacts = (List<Contact>) Stream.of(accounts)
     *     .collect(SObjectCollectors.flatMapping(Contact.AccountId).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.flatMapping(Contact.AccountId)
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final SObjectField field) {
        return flatMapping(SObjectFunctions.getSObjects(field));
    }

    /**
     * @description Returns a `SObjectCollector` which performs a reduction of its input elements
     * under `accumulator` using `identity`.
     *
     * @param identity the identity value for the reduction
     * @param accumulator the input arguments reducer
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Account accountWithSummedNumberOfEmployees = (Account) Stream.of(accounts)
     *     .collect(SObjectCollectors.reducing(
     *         new Account(NumberOfEmployees = 0),
     *         sumIntFieldReducer
     *     ));
     */
    public static SObjectCollector reducing(final SObject identity, final ISObjectBinaryOperator accumulator) {
        return SObjectCollector.of(
                CollectorBaseSuppliers.sObjectBox(identity),
                ListSObjectConsumers.reducing(accumulator),
                ListFunctions.get(0)
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Optional Collectors">
    // @start-group Optional Collectors
    /**
     * @description Returns a `SObjectCollector` which performs a reduction of its input elements
     * under `accumulator`. The result is described as an `OptionalSObject`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param accumulator the input arguments reducer
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.reducing(
     *                 SObjectBinaryOperator.maxBy('NumberOfEmployees')
     *             )
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     accountOptionalWithMaxNumberOfEmployeesPerType.get('Customer').get();
     */
    public static SObjectCollector reducing(final ISObjectBinaryOperator accumulator) {
        return SObjectCollector.of(
                Supplier.of(List<SObject>.class),
                ListSObjectConsumers.reducingOptional(accumulator),
                CollectorBaseFunctions.reducingOptionalSObject()
        );
    }

    /**
     * @description Returns a `SObjectCollector` which produces the maximal element
     * according to `comparator`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param comparator the comparator
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.maximizing(
     *                 SObjectComparator.comparingInt('NumberOfEmployees')
     *             )
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector maximizing(final ISObjectComparator comparator) {
        return reducing(SObjectBinaryOperator.maxBy(comparator));
    }

    /**
     * @description Returns a `SObjectCollector` which produces the maximal element
     * according to `fieldName`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param fieldName the field value to compare
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.maximizing('NumberOfEmployees')
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector maximizing(final String fieldName) {
        return maximizing(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` which produces the maximal element
     * according to `field`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param field the field value to compare
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get(Account.Type),
     *             SObjectCollectors.maximizing(Account.NumberOfEmployees)
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector maximizing(final SObjectField field) {
        return maximizing(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns a `SObjectCollector` which produces the minimal element
     * according to `comparator`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param comparator the comparator
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.minimizing(
     *                 SObjectComparator.comparingInt('NumberOfEmployees')
     *             )
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     accountOptionalWithMinNumberOfEmployeesPerType.get('Customer').get();
     */
    public static SObjectCollector minimizing(final ISObjectComparator comparator) {
        return reducing(SObjectBinaryOperator.minBy(comparator));
    }

    /**
     * @description Returns a `SObjectCollector` which produces the minimal element
     * according to `fieldName`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param fieldName the field value to compare
     *
     * @return the `SObjectCollector`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get('Type'),
     *             SObjectCollectors.maximizing('NumberOfEmployees')
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector minimizing(final String fieldName) {
        return minimizing(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` which produces the maximal element
     * according to `field`, described as an `OptionalSObject` .
     * <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>
     *
     * @param field the field value to compare
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollectors.groupingByString(
     *             SObjectFunctions.get(Account.Type),
     *             SObjectCollectors.maximizing(Account.NumberOfEmployees)
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector minimizing(final SObjectField field) {
        return minimizing(SObjectComparator.comparing(field));
    }
    // @end-group
    //</editor-fold>

    //</editor-fold>
    
}
