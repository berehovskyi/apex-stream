/**
 * @description A provider class that offers various functions for retrieving values from SObjects,
 * supporting cross-reference fields, safe navigation, and complex field paths.
 * This class acts as a factory for different types of functions that can be applied to SObjects.
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IFunction nameFunction = new SObjectFunctionProvider().get('Name');
 * nameFunction.apply(new Account(Name = 'John Doe')); // John Doe
 * IFunction contactsFunction = new SObjectFunctionProvider().getSObjects('Contacts');
 * contactsFunction.apply(
 *     new Account(Id = '001000000000001AAA', Contacts = new List<Contact>{ new Contact(LastName = 'Doe') })
 * ); // [{ LastName: 'Doe' }]
 * IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
 *    .val(Contact.LastName).to(Lead.LastName)
 *    .val('Email').to('Email')
 *    .var(someUserId).to('OwnerId');
 * mapToLead.apply(new Contact(LastName = 'Doe', Email = 'john.doe@example.com'));
 * // Lead { LastName: 'Doe', Email: 'john.doe@example.com', OwnerId: '005000000000000AAA' }
 */
public virtual inherited sharing class SObjectFunctionProvider {
    /**
     * @description Returns a `Function` that gets a value for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Function`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.get
     *
     * @example
     * IFunction nameFunction = new SObjectFunctionProvider().get('Name');
     * nameFunction.apply(new Account(Name = 'John Doe')); // John Doe
     *
     * IFunction parentNameFunction = new SObjectFunctionProvider().get('Parent.Name');
     * parentNameFunction.apply(new Account(Parent = new Account(Name = 'Acme Corp'))); // Acme Corp
     * // but
     * parentNameFunction.apply(new Account()); // throws NPE
     *
     * IFunction safeParentNameFunction = new SObjectFunctionProvider().get('Parent?.Name');
     * safeParentNameFunction.apply(new Account(Parent = new Account(Name = 'Acme Corp'))); // Acme Corp
     * // but
     * safeParentNameFunction.apply(new Account()); // null
     */
    public virtual Function get(final String fieldName) {
        return new GetFunction(fieldName);
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
     * IFunction nameFieldFunction = new SObjectFunctionProvider().get(Account.Name);
     * nameFieldFunction.apply(new Account(Name = 'John Doe')); // John Doe
     */
    public virtual Function get(final SObjectField field) {
        return new GetFieldFunction(field);
    }

    /**
     * @description Returns a `Function` that gets a single related sObject for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get the related sObject
     *
     * @return the `Function`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObject
     *
     * @example
     * IFunction accountFunction = new SObjectFunctionProvider().getSObject('Account');
     * accountFunction.apply(new Contact(Account = new Account(Name = 'John Doe'))); // Account { Name: 'John Doe' }
     */
    public virtual Function getSObject(final String fieldName) {
        return new GetSObjectFunction(fieldName);
    }

    /**
     * @description Returns a `Function` that gets a single related sObject for the specified `field`.
     *
     * @param field the `SObjectField` to get the related sObject
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.getSObject
     *
     * @example
     * IFunction accountFunction = new SObjectFunctionProvider().getSObject(Contact.AccountId);
     * accountFunction.apply(new Contact(Account = new Account(Name = 'John Doe'))); // Account { Name: 'John Doe' }
     */
    public virtual Function getSObject(final SObjectField field) {
        return new GetSObjectFieldFunction(field);
    }

    /**
     * @description Returns a `Function` that gets children sobjects for
     * the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Function`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObjects
     *
     * @example
     * IFunction contactsFunction = new SObjectFunctionProvider().getSObjects('Contacts');
     * contactsFunction.apply(
     *     new Account(Id = '001000000000001AAA', Contacts = new List<Contact>{ new Contact(LastName = 'Doe') })
     * ); // [{ Name: Doe }]
     *
     * IFunction parentContactsFunction = new SObjectFunctionProvider().getSObjects('Parent.Contacts');
     * parentContactsFunction.apply(
     *     new Account(Parent = new Account(
     *         Id = '001000000000001AAA',
     *         Contacts = new List<Contact>{ new Contact(LastName = 'Doe') }
     *     ))
     * ); // [{ Name: Doe }]
     * // but
     * parentContactsFunction.apply(new Account(Id = '001000000000001AAA')); // throws NPE
     *
     * IFunction safeParentContactsFunction = new SObjectFunctionProvider().getSObjects('Parent?.Contacts');
     * safeParentContactsFunction.apply(
     *     new Account(Parent = new Account(
     *         Id = '001000000000001AAA',
     *         Contacts = new List<Contact>{ new Contact(LastName = 'Doe') }
     *     ))
     * ); // [{ Name: Doe }]
     * // but
     * safeParentContactsFunction.apply(new Account(Id = '001000000000001AAA')); // null
     */
    public virtual Function getSObjects(final String fieldName) {
        return new GetSObjectsFunction(fieldName);
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
     * IFunction contactsFunction = new SObjectFunctionProvider().getSObjects(Contact.AccountId);
     * contactsFunction.apply(
     *     new Account(Id = '001000000000001AAA', Contacts = new List<Contact>{ new Contact(LastName = 'Doe') })
     * ); // [{ LastName: 'Doe' }]
     */
    public virtual Function getSObjects(final SObjectField field) {
        final String relationshipField = AcfSupport.findRelationshipField(field);
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(relationshipField);
    }

    /**
     * @description Returns a `Function` that returns
     * a map of populated field names and their corresponding values for an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getPopulatedFieldsAsMap
     *
     * @example
     * IFunction populatedFieldsMapFunction = new SObjectFunctionProvider().getPopulatedFieldsAsMap();
     * populatedFieldsMapFunction.apply(new Account(Name = 'John Doe', AnnualRevenue = 1000000));
     * // { Name = John Doe, AnnualRevenue = 1000000 }
     */
    public virtual Function getPopulatedFieldsAsMap() {
        return new GetPopulatedFieldsAsMap();
    }

    /**
     * @description Returns a `Function` that returns
     * the name of a quick action associated with an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getQuickActionName
     *
     * @example
     * IFunction quickActionNameFunction = new SObjectFunctionProvider().getQuickActionName();
     * quickActionNameFunction.apply(acc); // some quick action, determined in trigger context
     */
    public virtual Function getQuickActionName() {
        return new GetQuickActionName();
    }

    /**
     * @description Returns a `Function` that returns
     * the `SObjectType` of an input argument.
     *
     * @return the `Function`
     *
     * @see SObject.getSObjectType
     *
     * @example
     * IFunction sObjectTypeFunction = new SObjectFunctionProvider().getSObjectType();
     * sObjectTypeFunction.apply(new Account()); // Account
     */
    public virtual Function getSObjectType() {
        return new GetSObjectType();
    }

    /**
     * @description Returns a `ChainableMapSObjectFunction` that allows mapping values
     * from a supplier to an SObject. This method provides flexibility for complex mapping
     * operations.
     *
     * @param identitySupplier the supplier that provides the initial SObject
     *
     * @return the `ChainableMapSObjectFunction`
     *
     * @throws NullPointerException if `identitySupplier` is null
     *
     * @example
     * IFunction mapToLead = new SObjectFunctionProvider().mapTo(new SObjectSupplierProvider().of(Lead.SObjectType))
     *    .val(Contact.LastName).to(Lead.LastName)
     *    .val('Email').to('Email')
     *    .var(someUserId).to('OwnerId');
     * mapToLead.apply(new Contact(LastName = 'Doe', Email = 'john.doe@example.com'));
     * // Lead { LastName: 'Doe', Email: 'john.doe@example.com', OwnerId: '005000000000000AAA' }
     */
    public virtual ChainableMapSObjectFunction mapTo(final ISupplier identitySupplier) {
        return new ChainableMapSObjectFunction(identitySupplier);
    }

    /**
     * @description Returns a `ChainableMapSObjectFunction` that maps values to a specified
     * SObject type, using the destination type to create the SObject.
     *
     * @param destType the SObjectType of the destination object
     *
     * @return the `ChainableMapSObjectFunction`
     *
     * @throws NullPointerException if `destType` is null
     *
     * @example
     * IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
     *    .val(Contact.LastName).to(Lead.LastName)
     *    .val('Email').to('Email')
     *    .var(someUserId).to('OwnerId');
     * mapToLead.apply(new Contact(LastName = 'Doe', Email = 'john.doe@example.com'));
     * // Lead { LastName: 'Doe', Email: 'john.doe@example.com', OwnerId: '005000000000000AAA' }
     */
    public virtual ChainableMapSObjectFunction mapTo(final SObjectType destType) {
        return mapTo(new SObjectSupplierProvider().of(destType));
    }

    /**
     * @description Represents a chainable mapping function that maps values to fields of an SObject.
     * This function allows for a flexible and extensible mapping approach by supporting multiple
     * value mappers and destination consumers.
     */
    public virtual class ChainableMapSObjectFunction extends Function {
        protected final ISupplier identitySupplier;
        protected final List<IFunction> valueMappers = new List<IFunction>();
        protected final List<SObjectConsumerProvider.SetFieldValueBase> destConsumers
            = new List<SObjectConsumerProvider.SetFieldValueBase>();
        protected ChainableMapSObjectFunction(ISupplier identitySupplier) {
            Validate.notNull(identitySupplier);
            this.identitySupplier = identitySupplier;
        }

        @SuppressWarnings('PMD.OneDeclarationPerLine')
        public override Object apply(Object o) {
            SObject identity = (SObject) identitySupplier.get();
            if (valueMappers.isEmpty()) { return identity; }
            for (Integer i = 0, size = valueMappers.size(); i < size; i++) {
                destConsumers[i].var(valueMappers[i].apply(o)).accept(identity);
            }
            return identity;
        }

        /**
         * @description Creates a `MapSObjectValueMapper` to map a value obtained from the provided
         * function to a field on the SObject.
         *
         * @param mapper the function that retrieves the value to be mapped
         *
         * @return the `MapSObjectValueMapper`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType);
         *     .val(new SObjectFunctionProvider().get(Contact.LastName)).to(Lead.LastName);
         * mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
         */
        public virtual MapSObjectValueMapper val(final IFunction mapper) {
            return new MapSObjectValueMapper(this, mapper);
        }

        /**
         * @description Creates a `MapSObjectValueMapper` to map a value obtained from a field
         * by specifying its `fieldName`, and mapping it to a field on the SObject.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field from which to retrieve the value
         *
         * @return the `MapSObjectValueMapper`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
         *     .val('LastName').to('LastName');
         * mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
         */
        public virtual MapSObjectValueMapper val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Creates a `MapSObjectValueMapper` to map a value obtained from a specified
         * `field`, and mapping it to a field on the SObject.
         *
         * @param field the `SObjectField` from which to retrieve the value
         *
         * @return the `MapSObjectValueMapper`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
         *     .val(Contact.LastName).to(Lead.LastName);
         * mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
         */
        public virtual MapSObjectValueMapper val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }

        /**
         * @description Creates a `MapSObjectValueMapper` to map a constant value to a field on the SObject.
         *
         * @param value the constant value to be mapped
         *
         * @return the `MapSObjectValueMapper`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
         *     .var('John Doe').to(Lead.Name);
         * mapToLead.apply(new Contact()); // Lead { Name: 'John Doe' }
         */
        public virtual MapSObjectValueMapper var(final Object value) {
            return val(Function.constant(value));
        }

        private ChainableMapSObjectFunction addMapping(
            IFunction valueMapper,
            SObjectConsumerProvider.SetFieldValueBase destMapper
        ) {
            valueMappers.add(valueMapper);
            destConsumers.add(destMapper);
            return this;
        }
    }

    /**
     * @description A class that provides a mapping between a value retrieved by an `IFunction`
     * and a target field on an SObject. Supports cross-reference fields and safe navigation.
     * This class is used in conjunction with `ChainableMapSObjectFunction` to map values
     * from one SObject to another in a flexible and chainable manner.
     */
    public virtual class MapSObjectValueMapper {
        protected final ChainableMapSObjectFunction chainableOperator;
        protected final IFunction mapper;
        protected MapSObjectValueMapper(ChainableMapSObjectFunction chainableOperator, IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
            this.chainableOperator = chainableOperator;
        }

        /**
         * @description Maps the value provided by the function to the specified field name on the SObject.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the field on the destination SObject where the value will be mapped
         *
         * @return the `ChainableMapSObjectFunction`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
         *     .val('LastName').to('LastName');
         *     .var(someUserId).to('OwnerId');
         * mapToLead.apply(new Contact(LastName = 'Doe'));
         * // Lead { LastName: 'Doe', OwnerId: '005000000000000AAA' }
         */
        public virtual ChainableMapSObjectFunction to(final String fieldName) {
            return chainableOperator.addMapping(mapper, new SObjectConsumerProvider().set(fieldName));
        }

        /**
         * @description Maps the value provided by the function to the specified `field`
         * on the SObject.
         *
         * @param field the `SObjectField` on the destination SObject where the value will be mapped
         *
         * @return the `ChainableMapSObjectFunction`
         *
         * @example
         * IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
         *     .val(Contact.LastName).to(Lead.LastName)
         *     .var(someUserId).to(Lead.OwnerId);
         * mapToLead.apply(new Contact(LastName = 'Doe'));
         * // Lead { LastName: 'Doe', OwnerId: '005000000000000AAA' }
         */
        public virtual ChainableMapSObjectFunction to(final SObjectField field) {
            return chainableOperator.addMapping(mapper, new SObjectConsumerProvider().set(field));
        }
    }

    private abstract class SObjectPathFunction extends Function {
        protected final IFunction mapper;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            mapper = new SObjectFunctionProvider().getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class GetByFieldName extends Function {
        private final String fieldName;
        private GetByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object o) { return ((SObject) o).get(fieldName); }
    }

    private class GetByFieldPath extends SObjectPathFunction {
        private GetByFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(Object o) { return ((SObject) mapper.apply(o)).get(xRefFieldName); }
    }

    private class GetByFieldPathSafe extends SObjectPathFunction {
        private GetByFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(Object o) { return ((SObject) mapper.apply(o))?.get(xRefFieldName); }
    }

    private class GetFunction extends Function {
        private final IFunction function;
        private GetFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!AcfSupport.isXRefField(fieldName)) { function = new GetByFieldName(fieldName); }
            else if (AcfSupport.isSafePath(fieldName)) { function = new GetByFieldPathSafe(fieldName); }
            else { function = new GetByFieldPath(fieldName); }
        }
        public override Object apply(Object o) { return function.apply(o); }
    }

    private class GetFieldFunction extends Function {
        private final SObjectField field;
        private GetFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object o) { return ((SObject) o).get(field); }
    }

    private class GetSObjectFunction extends Function {
        private final IFunction function;
        private GetSObjectFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!fieldName.containsAny('?.')) { function = new GetSObjectByFieldName(fieldName); }
            else { function = new GetSObjectByFieldPathSafe(fieldName); }
        }
        public override Object apply(Object o) { return function.apply(o); }
    }

    private class GetSObjectFieldFunction extends Function {
        private final SObjectField field;
        private GetSObjectFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object o) { return ((SObject) o).getSObject(field); }
    }

    private class GetSObjectsByFieldName extends Function {
        private final String fieldName;
        private GetSObjectsByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object o) { return ((SObject) o).getSObjects(fieldName); }
    }

    private class GetSObjectsByFieldPath extends SObjectPathFunction {
        private GetSObjectsByFieldPath(String fieldName) { super(fieldName); }
        public override Object apply(Object o) { return ((SObject) mapper.apply(o)).getSObjects(xRefFieldName); }
    }

    private class GetSObjectsByFieldPathSafe extends SObjectPathFunction {
        private GetSObjectsByFieldPathSafe(String fieldName) { super(fieldName); }
        public override Object apply(Object o) { return ((SObject) mapper.apply(o))?.getSObjects(xRefFieldName); }
    }

    private class GetSObjectsFunction extends Function {
        private final IFunction function;
        private GetSObjectsFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!AcfSupport.isXRefField(fieldName)) { function = new GetSObjectsByFieldName(fieldName); }
            else if (AcfSupport.isSafePath(fieldName)) { function = new GetSObjectsByFieldPathSafe(fieldName); }
            else { function = new GetSObjectsByFieldPath(fieldName); }
        }
        public override Object apply(Object o) { return function.apply(o); }
    }

    private class GetPopulatedFieldsAsMap extends Function {
        public override Object apply(Object o) { return ((SObject) o).getPopulatedFieldsAsMap(); }
    }

    private class GetQuickActionName extends Function {
        public override Object apply(Object o) { return ((SObject) o).getQuickActionName(); }
    }

    private class GetSObjectType extends Function {
        public override Object apply(Object o) { return ((SObject) o).getSObjectType(); }
    }

    private class GetSObjectByFieldName extends Function {
        private final String fieldName;
        private GetSObjectByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object o) { return ((SObject) o).getSObject(fieldName); }
    }

    private class GetSObjectByFieldPathSafe extends Function {
        private final List<String> path;
        private GetSObjectByFieldPathSafe(String fieldName) { path = fieldName.split('\\.'); }
        public override Object apply(Object o) { return getSObject((SObject) o, 0); }
        private SObject getSObject(SObject sObj, Integer i) {
            if (i >= path.size()) { return sObj; }
            String fieldName = path[i];
            Boolean isSafe = fieldName.endsWith('?'); // Safe Navigation
            if (isSafe) { fieldName = fieldName.removeEnd('?'); }
            sObj = sObj.getSObject(fieldName);
            if (isSafe && sObj == null) { return null; }
            return getSObject(sObj, ++i);
        }
    }
}
