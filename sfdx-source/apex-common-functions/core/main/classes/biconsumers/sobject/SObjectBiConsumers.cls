/**
 * @description Provides common implementations of {@link BiConsumer}
 * and related utilities.
 *
 * @see BiConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class SObjectBiConsumers {
    @TestVisible
    protected SObjectBiConsumers() {
    }

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiConsumer` that sets for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument. Cross-reference fields and safe navigation are
     * supported.
     *
     * @param field the target field of the second `SObject` input argument
     * @param mapper the function applied to the first `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.set('NumberOfEmployees', someFunction);
     * SObjectBiConsumers.set('Parent.NumberOfEmployees', someFunction);
     * SObjectBiConsumers.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static BiConsumer set(final String field, final IFunction mapper) {
        AfSupport.notNull(field);
        AfSupport.notNull(mapper);
        // prettier-ignore
        if (!CsfSupport.isXRefField(field)) { return new SetFieldName(field, mapper); }
        // prettier-ignore
        if (CsfSupport.isSafePath(field)) { return new SetFieldPathSafe(field, mapper); }
        return new SetFieldPath(field, mapper);
    }

    /**
     * @description Returns a `BiConsumer` that sets for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param mapper the function applied to the first `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.set(Account.NumberOfEmployees, someFunction);
     */
    public static BiConsumer set(final SObjectField field, final IFunction mapper) {
        return new SetByField(field, mapper);
    }

    /**
     * @description Returns a `BiConsumer` that sets the `value` for
     * the specified field for the second `SObject` input argument. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param field the target field of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.set('NumberOfEmployees', 100);
     * SObjectBiConsumers.set('Parent.NumberOfEmployees', 100);
     * SObjectBiConsumers.set('Parent?.NumberOfEmployees', 100);
     */
    public static BiConsumer set(final String field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `BiConsumer` that sets the `value` for
     * the specified field for the second `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.set(Account.NumberOfEmployees, 100);
     */
    public static BiConsumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `BiConsumer` that sets `SObject` for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument. Cross-reference fields and safe navigation are
     * supported.
     *
     * @param field the target field of the second `SObject` input argument
     * @param operator the operator applied to the first `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.setSObject('Parent', someOperator);
     * SObjectBiConsumers.setSObject('Parent.Parent', someOperator);
     * SObjectBiConsumers.setSObject('Parent?.Parent', someOperator);
     */
    public static BiConsumer setSObject(final String field, final IOperator operator) {
        AfSupport.notNull(field);
        AfSupport.notNull(operator);
        // prettier-ignore
        if (!CsfSupport.isXRefField(field)) { return new SetSObjectByFieldName(field, operator); }
        // prettier-ignore
        if (CsfSupport.isSafePath(field)) { return new SetSObjectByPathSafe(field, operator); }
        return new SetSObjectByPath(field, operator);
    }

    /**
     * @description Returns a `BiConsumer` that sets `SObject` for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param operator the operator applied to the first `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `field` or `operator` is null
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.setSObject(Account.ParentId, someOperator);
     */
    public static BiConsumer setSObject(final SObjectField field, final IOperator operator) {
        return new SetSObjectByField(field, operator);
    }

    /**
     * @description Returns a `BiConsumer` that sets `SObject`
     * the `value` for the specified field for the second `SObject` input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the target field of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.setSObject('Parent', someAccount);
     * SObjectBiConsumers.setSObject('Parent.Parent', someAccount);
     * SObjectBiConsumers.setSObject('Parent?.Parent', someAccount);
     */
    public static BiConsumer setSObject(final String field, final SObject value) {
        return setSObject(field, Operator.constant(value));
    }

    /**
     * @description Returns a `BiConsumer` that sets `SObject`
     * the `value` for the specified field for the second `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see BiOperator.combine
     *
     * @example
     * SObjectBiConsumers.setSObject(Account.ParentId, someAccount);
     */
    public static BiConsumer setSObject(final SObjectField field, final SObject value) {
        return setSObject(field, Operator.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class SObjectByPathBiConsumer extends BiConsumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectByPathBiConsumer(String field) {
            xRefFieldName = field.substringAfterLast('.');
            operator = SObjectOperators.getSObject(field.substringBeforeLast('.'));
        }
    }

    private abstract class ComposedBiConsumer extends BiConsumer {
        protected final IFunction mapper;
        protected ComposedBiConsumer(IFunction mapper) {
            AfSupport.notNull(mapper);
            this.mapper = mapper;
        }
    }

    private abstract class FieldNameComposedBiConsumer extends ComposedBiConsumer {
        protected final String field;
        protected FieldNameComposedBiConsumer(String field, IFunction mapper) {
            super(mapper);
            AfSupport.notNull(field);
            this.field = field;
        }
    }

    private abstract class FieldComposedBiConsumer extends ComposedBiConsumer {
        protected final SObjectField field;
        protected FieldComposedBiConsumer(SObjectField field, IFunction mapper) {
            super(mapper);
            AfSupport.notNull(field);
            this.field = field;
        }
    }

    private class SetFieldName extends FieldNameComposedBiConsumer {
        // prettier-ignore
        private SetFieldName(String field, IFunction mapper) { super(field, mapper); }
        // prettier-ignore
        public override void accept(Object src, Object target) { ((SObject) target).put(field, mapper.apply(src)); }
    }

    private class SetFieldPath extends SObjectByPathBiConsumer {
        private final IFunction mapper;
        private SetFieldPath(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object src, Object target) {
            ((SObject) operator.apply(target)).put(xRefFieldName, mapper.apply(src));
        }
    }

    private class SetFieldPathSafe extends SObjectByPathBiConsumer {
        private final IFunction mapper;
        private SetFieldPathSafe(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object src, Object target) {
            ((SObject) operator.apply(target))?.put(xRefFieldName, mapper.apply(src));
        }
    }

    private class SetByField extends FieldComposedBiConsumer {
        // prettier-ignore
        private SetByField(SObjectField field, IFunction mapper) { super(field, mapper); }
        // prettier-ignore
        public override void accept(Object src, Object target) { ((SObject) target).put(field, mapper.apply(src)); }
    }

    private class SetSObjectByFieldName extends BiConsumer {
        private final String field;
        private final IOperator operator;
        private SetSObjectByFieldName(String field, IOperator operator) {
            this.field = field;
            this.operator = operator;
        }
        public override void accept(Object src, Object target) {
            ((SObject) target).putSObject(field, (SObject) operator.apply(src));
        }
    }

    private class SetSObjectByPath extends SObjectByPathBiConsumer {
        private final IOperator mapper;
        private SetSObjectByPath(String field, IOperator operator) {
            super(field);
            this.mapper = operator;
        }
        public override void accept(Object src, Object target) {
            ((SObject) operator.apply(target)).putSObject(xRefFieldName, (SObject) mapper.apply(src));
        }
    }

    private class SetSObjectByPathSafe extends SObjectByPathBiConsumer {
        private final IOperator mapper;
        private SetSObjectByPathSafe(String field, IOperator operator) {
            super(field);
            this.mapper = operator;
        }
        public override void accept(Object src, Object target) {
            ((SObject) operator.apply(target))?.putSObject(xRefFieldName, (SObject) mapper.apply(src));
        }
    }

    private class SetSObjectByField extends BiConsumer {
        private final SObjectField field;
        private final IOperator operator;
        private SetSObjectByField(SObjectField field, IOperator operator) {
            AfSupport.notNull(field);
            AfSupport.notNull(operator);
            this.field = field;
            this.operator = operator;
        }
        public override void accept(Object src, Object target) {
            ((SObject) target).putSObject(field, (SObject) operator.apply(src));
        }
    }
    // @end-group
    //</editor-fold>
}
