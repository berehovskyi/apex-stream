/**
 * @description Provides common implementations of {@link SObjectConsumer}
 * and related utilities.
 *
 * @see SObjectConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectConsumers {

    @TestVisible
    private SObjectConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectConsumer` that adds error to `fieldName`.
     *
     * @param fieldName the field name to add an error
     * @param message the error message
     *
     * @return the `SObjectConsumer`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `message` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError('NumberOfEmployees', 'Error message');
     */
    public static SObjectConsumer addError(final String fieldName, final String message) {
        Validate.notBlank(fieldName);
        Validate.notNull(message);
        return new AddFieldNameError(fieldName, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that adds error to `field`.
     *
     * @param field the field to add an error
     * @param message the error message
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `field` is blank or `message` is null
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError(Account.NumberOfEmployees, 'Error message');
     */
    public static SObjectConsumer addError(final SObjectField field, final String message) {
        Validate.notNull(field);
        Validate.notNull(message);
        return new AddFieldError(field, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that adds error to an input argument.
     *
     * @param message the error message
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `mapper` is nuyll
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError('Error message');
     */
    public static SObjectConsumer addError(final String message) {
        Validate.notNull(message);
        return new AddErrorMessage(message);
    }

    /**
     * @description Returns a `SObjectConsumer` that adds error to an input argument.
     *
     * @param exc the exception to attach
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `exc` is null
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError(new IllegalArgumentException('Error message'));
     */
    public static SObjectConsumer addError(final Exception exc) {
        Validate.notNull(exc);
        return new AddErrorExc(exc);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the value returned by
     * the `mapper` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectConsumer`
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
     * SObjectConsumers.set('NumberOfEmployees', someSObjectFunction);
     * SObjectConsumers.set('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', someSObjectFunction);
     */
    public static SObjectConsumer set(final String fieldName, final ISObjectFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!Schemas.isXRef(fieldName)) { return new SetFieldName(fieldName, mapper); }
        if (Schemas.isSaveNav(fieldName)) { return new SetFieldPathSafe(fieldName, mapper); }
        return new SetFieldPath(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the value returned by
     * the `mapper` for the specified `field`.
     *
     * @param field the field to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * SObjectConsumers.set(Account.NumberOfEmployees, someSObjectFunction);
     */
    public static SObjectConsumer set(final SObjectField field, final ISObjectFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new SetField(field, mapper);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the `value`
     * for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `SObjectConsumer`
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
     * SObjectConsumers.set('NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent.NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
     */
    public static SObjectConsumer set(final String fieldName, final Object value) {
        return set(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the `value`
     * for the specified `field`.
     *
     * @param field the field to set a value
     * @param value the value to set
     *
     * @return the `SObjectConsumer`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.put
     *
     * @example
     * SObjectConsumers.set(Account.NumberOfEmployees, 100);
     * SObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
     */
    public static SObjectConsumer set(final SObjectField field, final Object value) {
        return set(field, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the value returned by
     * the `operator` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param operator applied to the input argument
     *
     * @return the `SObjectConsumer`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject('Parent', someSObjectUnaryOperator);
     * SObjectConsumers.setSObject('Parent.Parent', someSObjectUnaryOperator);
     * SObjectConsumers.setSObject('Parent?.Parent', someSObjectUnaryOperator);
     */
    public static SObjectConsumer setSObject(final String fieldName, final ISObjectUnaryOperator operator) {
        Validate.notBlank(fieldName);
        Validate.notNull(operator);
        if (!Schemas.isXRef(fieldName)) { return new SetSObjectFieldName(fieldName, operator); }
        if (Schemas.isSaveNav(fieldName)) { return new SetSObjectFieldPathSafe(fieldName, operator); }
        return new SetSObjectFieldPath(fieldName, operator);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the value returned by
     * the `operator` for the specified `field`.
     *
     * @param field the field to set a value
     * @param operator applied to the input argument
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `field` or `operator` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject(Account.ParentId, someSObjectUnaryOperator);
     */
    public static SObjectConsumer setSObject(final SObjectField field, final ISObjectUnaryOperator operator) {
        Validate.notNull(field);
        Validate.notNull(operator);
        return new SetSObjectField(field, operator);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the `parent`
     * for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param parent the value to set
     *
     * @return the `SObjectConsumer`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject('Parent', someAccount);
     * SObjectConsumers.setSObject('Parent.Parent', someAccount);
     * SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
     */
    public static SObjectConsumer setSObject(final String fieldName, final SObject parent) {
        return setSObject(fieldName, SObjectUnaryOperator.constant(parent));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the `parent`
     * for the specified `field`.
     *
     * @param field the field to set a value
     * @param parent the value to set
     *
     * @return the `SObjectConsumer`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject(Account.ParentId, someAccount);
     * SObjectConsumers.setSObject(Account.ParentId, (SObject) null);
     */
    public static SObjectConsumer setSObject(final SObjectField field, final SObject parent) {
        return setSObject(field, SObjectUnaryOperator.constant(parent));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddFieldNameError extends SObjectConsumer {
        private final String fieldName;
        private final String message;
        private AddFieldNameError(String fieldName, String message) {
            this.fieldName = fieldName;
            this.message = message;
        }
        public override void accept(SObject sObj) { sObj.addError(fieldName, message); }
    }

    private class AddFieldError extends SObjectConsumer {
        private final SObjectField field;
        private final String message;
        private AddFieldError(SObjectField field, String message) { this.field = field; this.message = message; }
        public override void accept(SObject sObj) { sObj.addError(field, message); }
    }

    private class AddErrorMessage extends SObjectConsumer {
        private final String message;
        private AddErrorMessage(String message) { this.message = message; }
        public override void accept(SObject sObj) { sObj.addError(message); }
    }

    private class AddErrorExc extends SObjectConsumer {
        private final Exception exc;
        private AddErrorExc(Exception exc) { this.exc = exc; }
        public override void accept(SObject sObj) { sObj.addError(exc); }
    }

    private abstract class SObjectPathConsumer extends SObjectConsumer {
        protected final ISObjectUnaryOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends SObjectConsumer {
        private final String fieldName;
        private final ISObjectFunction mapper;
        private SetFieldName(String fieldName, ISObjectFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) { sObj.put(fieldName, this.mapper.apply(sObj)); }
    }

    private class SetFieldPath extends SObjectPathConsumer {
        private final ISObjectFunction mapper;
        private SetFieldPath(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) { operator.apply(sObj).put(xRefFieldName, this.mapper.apply(sObj)); }
    }

    private class SetFieldPathSafe extends SObjectPathConsumer {
        private final ISObjectFunction mapper;
        private SetFieldPathSafe(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            operator.apply(sObj)?.put(xRefFieldName, this.mapper.apply(sObj));
        }
    }

    private class SetField extends SObjectConsumer {
        private final SObjectField field;
        private final ISObjectFunction mapper;
        private SetField(SObjectField field, ISObjectFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) { sObj.put(field, this.mapper.apply(sObj)); }
    }

    private class SetSObjectFieldName extends SObjectConsumer {
        protected final String fieldName;
        private final ISObjectUnaryOperator mapper;
        private SetSObjectFieldName(String fieldName, ISObjectUnaryOperator mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) { sObj.putSObject(fieldName, this.mapper.apply(sObj)); }
    }

    private class SetSObjectFieldPath extends SObjectPathConsumer {
        private final ISObjectUnaryOperator mapper;
        private SetSObjectFieldPath(String fieldName, ISObjectUnaryOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            operator.apply(sObj).putSObject(xRefFieldName, this.mapper.apply(sObj));
        }
    }

    private class SetSObjectFieldPathSafe extends SObjectPathConsumer {
        private final ISObjectUnaryOperator mapper;
        private SetSObjectFieldPathSafe(String fieldName, ISObjectUnaryOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            operator.apply(sObj)?.putSObject(xRefFieldName, this.mapper.apply(sObj));
        }
    }

    private class SetSObjectField extends SObjectConsumer {
        private final SObjectField field;
        private final ISObjectUnaryOperator operator;
        private SetSObjectField(SObjectField field, ISObjectUnaryOperator operator) {
            this.field = field;
            this.operator = operator;
        }
        public override void accept(SObject sObj) { sObj.putSObject(field, operator.apply(sObj)); }
    }
    // @end-group
    //</editor-fold>

}
