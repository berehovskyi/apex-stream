/**
 * @description Provides common implementations of {@link SObjectBiConsumer}
 * and related utilities.
 *
 * @see SObjectBiConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectBiConsumers {

    @TestVisible
    private SObjectBiConsumers(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectBiConsumer` that sets for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument. Cross-reference fields and safe navigation are
     * supported.
     *
     * @param fieldName the target field name of the second `SObject` input argument
     * @param mapper the function applied to the first `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `fieldName` is blank or `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.set('NumberOfEmployees', someSObjectFunction);
     * SObjectBiConsumers.set('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectBiConsumers.set('Parent?.NumberOfEmployees', someSObjectFunction);
     */
    public static SObjectBiConsumer set(final String fieldName, final ISObjectFunction mapper) {
        Validate.notNull(fieldName);
        Validate.notNull(mapper);
        if (!Schemas.isXRef(fieldName)) { return new SetFieldName(fieldName, mapper); }
        if (Schemas.isSaveNav(fieldName)) { return new SetFieldPathSafe(fieldName, mapper); }
        return new SetFieldPath(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param mapper the function applied to the first `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.set(Account.NumberOfEmployees, someSObjectFunction);
     */
    public static SObjectBiConsumer set(final SObjectField field, final ISObjectFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new SetByField(field, mapper);
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets the `value` for
     * the specified field for the second `SObject` input argument. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the target field name of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `fieldName` is blank or `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.set('NumberOfEmployees', 100);
     * SObjectBiConsumers.set('Parent.NumberOfEmployees', 100);
     * SObjectBiConsumers.set('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectBiConsumer set(final String fieldName, final Object value) {
        return set(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets the `value` for
     * the specified field for the second `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.set(Account.NumberOfEmployees, 100);
     */
    public static SObjectBiConsumer set(final SObjectField field, final Object value) {
        return set(field, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets `SObject` for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument. Cross-reference fields and safe navigation are
     * supported.
     *
     * @param fieldName the target field name of the second `SObject` input argument
     * @param operator the operator applied to the first `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `fieldName` is blank or `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.setSObject('Parent', someSObjectUnaryOperator);
     * SObjectBiConsumers.setSObject('Parent.Parent', someSObjectUnaryOperator);
     * SObjectBiConsumers.setSObject('Parent?.Parent', someSObjectUnaryOperator);
     */
    public static SObjectBiConsumer setSObject(final String fieldName, final ISObjectUnaryOperator operator) {
        Validate.notNull(fieldName);
        Validate.notNull(operator);
        if (!Schemas.isXRef(fieldName)) { return new SetSObjectByFieldName(fieldName, operator); }
        if (Schemas.isSaveNav(fieldName)) { return new SetSObjectByPathSafe(fieldName, operator); }
        return new SetSObjectByPath(fieldName, operator);
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets `SObject` for the specified field
     * for the second `SObject` input argument a result returned by the `mapper` applied
     * to the first `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param operator the operator applied to the first `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `field` or `operator` is null
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.setSObject(Account.ParentId, someSObjectUnaryOperator);
     */
    public static SObjectBiConsumer setSObject(final SObjectField field, final ISObjectUnaryOperator operator) {
        Validate.notNull(field);
        Validate.notNull(operator);
        return new SetSObjectByField(field, operator);
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets `SObject`
     * the `value` for the specified field for the second `SObject` input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the target field name of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `fieldName` is blank or `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.setSObject('Parent', someAccount);
     * SObjectBiConsumers.setSObject('Parent.Parent', someAccount);
     * SObjectBiConsumers.setSObject('Parent?.Parent', someAccount);
     */
    public static SObjectBiConsumer setSObject(final String fieldName, final SObject value) {
        return setSObject(fieldName, SObjectUnaryOperator.constant(value));
    }

    /**
     * @description Returns a `SObjectBiConsumer` that sets `SObject`
     * the `value` for the specified field for the second `SObject` input argument.
     *
     * @param field the target `SObjectField` of the second `SObject` input argument
     * @param value the value to set for the second `SObject` input argument
     *
     * @return the `SObjectBiConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObjectBinaryOperator.forBiConsumer
     *
     * @example
     * SObjectBiConsumers.setSObject(Account.ParentId, someAccount);
     */
    public static SObjectBiConsumer setSObject(final SObjectField field, final SObject value) {
        return setSObject(field, SObjectUnaryOperator.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class SObjectByPathBiConsumer extends SObjectBiConsumer {
        protected final ISObjectUnaryOperator operator;
        protected final String xRefFieldName;
        protected SObjectByPathBiConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends SObjectBiConsumer {
        protected final String fieldName;
        private final ISObjectFunction mapper;
        private SetFieldName(String fieldName, ISObjectFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(SObject src, SObject target) { target.put(fieldName, mapper.apply(src)); }
    }

    private class SetFieldPath extends SObjectByPathBiConsumer {
        private final ISObjectFunction mapper;
        private SetFieldPath(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject src, SObject target) {
            operator.apply(target).put(xRefFieldName, mapper.apply(src));
        }
    }

    private class SetFieldPathSafe extends SObjectByPathBiConsumer {
        private final ISObjectFunction mapper;
        private SetFieldPathSafe(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject src, SObject target) {
            operator.apply(target)?.put(xRefFieldName, mapper.apply(src));
        }
    }

    private class SetByField extends SObjectBiConsumer {
        private final SObjectField field;
        private final ISObjectFunction mapper;
        private SetByField(SObjectField field, ISObjectFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(SObject src, SObject target) { target.put(field, mapper.apply(src)); }
    }

    private class SetSObjectByFieldName extends SObjectBiConsumer {
        private final String fieldName;
        private final ISObjectUnaryOperator operator;
        private SetSObjectByFieldName(String fieldName, ISObjectUnaryOperator operator) {
            this.fieldName = fieldName;
            this.operator = operator;
        }
        public override void accept(SObject src, SObject target) { target.putSObject(fieldName, operator.apply(src)); }
    }

    private class SetSObjectByPath extends SObjectByPathBiConsumer {
        private final ISObjectUnaryOperator mapper;
        private SetSObjectByPath(String fieldName, ISObjectUnaryOperator operator) {
            super(fieldName);
            this.mapper = operator;
        }
        public override void accept(SObject src, SObject target) {
            operator.apply(target).putSObject(xRefFieldName, this.mapper.apply(src));
        }
    }

    private class SetSObjectByPathSafe extends SObjectByPathBiConsumer {
        private final ISObjectUnaryOperator mapper;
        private SetSObjectByPathSafe(String fieldName, ISObjectUnaryOperator operator) {
            super(fieldName);
            this.mapper = operator;
        }
        public override void accept(SObject src, SObject target) {
            operator.apply(target)?.putSObject(xRefFieldName, this.mapper.apply(src));
        }
    }

    private class SetSObjectByField extends SObjectBiConsumer {
        private final SObjectField field;
        private final ISObjectUnaryOperator operator;
        private SetSObjectByField(SObjectField field, ISObjectUnaryOperator operator) {
            this.field = field;
            this.operator = operator;
        }
        public override void accept(SObject src, SObject target) { target.putSObject(field, operator.apply(src)); }
    }
    // @end-group
    //</editor-fold>

}
