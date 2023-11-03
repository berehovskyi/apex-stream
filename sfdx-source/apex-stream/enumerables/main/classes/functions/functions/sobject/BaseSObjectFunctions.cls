/**
 * @description Provides base implementations of {@link Function}
 * and related utilities that are used by {@link ISObjectEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseSObjectFunctions {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseSObjectFunctions() {}

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
     * BaseSObjectFunctions.get('Name');
     * BaseSObjectFunctions.get('Parent.Name');
     * BaseSObjectFunctions.get('Parent?.Name');
     */
    public static Function get(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.contains('.')) { return new GetFieldNameFunction(fieldName); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new GetFieldPathSafeFunction(fieldName); }
        return new GetFieldPathFunction(fieldName);
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
     * BaseSObjectFunctions.get(Account.Name);
     */
    public static Function get(final SObjectField field) {
        return new GetByFieldFunction(field);
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
     * BaseSObjectFunctions.getSObjects('Contacts');
     * BaseSObjectFunctions.getSObjects('Parent.Contacts');
     * BaseSObjectFunctions.getSObjects('Parent?.Contacts');
     */
    public static Function getSObjects(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.contains('.')) { return new GetSObjectsFieldNameFunction(fieldName); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new GetSObjectsFieldPathSafeFunction(fieldName); }
        return new GetSObjectsFieldPathFunction(fieldName);
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
     * BaseSObjectFunctions.getSObjects(Contact.AccountId);
     */
    public static Function getSObjects(final SObjectField field) {
        final String relationshipField = EnumerablePipeline.findRelationshipField(field);
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(relationshipField);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    private abstract class SObjectPathFunction extends Function {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = BaseSObjectOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class GetFieldNameFunction extends Function {
        private final String fieldName;
        private GetFieldNameFunction(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).get(fieldName); }
    }

    private class GetFieldPathFunction extends SObjectPathFunction {
        private GetFieldPathFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj)).get(xRefFieldName);
        }
    }

    private class GetFieldPathSafeFunction extends SObjectPathFunction {
        private GetFieldPathSafeFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj))?.get(xRefFieldName);
        }
    }

    private class GetByFieldFunction extends Function {
        private final SObjectField field;
        private GetByFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).get(field); }
    }

    private class GetSObjectsFieldNameFunction extends Function {
        private final String fieldName;
        private GetSObjectsFieldNameFunction(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObjects(fieldName); }
    }

    private class GetSObjectsFieldPathFunction extends SObjectPathFunction {
        private GetSObjectsFieldPathFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj)).getSObjects(xRefFieldName);
        }
    }

    private class GetSObjectsFieldPathSafeFunction extends SObjectPathFunction {
        private GetSObjectsFieldPathSafeFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj))?.getSObjects(xRefFieldName);
        }
    }
    //</editor-fold>

}
