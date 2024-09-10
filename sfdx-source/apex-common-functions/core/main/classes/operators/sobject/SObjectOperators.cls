/**
 * @description Provides common implementations of {@link Operator}
 * and related utilities.
 *
 * @see Operator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
@SuppressWarnings('PMD.CognitiveComplexity')
public virtual inherited sharing class SObjectOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Operator` that gets sobject
     * for the specified `fieldName`. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a value
     *
     * @return the `Operator`
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
     * SObjectOperators.getSObject('Parent');
     * SObjectOperators.getSObject('Parent.Parent');
     * SObjectOperators.getSObject('Parent?.Parent');
     */
    public static Operator getSObject(final String fieldName) {
        return new GetSObjectOperator(fieldName);
    }

    /**
     * @description Returns a `Operator` that gets sobject
     * for the specified `field`.
     *
     * @param field the field to get a value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectOperators.getSObject(Account.ParentId);
     */
    public static Operator getSObject(final SObjectField field) {
        return new GetSObjectFieldOperator(field);
    }

    /**
     * @description Returns a `Operator` that sets the value returned by
     * the `mapper` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.set('NumberOfEmployees', someFunction);
     * SObjectOperators.set('Parent.NumberOfEmployees', someFunction);
     * SObjectOperators.set('Parent?.NumberOfEmployees', someFunction);
     */
    public static Operator set(final String fieldName, final IFunction mapper) {
        return Operator.compose(SObjectConsumers.set(fieldName, mapper));
    }

    /**
     * @description Returns a `Operator` that sets the value returned by
     * the `mapper` for the specified `field` and returns a mutated argument.
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @example
     * SObjectOperators.set(Account.NumberOfEmployees, someFunction);
     * SObjectOperators.set(Account.NumberOfEmployees, Function.constant(100));
     */
    public static Operator set(final SObjectField field, final IFunction mapper) {
        return Operator.compose(SObjectConsumers.set(field, mapper));
    }

    /**
     * @description Returns a `Operator` that sets the `value`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param value the value to set
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.set('NumberOfEmployees', 100);
     * SObjectOperators.set('Parent.NumberOfEmployees', 100);
     * SObjectOperators.set('Parent?.NumberOfEmployees', (Object) null);
     */
    public static Operator set(final String fieldName, final Object value) {
        return set(fieldName, Function.constant(value));
    }

    /**
     * @description Returns a `Operator` that sets the `value`
     * for the specified `field` and returns a mutated argument.
     *
     * @param field the field name to set a value
     * @param value the value to set
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.set(Account.NumberOfEmployees, 100);
     * SObjectOperators.set(Account.NumberOfEmployees, (Object) null);
     */
    public static Operator set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    /**
     * @description Returns a `Operator` that sets SObject the value returned by
     * the `valueMapper` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param valueMapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `valueMapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectOperators.setSObject('Parent', someOperator);
     * SObjectOperators.setSObject('Parent.Parent', someOperator);
     * SObjectOperators.setSObject('Parent?.Parent', someOperator);
     */
    public static Operator setSObject(final String fieldName, final IOperator valueMapper) {
        return Operator.compose(SObjectConsumers.setSObject(fieldName, valueMapper));
    }

    /**
     * @description Returns a `Operator` that sets SObject the value returned by
     * the `valueMapper` for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field name to set a value
     * @param valueMapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` or `valueMapper` is null
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectOperators.setSObject(Account.ParentId, someOperator);
     */
    public static Operator setSObject(final SObjectField field, final IOperator valueMapper) {
        return Operator.compose(SObjectConsumers.setSObject(field, valueMapper));
    }

    /**
     * @description Returns a `Operator` that sets SObject the `parent`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field name to set a value
     * @param parent the value to set
     *
     * @return the `Operator`
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
     * SObjectOperators.setSObject('Parent', someAccount);
     * SObjectOperators.setSObject('Parent.Parent', someAccount);
     * SObjectOperators.setSObject('Parent?.Parent', (SObject) null);
     */
    public static Operator setSObject(final String fieldName, final SObject parent) {
        return setSObject(fieldName, Operator.constant(parent));
    }

    /**
     * @description Returns a `Operator` that sets SObject the `parent`
     * for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param field the field name to set a value
     * @param parent the value to set
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumers.setSObject
     *
     * @example
     * SObjectOperators.setSObject(Account.ParentId, someAccount);
     * SObjectOperators.setSObject(Account.ParentId, (SObject) null);
     */
    public static Operator setSObject(final SObjectField field, final SObject parent) {
        return setSObject(field, Operator.constant(parent));
    }

    /**
     * @description Returns a `Operator` that sets sobjects the value returned by
     * the `mapper` for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.setSObjects('Contacts', someFunction);
     * SObjectOperators.setSObjects('Parent.Contacts', someFunction);
     * SObjectOperators.setSObjects('Parent?.Contacts', someFunction);
     */
    public static Operator setSObjects(final String fieldName, final IFunction mapper) {
        return new SetSObjectsByFieldNameOperator(fieldName, mapper);
    }

    /**
     * @description Returns a `Operator` that sets sobjects the value returned by
     * the `mapper` for the specified `field` and returns a mutated argument.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param field the field name to set a value
     * @param mapper applied to the input argument
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` or `mapper` is null
     *
     * @example
     * SObjectOperators.setSObjects(Contact.AccountId, someFunction);
     */
    public static Operator setSObjects(final SObjectField field, final IFunction mapper) {
        return new SetSObjectsByFieldNameOperator(field, mapper);
    }

    /**
     * @description Returns a `Operator` that sets sobjects the `children`
     * for the specified `fieldName` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param fieldName the field name to set a value
     * @param children the value to set
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.setSObjects('Contacts', someFunction);
     * SObjectOperators.setSObjects('Parent.Contacts', someFunction);
     * SObjectOperators.setSObjects('Parent?.Contacts', someFunction);
     */
    public static Operator setSObjects(final String fieldName, final List<SObject> children) {
        return setSObjects(fieldName, Function.constant(children));
    }

    /**
     * @description Returns a `Operator` that sets sobjects the `children`
     * the for the specified `field` and returns a mutated argument.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>
     *
     * @param field the field name to set a value
     * @param children the value to set
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.setSObjects(Contact.AccountId, childrenContacts);
     * SObjectOperators.setSObjects(Contact.AccountId, (List<SObject>) null);
     */
    public static Operator setSObjects(final SObjectField field, final List<SObject> children) {
        return setSObjects(field, Function.constant(children));
    }

    /**
     * @description Returns a `Operator` that returns a new sobject
     * of the given `sObjectType`.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` is null
     *
     * @see Supplier.of
     *
     * @example
     * SObjectOperators.newSObject(Account.SObjectType);
     */
    public static Operator newSObject(final SObjectType sObjectType) {
        return Operator.compose(SObjectSuppliers.of(sObjectType));
    }

    /**
     * @description Returns a combined `Operator` of the
     * {@link SObjectOperators.newSObject} and the `merger`.
     * Is typically used to create a new SObject based on an input argument.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param merger the binary valueMapper that merges input arguments
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` or `merger` is null
     */
    public static Operator newSObject(final SObjectType sObjectType, final IBiOperator merger) {
        return Operator.combine(newSObject(sObjectType), merger);
    }

    /**
     * @description Returns a combined `Operator` of the
     * {@link SObjectOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject based on an input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param fieldName target field name of a first input argument
     * @param mapper the function applied to a second input argument
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName`,
     * `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.newSObject(Account.SObjectType, 'Id', Functions.get('AccountId'));
     * SObjectOperators.newSObject(Account.SObjectType, 'Id', Functions.get('Account.ParentId'));
     */
    public static Operator newSObject(
        final SObjectType sObjectType,
        final String fieldName,
        final IFunction mapper
    ) {
        return newSObject(sObjectType, BiOperator.combine(SObjectBiConsumers.set(fieldName, mapper)));
    }

    /**
     * @description Returns a combined `Operator` of the
     * {@link SObjectOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject based on an input argument.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param field target field of a first input argument
     * @param mapper the function applied to a second input argument
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` or `field`,
     * `mapper` is null
     *
     * @example
     * SObjectOperators.newSObject(Account.SObjectType, Account.Id, Functions.get('AccountId'));
     */
    public static Operator newSObject(
        final SObjectType sObjectType,
        final SObjectField field,
        final IFunction mapper
    ) {
        return newSObject(sObjectType, BiOperator.combine(SObjectBiConsumers.set(field, mapper)));
    }

    /**
     * @description Returns a combined `Operator` of the
     * {@link SObjectOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject and set the `value` for the `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param fieldName target field name of a first input argument
     * @param value the value to set
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectOperators.newSObject(Account.SObjectType, 'Id', someAccId);
     */
    public static Operator newSObject(
        final SObjectType sObjectType,
        final String fieldName,
        final Object value
    ) {
        return newSObject(sObjectType, fieldName, Function.constant(value));
    }

    /**
     * @description Returns a combined `Operator` of the
     * {@link SObjectOperators.newSObject} and the {@link SObjectBiConsumers.set}.
     * Is typically used to create a new SObject and set the `value` for the `field`.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param field the target field
     * @param value the value to set
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `sObjectType` or `fieldName` is null
     *
     * @example
     * SObjectOperators.newSObject(Account.SObjectType, Account.Id, someAccId);
     */
    public static Operator newSObject(
        final SObjectType sObjectType,
        final SObjectField field,
        final Object value
    ) {
        return newSObject(sObjectType, field, Function.constant(value));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetSObjectByFieldName extends Operator {
        private final String fieldName;
        private GetSObjectByFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(fieldName); }
    }

    private class GetSObjectByFieldPathSafe extends Operator {
        private final List<String> path;
        private GetSObjectByFieldPathSafe(String fieldName) { path = fieldName.split('\\.'); }
        public override Object apply(Object obj) { return getSObject((SObject) obj, 0); }
        private SObject getSObject(SObject sObj, Integer i) {
            if (i >= path.size()) { return sObj; }
            String fieldName = path[i];
            Boolean isSafeNavigation = fieldName.endsWith('?'); // Safe Navigation
            if (isSafeNavigation) { fieldName = fieldName.removeEnd('?'); }
            sObj = sObj.getSObject(fieldName);
            if (isSafeNavigation && sObj == null) { return null; }
            return getSObject(sObj, ++i);
        }
    }

    private class GetSObjectOperator extends Operator {
        private final IFunction mapper;
        private GetSObjectOperator(String fieldName) {
            Validate.notBlank(fieldName);
            if (!fieldName.containsAny('?.')) { mapper = new GetSObjectByFieldName(fieldName); }
            else { mapper = new GetSObjectByFieldPathSafe(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply(obj); }
    }

    private class GetSObjectFieldOperator extends Operator {
        private final SObjectField field;
        private GetSObjectFieldOperator(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }

    private class SetSObjectsByFieldNameOperator extends Operator {
        private final String placeholder = '\'{\'"totalSize": {0}, "done": true, "records": {1}\'}\'';
        private final String fieldName;
        private final IFunction mapper;
        public SetSObjectsByFieldNameOperator(String fieldName, IFunction mapper) {
            Validate.notBlank(fieldName);
            Validate.notNull(mapper);
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public SetSObjectsByFieldNameOperator(SObjectField field, IFunction mapper) {
            Validate.notNull(field);
            Validate.notNull(mapper);
            this.fieldName = findChildRelationshipName(field);
            this.mapper = mapper;
        }
        public override Object apply(Object o) {
            SObject sObj = ((SObject) o);
            final Map<String, Object> rawRecord = new Map<String, Object>(sObj.getPopulatedFieldsAsMap());
            final List<SObject> children = (List<SObject>) mapper.apply(sObj);
            if (children == null || children.isEmpty()) {
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
        private String findChildRelationshipName(final SObjectField field) {
            return CsfSupport.findRelationshipField(field);
        }
    }
    // @end-group
    //</editor-fold>

}
