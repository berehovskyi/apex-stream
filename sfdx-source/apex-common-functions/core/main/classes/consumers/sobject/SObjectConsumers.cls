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
    protected SObjectConsumers() {
    }

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Consumer` that adds an error to `field`.
     *
     * @param field the field to add an error
     * @param message the error message
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `message` is null
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.addError
     *
     * @example
     * SObjectConsumers.addError('NumberOfEmployees', 'Error message');
     */
    public static Consumer addError(final String field, final String message) {
        return new AddFieldNameError(field, message);
    }

    /**
     * @description Returns a `Consumer` that adds an error to `field`.
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
     * @description Returns a `Consumer` that adds an error to an input argument.
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
     * @description Returns a `Consumer` that adds an error to an input argument.
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
     * SObjectConsumers.set('NumberOfEmployees', someFunction);
     * SObjectConsumers.set('Parent.NumberOfEmployees', someFunction);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static Consumer set(final String field, final IFunction mapper) {
        return new SetConsumer(field, mapper);
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
     * SObjectConsumers.set(Account.NumberOfEmployees, someFunction);
     */
    public static Consumer set(final SObjectField field, final IFunction mapper) {
        return new SetFieldConsumer(field, mapper);
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
     * SObjectConsumers.set('NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent.NumberOfEmployees', 100);
     * SObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
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
     * SObjectConsumers.set(Account.NumberOfEmployees, 100);
     * SObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
     */
    public static Consumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `Consumer` that sets the SObject value returned by
     * the `operator` for the specified `field`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to set a value
     * @param operator applied to the input argument
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject('Parent', someOperator);
     * SObjectConsumers.setSObject('Parent.Parent', someOperator);
     * SObjectConsumers.setSObject('Parent?.Parent', someOperator);
     */
    public static Consumer setSObject(final String field, final IOperator operator) {
        return new SetSObjectConsumer(field, operator);
    }

    /**
     * @description Returns a `Consumer` that sets the SObject value returned by
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
     * @description Returns a `Consumer` that sets the SObject `parent`
     * for the specified `field`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field to set a value
     * @param parent the value to set
     *
     * @return the `Consumer`
     *
     * @throws IllegalArgumentException if `field` is blank
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `field`
     *
     * @see SObject.putSObject
     *
     * @example
     * SObjectConsumers.setSObject('Parent', someAccount);
     * SObjectConsumers.setSObject('Parent.Parent', someAccount);
     * SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
     */
    public static Consumer setSObject(final String field, final SObject parent) {
        return setSObject(field, Operator.constant(parent));
    }

    /**
     * @description Returns a `Consumer` that sets the SObject `parent`
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
        private final String field;
        private final String message;
        private AddFieldNameError(String field, String message) {
            AfSupport.notBlank(field);
            AfSupport.notNull(message);
            this.field = field;
            this.message = message;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).addError(field, message); }
    }

    private class AddFieldError extends Consumer {
        private final SObjectField field;
        private final String message;
        private AddFieldError(SObjectField field, String message) {
            AfSupport.notNull(field);
            AfSupport.notNull(message);
            this.field = field;
            this.message = message;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).addError(field, message); }
    }

    private class AddErrorMessage extends Consumer {
        private final String message;
        private AddErrorMessage(String message) {
            AfSupport.notBlank(message);
            this.message = message;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).addError(message); }
    }

    private class AddErrorExc extends Consumer {
        private final Exception exc;
        private AddErrorExc(Exception exc) {
            AfSupport.notNull(exc);
            this.exc = exc;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).addError(exc); }
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String field) {
            xRefFieldName = field.substringAfterLast('.');
            operator = SObjectOperators.getSObject(field.substringBeforeLast('.'));
        }
    }

    private class SetByFieldName extends Consumer {
        private final String field;
        private final IFunction mapper;
        private SetByFieldName(String field, IFunction mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply(obj)); }
    }

    private class SetByFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPath(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj)).put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class SetByFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPathSafe(String field, IFunction mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj))?.put(xRefFieldName, mapper.apply(obj));
        }
    }

    private class SetConsumer extends Consumer {
        private final IConsumer consumer;
        private SetConsumer(String field, IFunction mapper) {
            AfSupport.notBlank(field);
            AfSupport.notNull(mapper);
            // prettier-ignore
            if (!CsfSupport.isXRefField(field)) { consumer = new SetByFieldName(field, mapper); }
            // prettier-ignore
            else if (CsfSupport.isSafePath(field)) { consumer = new SetByFieldPathSafe(field, mapper); }
            // prettier-ignore
            else { consumer = new SetByFieldPath(field, mapper); }
        }
        // prettier-ignore
        public override void accept(Object obj) { consumer.accept(obj); }
    }

    private class SetFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetFieldConsumer(SObjectField field, IFunction mapper) {
            AfSupport.notNull(field);
            AfSupport.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply(obj)); }
    }

    private class SetSObjectByFieldName extends Consumer {
        protected final String field;
        private final IOperator mapper;
        private SetSObjectByFieldName(String field, IOperator mapper) {
            this.field = field;
            this.mapper = mapper;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).putSObject(field, (SObject) mapper.apply(obj)); }
    }

    private class SetSObjectByFieldPath extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectByFieldPath(String field, IOperator mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj)).putSObject(xRefFieldName, (SObject) mapper.apply(obj));
        }
    }

    private class SetSObjectByFieldPathSafe extends SObjectPathConsumer {
        private final IOperator mapper;
        private SetSObjectByFieldPathSafe(String field, IOperator mapper) {
            super(field);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply(obj))?.putSObject(xRefFieldName, (SObject) mapper.apply(obj));
        }
    }

    private class SetSObjectConsumer extends Consumer {
        private final IConsumer consumer;
        private SetSObjectConsumer(String field, IOperator operator) {
            AfSupport.notBlank(field);
            AfSupport.notNull(operator);
            // prettier-ignore
            if (!CsfSupport.isXRefField(field)) { consumer = new SetSObjectByFieldName(field, operator); }
            else if (CsfSupport.isSafePath(field)) { consumer = new SetSObjectByFieldPathSafe(field, operator); }
            // prettier-ignore
            else { consumer = new SetSObjectByFieldPath(field, operator); }
        }
        // prettier-ignore
        public override void accept(Object obj) { consumer.accept(obj); }
    }

    private class SetSObjectFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IOperator operator;
        private SetSObjectFieldConsumer(SObjectField field, IOperator operator) {
            AfSupport.notNull(field);
            AfSupport.notNull(operator);
            this.field = field;
            this.operator = operator;
        }
        // prettier-ignore
        public override void accept(Object obj) { ((SObject) obj).putSObject(field, (SObject) operator.apply(obj)); }
    }
    // @end-group
    //</editor-fold>
}
