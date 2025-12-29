/**
 * @description Utility methods to simplify and standardize common SObject enumerable manipulations.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectEnumerableSupport {
    /**
     * @description Returns a `Consumer` that sets the value returned by
     * the `mapper` for the specified `field`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.put
     *
     * @example
     * SObjectEnumerableSupport.set('NumberOfEmployees', someFunction);
     * SObjectEnumerableSupport.set('Parent.NumberOfEmployees', someFunction);
     * SObjectEnumerableSupport.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static Consumer set(final String field, final IFunction mapper) {
        return new SetFieldConsumer(field, mapper);
    }

    /**
     * @description Returns a `Consumer` that sets the value returned by
     * the `mapper` for the specified `field`.
     *
     * @param field the field to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.put
     *
     * @example
     * SObjectEnumerableSupport.set(Account.NumberOfEmployees, someFunction);
     */
    public static Consumer set(final SObjectField field, final IFunction mapper) {
        return new SetField(field, mapper);
    }

    /**
     * @description Returns a `Consumer` that sets the `value`
     * for the specified `field`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to set a value
     * @param value the value to set
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.put
     *
     * @example
     * SObjectEnumerableSupport.set('NumberOfEmployees', 100);
     * SObjectEnumerableSupport.set('Parent.NumberOfEmployees', 100);
     * SObjectEnumerableSupport.set('Parent?.NumberOfEmployees', (Object) null);
     */
    public static Consumer set(final String field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `Consumer` that sets the `value`
     * for the specified `field`.
     *
     * @param field the field to set a value
     * @param value the value to set
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.put
     *
     * @example
     * SObjectEnumerableSupport.set(Account.NumberOfEmployees, 100);
     * SObjectEnumerableSupport.set(Account.NumberOfEmployees, (Object) null);
     */
    public static Consumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `Function` that gets a value for
     * the specified `field`. Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to get a value
     *
     * @return the `Function`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.get
     *
     * @example
     * SObjectEnumerableSupport.get('Name');
     * SObjectEnumerableSupport.get('Parent.Name');
     * SObjectEnumerableSupport.get('Parent?.Name');
     */
    public static Function get(final String field) {
        return new GetFunction(field);
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
     * SObjectEnumerableSupport.get(Account.Name);
     */
    public static Function get(final SObjectField field) {
        return new GetByFieldFunction(field);
    }

    /**
     * @description Returns a `Function` that gets children sobjects for
     * the specified `field`. Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to get a value
     *
     * @return the `Function`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.getSObjects
     *
     * @example
     * SObjectEnumerableSupport.getSObjects('Contacts');
     * SObjectEnumerableSupport.getSObjects('Parent.Contacts');
     * SObjectEnumerableSupport.getSObjects('Parent?.Contacts');
     */
    public static Function getSObjects(final String field) {
        return new GetSObjectsFunction(field);
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
     * SObjectEnumerableSupport.getSObjects(Contact.AccountId);
     */
    public static Function getSObjects(final SObjectField field) {
        final String relationshipField = findRelationshipField(field);
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(relationshipField);
    }

    /**
     * @description Returns a `Operator` that gets sobject
     * for the specified `field`. Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to get a value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectEnumerableSupport.getSObject('Parent');
     * SObjectEnumerableSupport.getSObject('Parent.Parent');
     * SObjectEnumerableSupport.getSObject('Parent?.Parent');
     */
    public static Operator getSObject(final String field) {
        return new GetSObjectOperator(field);
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
     * SObjectEnumerableSupport.getSObject(Account.ParentId);
     */
    public static Operator getSObject(final SObjectField field) {
        return new GetSObjectFieldOperator(field);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectEnumerableSupport.isEqual('NumberOfEmployees', 100);
     * SObjectEnumerableSupport.isEqual('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isEqual(final String field, final Object value) {
        return EnumerableSupport.isEqual(get(field), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is equal to the `value`, comparing object value equality
     * not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectEnumerableSupport.isEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isEqual(final SObjectField field, final Object value) {
        return EnumerableSupport.isEqual(get(field), Function.constant(value));
    }

    /**
     * @description Finds the relationship name for a given SObject field that is a reference field.
     *
     * @param field The SObjectField to find the relationship name for. This field must be a reference field.
     *
     * @return The relationship name of the given SObject field.
     *
     * @throws IllegalArgumentException if the provided field is not a reference field.
     * @throws NullPointerException if no relationship name is found for the provided field.
     */
    public static String findRelationshipField(final SObjectField field) {
        Validate.isNotNull(field);
        final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
        Validate.isTrue(!referenceTo.isEmpty(), Label.AF_ErrorMessage_NotReferenceField, new List<Object>{ field });
        String result;
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                result = relationship.getRelationshipName();
                break;
            }
        }
        Validate.isNotNull(result);
        return result;
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String field) {
            xRefFieldName = field.substringAfterLast('.');
            operator = getSObject(field.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends Consumer {
        private final String field;
        private final IFunction mapper;
        private SetFieldName(String field, IFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply(((SObject) obj))); }
    }

    private class SetFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPath(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj)).put(xRefFieldName, mapper.apply(((SObject) obj)));
        }
    }

    private class SetFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPathSafe(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj))?.put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class SetField extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetField(SObjectField field, IFunction mapper) {
            Validate.notNull(field);
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply(obj)); }
    }

    private class SetFieldConsumer extends Consumer {
        private final IConsumer consumer;
        // prettier-ignore
        private SetFieldConsumer(String field, IFunction mapper) {
            Validate.notBlank(field);
            Validate.notNull(mapper);
            if (!field.contains('.')) { consumer = new SetFieldName(field, mapper); }
            else if (field.substringBeforeLast('.').endsWith('?')) {
                consumer = new SetFieldPathSafe(field, mapper);
            } else { consumer = new SetFieldPath(field, mapper); }
        }
        // prettier-ignore
        public override void accept(Object obj) { consumer.accept(obj); }
    }

    private abstract class SObjectPathFunction extends Function {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String field) {
            xRefFieldName = field.substringAfterLast('.');
            operator = getSObject(field.substringBeforeLast('.'));
        }
    }

    private class GetFieldNameFunction extends Function {
        private final String field;
        // prettier-ignore
        private GetFieldNameFunction(String field) { this.field = field; }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) obj).get(field); }
    }

    private class GetFieldPathFunction extends SObjectPathFunction {
        // prettier-ignore
        private GetFieldPathFunction(String field) { super(field); }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj)).get(xRefFieldName); }
    }

    private class GetFieldPathSafeFunction extends SObjectPathFunction {
        // prettier-ignore
        private GetFieldPathSafeFunction(String field) { super(field); }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj))?.get(xRefFieldName); }
    }

    private class GetFunction extends Function {
        private final IFunction mapper;
        // prettier-ignore
        private GetFunction(String field) {
            Validate.notBlank(field);
            if (!field.contains('.')) { mapper = new GetFieldNameFunction(field); }
            else if (field.substringBeforeLast('.').endsWith('?')) {
                mapper = new GetFieldPathSafeFunction(field);
            } else { mapper = new GetFieldPathFunction(field); }
        }
        // prettier-ignore
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetByFieldFunction extends Function {
        private final SObjectField field;
        private GetByFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) obj).get(field); }
    }

    private class GetSObjectsFieldNameFunction extends Function {
        private final String field;
        // prettier-ignore
        private GetSObjectsFieldNameFunction(String field) { this.field = field; }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) obj).getSObjects(field); }
    }

    private class GetSObjectsFieldPathFunction extends SObjectPathFunction {
        // prettier-ignore
        private GetSObjectsFieldPathFunction(String field) { super(field); }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj)).getSObjects(xRefFieldName); }
    }

    private class GetSObjectsFieldPathSafeFunction extends SObjectPathFunction {
        // prettier-ignore
        private GetSObjectsFieldPathSafeFunction(String field) { super(field); }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) operator.apply(obj))?.getSObjects(xRefFieldName); }
    }

    private class GetSObjectsFunction extends Function {
        private final IFunction mapper;
        // prettier-ignore
        private GetSObjectsFunction(String field) {
            Validate.notBlank(field);
            if (!field.contains('.')) { mapper = new GetSObjectsFieldNameFunction(field); }
            else if (field.substringBeforeLast('.').endsWith('?')) {
                mapper = new GetSObjectsFieldPathSafeFunction(field);
            } else { mapper = new GetSObjectsFieldPathFunction(field); }
        }
        // prettier-ignore
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetSObjectFieldNameOperator extends Operator {
        private final String field;
        // prettier-ignore
        private GetSObjectFieldNameOperator(String field) { this.field = field; }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }

    private class GetSObjectFieldPathSafeOperator extends Operator {
        private final List<String> path;
        // prettier-ignore
        private GetSObjectFieldPathSafeOperator(String field) { path = field.split('\\.'); }
        // prettier-ignore
        public override Object apply(Object obj) { return getSObject((SObject) obj, 0); }
        // prettier-ignore
        private SObject getSObject(SObject sObj, Integer i) {
            if (i >= path.size()) { return sObj; }
            String field = path[i];
            Boolean isSafeNavigation = field.endsWith('?'); // Safe Navigation
            if (isSafeNavigation) { field = field.removeEnd('?'); }
            sObj = sObj.getSObject(field);
            if (isSafeNavigation && sObj == null) { return null; }
            return getSObject(sObj, ++i);
        }
    }

    private class GetSObjectOperator extends Operator {
        private final IFunction mapper;
        // prettier-ignore
        private GetSObjectOperator(String field) {
            Validate.notBlank(field);
            if (!field.containsAny('?.')) { mapper = new GetSObjectFieldNameOperator(field); }
            else { mapper = new GetSObjectFieldPathSafeOperator(field); }
        }
        // prettier-ignore
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetSObjectFieldOperator extends Operator {
        private final SObjectField field;
        private GetSObjectFieldOperator(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        // prettier-ignore
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }
}
