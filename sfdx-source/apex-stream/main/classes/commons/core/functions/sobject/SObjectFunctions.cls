/**
 * @description Provides common implementations of {@link SObjectFunction}
 * and related utilities.
 *
 * @see SObjectFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectFunctions {

    @TestVisible
    private SObjectFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectFunction` that gets a value for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `SObjectFunction`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.get
     *
     * @example
     * SObjectFunctions.get('Name');
     * SObjectFunctions.get('Parent.Name');
     * SObjectFunctions.get('Parent?.Name');
     */
    public static SObjectFunction get(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!Schemas.isXRef(fieldName)) { return new GetFieldName(fieldName); }
        if (Schemas.isSaveNav(fieldName)) { return new GetFieldPathSafe(fieldName); }
        return new GetFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectFunction` that gets a value for
     * the specified `field`.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.get
     *
     * @example
     * SObjectFunctions.get(Account.Name);
     */
    public static SObjectFunction get(final SObjectField field) {
        Validate.notNull(field);
        return new GetByField(field);
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * a map of populated field names and their corresponding values for an input argument.
     *
     * @return the `SObjectFunction`
     *
     * @see SObject.getPopulatedFieldsAsMap
     */
    public static SObjectFunction getPopulatedFieldsAsMap() {
        return new GetPopulatedFieldsAsMap();
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * the name of a quick action associated with an input argument.
     *
     * @return the `SObjectFunction`
     *
     * @see SObject.getQuickActionName
     */
    public static SObjectFunction getQuickActionName() {
        return new GetQuickActionName();
    }

    /**
     * @description Returns a `SObjectFunction` that gets children sobjects for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `SObjectFunction`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObjects
     *
     * @example
     * SObjectFunctions.getSObjects('Contacts');
     * SObjectFunctions.getSObjects('Parent.Contacts');
     * SObjectFunctions.getSObjects('Parent?.Contacts');
     */
    public static SObjectFunction getSObjects(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!Schemas.isXRef(fieldName)) { return new GetSObjectsFieldName(fieldName); }
        if (Schemas.isSaveNav(fieldName)) { return new GetSObjectsFieldPathSafe(fieldName); }
        return new GetSObjectsFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectFunction` that gets children sobjects for
     * the specified `field`. Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObjects
     *
     * @example
     * SObjectFunctions.getSObjects(Contact.AccountId);
     */
    public static SObjectFunction getSObjects(final SObjectField field) {
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(Schemas.findChildRelationshipName(field));
    }

    /**
     * @description Returns a `SObjectFunction` that returns
     * the `SObjectType` of an input argument.
     *
     * @return the `SObjectFunction`
     *
     * @see SObject.getSObjectType
     */
    public static SObjectFunction getSObjectType() {
        return new GetSObjectType();
    }

    /**
     * @description Returns a `SObjectFunction` that sets the value returned by
     * the `mapper` for the specified `fieldName` and returns the previous value for the field.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectFunction`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * SObjectFunctions.put('NumberOfEmployees', someSObjectFunction);
     * SObjectFunctions.put('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectFunctions.put('Parent?.NumberOfEmployees', someSObjectFunction);
     */
    public static SObjectFunction put(final String fieldName, final ISObjectFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!Schemas.isXRef(fieldName)) { return new PutFieldName(fieldName, mapper); }
        if (Schemas.isSaveNav(fieldName)) { return new PutFieldPathSafe(fieldName, mapper); }
        return new PutFieldPath(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectFunction` that sets the value returned by
     * the `mapper` for the specified `field` and returns the previous value for the field.
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObject.put
     *
     * @example
     * SObjectConsumers.put(Account.NumberOfEmployees, someSObjectFunction);
     * SObjectConsumers.put(Account.NumberOfEmployees, SObjectFunction.constant(100));
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
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `SObjectFunction`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * SObjectFunctions.put('NumberOfEmployees', 100);
     * SObjectFunctions.put('Parent.NumberOfEmployees', 100);
     * SObjectFunctions.put('Parent?.NumberOfEmployees', (Object) null);
     */
    public static SObjectFunction put(final String fieldName, final Object value) {
        return put(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectFunction` that sets the `value`
     * for the specified `field` and returns the previous value for the field.
     *
     * @param field the field name to set a value
     * @param value the value to set
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * SObjectFunctions.put(Account.NumberOfEmployees, 100);
     * SObjectFunctions.put(Account.NumberOfEmployees, (Object) null);
     */
    public static SObjectFunction put(final SObjectField field, final Object value) {
        return put(field, SObjectFunction.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class SObjectPathFunction extends SObjectFunction {
        protected final ISObjectUnaryOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperators.getSObject(fieldName.substringBeforeLast('.'));
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
        public override Object apply(SObject sObj) { return sObj.put(fieldName, mapper.apply(sObj)); }
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
