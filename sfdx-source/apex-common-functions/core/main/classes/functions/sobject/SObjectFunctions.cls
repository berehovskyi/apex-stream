/**
 * @description Provides common implementations of {@link Function}
 * and related utilities.
 *
 * @see Function
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class SObjectFunctions {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Function` that gets a value for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Function`
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
    public static Function get(final String fieldName) {
        return new GetFunction(fieldName);
    }

    /**
     * @description Returns a `Function` that gets a value for
     * the specified `field`.
     *
     * @param field the field to get a value
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.get
     *
     * @example
     * SObjectFunctions.get(Account.Name);
     */
    public static Function get(final SObjectField field) {
        return new GetFieldFunction(field);
    }

    /**
     * @description Returns a `Function` that gets children sobjects for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Function`
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
    public static Function getSObjects(final String fieldName) {
        return new GetSObjectsFunction(fieldName);
    }

    /**
     * @description Returns a `Function` that gets children sobjects for
     * the specified `field`. Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to get a value
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     *
     * @see SObject.getSObjects
     *
     * @example
     * SObjectFunctions.getSObjects(Contact.AccountId);
     */
    public static Function getSObjects(final SObjectField field) {
        final String relationshipField = CsfSupport.findRelationshipField(field);
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(relationshipField);
    }

    /**
     * @description Returns a `Function` that returns
     * a map of populated field names and their corresponding values for an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getPopulatedFieldsAsMap
     */
    public static Function getPopulatedFieldsAsMap() {
        return new GetPopulatedFieldsAsMap();
    }

    /**
     * @description Returns a `Function` that returns
     * the name of a quick action associated with an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getQuickActionName
     */
    public static Function getQuickActionName() {
        return new GetQuickActionName();
    }

    /**
     * @description Returns a `Function` that returns
     * the `SObjectType` of an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getSObjectType
     */
    public static Function getSObjectType() {
        return new GetSObjectType();
    }

    /**
     * @description Returns a `Function` that sets the value returned by
     * the `mapper` for the specified `fieldName` and returns the previous value for the field.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Function`
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
     * SObjectFunctions.put('NumberOfEmployees', someFunction);
     * SObjectFunctions.put('Parent.NumberOfEmployees', someFunction);
     * SObjectFunctions.put('Parent?.NumberOfEmployees', someFunction);
     */
    public static Function put(final String fieldName, final IFunction mapper) {
        return new PutFunction(fieldName, mapper);
    }

    /**
     * @description Returns a `Function` that sets the value returned by
     * the `mapper` for the specified `field` and returns the previous value for the field.
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObject.put
     *
     * @example
     * SObjectFunctions.put(Account.NumberOfEmployees, someFunction);
     * SObjectFunctions.put(Account.NumberOfEmployees, Function.constant(100));
     */
    public static Function put(final SObjectField field, final IFunction mapper) {
        return new PutFieldFunction(field, mapper);
    }

    /**
     * @description Returns a `Function` that sets the `value`
     * for the specified `fieldName` and returns the previous value for the field.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `Function`
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
    public static Function put(final String fieldName, final Object value) {
        return put(fieldName, Function.constant(value));
    }

    /**
     * @description Returns a `Function` that sets the `value`
     * for the specified `field` and returns the previous value for the field.
     *
     * @param field the field name to set a value
     * @param value the value to set
     *
     * @return the `Function`
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
    public static Function put(final SObjectField field, final Object value) {
        return put(field, Function.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class SObjectPathFunction extends Function {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class GetByFieldName extends Function {
        private final String fieldName;
        private GetByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).get(fieldName); }
    }

    private class GetByFieldPath extends SObjectPathFunction {
        private GetByFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj)).get(xRefFieldName); }
    }

    private class GetByFieldPathSafe extends SObjectPathFunction {
        private GetByFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj))?.get(xRefFieldName); }
    }

    private class GetFunction extends Function {
        private final IFunction mapper;
        private GetFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!CsfSupport.isXRefField(fieldName)) { mapper = new GetByFieldName(fieldName); }
            else if (CsfSupport.isSafePath(fieldName)) { mapper = new GetByFieldPathSafe(fieldName); }
            else { mapper = new GetByFieldPath(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetFieldFunction extends Function {
        private final SObjectField field;
        private GetFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).get(field); }
    }

    private class GetSObjectsByFieldName extends Function {
        private final String fieldName;
        private GetSObjectsByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObjects(fieldName); }
    }

    private class GetSObjectsByFieldPath extends SObjectPathFunction {
        private GetSObjectsByFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj)).getSObjects(xRefFieldName); }
    }

    private class GetSObjectsByFieldPathSafe extends SObjectPathFunction {
        private GetSObjectsByFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj))?.getSObjects(xRefFieldName); }
    }

    private class GetSObjectsFunction extends Function {
        private final IFunction mapper;
        private GetSObjectsFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!CsfSupport.isXRefField(fieldName)) { mapper = new GetSObjectsByFieldName(fieldName); }
            else if (CsfSupport.isSafePath(fieldName)) { mapper = new GetSObjectsByFieldPathSafe(fieldName); }
            else { mapper = new GetSObjectsByFieldPath(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetPopulatedFieldsAsMap extends Function {
        public override Object apply(Object obj) { return ((SObject) obj).getPopulatedFieldsAsMap(); }
    }

    private class GetQuickActionName extends Function {
        public override Object apply(Object obj) { return ((SObject) obj).getQuickActionName(); }
    }

    private class GetSObjectType extends Function {
        public override Object apply(Object obj) { return ((SObject) obj).getSObjectType(); }
    }

    private class PutFieldName extends Function {
        private final String fieldName;
        private final IFunction mapper;
        private PutFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override Object apply(Object obj) { return ((SObject) obj).put(fieldName, mapper.apply(obj)); }
    }

    private class PutFieldPath extends SObjectPathFunction {
        private final IFunction mapper;
        private PutFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply(obj)).put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class PutFieldPathSafe extends SObjectPathFunction {
        private final IFunction mapper;
        private PutFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply(obj))?.put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class PutFunction extends Function {
        private final IFunction mapper;
        private PutFunction(String fieldName, IFunction mapper) {
            Validate.notBlank(fieldName);
            Validate.notNull(mapper);
            if (!CsfSupport.isXRefField(fieldName)) { this.mapper = new PutFieldName(fieldName, mapper); }
            else if (CsfSupport.isSafePath(fieldName)) { this.mapper = new PutFieldPathSafe(fieldName, mapper); }
            else { this.mapper = new PutFieldPath(fieldName, mapper); }
        }
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class PutFieldFunction extends Function {
        private final SObjectField field;
        private final IFunction mapper;
        private PutFieldFunction(SObjectField field, IFunction mapper) {
            Validate.notNull(field);
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        public override Object apply(Object obj) { return ((SObject) obj).put(field, mapper.apply(obj)); }
    }
    // @end-group
    //</editor-fold>

}
