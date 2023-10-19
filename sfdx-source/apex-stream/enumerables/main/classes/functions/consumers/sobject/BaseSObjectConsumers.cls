/**
 * @description
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class BaseSObjectConsumers {
    
    @TestVisible
    protected BaseSObjectConsumers() {}

    /**
     * @description Returns a `Consumer` that sets the value returned by
     * the `mapper` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Consumer`
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
     * Consumers.set('NumberOfEmployees', someFunction);
     * Consumers.set('Parent.NumberOfEmployees', someFunction);
     * Consumers.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static Consumer set(final String fieldName, final IFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!fieldName.contains('.')) { return new SetFieldName(fieldName, mapper); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new SetFieldPathSafe(fieldName, mapper); }
        return new SetFieldPath(fieldName, mapper);
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
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * Consumers.set(Account.NumberOfEmployees, someFunction);
     */
    public static Consumer set(final SObjectField field, final IFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new SetField(field, mapper);
    }

    /**
     * @description Returns a `Consumer` that sets the `value`
     * for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `Consumer`
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
     * Consumers.set('NumberOfEmployees', 100);
     * Consumers.set('Parent.NumberOfEmployees', 100);
     * Consumers.set('Parent?.NumberOfEmployees', (Object) null);
     */
    public static Consumer set(final String fieldName, final Object value) {
        return set(fieldName, Function.constant(value));
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
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * Consumers.set(Account.NumberOfEmployees, 100);
     * Consumers.set(Account.NumberOfEmployees, (Object) null);
     */
    public static Consumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = BaseSObjectOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends Consumer {
        private final String fieldName;
        private final IFunction mapper;
        private SetFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(fieldName, this.mapper.apply(((SObject) obj))); }
    }

    private class SetFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj)).put(xRefFieldName, this.mapper.apply(((SObject) obj)));
        }
    }

    private class SetFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj))?.put(xRefFieldName, this.mapper.apply((SObject) obj));
        }
    }

    private class SetField extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetField(SObjectField field, IFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(field, this.mapper.apply((SObject) obj)); }
    }

}
