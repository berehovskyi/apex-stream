/**
 * @description Inherits {@link ISObjectCollector} interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Collectors
 */
public abstract inherited sharing class SObjectCollector implements ISObjectCollector {

    //<editor-fold desc="Functions">
    // @start-group Functions
    public abstract ISupplier supplier();

    public abstract IObjectSObjectConsumer accumulator();

    public abstract IFunction finisher();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectCollector` by the given `supplier` and `accumulator`.
     *
     * @param supplier the supplier function for the `SObjectCollector`
     * @param accumulator the accumulator function for the `SObjectCollector`
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static SObjectCollector of(final ISupplier supplier, final IObjectSObjectConsumer accumulator) {
        return of(supplier, accumulator, null);
    }

    /**
     * @description Returns a `SObjectCollector` by the given `supplier`, `accumulator`,
     * and `finisher`.
     *
     * @param supplier the supplier function for the `SObjectCollector`
     * @param accumulator the accumulator function for the `SObjectCollector`
     * @param finisher the final transformation function for the `SObjectCollector`
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static SObjectCollector of(
            final ISupplier supplier,
            final IObjectSObjectConsumer accumulator,
            final IFunction finisher
    ) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        return new SObjectCollectorOf(supplier, accumulator, finisher);
    }

    /**
     * @description Returns a `SObjectCollector` that recursively reconstructs collector's suppliers
     * and returns a new `SObjectCollector` according to a given container type.
     * <p>Supports casting list type for methods:</p>
     * <ul>
     *     <li>{@link #toList(ISObjectFunction)}</li>
     *     <li>{@link #toList(String)}</li>
     *     <li>{@link #toList(SObjectField)}</li>
     * <p/>
     * </ul>
     * <p>Supports casting map value type (but not map key type) for methods:</p>
     * <ul>
     *     <li>{@link #toBy<T>map(ISObjectFunction)}</li>
     *     <li>{@link #toBy<T>map(String)}</li>
     *     <li>{@link #toBy<T>map(SObjectField)}</li>
     *     <li>{@link #groupingBy<T>(ISObjectFunction)}</li>
     *     <li>{@link #groupingBy<T>(String)}</li>
     *     <li>{@link #groupingBy<T>(SObjectField)}</li>
     *     <li>{@link #partitioningBy(ISObjectPredicate)}</li>
     *     <li>{@link #partitioningBy(ISObjectPredicate, ISObjectCollector)}</li>
     * </ul>
     *
     * @param t the Type to cast the result container to
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `t` is null
     * @throws TypeException if invalid `t` is provided
     *
     * @example
     * SObjectCollector.toList('Name').cast(List<String>.class);
     */
    public virtual SObjectCollector cast(final Type t) {
        Validate.notNull(t);
        ObjectSObjectConsumer accumulator = (ObjectSObjectConsumer) this.accumulator();
        String typeName = String.valueOf(t);
        while (accumulator?.downstream != null) {
            typeName = typeName.substringAfter(',').substringBeforeLast('>');
            if (!typeName.startsWith('Map') && !typeName.startsWith('List') && !typeName.startsWith('Set')) { break; }
            accumulator.downstream = new SObjectCollectorOf(
                    Supplier.of(Type.forName(typeName)),
                    accumulator.downstream.accumulator(),
                    accumulator.downstream.finisher()
            );
            accumulator = (ObjectSObjectConsumer) accumulator.downstream?.accumulator();
        }
        return new SObjectCollectorOf(Supplier.of(t), this.accumulator(), this.finisher());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">

    //<editor-fold desc="List<?> Collectors">
    // @start-group List<?> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates SObject input arguments
     * into a new `List<SObject>`.
     * <p>The result container can be cast to a specific `SObjectType`.</p>
     * <p>{@link ISObjectIterable.collect(SObjectCollector.toList())} can be replaced with
     * {@link ISObjectIterable.toList()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @example
     * // Accumulates SObjects into a List
     * List<SObject> sObjs = (List<SObject>) Stream.of(sObjects).collect(SObjectCollector.toList());
     * List<Account> accs = (List<Account>) Stream.of(accounts).collect(SObjectCollector.toList());
     */
    public static SObjectCollector toList() {
        return SObjectCollector.of(
                Supplier.of(List<SObject>.class),
                ListSObjectConsumer.addToList(SObjectFunction.identity())
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
     *     .collect(SObjectCollector.toList(SObjectFunction.get('Name')));
     * List<String> accountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toList(SObjectFunction.get('Name')).cast(List<String>.class));
     */
    public static SObjectCollector toList(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(List<Object>.class), ListSObjectConsumer.addToList(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a List
     * List<Object> accountNames = (List<Object>) Stream.of(accounts)
     *     .collect(SObjectCollector.toList('Name'));
     * List<String> parentAccountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toList('Parent?.Name')).cast(List<String>.class));
     */
    public static SObjectCollector toList(final String fieldName) {
        return toList(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toList(Account.Name));
     * List<String> accountNames = (List<String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toList(Account.Name)).cast(List<String>.class));
     */
    public static SObjectCollector toList(final SObjectField field) {
        return toList(SObjectFunction.get(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Set<?> Collectors">
    // @start-group Set<?> Collectors
    /**
     * @description Returns a `SObjectCollector` that accumulates SObject input arguments
     * into a new `Set<SObject>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific `SObjectType`.</p>
     * <p>{@link ISObjectIterable.collect(SObjectCollector.toSet())} can be replaced with
     * {@link ISObjectIterable.toSet()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @example
     * // Accumulates SObjects into a List
     * Set<SObject> sObjs = (Set<SObject>) Stream.of(sObjects).collect(SObjectCollector.toSet());
     */
    public static SObjectCollector toSet() {
        return SObjectCollector.of(
                Supplier.of(Set<SObject>.class),
                SetSObjectConsumer.addToSObjectSet(SObjectUnaryOperator.identity())
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
     *     .collect(SObjectCollector.toBoolSet(SObjectFunction.get('DoNotCall')));
     */
    public static SObjectCollector toBoolSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Boolean>.class), SetSObjectConsumer.addToBoolSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Boolean> doNotCalls = (Set<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollector.toBoolSet('DoNotCall'));
     * Set<Boolean> parentDoNotCalls = (Set<Boolean>) Stream.of(contacts)
     *     .collect(SObjectCollector.toBoolSet('Parent?.DoNotCall'));
     */
    public static SObjectCollector toBoolSet(final String fieldName) {
        return toBoolSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toBoolSet(Contact.DoNotCall));
     */
    public static SObjectCollector toBoolSet(final SObjectField field) {
        return toBoolSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toIdSet(SObjectFunction.get('Id')));
     */
    public static SObjectCollector toIdSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Id>.class), SetSObjectConsumer.addToIdSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Id> ids = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollector.toIdSet('Id'));
     * Set<Id> parentOwnerIds = (Set<Id>) Stream.of(accounts)
     *     .collect(SObjectCollector.toIdSet('Parent?.OwnerId'));
     */
    public static SObjectCollector toIdSet(final String fieldName) {
        return toIdSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toIdSet(Account.Id)));
     */
    public static SObjectCollector toIdSet(final SObjectField field) {
        return toIdSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toStringSet(SObjectFunction.get('Name')));
     */
    public static SObjectCollector toStringSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<String>.class), SetSObjectConsumer.addToStringSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<String> names = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toStringSet('Name'));
     * Set<String> parentNames = (Set<String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toStringSet('Parent?.Name'));
     */
    public static SObjectCollector toStringSet(final String fieldName) {
        return toStringSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toStringSet(Account.Name)));
     */
    public static SObjectCollector toStringSet(final SObjectField field) {
        return toStringSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toBlobSet(SObjectFunction.get('Body')));
     */
    public static SObjectCollector toBlobSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Blob>.class), SetSObjectConsumer.addToBlobSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollector.toBlobSet('Body'));
     * Set<Blob> parentBodies = (Set<Blob>) Stream.of(attachments)
     *     .collect(SObjectCollector.toBlobSet('Parent?.Body'));
     */
    public static SObjectCollector toBlobSet(final String fieldName) {
        return toBlobSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toBlobSet(Attachment.Body)));
     */
    public static SObjectCollector toBlobSet(final SObjectField field) {
        return toBlobSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toDateSet(SObjectFunction.get('Birthdate')));
     */
    public static SObjectCollector toDateSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Date>.class), SetSObjectConsumer.addToDateSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollector.toDateSet('Birthdate'));
     * Set<Date> parentBirthdates = (Set<Date>) Stream.of(contacts)
     *     .collect(SObjectCollector.toDateSet('Parent?.Birthdate'));
     */
    public static SObjectCollector toDateSet(final String fieldName) {
        return toDateSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toDateSet(Contact.Birthdate)));
     */
    public static SObjectCollector toDateSet(final SObjectField field) {
        return toDateSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toDatetimeSet(SObjectFunction.get('ActivityDateTime')));
     */
    public static SObjectCollector toDatetimeSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Datetime>.class), SetSObjectConsumer.addToDatetimeSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollector.toDatetimeSet('ActivityDateTime'));
     * Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
     *     .collect(SObjectCollector.toDatetimeSet('Parent?.ActivityDateTime'));
     */
    public static SObjectCollector toDatetimeSet(final String fieldName) {
        return toDatetimeSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toDatetimeSet(Event.ActivityDateTime)));
     */
    public static SObjectCollector toDatetimeSet(final SObjectField field) {
        return toDatetimeSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toTimeSet(SObjectFunction.get('StartTime')));
     */
    public static SObjectCollector toTimeSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Time>.class), SetSObjectConsumer.addToTimeSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Time> startTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollector.toTimeSet('StartTime'));
     * Set<Time> parentStartTimes = (Set<Time>) Stream.of(slots)
     *     .collect(SObjectCollector.toTimeSet('Parent?.StartTime'));
     */
    public static SObjectCollector toTimeSet(final String fieldName) {
        return toTimeSet(SObjectFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toTimeSet(TimeSlot.StartTime)));
     */
    public static SObjectCollector toTimeSet(final SObjectField field) {
        return toTimeSet(SObjectFunction.get(field));
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
     *     .collect(SObjectCollector.toIntSet(SObjectToIntFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector toIntSet(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Integer>.class), SetSObjectConsumer.addToIntSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollector.toIntSet('NumberOfEmployees'));
     * Set<Integer> parentNumberOfEmployees = (Set<Integer>) Stream.of(accounts)
     *     .collect(SObjectCollector.toIntSet('Parent?.NumberOfEmployees'));
     */
    public static SObjectCollector toIntSet(final String fieldName) {
        return toIntSet(SObjectToIntFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toIntSet(Account.NumberOfEmployees)));
     */
    public static SObjectCollector toIntSet(final SObjectField field) {
        return toIntSet(SObjectToIntFunction.get(field));
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
     *     .collect(SObjectCollector.toLongSet(SObjectToLongFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector toLongSet(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Long>.class), SetSObjectConsumer.addToLongSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollector.toLongSet('NumberOfEmployees'));
     * Set<Long> parentNumberOfEmployees = (Set<Long>) Stream.of(accounts)
     *     .collect(SObjectCollector.toLongSet('Parent?.NumberOfEmployees'));
     */
    public static SObjectCollector toLongSet(final String fieldName) {
        return toLongSet(SObjectToLongFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toLongSet(Account.NumberOfEmployees)));
     */
    public static SObjectCollector toLongSet(final SObjectField field) {
        return toLongSet(SObjectToLongFunction.get(field));
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
     *     .collect(SObjectCollector.toDoubleSet(SObjectToDoubleFunction.get('BillingLatitude')));
     */
    public static SObjectCollector toDoubleSet(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Double>.class), SetSObjectConsumer.addToDoubleSet(mapper));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollector.toDoubleSet('BillingLatitude'));
     * Set<Double> parentBillingLatitudes = (Set<Double>) Stream.of(accounts)
     *     .collect(SObjectCollector.toDoubleSet('Parent?.BillingLatitude'));
     */
    public static SObjectCollector toDoubleSet(final String fieldName) {
        return toDoubleSet(SObjectToDoubleFunction.get(fieldName));
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
     *     .collect(SObjectCollector.toDoubleSet(Account.BillingLatitude)));
     */
    public static SObjectCollector toDoubleSet(final SObjectField field) {
        return toDoubleSet(SObjectToDoubleFunction.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values
     * returned by `mapper` into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollector.toIdSet}, {@link SObjectCollector.toStringSet}, etc.</p>
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
     *     .collect(SObjectCollector.toSet(SObjectFunction.get('Birthdate')));
     */
    public static SObjectCollector toSet(final ISObjectFunction mapper) {
        return SObjectCollector.of(Supplier.of(Set<Object>.class), SetSObjectConsumer.addToObjectSet(mapper));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values of `fieldName`
     * into a new `Set<Double>`.
     * Cross-reference fields and safe navigation are supported.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollector.toIdSet}, {@link SObjectCollector.toStringSet}, etc.</p>
     *
     * @param fieldName the field value to accumulate
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Accumulates values of fieldName into a Set
     * Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollector.toSet('Birthdate'));
     * Set<Object> parentBirthdates = (Set<Object>) Stream.of(contacts)
     *     .collect(SObjectCollector.toSet('Parent?.Birthdate'));
     */
    public static SObjectCollector toSet(final String fieldName) {
        return toSet(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates the Object values of `field`
     * into a new `Set<Object>`.
     * <p>The result container <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link SObjectCollector.toIdSet}, {@link SObjectCollector.toStringSet}, etc.</p>
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
     *     .collect(SObjectCollector.toSet(Contact.Birthdate)));
     */
    public static SObjectCollector toSet(final SObjectField field) {
        return toSet(SObjectFunction.get(field));
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
     * <p>{@link ISObjectBaseIterable.collect(SObjectCollector.toMap())} can be replaced with
     * {@link ISObjectIterable.toMap()}</p>
     *
     * @return the `SObjectCollector`
     *
     * @see SObjectCollector.toByIdMap
     *
     * @example
     * // Accumulates SObjects into a List
     * Map<Id, SObject> sObjs = (Map<Id, SObject>) Stream.of(sObjects)
     *     .collect(SObjectCollector.toMap());
     * Map<Id, Account> accs = (Map<Id, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toMap().cast(Map<Id, Account));
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
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Boolean, Contact>.class));
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
     *         SObjectFunction.get('LastName')
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
     *         SObjectFunction.get('LastName'),
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
     *         SObjectFunction.get('LastName'),
     *         BinaryOperator.right(),
     *         Supplier.of(Map<Boolean, String>.class),
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
                MapSObjectConsumer.putToObjectByBoolMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(final String keyFieldName, final String valueFieldName) {
        return toByBoolMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         Contact.DoNotCall,
     *        Contact.LastName
     *    ).cast(Map<Boolean, String>.class));
     */
    public static SObjectCollector toByBoolMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBoolMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap('DoNotCall'));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(final String keyFieldName) {
        return toByBoolMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap(Contact.DoNotCall));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
     */
    public static SObjectCollector toByBoolMap(final SObjectField keyField) {
        return toByBoolMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Boolean, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall')
     *     ));
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall')
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
     *     .collect(SObjectCollector.toByBoolMap(
     *         SObjectFunction.get('DoNotCall'),
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
                MapSObjectConsumer.putToSObjectByBoolMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Id, Contact>.class));
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
     *         SObjectFunction.get('LastName')
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
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
     *         SObjectFunction.get('LastName'),
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
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
     *         SObjectFunction.get('LastName'),
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
        return SObjectCollector.of(mapSupplier, MapSObjectConsumer.putToObjectByIdMap(keyMapper, valueMapper, merger));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap(
     *         'AccountId',
     *         'LastName'
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(final String keyFieldName, final String valueFieldName) {
        return toByIdMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap(
     *         Contact.AccountId,
     *         Contact.LastName
     *     ).cast(Map<Id, String>.class));
     */
    public static SObjectCollector toByIdMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIdMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap('AccountId'));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(final String keyFieldName) {
        return toByIdMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap(Contact.AccountId));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
     */
    public static SObjectCollector toByIdMap(final SObjectField keyField) {
        return toByIdMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Id, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIdMap(SObjectFunction.get('AccountId')));
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByIdMap(SObjectFunction.get('AccountId')).cast(Map<Id, Contact>.class));
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
     *     .collect(SObjectCollector.toByIdMap(
     *         SObjectFunction.get('AccountId'),
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
                MapSObjectConsumer.putToSObjectByIdMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
     *         SObjectFunction.identity()
     *     ));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
     *         SObjectFunction.identity()
     *     ).cast(Map<String, Contact>.class));
     * Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
     *         SObjectFunction.get('LastName')
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
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
     *         SObjectFunction.get('LastName'),
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
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
     *         SObjectFunction.get('LastName'),
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
                MapSObjectConsumer.putToObjectByStringMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap(
     *         'FirstName',
     *         'LastName'
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(final String keyFieldName, final String valueFieldName) {
        return toByStringMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap(
     *         Contact.FirstName,
     *         Contact.LastName
     *     ).cast(Map<String, String>.class));
     */
    public static SObjectCollector toByStringMap(final SObjectField keyField, final SObjectField valueField) {
        return toByStringMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap('FirstName'));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByStringMap('FirstName').cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(final String keyFieldName) {
        return toByStringMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap(Contact.FirstName));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
     */
    public static SObjectCollector toByStringMap(final SObjectField keyField) {
        return toByStringMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<String, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName')
     *     ));
     * Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName')
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
     *     .collect(SObjectCollector.toByStringMap(
     *         SObjectFunction.get('FirstName'),
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
                MapSObjectConsumer.putToSObjectByStringMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Blob, Attachment>.class));
     * Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
     *         SObjectFunction.get('Name')
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
     *         SObjectFunction.get('Name'),
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
     *         SObjectFunction.get('Name'),
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
                MapSObjectConsumer.putToObjectByBlobMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         'Body',
     *         'Name'
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(final String keyFieldName, final String valueFieldName) {
        return toByBlobMap(
                SObjectFunction.get(keyFieldName),
                SObjectFunction.get(valueFieldName),
                null
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         Attachment.Body,
     *         Attachment.Name
     *     ).cast(Map<Blob, String>.class));
     */
    public static SObjectCollector toByBlobMap(final SObjectField keyField, final SObjectField valueField) {
        return toByBlobMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap('Body'));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollector.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(final String keyFieldName) {
        return toByBlobMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap(Attachment.Body));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollector.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
     */
    public static SObjectCollector toByBlobMap(final SObjectField keyField) {
        return toByBlobMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Blob, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body')
     *     ));
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body')
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
     *     .collect(SObjectCollector.toByBlobMap(
     *         SObjectFunction.get('Body'),
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
                MapSObjectConsumer.putToSObjectByBlobMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Date, Contact>.class));
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName')
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
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName'),
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
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName'),
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
                MapSObjectConsumer.putToObjectByDateMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap(
     *         'Birthdate',
     *         'LastName'
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(final String keyFieldName, final String valueFieldName) {
        return toByDateMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Date, String>.class));
     */
    public static SObjectCollector toByDateMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDateMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap('Birthdate'));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(final String keyFieldName) {
        return toByDateMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap(Contact.Birthdate));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
     */
    public static SObjectCollector toByDateMap(final SObjectField keyField) {
        return toByDateMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Date, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate')
     *     ));
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate')
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
     *     .collect(SObjectCollector.toByDateMap(
     *         SObjectFunction.get('Birthdate'),
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
                MapSObjectConsumer.putToSObjectByDateMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Datetime, Event>.class));
     * Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
     *         SObjectFunction.get('Description')
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
     *         SObjectFunction.get('Description'),
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
     *         SObjectFunction.get('Description'),
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
                MapSObjectConsumer.putToObjectByDatetimeMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         'ActivityDateTime',
     *         'Description'
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(final String keyFieldName, final String valueFieldName) {
        return toByDatetimeMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         Event.ActivityDateTime,
     *         Event.Description
     *     ).cast(Map<Datetime, String>.class));
     */
    public static SObjectCollector toByDatetimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDatetimeMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap('ActivityDateTime'));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollector.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(final String keyFieldName) {
        return toByDatetimeMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap(Event.ActivityDateTime));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollector.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
     */
    public static SObjectCollector toByDatetimeMap(final SObjectField keyField) {
        return toByDatetimeMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime')
     *     ));
     * Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime')
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
     *     .collect(SObjectCollector.toByDatetimeMap(
     *         SObjectFunction.get('ActivityDateTime'),
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
                MapSObjectConsumer.putToSObjectByDatetimeMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Time, TimeSlot>.class));
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
     *         SObjectFunction.get('EndTime')
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
     *         SObjectFunction.get('EndTime'),
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
     *         SObjectFunction.get('EndTime'),
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
                MapSObjectConsumer.putToObjectByTimeMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         'StartTime',
     *         'EndTime'
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(final String keyFieldName, final String valueFieldName) {
        return toByTimeMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         TimeSlot.StartTime,
     *         TimeSlot.EndTime
     *     ).cast(Map<Time, Time>.class));
     */
    public static SObjectCollector toByTimeMap(final SObjectField keyField, final SObjectField valueField) {
        return toByTimeMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap('StartTime'));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollector.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(final String keyFieldName) {
        return toByTimeMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Datetime, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap(TimeSlot.StartTime));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollector.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
     */
    public static SObjectCollector toByTimeMap(final SObjectField keyField) {
        return toByTimeMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Time, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime')
     *     ));
     * Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime')
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
     *     .collect(SObjectCollector.toByTimeMap(
     *         SObjectFunction.get('StartTime'),
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
                MapSObjectConsumer.putToSObjectByTimeMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Integer, Account>.class));
     * Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name')
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
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name'),
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
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name'),
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
                MapSObjectConsumer.putToObjectByIntMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(final String keyFieldName, final String valueFieldName) {
        return toByIntMap(SObjectToIntFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Integer, String>.class));
     */
    public static SObjectCollector toByIntMap(final SObjectField keyField, final SObjectField valueField) {
        return toByIntMap(SObjectToIntFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap('NumberOfEmployees'));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(final String keyFieldName) {
        return toByIntMap(SObjectToIntFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, Object>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(Account.NumberOfEmployees));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
     */
    public static SObjectCollector toByIntMap(final SObjectField keyField) {
        return toByIntMap(SObjectToIntFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Integer, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees')
     *     ));
     * Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees')
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
     *     .collect(SObjectCollector.toByIntMap(
     *         SObjectToIntFunction.get('NumberOfEmployees'),
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
                MapSObjectConsumer.putToSObjectByIntMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Long, Account>.class));
     * Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name')
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
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name'),
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
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
     *         SObjectFunction.get('Name'),
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
                MapSObjectConsumer.putToObjectByLongMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByIntMap(
     *         'NumberOfEmployees',
     *         'Name'
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(final String keyFieldName, final String valueFieldName) {
        return toByLongMap(SObjectToLongFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByLongMap(
     *         Account.NumberOfEmployees,
     *         Account.Name
     *     ).cast(Map<Long, String>.class));
     */
    public static SObjectCollector toByLongMap(final SObjectField keyField, final SObjectField valueField) {
        return toByLongMap(SObjectToLongFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * use {@link SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByLongMap('NumberOfEmployees'));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(final String keyFieldName) {
        return toByLongMap(SObjectToLongFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByLongMap(Account.NumberOfEmployees));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
     */
    public static SObjectCollector toByLongMap(final SObjectField keyField) {
        return toByLongMap(SObjectToLongFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Long, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByLongMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectFunction.get('NumberOfEmployees')
     *     ));
     * Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectFunction.get('NumberOfEmployees')
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
     *     .collect(SObjectCollector.toByLongMap(
     *         SObjectToLongFunction.get('NumberOfEmployees'),
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
                MapSObjectConsumer.putToSObjectByLongMap(keyMapper, valueMapper, merger)
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
     * {@link SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Double, Account>.class));
     * Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
     *         SObjectFunction.get('Name')
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
     *         SObjectFunction.get('Name'),
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
     *         SObjectFunction.get('Name'),
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
                MapSObjectConsumer.putToObjectByDoubleMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         'BillingLatitude',
     *         'Name'
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(final String keyFieldName, final String valueFieldName) {
        return toByDoubleMap(
                SObjectToDoubleFunction.get(keyFieldName),
                SObjectFunction.get(valueFieldName),
                null
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         Account.BillingLatitude,
     *         Account.Name
     *     ).cast(Map<Double, String>.class));
     */
    public static SObjectCollector toByDoubleMap(final SObjectField keyField, final SObjectField valueField) {
        return toByDoubleMap(
                SObjectToDoubleFunction.get(keyField),
                SObjectFunction.get(valueField),
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
     * {@link SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap('BillingLatitude'));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(final String keyFieldName) {
        return toByDoubleMap(SObjectToDoubleFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap(Account.BillingLatitude));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
     */
    public static SObjectCollector toByDoubleMap(final SObjectField keyField) {
        return toByDoubleMap(SObjectToDoubleFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Double, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toByLongMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude')
     *     ));
     * Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude')
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
     *     .collect(SObjectCollector.toByDoubleMap(
     *         SObjectToDoubleFunction.get('BillingLatitude'),
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
                MapSObjectConsumer.putToSObjectByDoubleMap(keyMapper, valueMapper, merger)
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
     * use {@link SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.identity()
     *     ).cast(Map<Object, Contact>.class));
     * Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName')
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
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName'),
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
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
     *         SObjectFunction.get('LastName'),
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
                MapSObjectConsumer.putToObjectByObjectMap(keyMapper, valueMapper, merger)
        );
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyFieldName`
     * and `valueFieldName` of the SObject input arguments.
     * Cross-reference fields and safe navigation are supported.
     * If the mapped keys might have duplicates,
     * use {@link SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         'Birtdate',
     *         'LastName'
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(final String keyFieldName, final String valueFieldName) {
        return toMap(SObjectFunction.get(keyFieldName), SObjectFunction.get(valueFieldName), null);
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, Object>` whose keys and values are values of `keyField`
     * and `valueField` of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         Contact.Birthdate,
     *         Contact.LastName
     *     ).cast(Map<Object, String>.class));
     */
    public static SObjectCollector toMap(final SObjectField keyField, final SObjectField valueField) {
        return toMap(SObjectFunction.get(keyField), SObjectFunction.get(valueField), null);
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
     * {@link SObjectCollector.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap('Birthdate'));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toMap('Birthdate').cast(Map<Double, Contact>.class));
     */
    public static SObjectCollector toMap(final String keyFieldName) {
        return toMap(SObjectFunction.get(keyFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values of `keyField`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(Contact.Birthdate));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
     */
    public static SObjectCollector toMap(final SObjectField keyField) {
        return toMap(SObjectFunction.get(keyField));
    }

    /**
     * @description Returns a `SObjectCollector` that accumulates elements
     * into a `Map<Object, SObject>` whose keys are values returned by `keyMapper`
     * and values are values of the SObject input arguments.
     * If the mapped keys might have duplicates, use
     * {@link SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator)} instead.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Map()` collectors
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate')
     *     ));
     * Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate')
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
     * such as {@link SObjectCollector.toByIdMap}, {@link SObjectCollector.toByStringMap}, etc.</p>
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
     *     .collect(SObjectCollector.toMap(
     *         SObjectFunction.get('Birthdate'),
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
                MapSObjectConsumer.putToSObjectByObjectMap(keyMapper, valueMapper, merger)
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
     *         .collect(SObjectCollector.groupingByBool(
     *             SObjectFunction.get('DoNotCall')
     *         ));
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByBool(
     *             SObjectFunction.get('DoNotCall')
     *         ).cast(Map<Boolean, List<Contact>>.class));
     */
    public static SObjectCollector groupingByBool(final ISObjectFunction classifier) {
        return groupingByBool(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByBool(
     *             SObjectFunction.get('DoNotCall'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByBool(
     *             SObjectFunction.get('DoNotCall'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByBool(
     *             SObjectFunction.get('DoNotCall'),
     *             Supplier.of(Map<Boolean, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByBool(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByBoolMap(downstream, classifier),
                CollectorFunction.groupByBool(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByBool(
     *             'DoNotCall',
     *             'LastName'
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static SObjectCollector groupingByBool(final String keyFieldName, final String valueFieldName) {
        return groupingByBool(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByBool(
     *             Contact.DoNotCall,
     *             Contact.LastName
     *         ).cast(Map<Boolean, List<String>>.class));
     */
    public static SObjectCollector groupingByBool(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBool(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByBool('DoNotCall'));
     */
    public static SObjectCollector groupingByBool(final String fieldName) {
        return groupingByBool(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Boolean, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByBool(Contact.DoNotCall));
     */
    public static SObjectCollector groupingByBool(final SObjectField field) {
        return groupingByBool(
                SObjectFunction.get(field),
                Supplier.of(Map<Boolean, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingById(
     *             SObjectFunction.get('AccountId')
     *         ));
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingById(
     *             SObjectFunction.get('AccountId')
     *         ).cast(Map<Id, List<Contact>>.class));
     */
    public static SObjectCollector groupingById(final ISObjectFunction classifier) {
        return groupingById(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingById(
     *             SObjectFunction.get('AccountId'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingById(
     *             SObjectFunction.get('AccountId'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingById(
     *             SObjectFunction.get('AccountId'),
     *             Supplier.of(Map<Id, Set<SObject>>.class)
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingById(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByIdMap(downstream, classifier),
                CollectorFunction.groupById(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingById(
     *             'AccountId',
     *             'LastName'
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static SObjectCollector groupingById(final String keyFieldName, final String valueFieldName) {
        return groupingById(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByBool(
     *             Contact.AccountId,
     *             Contact.LastName
     *         ).cast(Map<Id, List<String>>.class));
     */
    public static SObjectCollector groupingById(final SObjectField keyField, final SObjectField valueField) {
        return groupingById(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingById('AccountId'));
     */
    public static SObjectCollector groupingById(final String fieldName) {
        return groupingById(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Id, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingById(Contact.AccountId));
     */
    public static SObjectCollector groupingById(final SObjectField field) {
        return groupingById(
                SObjectFunction.get(field),
                Supplier.of(Map<Id, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('OtherCity')
     *         ));
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('OtherCity')
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector groupingByString(final ISObjectFunction classifier) {
        return groupingByString(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('OtherCity'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('OtherCity'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('OtherCity'),
     *             Supplier.of(Map<String, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByString(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByStringMap(downstream, classifier),
                CollectorFunction.groupByString(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByString(
     *             'OtherCity',
     *             'LastName'
     *         ).cast(Map<String, List<String>>.class));
     */
    public static SObjectCollector groupingByString(final String keyFieldName, final String valueFieldName) {
        return groupingByString(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByString(
     *             Contact.OtherCity,
     *             Contact.LastName
     *         ).cast(Map<String, List<String>>.class));
     */
    public static SObjectCollector groupingByString(final SObjectField keyField, final SObjectField valueField) {
        return groupingByString(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByString('OtherCity'));
     */
    public static SObjectCollector groupingByString(final String fieldName) {
        return groupingByString(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<String, List<SObject>>.class), SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByString(Contact.OtherCity));
     */
    public static SObjectCollector groupingByString(final SObjectField field) {
        return groupingByString(
                SObjectFunction.get(field),
                Supplier.of(Map<String, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByBlob(
     *             SObjectFunction.get('Body')
     *         ));
     * Map<Blob, List<Attachment>> attachmentsByOtherCity = (Map<Blob, List<Attachment>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollector.groupingByBlob(
     *             SObjectFunction.get('Body')
     *         ).cast(Map<Blob, List<Attachment>>.class));
     */
    public static SObjectCollector groupingByBlob(final ISObjectFunction classifier) {
        return groupingByBlob(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByBlob(
     *             SObjectFunction.get('Body'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
     *     Stream.of(attachments)
     *         .collect(SObjectCollector.groupingByBlob(
     *             SObjectFunction.get('Body'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByBlob(
     *             SObjectFunction.get('Body'),
     *             Supplier.of(Map<String, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByBlob(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByBlobMap(downstream, classifier),
                CollectorFunction.groupByBlob(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByBlob(
     *             'Body',
     *             'Name'
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static SObjectCollector groupingByBlob(final String keyFieldName, final String valueFieldName) {
        return groupingByBlob(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByString(
     *             Attachment.Body,
     *             Attachment.Name
     *         ).cast(Map<Blob, List<String>>.class));
     */
    public static SObjectCollector groupingByBlob(final SObjectField keyField, final SObjectField valueField) {
        return groupingByBlob(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByBlob('Body'));
     */
    public static SObjectCollector groupingByBlob(final String fieldName) {
        return groupingByBlob(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Blob, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByBlob(Attachment.Body));
     */
    public static SObjectCollector groupingByBlob(final SObjectField field) {
        return groupingByBlob(
                SObjectFunction.get(field),
                Supplier.of(Map<Blob, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDate(
     *             SObjectFunction.get('Birthdate')
     *         ));
     * Map<Date, List<Contact>> contactsByBirthdate = (Map<Date, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByDate(
     *             SObjectFunction.get('Birthdate')
     *         ).cast(Map<Date, List<Contact>>.class));
     */
    public static SObjectCollector groupingByDate(final ISObjectFunction classifier) {
        return groupingByDate(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByDate(
     *             SObjectFunction.get('Birthdate'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByDate(
     *             SObjectFunction.get('Birthdate'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByDate(
     *             SObjectFunction.get('Birthdate'),
     *             Supplier.of(Map<Date, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDate(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByDateMap(downstream, classifier),
                CollectorFunction.groupByDate(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByDate(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static SObjectCollector groupingByDate(final String keyFieldName, final String valueFieldName) {
        return groupingByDate(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByDate(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Date, List<String>>.class));
     */
    public static SObjectCollector groupingByDate(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDate(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingByDate('Birthdate'));
     */
    public static SObjectCollector groupingByDate(final String fieldName) {
        return groupingByDate(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Date, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDate(Contact.Birthdate));
     */
    public static SObjectCollector groupingByDate(final SObjectField field) {
        return groupingByDate(
                SObjectFunction.get(field),
                Supplier.of(Map<Date, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             SObjectFunction.get('ActivityDateTime')
     *         ));
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     Stream.of(events)
     *         .collect(SObjectCollector.groupingByDatetime(
     *             SObjectFunction.get('ActivityDateTime')
     *         ).cast(Map<Datetime, List<Event>>.class));
     */
    public static SObjectCollector groupingByDatetime(final ISObjectFunction classifier) {
        return groupingByDatetime(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             SObjectFunction.get('ActivityDateTime'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollector.groupingByDatetime(
     *             SObjectFunction.get('ActivityDateTime'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             SObjectFunction.get('ActivityDateTime'),
     *             Supplier.of(Map<Datetime, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDatetime(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByDatetimeMap(downstream, classifier),
                CollectorFunction.groupByDatetime(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             'ActivityDateTime',
     *             'Description'
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static SObjectCollector groupingByDatetime(final String keyFieldName, final String valueFieldName) {
        return groupingByDatetime(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             Event.ActivityDateTime,
     *             Event.Description
     *         ).cast(Map<Datetime, List<String>>.class));
     */
    public static SObjectCollector groupingByDatetime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDatetime(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
     *     Stream.of(events)
     *         .collect(SObjectCollector.groupingByDatetime('ActivityDateTime'));
     */
    public static SObjectCollector groupingByDatetime(final String fieldName) {
        return groupingByDatetime(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Datetime, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDatetime(Event.ActivityDateTime));
     */
    public static SObjectCollector groupingByDatetime(final SObjectField field) {
        return groupingByDatetime(
                SObjectFunction.get(field),
                Supplier.of(Map<Datetime, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByTime(
     *             SObjectFunction.get('StartTime')
     *         ));
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     Stream.of(events)
     *         .collect(SObjectCollector.groupingByTime(
     *             SObjectFunction.get('StartTime')
     *         ).cast(Map<Time, List<TimeSlot>>.class));
     */
    public static SObjectCollector groupingByTime(final ISObjectFunction classifier) {
        return groupingByTime(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByTime(
     *             SObjectFunction.get('StartTime'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
     *     Stream.of(events)
     *         .collect(SObjectCollector.groupingByTime(
     *             SObjectFunction.get('StartTime'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByTime(
     *             SObjectFunction.get('StartTime'),
     *             Supplier.of(Map<Time, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByTime(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByTimeMap(downstream, classifier),
                CollectorFunction.groupByTime(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByDatetime(
     *             'StartTime',
     *             'Name'
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static SObjectCollector groupingByTime(final String keyFieldName, final String valueFieldName) {
        return groupingByTime(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByTime(
     *             TimeSlot.StartTime,
     *             TimeSlot.Description
     *         ).cast(Map<Time, List<String>>.class));
     */
    public static SObjectCollector groupingByTime(final SObjectField keyField, final SObjectField valueField) {
        return groupingByTime(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
     *     Stream.of(slots)
     *         .collect(SObjectCollector.groupingByTime('StartTime'));
     */
    public static SObjectCollector groupingByTime(final String fieldName) {
        return groupingByTime(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Time, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByTime(TimeSlot.StartTime));
     */
    public static SObjectCollector groupingByTime(final SObjectField field) {
        return groupingByTime(
                SObjectFunction.get(field),
                Supplier.of(Map<Time, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToIntFunction.get('NumberOfEmployees')
     *         ));
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToIntFunction.get('NumberOfEmployees')
     *         ).cast(Map<Integer, List<Account>>.class));
     */
    public static SObjectCollector groupingByInt(final ISObjectToIntFunction classifier) {
        return groupingByInt(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToIntFunction.get('NumberOfEmployees'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToIntFunction.get('NumberOfEmployees'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToIntFunction.get('NumberOfEmployees'),
     *             Supplier.of(Map<Integer, Set<SObject>>.class)
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByInt(
            final ISObjectToIntFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByIntMap(downstream, classifier),
                CollectorFunction.groupByInt(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByInt(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static SObjectCollector groupingByInt(final String keyFieldName, final String valueFieldName) {
        return groupingByInt(SObjectToIntFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByInt(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Integer, List<String>>.class));
     */
    public static SObjectCollector groupingByInt(final SObjectField keyField, final SObjectField valueField) {
        return groupingByInt(SObjectToIntFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByInt('NumberOfEmployees'));
     */
    public static SObjectCollector groupingByInt(final String fieldName) {
        return groupingByInt(
                SObjectToIntFunction.get(fieldName),
                Supplier.of(Map<Integer, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector groupingByInt(final SObjectField field) {
        return groupingByInt(
                SObjectToIntFunction.get(field),
                Supplier.of(Map<Integer, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByLong(
     *             SObjectToLongFunction.get('NumberOfEmployees')
     *         ));
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByLong(
     *             SObjectToLongFunction.get('NumberOfEmployees')
     *         ).cast(Map<Long, List<Account>>.class));
     */
    public static SObjectCollector groupingByLong(final ISObjectToLongFunction classifier) {
        return groupingByLong(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByLong(
     *             SObjectToLongFunction.get('NumberOfEmployees'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToLongFunction.get('NumberOfEmployees'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByInt(
     *             SObjectToLongFunction.get('NumberOfEmployees'),
     *             Supplier.of(Map<Long, Set<SObject>>.class)
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByLong(
            final ISObjectToLongFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByLongMap(downstream, classifier),
                CollectorFunction.groupByLong(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByLong(
     *             'NumberOfEmployees',
     *             'Name'
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static SObjectCollector groupingByLong(final String keyFieldName, final String valueFieldName) {
        return groupingByLong(SObjectToLongFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
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
     *         .collect(SObjectCollector.groupingByLong(
     *             Account.NumberOfEmployees,
     *             Account.Name
     *         ).cast(Map<Long, List<String>>.class));
     */
    public static SObjectCollector groupingByLong(final SObjectField keyField, final SObjectField valueField) {
        return groupingByLong(SObjectToLongFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByLong('NumberOfEmployees'));
     */
    public static SObjectCollector groupingByLong(final String fieldName) {
        return groupingByLong(
                SObjectToLongFunction.get(fieldName),
                Supplier.of(Map<Long, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector groupingByLong(final SObjectField field) {
        return groupingByLong(
                SObjectToLongFunction.get(field),
                Supplier.of(Map<Long, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDouble(
     *             SObjectToDoubleFunction.get('BillingLatitude')
     *         ));
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByDouble(
     *             SObjectToDoubleFunction.get('BillingLatitude')
     *         ).cast(Map<Double, List<Account>>.class));
     */
    public static SObjectCollector groupingByDouble(final ISObjectToDoubleFunction classifier) {
        return groupingByDouble(classifier, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.groupingByDouble(
     *             SObjectToDoubleFunction.get('BillingLatitude'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByDouble(
     *             SObjectToDoubleFunction.get('BillingLatitude'),
     *             SObjectCollector.toSet()
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
     *         .collect(SObjectCollector.groupingByDouble(
     *             SObjectToDoubleFunction.get('BillingLatitude'),
     *             Supplier.of(Map<Double, Set<SObject>>.class)
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingByDouble(
            final ISObjectToDoubleFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByDoubleMap(downstream, classifier),
                CollectorFunction.groupByDouble(downstream.finisher())
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
     *         .collect(SObjectCollector.groupingByDouble(
     *             'BillingLatitude',
     *             'Name'
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static SObjectCollector groupingByDouble(final String keyFieldName, final String valueFieldName) {
        return groupingByDouble(
                SObjectToDoubleFunction.get(keyFieldName),
                SObjectCollector.toList(valueFieldName)
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
     *         .collect(SObjectCollector.groupingByDouble(
     *             Account.BillingLatitude,
     *             Account.Name
     *         ).cast(Map<Double, List<String>>.class));
     */
    public static SObjectCollector groupingByDouble(final SObjectField keyField, final SObjectField valueField) {
        return groupingByDouble(SObjectToDoubleFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByDouble('BillingLatitude'));
     */
    public static SObjectCollector groupingByDouble(final String fieldName) {
        return groupingByDouble(
                SObjectToDoubleFunction.get(fieldName),
                Supplier.of(Map<Double, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.groupingByDouble(Account.BillingLatitude));
     */
    public static SObjectCollector groupingByDouble(final SObjectField field) {
        return groupingByDouble(
                SObjectToDoubleFunction.get(field),
                Supplier.of(Map<Double, List<SObject>>.class),
                SObjectCollector.toList()
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
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(
     *             SObjectFunction.get('Birthdate')
     *         ));
     * Map<Object, List<Contact>> contactsByBirthdate = (Map<Object, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingBy(
     *             SObjectFunction.get('Birthdate')
     *         ).cast(Map<Object, List<Contact>>.class));
     */
    public static SObjectCollector groupingBy(final ISObjectFunction classifier) {
        return groupingBy(classifier, SObjectCollector.toList(SObjectFunction.identity()));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to the `classifier` and then performing a reduction operation on the values
     * associated with a given key using the specified `downstream` SObjectCollector.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(
     *             SObjectFunction.get('Birthdate'),
     *             SObjectCollector.toSet()
     *         ));
     * Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object, Set<SObject>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingBy(
     *             SObjectFunction.get('Birthdate'),
     *             SObjectCollector.toSet()
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
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(
     *             SObjectFunction.get('Birthdate'),
     *             Supplier.of(Map<Object, Set<SObject>>.class),
     *             SObjectCollector.toSet()
     *         ));
     */
    public static SObjectCollector groupingBy(
            final ISObjectFunction classifier,
            final ISupplier mapSupplier,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                mapSupplier,
                MapSObjectConsumer.putToObjectsByObjectMap(downstream, classifier),
                CollectorFunction.groupByObject(downstream.finisher())
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
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(
     *             'Birthdate',
     *             'LastName'
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static SObjectCollector groupingBy(final String keyFieldName, final String valueFieldName) {
        return groupingBy(SObjectFunction.get(keyFieldName), SObjectCollector.toList(valueFieldName));
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping operation
     * according to `keyField` and `valueField`.
     * <p>The result container values type can be cast to a specific type
     * using {@link SObjectCollector.cast}.</p>
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(
     *             Contact.Birthdate,
     *             Contact.LastName
     *         ).cast(Map<Object, List<String>>.class));
     */
    public static SObjectCollector groupingBy(final SObjectField keyField, final SObjectField valueField) {
        return groupingBy(SObjectFunction.get(keyField), SObjectCollector.toList(valueField));
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
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
     *
     * @param fieldName the field value to accumulate as key
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Group values by keys provided by field
     * Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
     *     Stream.of(contacts)
     *         .collect(SObjectCollector.groupingBy('Birthdate'));
     */
    public static SObjectCollector groupingBy(final String fieldName) {
        return groupingBy(
                SObjectFunction.get(fieldName),
                Supplier.of(Map<Object, List<SObject>>.class),
                SObjectCollector.toList()
        );
    }

    /**
     * @description Returns a `SObjectCollector` that performs grouping of SObject input arguments
     * according to `field`.
     * <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `groupingBy<T>()` collectors
     * such as {@link SObjectCollector.groupingById}, {@link SObjectCollector.groupingByString}, etc.</p>
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
     *         .collect(SObjectCollector.groupingBy(Contact.Birthdate));
     */
    public static SObjectCollector groupingBy(final SObjectField field) {
        return groupingBy(
                SObjectFunction.get(field),
                Supplier.of(Map<Object, List<SObject>>.class),
                SObjectCollector.toList()
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
     *         .collect(SObjectCollector.partitioningBy(
     *             SObjectPredicate.isGreater('NumberOfEmployees', 100)
     *         ));
     * Map<Boolean, List<Account>> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, List<Account>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.partitioningBy(
     *             SObjectPredicate.isGreater('NumberOfEmployees', 100)
     *         ).cast(Map<Boolean, List<Account>>.class));
     */
    public static SObjectCollector partitioningBy(final ISObjectPredicate predicate) {
        return partitioningBy(predicate, SObjectCollector.toList(SObjectFunction.identity()));
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
     *         .collect(SObjectCollector.partitioningBy(
     *             SObjectPredicate.isGreater('NumberOfEmployees', 100),
     *             SObjectCollector.toStringSet('Name')
     *         ).cast(Map<Boolean, Set<Account>>.class));
     */
    public static SObjectCollector partitioningBy(
            final ISObjectPredicate predicate,
            final ISObjectCollector downstream
    ) {
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, Object>.class),
                MapSObjectConsumer.putToObjectsByBoolMap(downstream, SObjectFunction.forPredicate(predicate)),
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) Stream.of(contacts)
     *         .collect(SObjectCollector.partitioningBy('OtherCountry', 'UK'));
     */
    public static SObjectCollector partitioningBy(final String fieldName, final Object value) {
        final ISObjectCollector downstream = SObjectCollector.toList();
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, List<SObject>>.class),
                MapSObjectConsumer.putToObjectsByBoolMap(
                        downstream,
                        SObjectFunction.forPredicate(SObjectPredicate.isEqual(fieldName, value))
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
     * @example
     * Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
     *     (Map<Boolean, List<Account>>) Stream.of(contacts)
     *         .collect(SObjectCollector.partitioningBy(Contact.OtherCountry, 'UK'));
     */
    public static SObjectCollector partitioningBy(final SObjectField field, final Object value) {
        final ISObjectCollector downstream = SObjectCollector.toList();
        return SObjectCollector.of(
                Supplier.of(Map<Boolean, List<SObject>>.class),
                MapSObjectConsumer.putToObjectsByBoolMap(
                        downstream,
                        SObjectFunction.forPredicate(SObjectPredicate.isEqual(field, value))
                ),
                downstream.finisher()
        );
    }
    // @end-group
    //</editor-fold>

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * String lastNames = (String) Stream.of(contacts).collect(SObjectCollector.joining('LastName'));
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
     * String lastNames = (String) Stream.of(contacts).collect(SObjectCollector.joining(Contact.LastName));
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
     * @throws NullPointerException if `fieldName` is blank or `delimiter` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *      .collect(SObjectCollector.joining('LastName', '; '));
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
     *     .collect(SObjectCollector.joining(Contact.LastName, '; '));
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
     * @throws NullPointerException if `fieldName` is blank or `delimiter`,
     * `prefix` or `suffix` is null
     *
     * @example
     * String lastNames = (String) Stream.of(contacts)
     *      .collect(SObjectCollector.joining('LastName', '; ', 'prefix', 'suffix'));
     */
    public static SObjectCollector joining(
            final String fieldName,
            final String delimiter,
            final String prefix,
            final String suffix
    ) {
        return SObjectCollector.of(
                Supplier.joiningString(),
                ListSObjectConsumer.joining(SObjectFunction.get(fieldName), delimiter, prefix),
                CollectorFunction.append(suffix)
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
     *      .collect(SObjectCollector.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
     */
    public static SObjectCollector joining(
            final SObjectField field,
            final String delimiter,
            final String prefix,
            final String suffix
    ) {
        return SObjectCollector.of(
                Supplier.joiningString(),
                ListSObjectConsumer.joining(SObjectFunction.get(field), delimiter, prefix),
                CollectorFunction.append(suffix)
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
     *     .collect(SObjectCollector.averagingInt(SObjectToIntFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector averagingInt(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(
                Supplier.averagingInt(),
                ListSObjectConsumer.averagingInt(mapper),
                CollectorFunction.averagingInt()
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollector.averagingInt('NumberOfEmployees'));
     */
    public static SObjectCollector averagingInt(final String fieldName) {
        return averagingInt(SObjectToIntFunction.get(fieldName));
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
     *     .collect(SObjectCollector.averagingInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector averagingInt(final SObjectField field) {
        return averagingInt(SObjectToIntFunction.get(field));
    }

    /**
     * @description Returns a `SObjectCollector` that counts the number of input elements.
     * If no elements are present, the result is 0.
     *
     * @return the `SObjectCollector`
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollector.counting());
     */
    public static SObjectCollector counting() {
        return summingInt(SObjectToIntFunction.downcast(SObjectFunction.constant(1)));
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
     *     .collect(SObjectCollector.summingInt(SObjectToIntFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector summingInt(final ISObjectToIntFunction mapper) {
        return SObjectCollector.of(
                Supplier.summingInt(),
                ListSObjectConsumer.summingInt(mapper),
                ListFunction.get(0)
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
     *     .collect(SObjectCollector.summingInt('NumberOfEmployees'));
     */
    public static SObjectCollector summingInt(final String fieldName) {
        return summingInt(SObjectToIntFunction.get(fieldName));
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
     *     .collect(SObjectCollector.summingInt(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingInt(final SObjectField field) {
        return summingInt(SObjectToIntFunction.get(field));
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
     *     .collect(SObjectCollector.averagingLong(SObjectToLongFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector averagingLong(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(
                Supplier.averagingLong(),
                ListSObjectConsumer.averagingLong(mapper),
                CollectorFunction.averagingLong()
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double averageNumberOfEmployees = (Double) Stream.of(accounts)
     *     .collect(SObjectCollector.averagingLong('NumberOfEmployees'));
     */
    public static SObjectCollector averagingLong(final String fieldName) {
        return averagingLong(SObjectToLongFunction.get(fieldName));
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
     *     .collect(SObjectCollector.averagingLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector averagingLong(final SObjectField field) {
        return averagingLong(SObjectToLongFunction.get(field));
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
     *     .collect(SObjectCollector.summingLong(SObjectToLongFunction.get('NumberOfEmployees')));
     */
    public static SObjectCollector summingLong(final ISObjectToLongFunction mapper) {
        return SObjectCollector.of(
                Supplier.summingLong(),
                ListSObjectConsumer.summingLong(mapper),
                ListFunction.get(0)
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
     *     .collect(SObjectCollector.summingLong('NumberOfEmployees'));
     */
    public static SObjectCollector summingLong(final String fieldName) {
        return summingLong(SObjectToLongFunction.get(fieldName));
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
     *     .collect(SObjectCollector.summingLong(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingLong(final SObjectField field) {
        return summingLong(SObjectToLongFunction.get(field));
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
     *     .collect(SObjectCollector.averagingLong(SObjectToDoubleFunction.get('BillingLatitude')));
     */
    public static SObjectCollector averagingDouble(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(
                Supplier.averagingDouble(),
                ListSObjectConsumer.averagingDouble(mapper),
                CollectorFunction.averagingDouble()
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double averageBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollector.averagingDouble('BillingLatitude'));
     */
    public static SObjectCollector averagingDouble(final String fieldName) {
        return averagingDouble(SObjectToDoubleFunction.get(fieldName));
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
     *     .collect(SObjectCollector.averagingDouble(Account.BillingLatitude));
     */
    public static SObjectCollector averagingDouble(final SObjectField field) {
        return averagingDouble(SObjectToDoubleFunction.get(field));
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
     *     .collect(SObjectCollector.summingDouble(SObjectToDoubleFunction.get('BillingLatitude')));
     */
    public static SObjectCollector summingDouble(final ISObjectToDoubleFunction mapper) {
        return SObjectCollector.of(
                Supplier.summingDouble(),
                ListSObjectConsumer.summingDouble(mapper),
                ListFunction.get(0)
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double sumOfBillingLatitude = (Double) Stream.of(accounts)
     *     .collect(SObjectCollector.summingDouble('BillingLatitude'));
     */
    public static SObjectCollector summingDouble(final String fieldName) {
        return summingDouble(SObjectToDoubleFunction.get(fieldName));
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
     *     .collect(SObjectCollector.summingDouble(Account.NumberOfEmployees));
     */
    public static SObjectCollector summingDouble(final SObjectField field) {
        return summingDouble(SObjectToDoubleFunction.get(field));
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
     *     .collect(SObjectCollector.filtering(SObjectPredicate.isGreater('NumberOfEmployees', 100)));
     * // Group accounts with more than 100 employees by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollector.groupingByString(
     *                 SObjectFunction.get('Type'),
     *                 SObjectCollector.filtering(SObjectPredicate.isGreater('NumberOfEmployees', 100))
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final ISObjectPredicate predicate) {
        return filtering(predicate, SObjectCollector.toList());
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
     *     .collect(SObjectCollector.filtering(
     *         SObjectPredicate.isGreater('NumberOfEmployees', 100),
     *         SObjectCollector.toList('Name')
     *      ).cast(List<String>.class));
     * // Group accounts names with more than 100 employees by type
     * Map<String, List<String>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<String>>) Stream.of(accounts)
     *     .collect(
     *         SObjectCollector.filtering(
     *             SObjectPredicate.isGreater('NumberOfEmployees', 100),
     *             SObjectCollector.groupingByString(
     *                 SObjectFunction.get('Type'),
     *                 SObjectCollector.toList('Name')
     *             ).cast(Map<String, List<String>>.class)
     *      ));
     */
    public static SObjectCollector filtering(final ISObjectPredicate predicate, final ISObjectCollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ListSObjectConsumer.filtering(predicate, downstream.accumulator()),
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * // Get accounts with hot Rating
     * List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
     *     .collect(SObjectCollector.filtering('Rating', 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollector.groupingByString(
     *                 SObjectFunction.get('Type'),
     *                 SObjectCollector.filtering('Rating', 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final String fieldName, final Object value) {
        return filtering(SObjectPredicate.isEqual(fieldName, value));
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
     *     .collect(SObjectCollector.filtering(Account.Rating, 'Hot'));
     * // Group accounts with hot Rating by type
     * Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
     *     (Map<String, List<Account>>) Stream.of(accounts)
     *        .collect(
     *             SObjectCollector.groupingByString(
     *                 SObjectFunction.get('Type'),
     *                 SObjectCollector.filtering(Account.Rating, 'Hot')
     *        ).cast(Map<String, List<Account>>.class));
     */
    public static SObjectCollector filtering(final SObjectField field, final Object value) {
        return filtering(SObjectPredicate.isEqual(field, value));
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
     *         .collect(SObjectCollector.mapping(SObjectFunction.get('Name')).cast(List<String>.class));
     */
    public static SObjectCollector mapping(final ISObjectFunction mapper) {
        return mapping(mapper, Collector.toList());
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.mapping(
     *                 SObjectFunction.get('Name'),
     *                 Collector.toStringSet()
     *             )
     *         ).cast(Map<String, Set<String>>.class));
     */
    public static SObjectCollector mapping(final ISObjectFunction mapper, final ICollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ListSObjectConsumer.mapping(mapper, downstream.accumulator()),
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<String> accountNames = (List<String>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.mapping('Name').cast(List<String>.class));
     */
    public static SObjectCollector mapping(final String fieldName) {
        return mapping(SObjectFunction.get(fieldName));
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
     *         .collect(SObjectCollector.mapping(Account.Name).cast(List<String>.class));
     */
    public static SObjectCollector mapping(final SObjectField field) {
        return mapping(SObjectFunction.get(field));
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
     *     .collect(
     *         SObjectCollector.flatMapping(SObjectFunction.getSObjects('Contacts'))
     *     ).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.flatMapping(SObjectFunction.getSObjects('Contacts'))
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final ISObjectFunction mapper) {
        return flatMapping(mapper, Collector.toList());
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
     *     .collect(SObjectCollector.flatMapping(
     *         SObjectFunction.getSObjects('Contacts'),
     *         Collector.toSObjectSet()
     *     ));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.flatMapping(
     *                 SObjectFunction.getSObjects('Contacts'),
     *                 Collector.toSObjectList()
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final ISObjectFunction mapper, final ICollector downstream) {
        return SObjectCollector.of(
                downstream.supplier(),
                ListSObjectConsumer.flatMapping(mapper, downstream.accumulator()),
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Contact> contacts = (List<Contact>) Stream.of(accounts)
     *     .collect(SObjectCollector.flatMapping('Contacts')).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.flatMapping('Contacts')
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final String fieldName) {
        return flatMapping(SObjectFunction.getSObjects(fieldName));
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
     *     .collect(SObjectCollector.flatMapping(Contact.AccountId)).cast(List<Contact>.class));
     * Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.flatMapping(Contact.AccountId)
     *         ).cast(Map<String, List<Contact>>.class));
     */
    public static SObjectCollector flatMapping(final SObjectField field) {
        return flatMapping(SObjectFunction.getSObjects(field));
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
     *     .collect(SObjectCollector.reducing(
     *         new Account(NumberOfEmployees = 0),
     *         sumIntFieldReducer
     *     ));
     */
    public static SObjectCollector reducing(final SObject identity, final ISObjectBinaryOperator accumulator) {
        return SObjectCollector.of(
                Supplier.sObjectBox(identity),
                ListSObjectConsumer.reducing(accumulator),
                ListFunction.get(0)
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.reducing(
     *                 SObjectBinaryOperator.maxBy('NumberOfEmployees')
     *             )
     *         ));
     * Account customerWithMaxNumberOfEmployees = (Account)
     *     accountOptionalWithMaxNumberOfEmployeesPerType.get('Customer').get();
     */
    public static SObjectCollector reducing(final ISObjectBinaryOperator accumulator) {
        return SObjectCollector.of(
                Supplier.of(List<SObject>.class),
                ListSObjectConsumer.reducingOptional(accumulator),
                CollectorFunction.reducingOptionalSObject()
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.maximizing(
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.maximizing('NumberOfEmployees')
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get(Account.Type),
     *             SObjectCollector.maximizing(Account.NumberOfEmployees)
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.minimizing(
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
     *     Stream.of(accounts)
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get('Type'),
     *             SObjectCollector.maximizing('NumberOfEmployees')
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
     *         .collect(SObjectCollector.groupingByString(
     *             SObjectFunction.get(Account.Type),
     *             SObjectCollector.maximizing(Account.NumberOfEmployees)
     *         ));
     * Account customerWithMinNumberOfEmployees = (Account)
     *     ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
     */
    public static SObjectCollector minimizing(final SObjectField field) {
        return minimizing(SObjectComparator.comparing(field));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class SObjectCollectorOf extends SObjectCollector {
        private final ISupplier supplier;
        private final IObjectSObjectConsumer accumulator;
        private final IFunction finisher;
        private SObjectCollectorOf(ISupplier supplier, IObjectSObjectConsumer accumulator, IFunction finisher) {
            this.supplier = supplier;
            this.accumulator = accumulator;
            this.finisher = finisher;
        }
        public override ISupplier supplier() { return supplier; }
        public override IObjectSObjectConsumer accumulator() { return accumulator; }
        public override IFunction finisher() { return finisher; }
    }
    // @end-group
    //</editor-fold>

}
