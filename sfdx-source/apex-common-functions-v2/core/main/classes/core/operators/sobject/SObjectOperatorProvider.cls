/**
 * @description Provides a fluent interface for building operators that operate on SObjects, allowing you
 * to set fields, and perform other operations on SObjects.
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IOperator setJohnDoeNameOperator = new SObjectOperatorProvider()
 *     .set('Name')
 *     .var('John Doe');
 * setJohnDoeNameOperator.apply(new Account()); // { Name: 'John Doe' }
 */
public virtual inherited sharing class SObjectOperatorProvider {
    /**
     * @description Returns a `SetByName` builder that sets the value for the specified `fieldName` on the SObject.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set the value for
     *
     * @return the `SetByName` instance to set the field value
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @see SObject.put
     *
     * @example
     * IOperator setNameOperator = new SObjectOperatorProvider()
     *     .set('Name')
     *     .var('Jane Doe');
     * setNameOperator.apply(new Account()); // { Name: 'Jane Doe' }
     * // safe navigation
     * IOperator setRevenueFromParentOperator = new SObjectOperatorProvider()
     *     .set('AnnualRevenue')
     *     .val('Parent?.AnnualRevenue');
     * setRevenueFromParentOperator.apply(new Account(Parent = new Account(AnnualRevenue = 5000)));
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
     * @return the `SetByField` consumer to set the field value
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.put
     *
     * @example
     * IOperator setNameOperator = new SObjectOperatorProvider()
     *     .set(Account.Name)
     *     .var('Jane Doe');
     * setNameOperator.apply(new Account()); // { Name: 'Jane Doe' }
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
     * @return the `SetSObjectByName` instance to set the field value
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * IOperator setParentOperator = new SObjectOperatorProvider()
     *     .setSObject('Parent')
     *     .var(new Account(Name = 'Parent Account'));
     * setParentOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
     */
    public virtual SetSObjectByName setSObject(final String fieldName) {
        return new SetSObjectByName(fieldName);
    }

    /**
     * @description Returns a `SetSObjectByField` builder that sets a related SObject using the specified field.
     *
     * @param field the SObjectField representing the related SObject
     *
     * @return the `SetSObjectByField` instance to set the field value
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.putSObject
     *
     * @example
     * IOperator setParentOperator = new SObjectOperatorProvider()
     *     .setSObject(Account.ParentId)
     *     .var(new Account(Name = 'Parent Account'));
     * setParentOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
     */
    public virtual SetSObjectByField setSObject(final SObjectField field) {
        return new SetSObjectByField(field);
    }

    /**
     * @description Returns a `SetSObjects` builder that sets related SObjects using the specified field.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children SObjects.</p>
     *
     * @param fieldName the field name representing the related SObjects
     *
     * @return the `SetSObjects` instance to set the field value
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * IOperator setContactsOperator = new SObjectOperatorProvider()
     *     .setSObjects('Contacts')
     *     .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
     * setContactsOperator.apply(new Account());
     * // Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
     */
    public virtual SetSObjects setSObjects(final String fieldName) {
        return new SetSObjects(fieldName);
    }

    /**
     * @description Returns a `SetSObjects` builder that sets related SObjects using the specified field.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children SObjects.</p>
     *
     * @param field the SObjectField representing the related SObjects
     *
     * @return the `SetSObjects` instance to set the field value
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * IOperator setContactsOperator = new SObjectOperatorProvider()
     *     .setSObjects(Contact.AccountId)
     *     .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
     * setContactsOperator.apply(new Account());
     * // Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
     */
    public virtual SetSObjects setSObjects(final SObjectField field) {
        return new SetSObjects(field);
    }

    private abstract class SetFieldValueBase {
        protected abstract Operator val(final IFunction mapper);

        /**
         * @description Fetches a value from the provided field name
         * and sets it to the target field defined in the previous step.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field to fetch the value from
         *
         * @return the `Operator` that applies the fetched value to the target field and returns the mutated argument
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws SObjectException if the provided `fieldName` is invalid
         *
         * @example
         * IOperator setNameFromParentOperator = new SObjectOperatorProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .val('Parent.Name');
         * setNameFromParentOperator.apply(new Account(Parent = new Account(Name = 'ParentName')));
         * // { Name: 'ParentName', Parent: { Name: 'ParentName' } }
         */
        public virtual Operator val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Fetches a value from the provided `SObjectField`
         * and sets it to the target field defined in the previous step.
         *
         * @param field the SObjectField to fetch the value from
         *
         * @return the `Operator` that applies the fetched value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IOperator setNameFromDepartmentAccountOperator = new SObjectOperatorProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .val(Account.Department);
         * setNameFromDepartmentAccountOperator.apply(new Account(Department = 'HR'));
         * // { Name: 'HR', Department: 'HR' }
         */
        public virtual Operator val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }

        /**
         * @description Sets the provided constant value to the target field defined in the previous step.
         *
         * @param value the constant value to set
         *
         * @return the `Operator` that applies the constant value to the target field and returns the mutated argument
         *
         * @example
         * IOperator setJohnDoeNameOperator = new SObjectOperatorProvider()
         *     .set('Name') // or .set(Account.Name)
         *     .var('John Doe');
         * setJohnDoeNameOperator.apply(new Account()); // { Name: 'John Doe' }
         */
        public virtual Operator var(final Object value) {
            return val(Function.constant(value));
        }
    }

    /**
     * @description Sets a field value for a specific field name on the SObject.
     * You can use this instance to assign a value to a field using either a constant or a function, or another field.
     */
    public virtual class SetByName extends SetFieldValueBase {
        private final String fieldName;
        private SetByName(String fieldName) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
        }

        /**
         * @description Sets the field value by applying the provided function.
         *
         * @param mapper the function used to map the value to the field
         *
         * @return the `Operator` that accepts the value to the field and returns the mutated argument
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IOperator setFieldWithFunctionOperator = new SObjectOperatorProvider()
         *     .set('Name')
         *     .val(Function.constant('Jane Doe'));
         * setFieldWithFunctionOperator.apply(new Account()); // { Name: 'Jane Doe' }
         */
        public virtual override Operator val(final IFunction mapper) {
            return Operator.compose(new SObjectConsumerProvider().set(fieldName).val(mapper));
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
         * @return the `Operator` that accepts the value to the field and returns the mutated argument
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IOperator setFieldWithFunctionOperator = new SObjectOperatorProvider()
         *     .set(Account.Name)
         *     .val(Function.constant('Jane Doe'));
         * setFieldWithFunctionOperator.apply(new Account()); // { Name: 'Jane Doe' }
         */
        public virtual override Operator val(final IFunction mapper) {
            return Operator.compose(new SObjectConsumerProvider().set(field).val(mapper));
        }
    }

    private abstract class SetSObjectBase {
        protected abstract Operator val(final IFunction mapper);

        /**
         * @description Fetches an SObject value from the provided field name
         * and sets it to the target field defined in the previous step.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field to fetch the SObject value from
         *
         * @return the `Operator` that applies the fetched value to the target field and returns the mutated argument
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws SObjectException if the provided `fieldName` is invalid
         *
         * @example
         * IOperator setParentFromGrandparentOperator = new SObjectOperatorProvider()
         *     .setSObject('Parent')
         *     .val('Parent.Parent');
         * setParentFromGrandparentOperator.apply(
         *     new Account(Parent = new Account(Parent = new Account(Name = 'Grandparent')))
         * ); // { Parent: { Parent: { Name: 'Grandparent' } } }
         */
        public virtual Operator val(final String fieldName) {
            return val(new SObjectFunctionProvider().getSObject(fieldName));
        }

        /**
         * @description Fetches an SObject value from the provided reference `field`
         * and sets it to the target field defined in the previous step.
         *
         * @param field the `SObjectField` to fetch the value from
         *
         * @return the `Operator` that applies the fetched value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IOperator setParentFromCustomParentOperator = new SObjectOperatorProvider()
         *     .setSObject('Parent')
         *     .val(Account.CustomParentId__c);
         * setParentFromCustomParentOperator.apply(new Account(CustomParent__r = new Account(Name = 'CustomParent')));
         * // { Parent: { Name: 'CustomParent' }, CustomParent__r: { Name: 'CustomParent' } }
         */
        public virtual Operator val(final SObjectField field) {
            return val(new SObjectFunctionProvider().getSObject(field));
        }

        /**
         * @description Sets the provided SObject value to the target field defined in the previous step.
         *
         * @param value the constant SObject value to set
         *
         * @return the `Operator` that applies the SObject value to the target field and returns the mutated argument
         *
         * @example
         * IOperator setParentAccountOperator = new SObjectOperatorProvider()
         *     .setSObject('Parent')
         *     .var(new Account(Name = 'Parent Account'));
         * setParentAccountOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual Operator var(final SObject value) {
            return val(Operator.constant(value));
        }
    }

    /**
     * @description Sets a SObject for a specific field name on the SObject.
     * You can use this instance to assign a value using either a constant or a function, or another field.
     */
    public virtual class SetSObjectByName extends SetSObjectBase {
        protected final String fieldName;
        protected SetSObjectByName(String fieldName) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
        }

        /**
         * @description Sets the SObject value by applying the provided operator to the specified field name.
         *
         * @param mapper the operator used to map the SObject value to the field
         *
         * @return the `Operator` that applies the SObject value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IOperator setParentAccountOperator = new SObjectOperatorProvider()
         *     .setSObject('Parent')
         *     .val(Function.constant(new Account(Name = 'Parent Account')));
         * setParentAccountOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual override Operator val(final IFunction mapper) {
            return Operator.compose(new SObjectConsumerProvider().setSObject(fieldName).val(mapper));
        }
    }

    /**
     * @description Sets a SObject for a specific reference field on the SObject.
     * You can use this instance to assign a value using either a constant or a function, or another field.
     */
    public virtual class SetSObjectByField extends SetSObjectBase {
        protected final SObjectField field;
        protected SetSObjectByField(final SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }

        /**
         * @description Sets the SObject value by applying the provided function to the specified field.
         *
         * @param mapper the function used to map the SObject value to the field
         *
         * @return the `Operator` that applies the SObject value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IOperator setParentAccountOperator = new SObjectOperatorProvider()
         *     .setSObject(Account.ParentId)
         *     .val(Function.constant(new Account(Name = 'Parent Account')));
         * setParentAccountOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
         */
        public virtual override Operator val(final IFunction mapper) {
            return Operator.compose(new SObjectConsumerProvider().setSObject(field).val(mapper));
        }
    }

    /**
     * @description Sets related SObjects for a specific field name on the SObject.
     * You can use this instance to assign a value using either a constant or a function, or another field.
     */
    public virtual class SetSObjects {
        protected final String fieldName;
        protected SetSObjects(String fieldName) {
            Validate.notBlank(fieldName);
            this.fieldName = fieldName;
        }
        protected SetSObjects(SObjectField field) {
            this.fieldName = AcfSupport.findRelationshipField(field);
        }

        /**
         * @description Sets related SObjects value by applying the provided function to the specified field.
         * <p><strong>Note: </strong></p>
         * <p>This operator uses serialization / deserialization to set related children SObjects.</p>
         *
         * @param mapper the function used to map the `Iterable<SObject>` value to the field
         *
         * @return the `Operator` that applies the value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * IOperator setContactsOperator = new SObjectOperatorProvider()
         *     .setSObjects('Contacts')
         *     .val(Function.constant(
         *         new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') })
         *     ));
         * setContactsOperator.apply(new Account());
         * // Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
         */
        public virtual Operator val(final IFunction mapper) {
            return new SetSObjectsByFieldNameOperator(fieldName, mapper);
        }

        /**
         * @description Fetches a list of related SObject records from the provided field name
         * and sets them to the target field defined in the previous step.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field to fetch the related SObject records from
         *
         * @return the `Operator` that applies the value to the target field and returns the mutated argument
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * IOperator setContactsOperator = new SObjectOperatorProvider()
         *     .setSObjects('Contacts')
         *     .val('Contacts__r');
         * setContactsOperator.apply(new Account(
         *     Contacts__r = new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') }
         * ));
         * // Account {
         *     Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }],
         *     Contacts__r: [{ FirstName: 'John' }, { FirstName: 'Jane' }]
         * }
         */
        public virtual Operator val(final String fieldName) {
            return val(new SObjectFunctionProvider().getSObjects(fieldName));
        }

        /**
         * @description Fetches a list of related SObject records from the provided field
         * and sets them to the target field defined in the previous step.
         *
         * @param field the name of the field to fetch the related SObject records from
         *
         * @return the `Operator` that applies the value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * IOperator setContactsOperator = new SObjectOperatorProvider()
         *     .setSObjects('Contacts')
         *     .val(Contact.Account__c);
         * setContactsOperator.apply(new Account(
         *     Contacts__r = new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') }
         * ));
         * // Account {
         *     Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }],
         *     Contacts__r: [{ FirstName: 'John' }, { FirstName: 'Jane' }]
         * }
         */
        public virtual Operator val(final SObjectField field) {
            return val(new SObjectFunctionProvider().getSObjects(field));
        }

        /**
         * @description Sets the provided constant iterable to the target field defined in the previous step.
         *
         * @param value the iterable of SObject values to set
         *
         * @return the `Operator` that applies the value to the target field and returns the mutated argument
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IOperator setContactsOperator = new SObjectOperatorProvider()
         *     .setSObjects('Contacts')
         *     .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
         * setContactsOperator.apply(new Account());
         * // Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
         */
        public virtual Operator var(final Iterable<SObject> value) {
            return val(Function.constant(value));
        }
    }

    private class SetSObjectsByFieldNameOperator extends Operator {
        private final String placeholder = '\'{\'"totalSize": {0}, "done": true, "records": {1}\'}\'';
        private final String fieldName;
        private final IFunction mapper;
        private SetSObjectsByFieldNameOperator(String fieldName, IFunction mapper) {
            Validate.notNull(mapper);
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override Object apply(Object o) {
            final SObject sObj = ((SObject) o);
            final Map<String, Object> rawRecord = new Map<String, Object>(sObj.getPopulatedFieldsAsMap());
            final List<SObject> children = (List<SObject>) mapper.apply(sObj);
            if (children?.isEmpty() != false) {
                rawRecord.keySet().remove(fieldName);
            } else {
                final List<Object> arguments = new List<Object>{ children.size(), JSON.serialize(children) };
                final String fake = String.format(placeholder, arguments);
                rawRecord.put(fieldName, JSON.deserializeUntyped(fake));
            }
            return JSON.deserialize(
                JSON.serialize(rawRecord),
                Type.forName(sObj.getSObjectType().getDescribe().getName())
            );
        }
    }
}
