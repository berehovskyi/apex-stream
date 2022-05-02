/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link ISObjectConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ISObjectIterable.forEach
 */
public abstract inherited sharing class SObjectConsumer implements ISObjectConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     * @param after the operation to perform after this operation
     * @return the composed `SObjectConsumer`
     * @throws NullPointerException if `after` is null
     */
    public virtual SObjectConsumer andThen(final ISObjectConsumer after) {
        return compose(new List<ISObjectConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     * @param consumers the operations to sequentially perform
     * @return the composed `SObjectConsumer`
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static SObjectConsumer compose(final List<ISObjectConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Debug Consumers">
    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static SObjectConsumer debug(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new Debug(loggingLevel, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static SObjectConsumer debug(final LoggingLevel loggingLevel) {
        return debug(loggingLevel, '');
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument.
     * @param message the message
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `message` is null
     */
    public static SObjectConsumer debug(final String message) {
        return debug(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument.
     * @return the `SObjectConsumer`
     */
    public static SObjectConsumer debug() {
        return debug(LoggingLevel.INFO, '');
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument
     * using the pretty-print format.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static SObjectConsumer debugPretty(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new DebugPretty(loggingLevel, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument
     * using the pretty-print format.
     * @param loggingLevel the logging level
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static SObjectConsumer debugPretty(final LoggingLevel loggingLevel) {
        return debugPretty(loggingLevel, '');
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument
     * using the pretty-print format.
     * @param message the message
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `message` is null
     */
    public static SObjectConsumer debugPretty(final String message) {
        return debugPretty(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `SObjectConsumer` that debugs an input argument
     * using the pretty-print format.
     * @return the `SObjectConsumer`
     */
    public static SObjectConsumer debugPretty() {
        return debugPretty(LoggingLevel.INFO, '');
    }
    //</editor-fold>

    //<editor-fold desc="SObject Consumers">
    /**
     * @description Returns a `SObjectConsumer` that sets the value returned by
     * the `mapper` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectConsumer.set('NumberOfEmployees', someSObjectFunction);
     * SObjectConsumer.set('Parent.NumberOfEmployees', someSObjectFunction);
     * SObjectConsumer.set('Parent?.NumberOfEmployees', someSObjectFunction);
     * @param fieldName the field name to set a value
     * @param mapper applied to the input argument
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank or `mapper` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectConsumer set(final String fieldName, final ISObjectFunction mapper) {
        Validate.notBlank(fieldName);
        Validate.notNull(mapper);
        if (!fieldName.contains('.')) { return new SetFieldName(fieldName, mapper); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new SetFieldPathSafe(fieldName, mapper); }
        return new SetFieldPath(fieldName, mapper);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the value returned by
     * the `mapper` for the specified `field`.
     * @example
     * SObjectConsumer.set(Account.NumberOfEmployees, someSObjectFunction);
     * @param field the field to set a value
     * @param mapper applied to the input argument
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank or `mapper` is null
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
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
     * SObjectConsumer.set('NumberOfEmployees', 100);
     * SObjectConsumer.set('Parent.NumberOfEmployees', 100);
     * SObjectConsumer.set('Parent?.NumberOfEmployees', (Object) null);
     * @param fieldName the field name to set a value
     * @param value the value to set
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectConsumer set(final String fieldName, final Object value) {
        return set(fieldName, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets the `value`
     * for the specified `field`.
     * @example
     * SObjectConsumer.set(Account.NumberOfEmployees, 100);
     * SObjectConsumer.set(Account.NumberOfEmployees, (Object) null);
     * @param field the field to set a value
     * @param value the value to set
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.put
     */
    public static SObjectConsumer set(final SObjectField field, final Object value) {
        return set(field, SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the value returned by
     * the `operator` for the specified `fieldName`.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectConsumer.setSObject('Parent', someSObjectUnaryOperator);
     * SObjectConsumer.setSObject('Parent.Parent', someSObjectUnaryOperator);
     * SObjectConsumer.setSObject('Parent?.Parent', someSObjectUnaryOperator);
     * </pre>
     * @param fieldName the field name to set a value
     * @param operator applied to the input argument
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank or `operator` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.putSObject
     */
    public static SObjectConsumer setSObject(final String fieldName, final ISObjectUnaryOperator operator) {
        Validate.notBlank(fieldName);
        Validate.notNull(operator);
        if (!fieldName.contains('.')) { return new SetSObjectFieldName(fieldName, operator); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) {
            return new SetSObjectFieldPathSafe(fieldName, operator);
        }
        return new SetSObjectFieldPath(fieldName, operator);
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the value returned by
     * the `operator` for the specified `field`.
     * @example
     * SObjectBiConsumer.setSObject(Account.ParentId, someSObjectUnaryOperator);
     * @param field the field to set a value
     * @param operator applied to the input argument
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank or `operator` is null
     * @see SObject.putSObject
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
     * @example
     * SObjectConsumer.setSObject('Parent', someAccount);
     * SObjectConsumer.setSObject('Parent.Parent', someAccount);
     * SObjectConsumer.setSObject('Parent?.Parent', (SObject) null);
     * @param fieldName the field name to set a value
     * @param parent the value to set
     * @return the `SObjectConsumer`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.putSObject
     */
    public static SObjectConsumer setSObject(final String fieldName, final SObject parent) {
        return setSObject(fieldName, SObjectUnaryOperator.constant(parent));
    }

    /**
     * @description Returns a `SObjectConsumer` that sets SObject the `parent`
     * for the specified `field`.
     * @example
     * SObjectConsumer.setSObject(Account.ParentId, someAccount);
     * SObjectConsumer.setSObject(Account.ParentId, (SObject) null);
     * @param field the field to set a value
     * @param parent the value to set
     * @return the `SObjectConsumer`
     * @throws NullPointerException if the `fieldName` is blank
     * @see SObject.putSObject
     */
    public static SObjectConsumer setSObject(final SObjectField field, final SObject parent) {
        return setSObject(field, SObjectUnaryOperator.constant(parent));
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends SObjectConsumer {
        private final List<ISObjectConsumer> consumers;
        private Compose(List<ISObjectConsumer> consumers) { this.consumers = consumers; }
        public override void accept(SObject sObj) {
            for (ISObjectConsumer consumer : consumers) {
                consumer.accept(sObj);
            }
        }
    }

    private class Debug extends SObjectConsumer {
        private final String message;
        private final LoggingLevel level;
        private Debug(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(SObject sObj) { System.debug(level, message + sObj); }
    }

    private class DebugPretty extends SObjectConsumer {
        private final String message;
        private final LoggingLevel level;
        private DebugPretty(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(SObject sObj) { System.debug(level, message + JSON.serializePretty(sObj)); }
    }

    private abstract class SObjectPathConsumer extends SObjectConsumer {
        protected final ISObjectUnaryOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperator.getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends SObjectConsumer {
        private final String fieldName;
        private final ISObjectFunction mapper;
        private SetFieldName(String fieldName, ISObjectFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            sObj.put(fieldName, this.mapper.apply(sObj));
        }
    }

    private class SetFieldPath extends SObjectPathConsumer {
        private final ISObjectFunction mapper;
        private SetFieldPath(String fieldName, ISObjectFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            operator.apply(sObj).put(xRefFieldName, this.mapper.apply(sObj));
        }
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
        public override void accept(SObject sObj) {
            sObj.put(field, this.mapper.apply(sObj));
        }
    }

    private class SetSObjectFieldName extends SObjectConsumer {
        protected final String fieldName;
        private final ISObjectUnaryOperator mapper;
        private SetSObjectFieldName(String fieldName, ISObjectUnaryOperator mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(SObject sObj) {
            sObj.putSObject(fieldName, this.mapper.apply(sObj));
        }
    }

    private class SetSObjectFieldPath extends SObjectPathConsumer {
        protected final String fieldName;
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
        protected final String fieldName;
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
        public override void accept(SObject sObj) {
            sObj.putSObject(field, operator.apply(sObj));
        }
    }
    // @end-group
    //</editor-fold>

}
