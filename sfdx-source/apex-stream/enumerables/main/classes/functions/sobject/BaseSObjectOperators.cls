/**
 * @description
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class BaseSObjectOperators {

    @TestVisible
    protected BaseSObjectOperators() {}

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
     * Operators.getSObject('Parent');
     * Operators.getSObject('Parent.Parent');
     * Operators.getSObject('Parent?.Parent');
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
     * Operators.getSObject(Account.ParentId);
     */
    public static Operator getSObject(final SObjectField field) {
        Validate.notNull(field);
        return new GetSObjectFieldOperator(field);
    }

    private class GetSObjectFieldNameOperator extends Operator {
        private final String fieldName;
        private GetSObjectFieldNameOperator(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(fieldName); }
    }

    private class GetSObjectFieldPathSafeOperator extends Operator {
        private final List<String> path;
        private GetSObjectFieldPathSafeOperator(String fieldName) { path = fieldName.split('\\.'); }
        public override Object apply(Object root) {
            SObject sObj = (SObject) root;
            for (Integer i = 0, size = path.size(); i < size; i++) {
                String fieldName = path[i];
                if (fieldName.endsWith('?')) { // Safe Navigation
                    fieldName = fieldName.removeEnd('?');
                    sObj = sObj.getSObject(fieldName);
                    if (sObj == null) {
                        return sObj;
                    }
                } else {
                    sObj = sObj.getSObject(fieldName);
                }
            }
            return sObj;
        }
    }

    private class GetSObjectFieldOperator extends Operator {
        private final SObjectField field;
        private GetSObjectFieldOperator(SObjectField field) { this.field = field; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }

}
