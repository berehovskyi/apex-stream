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
public virtual inherited sharing class SObjectConsumers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
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
     * SObjectConsumers.addError('NumberOfEmployees', 'Error message');
     */
    public static Consumer addError(final String fieldName, final String message) {
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
     * SObjectConsumers.addError(Account.NumberOfEmployees, 'Error message');
     */
    public static Consumer addError(final SObjectField field, final String message) {
        return new AddFieldError(field, message);
    }

    /**
     * @description Returns a `Consumer` that adds error to an input argument.
     *
     * @param message the error message
     *
     * @return the `Consumer`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError('Error message');
     */
    public static Consumer addError(final String message) {
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
     * SObjectConsumers.addError(new IllegalArgumentException('Error message'));
     */
    public static Consumer addError(final Exception exc) {
        return new AddErrorExc(exc);
    }

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
     * SObjectConsumers.set('NumberOfEmployees', someFunction);
     * SObjectConsumers.set('Parent.NumberOfEmployees', someFunction);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static Consumer set(final String fieldName, final IFunction mapper) {
        return new SetConsumer(fieldName, mapper);
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
     * ObjectConsumers.set(Account.NumberOfEmployees, someFunction);
     */
    public static Consumer set(final SObjectField field, final IFunction mapper) {
        return new SetFieldConsumer(field, mapper);
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
     * SObjectConsumers.set('NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent.NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
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
     * SObjectConsumers.set(Account.NumberOfEmployees, 100);
     * SObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
     */
    public static Consumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

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
     * SObjectConsumers.setSObject('Parent', someOperator);
     * SObjectConsumers.setSObject('Parent.Parent', someOperator);
     * SObjectConsumers.setSObject('Parent?.Parent', someOperator);
     */
    public static Consumer setSObject(final String fieldName, final IOperator operator) {
        return new SetSObjectConsumer(fieldName, operator);
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
     * SObjectConsumers.setSObject(Account.ParentId, someOperator);
     */
    public static Consumer setSObject(final SObjectField field, final IOperator operator) {
        return new SetSObjectFieldConsumer(field, operator);
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
     * SObjectConsumers.setSObject('Parent', someAccount);
     * SObjectConsumers.setSObject('Parent.Parent', someAccount);
     * SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
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
     * SObjectConsumers.setSObject(Account.ParentId, someAccount);
     * SObjectConsumers.setSObject(Account.ParentId, (SObject) null);
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
            Validate.notBlank(fieldName);
            Validate.notNull(message);
            this.fieldName = fieldName;
            this.message = message;
        }
        public override void accept(Object obj) { ((SObject) obj).addError(fieldName, message); }
    }

    private class AddFieldError extends Consumer {
        private final SObjectField field;
        private final String message;
        private AddFieldError(SObjectField field, String message) {
            Validate.notNull(field);
            Validate.notNull(message);
            this.field = field;
            this.message = message;
        }
        public override void accept(Object obj) { ((SObject) obj).addError(field, message); }
    }

    private class AddErrorMessage extends Consumer {
        private final String message;
        private AddErrorMessage(String message) {
            Validate.notBlank(message);
            this.message = message;
        }
        public override void accept(Object obj) { ((SObject) obj).addError(message); }
    }

    private class AddErrorExc extends Consumer {
        private final Exception exc;
        private AddErrorExc(Exception exc) {
            Validate.notNull(exc);
            this.exc = exc;
        }
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

    private class SetByFieldName extends Consumer {
        private final String fieldName;
        private final IFunction mapper;
        private SetByFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(fieldName, mapper.apply(obj)); }
    }

    private class SetByFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj)).put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class SetByFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj))?.put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class SetConsumer extends Consumer {
        private final IConsumer consumer;
        private SetConsumer(String fieldName, IFunction mapper) {
            Validate.notBlank(fieldName);
            Validate.notNull(mapper);
            if (!CsfSupport.isXRefField(fieldName)) { consumer = new SetByFieldName(fieldName, mapper); }
            else if (CsfSupport.isSafePath(fieldName)) { consumer = new SetByFieldPathSafe(fieldName, mapper); }
            else { consumer = new SetByFieldPath(fieldName, mapper); }
        }
        public override void accept(Object obj) { consumer.accept(obj); }
    }

    private class SetFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetFieldConsumer(SObjectField field, IFunction mapper) {
            Validate.notNull(field);
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply(obj)); }
    }

    private class SetSObjectByFieldName extends Consumer {
        protected final String fieldName;
        private final IOperator mapper;
        private SetSObjectByFieldName(String fieldName, IOperator mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).putSObject(fieldName, (SObject) mapper.apply(obj)); }
    }

    private class SetSObjectByFieldPath extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectByFieldPath(String fieldName, IOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj)).putSObject(xRefFieldName, (SObject) mapper.apply(obj));
        }
    }

    private class SetSObjectByFieldPathSafe extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectByFieldPathSafe(String fieldName, IOperator mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj))?.putSObject(xRefFieldName, (SObject) mapper.apply(obj));
        }
    }

    private class SetSObjectConsumer extends Consumer {
        private final IConsumer consumer;
        private SetSObjectConsumer(String fieldName, IOperator operator) {
            Validate.notBlank(fieldName);
            Validate.notNull(operator);
            if (!CsfSupport.isXRefField(fieldName)) { consumer = new SetSObjectByFieldName(fieldName, operator); }
            else if (CsfSupport.isSafePath(fieldName)) {
                consumer = new SetSObjectByFieldPathSafe(fieldName, operator);
            }
            else { consumer = new SetSObjectByFieldPath(fieldName, operator); }
        }
        public override void accept(Object obj) { consumer.accept(obj); }
    }

    private class SetSObjectFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IOperator operator;
        private SetSObjectFieldConsumer(SObjectField field, IOperator operator) {
            Validate.notNull(field);
            Validate.notNull(operator);
            this.field = field;
            this.operator = operator;
        }
        public override void accept(Object obj) { ((SObject) obj).putSObject(field, (SObject) operator.apply(obj)); }
    }
    // @end-group
    //</editor-fold>

}
