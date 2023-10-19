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
public virtual inherited sharing class SObjectFunctions extends BaseSObjectFunctions {

    @TestVisible
    protected SObjectFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
//    /**
//     * @description Returns a `Function` that gets a value for
//     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the field to get a value
//     *
//     * @return the `Function`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.get
//     *
//     * @example
//     * Functions.get('Name');
//     * Functions.get('Parent.Name');
//     * Functions.get('Parent?.Name');
//     */
//    public static Function get(final String fieldName) {
//        Validate.notBlank(fieldName);
//        if (!Schemas.isXRef(fieldName)) { return new GetFieldName(fieldName); }
//        if (Schemas.isSaveNav(fieldName)) { return new GetFieldPathSafe(fieldName); }
//        return new GetFieldPath(fieldName);
//    }
//
//    /**
//     * @description Returns a `Function` that gets a value for
//     * the specified `field`.
//     *
//     * @param field the field to get a value
//     *
//     * @return the `Function`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see SObject.get
//     *
//     * @example
//     * Functions.get(Account.Name);
//     */
//    public static Function get(final SObjectField field) {
//        Validate.notNull(field);
//        return new GetByField(field);
//    }

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

//    /**
//     * @description Returns a `Function` that gets children sobjects for
//     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the field to get a value
//     *
//     * @return the `Function`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.getSObjects
//     *
//     * @example
//     * Functions.getSObjects('Contacts');
//     * Functions.getSObjects('Parent.Contacts');
//     * Functions.getSObjects('Parent?.Contacts');
//     */
//    public static Function getSObjects(final String fieldName) {
//        Validate.notBlank(fieldName);
//        if (!Schemas.isXRef(fieldName)) { return new GetSObjectsFieldName(fieldName); }
//        if (Schemas.isSaveNav(fieldName)) { return new GetSObjectsFieldPathSafe(fieldName); }
//        return new GetSObjectsFieldPath(fieldName);
//    }
//
//    /**
//     * @description Returns a `Function` that gets children sobjects for
//     * the specified `field`. Cross-reference fields and safe navigation are supported.
//     *
//     * @param field the field to get a value
//     *
//     * @return the `Function`
//     *
//     * @throws NullPointerException if `field` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.getSObjects
//     *
//     * @example
//     * Functions.getSObjects(Contact.AccountId);
//     */
//    public static Function getSObjects(final SObjectField field) {
//        // Since UnexpectedException is thrown if SObject doesn't have
//        // related sObjects returned using SObjectField navigation such as
//        // acc.getSObjects(Contact.AccountId)
//        return getSObjects(Schemas.findChildRelationshipName(field));
//    }

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
     * Functions.put('NumberOfEmployees', someFunction);
     * Functions.put('Parent.NumberOfEmployees', someFunction);
     * Functions.put('Parent?.NumberOfEmployees', someFunction);
     */
    public static Function put(final String fieldName, final IFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!fieldName.contains('.')) { return new PutFieldName(fieldName, mapper); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new PutFieldPathSafe(fieldName, mapper); }
        return new PutFieldPath(fieldName, mapper);
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
     * SObjectConsumers.put(Account.NumberOfEmployees, someFunction);
     * SObjectConsumers.put(Account.NumberOfEmployees, Function.constant(100));
     */
    public static Function put(final SObjectField field, final IFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new PutByField(field, mapper);
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
     * Functions.put('NumberOfEmployees', 100);
     * Functions.put('Parent.NumberOfEmployees', 100);
     * Functions.put('Parent?.NumberOfEmployees', (Object) null);
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
     * Functions.put(Account.NumberOfEmployees, 100);
     * Functions.put(Account.NumberOfEmployees, (Object) null);
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
            operator = BaseSObjectOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
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
        public override Object apply(Object obj) { return ((SObject) obj).put(fieldName, mapper.apply((SObject) obj)); }
    }

    private class PutFieldPath extends SObjectPathFunction {
        private final IFunction mapper;
        private PutFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj)).put(xRefFieldName, mapper.apply((SObject) obj));
        }
    }

    private class PutFieldPathSafe extends SObjectPathFunction {
        private final IFunction mapper;
        private PutFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj))?.put(xRefFieldName, mapper.apply((SObject) obj));
        }
    }

    private class PutByField extends Function {
        private final SObjectField field;
        private final IFunction mapper;
        private PutByField(SObjectField field, IFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        public override Object apply(Object obj) { return ((SObject) obj).put(field, mapper.apply(((SObject) obj))); }
    }
    // @end-group
    //</editor-fold>

}
