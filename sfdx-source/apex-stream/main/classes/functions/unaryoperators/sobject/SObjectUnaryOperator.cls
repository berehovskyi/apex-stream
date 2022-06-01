/**
 * @description Inherits {@link ISObjectUnaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see ISObjectIterable.mapTo
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectUnaryOperator implements ISObjectUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectUnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual SObjectUnaryOperator andThen(final ISObjectUnaryOperator after) {
        return compose(new List<ISObjectUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if before is null
     */
    public virtual SObjectUnaryOperator compose(final ISObjectUnaryOperator before) {
        return compose(new List<ISObjectUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectUnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static SObjectUnaryOperator compose(final List<ISObjectUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that always returns the input argument.
     *
     * @return the `SObjectUnaryOperator`
     */
    public static SObjectUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that always returns the `value`.
     *
     * @param value the const value
     *
     * @return the `SObjectUnaryOperator`
     */
    public static SObjectUnaryOperator constant(final SObject value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` of the `consumer`.
     *
     * @param consumer the consumer
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static SObjectUnaryOperator forConsumer(final ISObjectConsumer consumer) {
        Validate.notNull(consumer);
        return new ForSObjectConsumer(consumer);
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` of the `supplier`.
     *
     * @param supplier the supplier
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectUnaryOperator forSupplier(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return new ForSObjectSupplier(supplier);
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the `operator`
     * and the `merger`.
     *
     * @param operator the operator
     * @param merger the binary operator that merges the input argument and a value returned by
     * the `operator`.
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `operator` or `merger` is null
     */
    public static SObjectUnaryOperator combine(
            final ISObjectUnaryOperator operator,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(operator);
        Validate.notNull(merger);
        return new Combine(operator, merger);
    }
    // @end-group
    //</editor-fold>

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
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectUnaryOperator.getSObject('Parent');
     * SObjectUnaryOperator.getSObject('Parent.Parent');
     * SObjectUnaryOperator.getSObject('Parent?.Parent');
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
     * @throws NullPointerException if the `field` is null
     *
     * @see SObject.getSObject
     *
     * @example
     * SObjectUnaryOperator.getSObject(Account.ParentId);
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
     * @throws NullPointerException if the `fieldName` is blank or the `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.set
     *
     * @example
     * SObjectUnaryOperator.set('NumberOfEmployees', someSObjectFunction);
     * SObjectUnaryOperator.set('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectUnaryOperator.set('Parent?.NumberOfEmployees', someSObjectFunction);
     */
    public static SObjectUnaryOperator set(final String fieldName, final ISObjectFunction mapper) {
        return forConsumer(SObjectConsumer.set(fieldName, mapper));
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
     * @throws NullPointerException if the `field` or the `mapper` is null
     *
     * @see SObjectConsumer.set
     *
     * @example
     * SObjectUnaryOperator.set(Account.NumberOfEmployees, someSObjectFunction);
     * SObjectUnaryOperator.set(Account.NumberOfEmployees, SObjectFunction.constant(100));
     */
    public static SObjectUnaryOperator set(final SObjectField field, final ISObjectFunction mapper) {
        return forConsumer(SObjectConsumer.set(field, mapper));
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
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.set
     *
     * @example
     * SObjectUnaryOperator.set('NumberOfEmployees', 100);
     * SObjectUnaryOperator.set('Parent.NumberOfEmployees', 100);
     * SObjectUnaryOperator.set('Parent?.NumberOfEmployees', (Object) null);
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
     * @throws NullPointerException if the `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.set
     *
     * @example
     * SObjectUnaryOperator.set(Account.NumberOfEmployees, 100);
     * SObjectUnaryOperator.set(Account.NumberOfEmployees, (Object) null);
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
     * @throws NullPointerException if the `fieldName` is blank or the `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.setSObject
     *
     * @example
     * SObjectUnaryOperator.setSObject('Parent', someSObjectUnaryOperator);
     * SObjectUnaryOperator.setSObject('Parent.Parent', someSObjectUnaryOperator);
     * SObjectUnaryOperator.setSObject('Parent?.Parent', someSObjectUnaryOperator);
     */
    public static SObjectUnaryOperator setSObject(final String fieldName, final ISObjectUnaryOperator operator) {
        return forConsumer(SObjectConsumer.setSObject(fieldName, operator));
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
     * @throws NullPointerException if the `field` or the `operator` is null
     *
     * @see SObjectConsumer.setSObject
     *
     * @example
     * SObjectUnaryOperator.setSObject(Account.ParentId, someSObjectUnaryOperator);
     */
    public static SObjectUnaryOperator setSObject(final SObjectField field, final ISObjectUnaryOperator operator) {
        return forConsumer(SObjectConsumer.setSObject(field, operator));
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
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.setSObject
     *
     * @example
     * SObjectUnaryOperator.setSObject('Parent', someAccount);
     * SObjectUnaryOperator.setSObject('Parent.Parent', someAccount);
     * SObjectUnaryOperator.setSObject('Parent?.Parent', (SObject) null);
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
     * @throws NullPointerException if the `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectConsumer.setSObject
     *
     * @example
     * SObjectUnaryOperator.setSObject(Account.ParentId, someAccount);
     * SObjectUnaryOperator.setSObject(Account.ParentId, (SObject) null);
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
     * @throws NullPointerException if the `fieldName` is blank or the `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperator.setSObjects('Contacts', someSObjectFunction);
     * SObjectUnaryOperator.setSObjects('Parent.Contacts', someSObjectFunction);
     * SObjectUnaryOperator.setSObjects('Parent?.Contacts', someSObjectFunction);
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
     * @throws NullPointerException if the `field` or the `mapper` is null
     *
     * @example
     * SObjectUnaryOperator.setSObjects(Contact.AccountId, someSObjectFunction);
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
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperator.setSObjects('Contacts', someSObjectFunction);
     * SObjectUnaryOperator.setSObjects('Parent.Contacts', someSObjectFunction);
     * SObjectUnaryOperator.setSObjects('Parent?.Contacts', someSObjectFunction);
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
     * @throws NullPointerException if the `field` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectUnaryOperator.setSObjects(Contact.AccountId, childrenContacts);
     * SObjectUnaryOperator.setSObjects(Contact.AccountId, (List&lt;SObject>) null);
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
     * SObjectUnaryOperator.newSObject(Account.SObjectType);
     */
    public static SObjectUnaryOperator newSObject(final SObjectType sObjectType) {
        return forSupplier(SObjectSupplier.of(sObjectType));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperator.newSObject} and the `merger`.
     * Is typically used to create a new SObject based on an input argument.
     *
     * @param sObjectType the SObjectType of a new SObject to be returned
     * @param merger the binary operator that merges input arguments
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `sObjectType` or `merger` is null
     *
     * @see SObjectCollector.mapping
     */
    public static SObjectUnaryOperator newSObject(final SObjectType sObjectType, final ISObjectBinaryOperator merger) {
        return combine(newSObject(sObjectType), merger);
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperator.newSObject} and the {@link SObjectBiConsumer.set}.
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
     * @see SObjectUnaryOperator.newSObject
     * @see SObjectBiConsumer.set
     * @see SObjectCollector.mapping
     *
     * @example
     * SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', SObjectFunction.get('AccountId'));
     * SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', SObjectFunction.get('Account.ParentId'));
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final String fieldName,
            final ISObjectFunction mapper
    ) {
        return newSObject(sObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumer.set(fieldName, mapper)));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperator.newSObject} and the {@link SObjectBiConsumer.set}.
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
     * @see SObjectUnaryOperator.newSObject
     * @see SObjectBiConsumer.set
     * @see SObjectCollector.mapping
     *
     * @example
     * SObjectUnaryOperator.newSObject(Account.SObjectType, Account.Id, SObjectFunction.get('AccountId'));
     */
    public static SObjectUnaryOperator newSObject(
            final SObjectType sObjectType,
            final SObjectField field,
            final ISObjectFunction mapper
    ) {
        return newSObject(sObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumer.set(field, mapper)));
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the
     * {@link SObjectUnaryOperator.newSObject} and the {@link SObjectBiConsumer.set}.
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
     * SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', someAccId);
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
     * {@link SObjectUnaryOperator.newSObject} and the {@link SObjectBiConsumer.set}.
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
     * SObjectUnaryOperator.newSObject(Account.SObjectType, Account.Id, someAccId);
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
    private class Identity extends SObjectUnaryOperator {
        public override SObject apply(SObject sObj) { return sObj; }
    }

    private class Compose extends SObjectUnaryOperator {
        private final List<ISObjectUnaryOperator> operators;
        private Compose(List<ISObjectUnaryOperator> operators) { this.operators = operators; }
        public override SObject apply(SObject sObj) {
            SObject result = sObj;
            for (ISObjectUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends SObjectUnaryOperator {
        private final SObject value;
        private Constant(SObject value) { this.value = value; }
        public override SObject apply(SObject sObj) { return value; }
    }

    private class ForSObjectConsumer extends SObjectUnaryOperator {
        private final ISObjectConsumer consumer;
        private ForSObjectConsumer(ISObjectConsumer consumer) { this.consumer = consumer; }
        public override SObject apply(SObject sObj) {
            consumer.accept(sObj);
            return sObj;
        }
    }

    private class ForSObjectSupplier extends SObjectUnaryOperator {
        private final ISObjectSupplier supplier;
        private ForSObjectSupplier(ISObjectSupplier supplier) { this.supplier = supplier; }
        public override SObject apply(SObject sObj) { return supplier.get(); }
    }

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

    private class Combine extends SObjectUnaryOperator {
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private Combine(ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger) {
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override SObject apply(SObject sObj) {
            return merger.apply(sObj, valueMapper.apply(sObj));
        }
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
            final Map<String, Object> rawRecord = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(sObj));
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
