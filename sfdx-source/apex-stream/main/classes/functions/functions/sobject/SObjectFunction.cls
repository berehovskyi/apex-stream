/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link ISObjectFunction} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ISObjectIterable.mapToObject
 */
public abstract inherited sharing class SObjectFunction implements ISObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectFunction` that always returns the input argument.
     * @return the `SObjectFunction`
     */
    public static SObjectFunction identity() {
        return new Identity();
    }

    /**
     * @description Returns a `SObjectFunction` that always returns the `value`.
     * @param value the value
     * @return the `SObjectFunction`
     */
    public static SObjectFunction constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `predicate`.
     * @param predicate the predicate
     * @return the `SObjectFunction`
     * @throws NullPointerException if `predicate` is null
     */
    public static SObjectFunction forPredicate(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new ForPredicate(predicate);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `operator`.
     * @param operator the operator
     * @return the `SObjectFunction`
     * @throws NullPointerException if `operator` is null
     */
    public static SObjectFunction forOperator(final ISObjectUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForUnaryOperator(operator);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `supplier`.
     * @param supplier the supplier
     * @return the `SObjectFunction`
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectFunction forSupplier(final ISupplier supplier) {
        Validate.notNull(supplier);
        return new ForSupplier(supplier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectFunction` that gets a value for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectFunction.get('Name');
     * SObjectFunction.get('Parent.Name');
     * SObjectFunction.get('Parent?.Name');
     * @param fieldName the field to get a value
     * @return the `SObjectFunction`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.get
     */
    public static SObjectFunction get(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.contains('.')) { return new GetFieldName(fieldName); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new GetFieldPathSafe(fieldName); }
        return new GetFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectFunction` that gets a value for
     * the specified `field`.
     * @example
     * SObjectFunction.get(Account.Name);
     * @param field the field to get a value
     * @return the `SObjectFunction`
     * @throws NullPointerException if `field` is null
     * @see SObject.get
     */
    public static SObjectFunction get(final SObjectField field) {
        Validate.notNull(field);
        return new GetByField(field);
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * a map of populated field names and their corresponding values for an input argument.
     * @return the `SObjectFunction`
     * @see SObject.getPopulatedFieldsAsMap
     */
    public static SObjectFunction getPopulatedFieldsAsMap() {
        return new GetPopulatedFieldsAsMap();
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * the name of a quick action associated with an input argument.
     * @return the `SObjectFunction`
     * @see SObject.getQuickActionName
     */
    public static SObjectFunction getQuickActionName() {
        return new GetQuickActionName();
    }

    /**
     * @description Returns a `SObjectFunction` that gets children sobjects for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectFunction.get('Contacts');
     * SObjectFunction.get('Parent.Contacts');
     * SObjectFunction.get('Parent?.Contacts');
     * @param fieldName the field to get a value
     * @return the `SObjectFunction`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.getSObjects
     */
    public static SObjectFunction getSObjects(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.contains('.')) { return new GetSObjectsFieldName(fieldName); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) {
            return new GetSObjectsFieldPathSafe(fieldName);
        }
        return new GetSObjectsFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectFunction` that gets children sobjects for
     * the specified `field`. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectFunction.get(Contact.AccountId);
     * @param field the field to get a value
     * @return the `SObjectFunction`
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.getSObjects
     */
    public static SObjectFunction getSObjects(final SObjectField field) {
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObject(Contact.AccountId)
        return getSObjects(Schemas.findRelationshipName(field));
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * the `SObjectType` of an input argument.
     * @return the `SObjectFunction`
     * @see SObject.getQuickActionName
     */
    public static SObjectFunction getSObjectType() {
        return new GetSObjectType();
    }

    /**
     * @description Returns a `SObjectFunction` that sets the value returned by
     * the `mapper` for the specified `fieldName` and returns the previous value for the field.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectFunction.put('NumberOfEmployees', someSObjectFunction);
     * SObjectFunction.put('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectFunction.put('Parent?.NumberOfEmployees', someSObjectFunction);
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     * @return the `SObjectFunction`
     * @throws NullPointerException if `fieldName` is blank or the `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectFunction put(final String fieldName, final ISObjectFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!fieldName.contains('.')) { return new PutFieldName(fieldName, mapper); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new PutFieldPathSafe(fieldName, mapper); }
        return new PutFieldPath(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectFunction` that sets the value returned by
     * the `mapper` for the specified `field` and returns the previous value for the field.
     * @example
     * SObjectConsumer.put(Account.NumberOfEmployees, someSObjectFunction);
     * SObjectConsumer.put(Account.NumberOfEmployees, SObjectFunction.constant(100));
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     * @return the `SObjectFunction`
     * @throws NullPointerException if `field` or `mapper` is null
     * @see SObject.put
     */
    public static SObjectFunction put(final SObjectField field, final ISObjectFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new PutByField(field, mapper);
    }

    /**
     * @description Returns a `SObjectFunction` that sets the `value`
     * for the specified `fieldName` and returns the previous value for the field.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectFunction.put('NumberOfEmployees', 100);
     * SObjectFunction.put('Parent.NumberOfEmployees', 100);
     * SObjectFunction.put('Parent?.NumberOfEmployees', (Object) null);
     * @param fieldName the field name to set a value
     * @param value the value to set
     * @return the `SObjectFunction`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectFunction put(final String fieldName, final Object value) {
        return put(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectFunction` that sets the `value`
     * for the specified `field` and returns the previous value for the field.
     * @example
     * SObjectFunction.put(Account.NumberOfEmployees, 100);
     * SObjectFunction.put(Account.NumberOfEmployees, (Object) null);
     * @param field the field name to set a value
     * @param value the value to set
     * @return the `SObjectFunction`
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectFunction put(final SObjectField field, final Object value) {
        return put(field, SObjectFunction.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends SObjectFunction {
        public override Object apply(SObject sObj) { return sObj; }
    }

    private class Constant extends SObjectFunction {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(SObject sObj) { return value; }
    }

    private class ForPredicate extends SObjectFunction {
        private final ISObjectPredicate predicate;
        private ForPredicate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Object apply(SObject sObj) { return predicate.test(sObj); }
    }

    private class ForUnaryOperator extends SObjectFunction {
        private final ISObjectUnaryOperator operator;
        private ForUnaryOperator(ISObjectUnaryOperator operator) { this.operator = operator; }
        public override Object apply(SObject sObj) { return operator.apply(sObj); }
    }

    private class ForSupplier extends SObjectFunction {
        private final ISupplier supplier;
        private ForSupplier(ISupplier supplier) { this.supplier = supplier; }
        public override Object apply(SObject sObj) { return supplier.get(); }
    }

    private abstract class SObjectPathFunction extends SObjectFunction {
        protected final ISObjectUnaryOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperator.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class GetFieldName extends SObjectFunction {
        private final String fieldName;
        private GetFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(SObject sObj) { return sObj.get(fieldName); }
    }

    private class GetFieldPath extends SObjectPathFunction {
        private GetFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(SObject sObj) { return operator.apply(sObj).get(xRefFieldName); }
    }

    private class GetFieldPathSafe extends SObjectPathFunction {
        private GetFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(SObject sObj) { return operator.apply(sObj)?.get(xRefFieldName); }
    }

    private class GetSObjectsFieldName extends SObjectFunction {
        private final String fieldName;
        private GetSObjectsFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(SObject sObj) { return sObj.getSObjects(fieldName); }
    }

    private class GetSObjectsFieldPath extends SObjectPathFunction {
        private GetSObjectsFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(SObject sObj) { return operator.apply(sObj).getSObjects(xRefFieldName); }
    }

    private class GetSObjectsFieldPathSafe extends SObjectPathFunction {
        private GetSObjectsFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(SObject sObj) { return operator.apply(sObj)?.getSObjects(xRefFieldName); }
    }

    private class GetByField extends SObjectFunction {
        private final SObjectField field;
        private GetByField(SObjectField field) { this.field = field; }
        public override Object apply(SObject sObj) { return sObj.get(field); }
    }

    private class GetPopulatedFieldsAsMap extends SObjectFunction {
        public override Object apply(SObject sObj) { return sObj.getPopulatedFieldsAsMap(); }
    }

    private class GetQuickActionName extends SObjectFunction {
        public override Object apply(SObject sObj) { return sObj.getQuickActionName(); }
    }

    private class GetSObjectType extends SObjectFunction {
        public override Object apply(SObject sObj) { return sObj.getSObjectType(); }
    }

    private class PutFieldName extends SObjectFunction {
        private final String fieldName;
        private final ISObjectFunction mapper;
        private PutFieldName(String fieldName, ISObjectFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override Object apply(SObject sObj) {
            return sObj.put(fieldName, mapper.apply(sObj));
        }
    }

    private class PutFieldPath extends SObjectPathFunction {
        private final ISObjectFunction mapper;
        private PutFieldPath(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(SObject sObj) {
            return operator.apply(sObj).put(xRefFieldName, mapper.apply(sObj));
        }
    }

    private class PutFieldPathSafe extends SObjectPathFunction {
        private final ISObjectFunction mapper;
        private PutFieldPathSafe(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(SObject sObj) {
            return operator.apply(sObj)?.put(xRefFieldName, mapper.apply(sObj));
        }
    }

    private class PutByField extends SObjectFunction {
        private final SObjectField field;
        private final ISObjectFunction mapper;
        private PutByField(SObjectField field, ISObjectFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        public override Object apply(SObject sObj) { return sObj.put(field, mapper.apply(sObj)); }
    }
    // @end-group
    //</editor-fold>

}
