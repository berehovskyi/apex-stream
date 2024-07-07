/**
 * @description Provides a fluent interface for building consumers that operate on SObjects, allowing you
 * to set fields, add errors, and perform other operations on SObjects.
 *
 * @example
 * IConsumer setJohnDoeNameConsumer = new SObjectConsumerProvider()
 *     .set('Name')
 *     .var('John Doe');
 * setJohnDoeNameConsumer.accept(new Account()); // { Name: 'John Doe' }
 */
public virtual inherited sharing class SObjectConsumerProvider {
    /**
     * @description Returns an `AddErrorMessageConsumer` that adds an error message to a field of a SObject.
     *
     * @param message the error message to add
     *
     * @return the `AddErrorMessageConsumer`
     *
     * @throws NullPointerException if `message` is null
     *
     * @see SObject.addError
     *
     * @example
     * IConsumer addErrorConsumer = new SObjectConsumerProvider()
     *     .addError('Invalid Account');
     * addErrorConsumer.accept(new Account());
     *
     * IConsumer addErrorToNameConsumer = new SObjectConsumerProvider()
     *     .addError('Invalid Name')
     *     .to(Account.Name);
     * addErrorToNameConsumer.accept(new Account());
     */
    public virtual AddErrorMessageConsumer addError(final String message) {
        return new AddErrorMessageConsumer(message);
    }

    /**
     * @description Returns an `AddErrorExceptionConsumer` that adds an error to the input SObject with an exception.
     *
     * @param exc the exception to attach
     *
     * @return the `AddErrorExceptionConsumer`
     *
     * @throws NullPointerException if `exc` is null
     *
     * @see SObject.addError
     *
     * @example
     * IConsumer addExceptionErrorConsumer = new SObjectConsumerProvider()
     *     .addError(new IllegalArgumentException('Invalid Field'));
     * addExceptionErrorConsumer.accept(new Account());
     */
    public virtual AddErrorExceptionConsumer addError(final Exception exc) {
        return new AddErrorExceptionConsumer(exc);
    }

    /**
     * @description Returns a `SetByName` builder that sets the value for the specified `fieldName` on the SObject.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set the value for
     *
     * @return the `SetByName` builder to set the field value
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @see SObject.put
     *
     * @example
     * IConsumer setNameConsumer = new SObjectConsumerProvider()
     *     .set('Name')
     *     .var('Jane Doe');
     * setNameConsumer.accept(new Account()); // { Name: 'Jane Doe' }
     * // safe navigation
     * IConsumer setRevenueFromParentConsumer = new SObjectConsumerProvider()
     *     .set('AnnualRevenue')
     *     .val('Parent?.AnnualRevenue');
     * setRevenueFromParentConsumer.accept(new Account(Parent = new Account(AnnualRevenue = 5000)));
     * // { AnnualRevenue: 5000, Parent: { AnnualRevenue: 5000 } }
     */
    public virtual SetByName set(final String fieldName) {
        return new SetByName(fieldName);
    }

    /**
     * @description Returns a `SetByField` builder that sets the value for the specified `field` on the SObject.
     *
     * @param field the SObjectField to set the value for
     *
     * @return the `SetByField` builder to set the field value
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.put
     *
     * @example
     * IConsumer setNameConsumer = new SObjectConsumerProvider()
     *     .set(Account.Name)
     *     .var('Jane Doe');
     * setNameConsumer.accept(new Account()); // { Name: 'Jane Doe' }
     */
    public virtual SetByField set(final SObjectField field) {
        return new SetByField(field);
    }

    /**
     * @description Returns a `SetSObjectByName` builder that sets a related SObject using the field name.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set the value for
     *
     * @return the `SetSObjectByName` builder to set the field value
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * IConsumer setParentConsumer = new SObjectConsumerProvider()
     *     .setSObject('Parent')
     *     .var(new Account(Name = 'Parent Account'));
     * setParentConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
     */
    public virtual SetSObjectByName setSObject(final String fieldName) {
        return new SetSObjectByName(fieldName);
    }

    /**
     * @description Returns a `SetSObjectByField` builder that sets a related SObject using the specified field.
     *
     * @param field the SObjectField representing the related SObject
     *
     * @return the `SetSObjectByField` builder to set the field value
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * IConsumer setParentConsumer = new SObjectConsumerProvider()
     *     .setSObject(Account.ParentId)
     *     .var(new Account(Name = 'Parent Account'));
     * setParentConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
     */
    public virtual SetSObjectByField setSObject(final SObjectField field) {
        return new SetSObjectByField(field);
    }

    /**
     * @description A consumer that adds an error message to an SObject.
     * The consumer can target a specific field or the entire SObject, and the message can be escaped or unescaped.
     */
    public virtual class AddErrorMessageConsumer extends Consumer {
        protected final String message;
        protected Boolean escape = true;
        protected AddErrorMessageConsumer(String message) {
            Validate.notNull(message);
            this.message = message;
        }

        public virtual override void accept(Object o) { ((SObject) o).addError(message, escape); }

        /**
         * @description Specifies whether to escape the error message.
         *
         * @param escape whether to escape the message
         *
         * @return the `AddErrorMessageConsumer` builder for chaining
         *
         * @throws NullPointerException if `escape` is null
         *
         * @example
         * IConsumer addErrorConsumer = new SObjectConsumerProvider()
         *     .addError('<p>Invalid Name</p>')
         *     .escape(false)
         *     .to('Name');
         * addErrorConsumer.accept(new Account());
         */
        public virtual AddErrorMessageConsumer escape(final Boolean escape) {
            Validate.notNull(escape);
            this.escape = escape;
            return this;
        }

        /**
         * @description Returns a `Consumer` that adds the error message to the specified field on the SObject.
         *
         * @param fieldName the name of the field to add the error message to
         *
         * @return the `Consumer`
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws SObjectException if provided invalid `fieldName`
         *
         * @example
         * IConsumer addErrorConsumer = new SObjectConsumerProvider()
         *     .addError('Invalid Field')
         *     .to('Name');
         * addErrorConsumer.accept(new Account());
         */
        public virtual Consumer to(final String fieldName) {
            return new AddFieldNameErrorConsumer(fieldName, message, escape);
        }

        /**
         * @description Returns a `Consumer` that adds the error message to the specified field on the SObject.
         *
         * @param field the SObjectField to add the error message to
         *
         * @return the `Consumer`
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IConsumer addErrorConsumer = new SObjectConsumerProvider()
         *     .addError('Invalid Field')
         *     .to(Account.Name);
         * addErrorConsumer.accept(new Account());
         */
        public virtual Consumer to(final SObjectField field) {
            return new AddFieldErrorConsumer(field, message, escape);
        }
    }

    /**
     * @description A consumer that adds an exception as an error to an `SObject`.
     *
     * @example
     * IConsumer addExceptionError = new SObjectConsumerProvider()
     *     .addError(new IllegalArgumentException('Invalid value'));
     * addExceptionError.accept(new Account()); // Adds 'Invalid value' error to the Account.
     */
    public virtual class AddErrorExceptionConsumer extends Consumer {
        protected final Exception exc;
        protected Boolean escape = true;
        protected AddErrorExceptionConsumer(Exception exc) {
            Validate.notNull(exc);
            this.exc = exc;
        }

        public virtual override void accept(Object o) { ((SObject) o).addError(exc, escape); }

        /**
         * @description Sets whether the error message should be escaped when attached to the `SObject`.
         *
         * @param escape whether to escape the error message (true by default)
         *
         * @return the `AddErrorExceptionConsumer` builder for chaining
         *
         * @throws NullPointerException if `escape` is null
         *
         * @example
         * IConsumer addExceptionError = new SObjectConsumerProvider()
         *     .addError(new IllegalArgumentException('<p>Invalid value</p>'))
         *     .escape(false);
         * addExceptionError.accept(new Account()); // Adds unescaped 'Invalid value' error to the Account.
         */
        public virtual AddErrorExceptionConsumer escape(final Boolean escape) {
            Validate.notNull(escape);
            this.escape = escape;
            return this;
        }
    }

    public abstract class SetFieldValueBase {
        protected abstract Consumer val(final IFunction mapper);

        /**
         * @description Fetches a value from the provided field name
         * and sets it to the target field defined in the previous step.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field to fetch the value from
         *
         * @return the `Consumer` that applies the fetched value to the target field
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws SObjectException if the provided `fieldName` is invalid
         *
         * @example
         * IConsumer setNameFromParentConsumer = new SObjectConsumerProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .val('Parent.Name');
         * setNameFromParentConsumer.accept(new Account(Parent = new Account(Name = 'ParentName')));
         * // { Name: 'ParentName', Parent: { Name: 'ParentName' } }
         */
        public virtual Consumer val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Fetches a value from the provided `SObjectField`
         * and sets it to the target field defined in the previous step.
         *
         * @param field the SObjectField to fetch the value from
         *
         * @return the `Consumer` that applies the fetched value to the target field
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IConsumer setNameFromDepartmentAccountConsumer = new SObjectConsumerProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .val(Account.Department);
         * setNameFromDepartmentAccountConsumer.accept(new Account(Department = 'HR'));
         * // { Name: 'HR', Department: 'HR' }
         */
        public virtual Consumer val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }

        /**
         * @description Sets the provided constant value to the target field defined in the previous step.
         *
         * @param value the constant value to set
         *
         * @return the `Consumer` that applies the constant value to the target field
         *
         * @example
         * IConsumer setJohnDoeNameConsumer = new SObjectConsumerProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .var('John Doe');
         * setJohnDoeNameConsumer.accept(new Account()); // { Name: 'John Doe' }
         */
        public virtual Consumer var(final Object value) {
            return val(Function.constant(value));
        }
    }

    /**
     * @description Sets a field value for a specific field name on the SObject.
     * You can use this instance to assign a value to a field using either a constant or a function, or another field.
     */
    public virtual class SetByName extends SetFieldValueBase {
        protected final String fieldName;
        protected SetByName(String fieldName) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
        }

        /**
         * @description Sets the field value by applying the provided function.
         *
         * @param mapper the function used to map the value to the field
         *
         * @return the `Consumer` that accepts the value to the field
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IConsumer setFieldWithFunctionConsumer = new SObjectConsumerProvider()
         *     .set('Name')
         *     .val(Function.constant('Jane Doe'));
         * setFieldWithFunctionConsumer.accept(new Account()); // { Name: 'Jane Doe' }
         */
        public virtual override Consumer val(final IFunction mapper) {
            return new SetConsumer(fieldName, mapper);
        }
    }

    /**
     * @description Sets a field value for a specific field on the SObject.
     * You can use this instance to assign a value to a field using either a constant or a function, or another field.
     */
    public virtual class SetByField extends SetFieldValueBase {
        protected final SObjectField field;
        protected SetByField(final SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }

        /**
         * @description Sets the field value by applying the provided function.
         *
         * @param mapper the function used to map the value to the field
         *
         * @return the `Consumer` that accepts the value to the field
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IConsumer setFieldWithFunctionConsumer = new SObjectConsumerProvider()
         *     .set(Account.Name)
         *     .val(Function.constant('Jane Doe'));
         * setFieldWithFunctionConsumer.accept(new Account()); // { Name: 'Jane Doe' }
         */
        public virtual override Consumer val(final IFunction mapper) {
            return new SetFieldConsumer(field, mapper);
        }
    }

    private abstract class SetSObjectBase {
        protected abstract Consumer val(final IFunction mapper);

        /**
         * @description Fetches an `SObject` value from the provided field name
         * and sets it to the target field defined in the previous step.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field to fetch the `SObject` value from
         *
         * @return the `Consumer` that applies the fetched value to the target field
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws SObjectException if the provided `fieldName` is invalid
         *
         * @example
         * IConsumer setParentFromGrandparentConsumer = new SObjectConsumerProvider()
         *     .setSObject('Parent')
         *     .val('Parent.Parent');
         * setParentFromGrandparentConsumer.accept(
         *     new Account(Parent = new Account(Parent = new Account(Name = 'Grandparent')))
         * ); // { Parent: { Parent: { Name: 'Grandparent' } } }
         */
        public virtual Consumer val(final String fieldName) {
            return val(new SObjectFunctionProvider().getSObject(fieldName));
        }

        /**
         * @description Fetches an `SObject` value from the provided reference `field`
         * and sets it to the target field defined in the previous step.
         *
         * @param field the `SObjectField` to fetch the value from
         *
         * @return the `Consumer` that applies the fetched value to the target field
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IConsumer setParentFromCustomParentConsumer = new SObjectConsumerProvider()
         *     .setSObject('Parent')
         *     .val(Account.CustomParentId__c);
         * setParentFromCustomParentConsumer.accept(new Account(CustomParent__r = new Account(Name = 'CustomParent')));
         * // { Parent: { Name: 'CustomParent' }, CustomParent__r: { Name: 'CustomParent' } }
         */
        public virtual Consumer val(final SObjectField field) {
            return val(new SObjectFunctionProvider().getSObject(field));
        }

        /**
         * @description Sets the provided `SObject` value to the target field defined in the previous step.
         *
         * @param value the constant `SObject` value to set
         *
         * @return the `Consumer` that applies the `SObject` value to the target field
         *
         * @example
         * IConsumer setParentAccountConsumer = new SObjectConsumerProvider()
         *     .setSObject('Parent')
         *     .var(new Account(Name = 'Parent Account'));
         * setParentAccountConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual Consumer var(final SObject value) {
            return val(Operator.constant(value));
        }
    }

    /**
     * @description Sets a `SObject` for a specific field name on the SObject.
     * You can use this instance to assign a value using either a constant or a function, or another field.
     */
    public virtual class SetSObjectByName extends SetSObjectBase {
        protected final String fieldName;
        protected SetSObjectByName(String fieldName) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
        }

        /**
         * @description Sets the `SObject` value by applying the provided function to the specified field name.
         *
         * @param mapper the function used to map the `SObject` value to the field
         *
         * @return the `Consumer` that applies the `SObject` value to the target field
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IConsumer setParentAccountConsumer = new SObjectConsumerProvider()
         *     .setSObject('Parent')
         *     .val(Function.constant(new Account(Name = 'Parent Account')));
         * setParentAccountConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual override Consumer val(final IFunction mapper) {
            return new SetSObjectConsumer(fieldName, mapper);
        }
    }

    /**
     * @description Sets a `SObject` for a specific reference field on the SObject.
     * You can use this instance to assign a value using either a constant or a function, or another field.
     */
    public virtual class SetSObjectByField extends SetSObjectBase {
        protected final SObjectField field;
        protected SetSObjectByField(final SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }

        /**
         * @description Sets the `SObject` value by applying the provided function to the specified field.
         *
         * @param mapper the function used to map the `SObject` value to the field
         *
         * @return the `Consumer` that applies the `SObject` value to the target field
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IConsumer setParentAccountConsumer = new SObjectConsumerProvider()
         *     .setSObject(Account.ParentId)
         *     .val(Function.constant(new Account(Name = 'Parent Account')));
         * setParentAccountConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual override Consumer val(final IFunction mapper) {
            return new SetSObjectFieldConsumer(field, mapper);
        }
    }

    private class AddFieldNameErrorConsumer extends Consumer {
        private final String fieldName;
        private final String message;
        private final Boolean escape;
        private AddFieldNameErrorConsumer(String fieldName, String message, Boolean escape) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
            this.message = message;
            this.escape = escape;
        }
        public override void accept(Object o) { ((SObject) o).addError(fieldName, message, escape); }
    }

    private class AddFieldErrorConsumer extends Consumer {
        private final SObjectField field;
        private final String message;
        private final Boolean escape;
        private AddFieldErrorConsumer(SObjectField field, String message, Boolean escape) {
            Validate.notNull(field);
            this.field = field;
            this.message = message;
            this.escape = escape;
        }
        public override void accept(Object o) { ((SObject) o).addError(field, message, escape); }
    }

    private class SetConsumer extends Consumer {
        private final IConsumer consumer;
        private SetConsumer(String fieldName, IFunction mapper) {
            Validate.notNull(mapper);
            if (!AcfSupport.isXRefField(fieldName)) { consumer = new SetByFieldName(fieldName, mapper); }
            else if (AcfSupport.isSafePath(fieldName)) { consumer = new SetByFieldPathSafe(fieldName, mapper); }
            else { consumer = new SetByFieldPath(fieldName, mapper); }
        }
        public override void accept(Object o) { consumer.accept(o); }
    }

    private class SetFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetFieldConsumer(SObjectField field, IFunction mapper) {
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) o).put(field, mapper.apply(o)); }
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IFunction operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = new SObjectFunctionProvider().getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetByFieldName extends Consumer {
        private final String fieldName;
        private final IFunction mapper;
        private SetByFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) o).put(fieldName, mapper.apply(o)); }
    }

    private class SetByFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) operator.apply(o)).put(xRefFieldName, mapper.apply(o)); }
    }

    private class SetByFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetByFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) operator.apply(o))?.put(xRefFieldName, mapper.apply(o)); }
    }

    private class SetSObjectConsumer extends Consumer {
        private final IConsumer consumer;
        private SetSObjectConsumer(String fieldName, IFunction mapper) {
            Validate.notNull(mapper);
            if (!AcfSupport.isXRefField(fieldName)) { consumer = new SetSObjectByFieldName(fieldName, mapper); }
            else if (AcfSupport.isSafePath(fieldName)) {
                consumer = new SetSObjectByFieldPathSafe(fieldName, mapper);
            }
            else { consumer = new SetSObjectByFieldPath(fieldName, mapper); }
        }
        public override void accept(Object o) { consumer.accept(o); }
    }

    private class SetSObjectFieldConsumer extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetSObjectFieldConsumer(SObjectField field, IFunction mapper) {
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) o).putSObject(field, (SObject) mapper.apply(o)); }
    }

    private class SetSObjectByFieldName extends Consumer {
        protected final String fieldName;
        private final IFunction mapper;
        private SetSObjectByFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object o) { ((SObject) o).putSObject(fieldName, (SObject) mapper.apply(o)); }
    }

    private class SetSObjectByFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetSObjectByFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object o) {
            ((SObject) operator.apply(o)).putSObject(xRefFieldName, (SObject) mapper.apply(o));
        }
    }

    private class SetSObjectByFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetSObjectByFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object o) {
            ((SObject) operator.apply(o))?.putSObject(xRefFieldName, (SObject) mapper.apply(o));
        }
    }
}
