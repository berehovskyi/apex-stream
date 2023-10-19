/**
 * @description Provides common implementations of {@link Consumer}
 * and related utilities.
 *
 * @see Consumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class SObjectConsumers extends BaseSObjectConsumers {

    @TestVisible
    protected SObjectConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Consumer` that adds error to `fieldName`.
     *
     * @param fieldName the field name to add an error
     * @param message the error message
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `message` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.addError
     *
     * @example
     * Consumers.addError('NumberOfEmployees', 'Error message');
     */
    public static Consumer addError(final String fieldName, final String message) {
        Validate.notBlank(fieldName);
        Validate.notNull(message);
        return new AddFieldNameError(fieldName, message);
    }

    /**
     * @description Returns a `Consumer` that adds error to `field`.
     *
     * @param field the field to add an error
     * @param message the error message
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `field` is blank or `message` is null
     *
     * @see SObject.addError
     *
     * @example
     * Consumers.addError(Account.NumberOfEmployees, 'Error message');
     */
    public static Consumer addError(final SObjectField field, final String message) {
        Validate.notNull(field);
        Validate.notNull(message);
        return new AddFieldError(field, message);
    }

    /**
     * @description Returns a `Consumer` that adds error to an input argument.
     *
     * @param message the error message
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `mapper` is nuyll
     *
     * @see SObject.addError
     *
     * @example
     * Consumers.addError('Error message');
     */
    public static Consumer addError(final String message) {
        Validate.notNull(message);
        return new AddErrorMessage(message);
    }

    /**
     * @description Returns a `Consumer` that adds error to an input argument.
     *
     * @param exc the exception to attach
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `exc` is null
     *
     * @see SObject.addError
     *
     * @example
     * Consumers.addError(new IllegalArgumentException('Error message'));
     */
    public static Consumer addError(final Exception exc) {
        Validate.notNull(exc);
        return new AddErrorExc(exc);
    }

//    /**
//     * @description Returns a `Consumer` that sets the value returned by
//     * the `mapper` for the specified `fieldName`.
//     * Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the field name to set a value
//     * @param mapper applied to the input argument
//     *
//     * @return the `Consumer`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `mapper` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.put
//     *
//     * @example
//     * Consumers.set('NumberOfEmployees', someFunction);
//     * Consumers.set('Parent.NumberOfEmployees', someFunction);
//     * Consumers.set('Parent?.NumberOfEmployees', someFunction);
//     */
//    public static Consumer set(final String fieldName, final IFunction mapper) {
//        Validate.notBlank(fieldName);
//        Validate.notNull(mapper);
//        if (!Schemas.isXRef(fieldName)) { return new SetFieldName(fieldName, mapper); }
//        if (Schemas.isSaveNav(fieldName)) { return new SetFieldPathSafe(fieldName, mapper); }
//        return new SetFieldPath(fieldName, mapper);
//    }
//
//    /**
//     * @description Returns a `Consumer` that sets the value returned by
//     * the `mapper` for the specified `field`.
//     *
//     * @param field the field to set a value
//     * @param mapper applied to the input argument
//     *
//     * @return the `Consumer`
//     *
//     * @throws NullPointerException if `field` or `mapper` is null
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.put
//     *
//     * @example
//     * Consumers.set(Account.NumberOfEmployees, someFunction);
//     */
//    public static Consumer set(final SObjectField field, final IFunction mapper) {
//        Validate.notNull(field);
//        Validate.notNull(mapper);
//        return new SetField(field, mapper);
//    }
//
//    /**
//     * @description Returns a `Consumer` that sets the `value`
//     * for the specified `fieldName`.
//     * Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the field name to set a value
//     * @param value the value to set
//     *
//     * @return the `Consumer`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.put
//     * 
//     * @example 
//     * Consumers.set('NumberOfEmployees', 100);
//     * Consumers.set('Parent.NumberOfEmployees', 100);
//     * Consumers.set('Parent?.NumberOfEmployees', (Object) null);
//     */
//    public static Consumer set(final String fieldName, final Object value) {
//        return set(fieldName, Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Consumer` that sets the `value`
//     * for the specified `field`.
//     *
//     * @param field the field to set a value
//     * @param value the value to set
//     *
//     * @return the `Consumer`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see SObject.put
//     *
//     * @example
//     * Consumers.set(Account.NumberOfEmployees, 100);
//     * Consumers.set(Account.NumberOfEmployees, (Object) null);
//     */
//    public static Consumer set(final SObjectField field, final Object value) {
//        return set(field, Function.constant(value));
//    }

    /**
     * @description Returns a `Consumer` that sets SObject the value returned by
     * the `operator` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param operator applied to the input argument
     *
     * @return the `Consumer`
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
     * Consumers.setSObject('Parent', someOperator);
     * Consumers.setSObject('Parent.Parent', someOperator);
     * Consumers.setSObject('Parent?.Parent', someOperator);
     */
    public static Consumer setSObject(final String fieldName, final IOperator operator) {
        Validate.notBlank(fieldName);
        Validate.notNull(operator);
        if (!fieldName.contains('.')) { return new SetSObjectFieldName(fieldName, operator); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new SetSObjectFieldPathSafe(fieldName, operator); }
        return new SetSObjectFieldPath(fieldName, operator);
    }

    /**
     * @description Returns a `Consumer` that sets SObject the value returned by
     * the `operator` for the specified `field`.
     *
     * @param field the field to set a value
     * @param operator applied to the input argument
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `field` or `operator` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * Consumers.setSObject(Account.ParentId, someOperator);
     */
    public static Consumer setSObject(final SObjectField field, final IOperator operator) {
        Validate.notNull(field);
        Validate.notNull(operator);
        return new SetSObjectField(field, operator);
    }

    /**
     * @description Returns a `Consumer` that sets SObject the `parent`
     * for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param parent the value to set
     *
     * @return the `Consumer`
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
     * Consumers.setSObject('Parent', someAccount);
     * Consumers.setSObject('Parent.Parent', someAccount);
     * Consumers.setSObject('Parent?.Parent', (SObject) null);
     */
    public static Consumer setSObject(final String fieldName, final SObject parent) {
        return setSObject(fieldName, Operator.constant(parent));
    }

    /**
     * @description Returns a `Consumer` that sets SObject the `parent`
     * for the specified `field`.
     *
     * @param field the field to set a value
     * @param parent the value to set
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * Consumers.setSObject(Account.ParentId, someAccount);
     * Consumers.setSObject(Account.ParentId, (SObject) null);
     */
    public static Consumer setSObject(final SObjectField field, final SObject parent) {
        return setSObject(field, Operator.constant(parent));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddFieldNameError extends Consumer {
        private final String fieldName;
        private final String message;
        private AddFieldNameError(String fieldName, String message) {
            this.fieldName = fieldName;
            this.message = message;
        }
        public override void accept(Object obj) { ((SObject) obj).addError(fieldName, message); }
    }

    private class AddFieldError extends Consumer {
        private final SObjectField field;
        private final String message;
        private AddFieldError(SObjectField field, String message) { this.field = field; this.message = message; }
        public override void accept(Object obj) { ((SObject) obj).addError(field, message); }
    }

    private class AddErrorMessage extends Consumer {
        private final String message;
        private AddErrorMessage(String message) { this.message = message; }
        public override void accept(Object obj) { ((SObject) obj).addError(message); }
    }

    private class AddErrorExc extends Consumer {
        private final Exception exc;
        private AddErrorExc(Exception exc) { this.exc = exc; }
        public override void accept(Object obj) { ((SObject) obj).addError(exc); }
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

//    private class SetFieldName extends Consumer {
//        private final String fieldName;
//        private final IFunction mapper;
//        private SetFieldName(String fieldName, IFunction mapper) {
//            this.fieldName = fieldName;
//            this.mapper = mapper;
//        }
//        public override void accept(Object obj) { ((SObject) obj).put(fieldName, this.mapper.apply(((SObject) obj))); }
//    }
//
//    private class SetFieldPath extends SObjectPathConsumer {
//        private final IFunction mapper;
//        private SetFieldPath(String fieldName, IFunction mapper) {
//            super(fieldName);
//            this.mapper = mapper;
//        }
//        public override void accept(Object obj) { ((SObject) operator.apply((SObject) obj)).put(xRefFieldName, this.mapper.apply(((SObject) obj))); }
//    }
//
//    private class SetFieldPathSafe extends SObjectPathConsumer {
//        private final IFunction mapper;
//        private SetFieldPathSafe(String fieldName, IFunction mapper) {
//            super(fieldName);
//            this.mapper = mapper;
//        }
//        public override void accept(Object obj) {
//            ((SObject) operator.apply((SObject) obj))?.put(xRefFieldName, this.mapper.apply((SObject) obj));
//        }
//    }
//
//    private class SetField extends Consumer {
//        private final SObjectField field;
//        private final IFunction mapper;
//        private SetField(SObjectField field, IFunction mapper) {
//            this.field = field;
//            this.mapper = mapper;
//        }
//        public override void accept(Object obj) { ((SObject) obj).put(field, this.mapper.apply((SObject) obj)); }
//    }

    private class SetSObjectFieldName extends Consumer {
        protected final String fieldName;
        private final IOperator mapper;
        private SetSObjectFieldName(String fieldName, IOperator mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).putSObject(fieldName, (SObject) this.mapper.apply((SObject) obj)); }
    }

    private class SetSObjectFieldPath extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectFieldPath(String fieldName, IOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj)).putSObject(xRefFieldName, (SObject) this.mapper.apply((SObject) obj));
        }
    }

    private class SetSObjectFieldPathSafe extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectFieldPathSafe(String fieldName, IOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj))?.putSObject(xRefFieldName, (SObject) this.mapper.apply((SObject) obj));
        }
    }

    private class SetSObjectField extends Consumer {
        private final SObjectField field;
        private final IOperator operator;
        private SetSObjectField(SObjectField field, IOperator operator) {
            this.field = field;
            this.operator = operator;
        }
        public override void accept(Object obj) { ((SObject) obj).putSObject(field, (SObject) operator.apply((SObject) obj)); }
    }
    // @end-group
    //</editor-fold>

}
