/**
 * @description Provides base implementations of {@link Operator}
 * and related utilities that are used by {@link ISObjectEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseSObjectOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseSObjectOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Operator` that gets sobject
     * for the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObject
     *
     * @example
     * BaseSObjectOperators.getSObject('Parent');
     * BaseSObjectOperators.getSObject('Parent.Parent');
     * BaseSObjectOperators.getSObject('Parent?.Parent');
     */
    public static Operator getSObject(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.containsAny('?.')) { return new GetSObjectFieldNameOperator(fieldName); }
        return new GetSObjectFieldPathSafeOperator(fieldName);
    }

    /**
     * @description Returns a `Operator` that gets sobject
     * for the specified `field`.
     *
     * @param field the field to get a value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.getSObject
     *
     * @example
     * BaseSObjectOperators.getSObject(Account.ParentId);
     */
    public static Operator getSObject(final SObjectField field) {
        return new GetSObjectFieldOperator(field);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    private class GetSObjectFieldNameOperator extends Operator {
        private final String fieldName;
        private GetSObjectFieldNameOperator(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(fieldName); }
    }

    private class GetSObjectFieldPathSafeOperator extends Operator {
        private final List<String> path;
        private GetSObjectFieldPathSafeOperator(String fieldName) { path = fieldName.split('\\.'); }
        public override Object apply(Object obj) { return getSObject((SObject) obj, 0); }
        private SObject getSObject(SObject sObj, Integer i) {
            if (i >= path.size()) { return sObj; }
            String fieldName = path[i];
            Boolean isSafeNavigation = fieldName.endsWith('?'); // Safe Navigation
            if (isSafeNavigation) { fieldName = fieldName.removeEnd('?'); }
            sObj = sObj.getSObject(fieldName);
            if (isSafeNavigation && sObj == null) { return null; }
            return getSObject(sObj, ++i);
        }
    }

    private class GetSObjectFieldOperator extends Operator {
        private final SObjectField field;
        private GetSObjectFieldOperator(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }
    //</editor-fold>

}
