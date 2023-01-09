/**
 * @description Provides common implementations of {@link SObjectUnaryOperator}
 * and related utilities.
 *
 * @see SObjectUnaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectUnaryOperators {

    @TestVisible
    private SObjectUnaryOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectUnaryOperator` that gets sobject
     * for the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectUnaryOperators.getSObject('Parent');
     * SObjectUnaryOperators.getSObject('Parent.Parent');
     * SObjectUnaryOperators.getSObject('Parent?.Parent');
     */
    public static SObjectUnaryOperator getSObject(final String fieldName) {
        Validate.notBlank(fieldName);
        if (!fieldName.containsAny('?.')) { return new GetSObjectFieldName(fieldName); }
        return new GetSObjectFieldPathSafe(fieldName);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that gets sobject
     * for the specified `field`.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectUnaryOperators.getSObject(Account.ParentId);
     */
    public static SObjectUnaryOperator getSObject(final SObjectField field) {
        Validate.notNull(field);
        return new GetSObjectField(field);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets the value returned by
     * the `mapper` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.set
     *
     * @example
     * SObjectUnaryOperators.set('NumberOfEmployees', someSObjectFunction);
     * SObjectUnaryOperators.set('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectUnaryOperators.set('Parent?.NumberOfEmployees', someSObjectFunction);
     */
    public static SObjectUnaryOperator set(final String fieldName, final ISObjectFunction mapper) {
        return SObjectUnaryOperator.compose(SObjectConsumers.set(fieldName, mapper));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets the value returned by
     * the `mapper` for the specified `field` and returns a mutated argument.
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @see SObjectConsumers.set
     *
     * @example
     * SObjectUnaryOperators.set(Account.NumberOfEmployees, someSObjectFunction);
     * SObjectUnaryOperators.set(Account.NumberOfEmployees, SObjectFunction.constant(100));
     */
    public static SObjectUnaryOperator set(final SObjectField field, final ISObjectFunction mapper) {
        return SObjectUnaryOperator.compose(SObjectConsumers.set(field, mapper));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets the `value`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.set
     *
     * @example
     * SObjectUnaryOperators.set('NumberOfEmployees', 100);
     * SObjectUnaryOperators.set('Parent.NumberOfEmployees', 100);
     * SObjectUnaryOperators.set('Parent?.NumberOfEmployees', (Object) null);
     */
    public static SObjectUnaryOperator set(final String fieldName, final Object value) {
        return set(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets the `value`
     * for the specified `field` and returns a mutated argument.
     *
     * @param field the field name to set a value
     * @param value the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.set
     *
     * @example
     * SObjectUnaryOperators.set(Account.NumberOfEmployees, 100);
     * SObjectUnaryOperators.set(Account.NumberOfEmployees, (Object) null);
     */
    public static SObjectUnaryOperator set(final SObjectField field, final Object value) {
        return set(field, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets SObject the value returned by
     * the `operator` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param operator applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectUnaryOperators.setSObject('Parent', someSObjectUnaryOperator);
     * SObjectUnaryOperators.setSObject('Parent.Parent', someSObjectUnaryOperator);
     * SObjectUnaryOperators.setSObject('Parent?.Parent', someSObjectUnaryOperator);
     */
    public static SObjectUnaryOperator setSObject(final String fieldName, final ISObjectUnaryOperator operator) {
        return SObjectUnaryOperator.compose(SObjectConsumers.setSObject(fieldName, operator));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets SObject the value returned by
     * the `operator` for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field name to set a value
     * @param operator applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` or `operator` is null
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectUnaryOperators.setSObject(Account.ParentId, someSObjectUnaryOperator);
     */
    public static SObjectUnaryOperator setSObject(final SObjectField field, final ISObjectUnaryOperator operator) {
        return SObjectUnaryOperator.compose(SObjectConsumers.setSObject(field, operator));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets SObject the `parent`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param parent the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectUnaryOperators.setSObject('Parent', someAccount);
     * SObjectUnaryOperators.setSObject('Parent.Parent', someAccount);
     * SObjectUnaryOperators.setSObject('Parent?.Parent', (SObject) null);
     */
    public static SObjectUnaryOperator setSObject(final String fieldName, final SObject parent) {
        return setSObject(fieldName, SObjectUnaryOperator.constant(parent));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets SObject the `parent`
     * for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field name to set a value
     * @param parent the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectUnaryOperators.setSObject(Account.ParentId, someAccount);
     * SObjectUnaryOperators.setSObject(Account.ParentId, (SObject) null);
     */
    public static SObjectUnaryOperator setSObject(final SObjectField field, final SObject parent) {
        return setSObject(field, SObjectUnaryOperator.constant(parent));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets sobjects the value returned by
     * the `mapper` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This operator uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperators.setSObjects('Contacts', someSObjectFunction);
     * SObjectUnaryOperators.setSObjects('Parent.Contacts', someSObjectFunction);
     * SObjectUnaryOperators.setSObjects('Parent?.Contacts', someSObjectFunction);
     */
    public static SObjectUnaryOperator setSObjects(final String fieldName, final ISObjectFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        return new SetSObjectsByFieldName(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets sobjects the value returned by
     * the `mapper` for the specified `field` and returns a mutated argument.
     * <p><strong>Note: </strong></p>
     * <p>This operator uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @example
     * SObjectUnaryOperators.setSObjects(Contact.AccountId, someSObjectFunction);
     */
    public static SObjectUnaryOperator setSObjects(final SObjectField field, final ISObjectFunction mapper) {
        Validate.notNull(field);
        Validate.notNull(mapper);
        return new SetSObjectsByFieldName(field, mapper);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets sobjects the `children`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This operator uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param fieldName the field name to set a value
     * @param children the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperators.setSObjects('Contacts', someSObjectFunction);
     * SObjectUnaryOperators.setSObjects('Parent.Contacts', someSObjectFunction);
     * SObjectUnaryOperators.setSObjects('Parent?.Contacts', someSObjectFunction);
     */
    public static SObjectUnaryOperator setSObjects(final String fieldName, final List<SObject> children) {
        return setSObjects(fieldName, SObjectFunction.constant(children));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that sets sobjects the `children`
     * the for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This operator uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param field the field name to set a value
     * @param children the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperators.setSObjects(Contact.AccountId, childrenContacts);
     * SObjectUnaryOperators.setSObjects(Contact.AccountId, (List<SObject>) null);
     */
    public static SObjectUnaryOperator setSObjects(final SObjectField field, final List<SObject> children) {
        return setSObjects(field, SObjectFunction.constant(children));
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that returns a new sobject
     * of the given `sObjectType`.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` is null
     *
     * @see SObjectSupplier.of
     *
     * @example
     * SObjectUnaryOperators.newSObject(Account.SObjectType);
     */
    public static SObjectUnaryOperator newSObject(final SObjectType sObjectType) {
        return SObjectUnaryOperator.compose(SObjectSupplier.of(sObjectType));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperators.newSObject} and the `merger`.
     * Is typically used to create a new SObject based on an input argument.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param merger the binary operator that merges input arguments
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `merger` is null
     *
     * @see SObjectCollectors.mapping
     */
    public static SObjectUnaryOperator newSObject(final SObjectType sObjectType, final ISObjectBinaryOperator merger) {
        return SObjectUnaryOperator.combine(newSObject(sObjectType), merger);
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject based on an input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param fieldName target field name of a first input argument
     * @param mapper the function applied to a second input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName`,
     * `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectUnaryOperators.newSObject
     * @see SObjectBiConsumers.set
     * @see SObjectCollectors.mapping
     *
     * @example
     * SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', SObjectFunctions.get('AccountId'));
     * SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', SObjectFunctions.get('Account.ParentId'));
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final String fieldName,
            final ISObjectFunction mapper
    ) {
        return newSObject(sObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumers.set(fieldName, mapper)));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject based on an input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param field target field of a first input argument
     * @param mapper the function applied to a second input argument
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `field`,
     * `mapper` is null
     *
     * @see SObjectUnaryOperators.newSObject
     * @see SObjectBiConsumers.set
     * @see SObjectCollectors.mapping
     *
     * @example
     * SObjectUnaryOperators.newSObject(Account.SObjectType, Account.Id, SObjectFunctions.get('AccountId'));
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final SObjectField field,
            final ISObjectFunction mapper
    ) {
        return newSObject(sObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumers.set(field, mapper)));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject and set the `value` for the `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param fieldName target field name of a first input argument
     * @param value the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', someAccId);
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final String fieldName,
            final Object value
    ) {
        return newSObject(sObjectType, fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject and set the `value` for the `field`.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param field the target field
     * @param value the value to set
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName` is null
     *
     * @example
     * SObjectUnaryOperators.newSObject(Account.SObjectType, Account.Id, someAccId);
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final SObjectField field,
            final Object value
    ) {
        return newSObject(sObjectType, field, SObjectFunction.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetSObjectFieldName extends SObjectUnaryOperator {
        private final String fieldName;
        private GetSObjectFieldName(String fieldName) { this.fieldName = fieldName; }
        public override SObject apply(SObject sObj) { return sObj.getSObject(fieldName); }
    }

    private class GetSObjectFieldPathSafe extends SObjectUnaryOperator {
        private final List<String> path;
        private GetSObjectFieldPathSafe(String fieldName) { path = fieldName.split('\\.'); }
        public override SObject apply(SObject root) {
            SObject sObj = root;
            for (Integer i = 0, size = path.size(); i < size; i++) {
                String fieldName = path[i];
                if (fieldName.endsWith('?')) { // Safe Navigation
                    fieldName = fieldName.removeEnd('?');
                    sObj = sObj.getSObject(fieldName);
                    if (sObj == null) {
                        return sObj;
                    }
                } else {
                    sObj = sObj.getSObject(fieldName);
                }
            }
            return sObj;
        }
    }

    private class GetSObjectField extends SObjectUnaryOperator {
        private final SObjectField field;
        private GetSObjectField(SObjectField field) { this.field = field; }
        public override SObject apply(SObject sObj) { return sObj.getSObject(field); }
    }

    private class SetSObjectsByFieldName extends SObjectUnaryOperator {
        private final String placeholder = '\'{\'"totalSize": {0}, "done": true, "records": {1}\'}\'';
        private final String fieldName;
        private final ISObjectFunction mapper;
        private SetSObjectsByFieldName(String fieldName, ISObjectFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        private SetSObjectsByFieldName(SObjectField field, ISObjectFunction mapper) {
            this(Schemas.findChildRelationshipName(field), mapper);
        }
        public override SObject apply(SObject sObj) {
            final Map<String, Object> rawRecord = new Map<String, Object>(sObj.getPopulatedFieldsAsMap());
            final List<SObject> children = (List<SObject>) mapper.apply(sObj);
            if (children == null || children.isEmpty()) {
                rawRecord.keySet().remove(fieldName);
            } else {
                final List<Object> arguments = new List<Object>{ children.size(), JSON.serialize(children) };
                final String fake = String.format(placeholder, arguments);
                rawRecord.put(fieldName, JSON.deserializeUntyped(fake));
            }
            return (SObject) JSON.deserialize(
                    JSON.serialize(rawRecord),
                    Type.forName(sObj.getSObjectType().getDescribe().getName())
            );
        }
    }
    // @end-group
    //</editor-fold>

}
