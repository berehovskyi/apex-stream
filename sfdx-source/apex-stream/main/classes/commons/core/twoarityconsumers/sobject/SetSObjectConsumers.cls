/**
 * @description Provides common implementations of `Set<T> - T` {@link ObjectSObjectConsumer}
 * and related utilities that are used by {@link SObjectCollectors}.
 *
 * @see ObjectSObjectConsumer
 * @see SObjectCollectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SetSObjectConsumers {

    @TestVisible
    private SetSObjectConsumers(){}

    //<editor-fold desc="Add To Set<?> BiConsumers">
    // @start-group Add To Set<?> BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Boolean>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toBoolSet
     */
    public static ObjectSObjectConsumer addToBoolSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToBoolSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Id>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toIdSet
     */
    public static ObjectSObjectConsumer addToIdSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToIdSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<String>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toStringSet
     */
    public static ObjectSObjectConsumer addToStringSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToStringSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Blob>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toBlobSet
     */
    public static ObjectSObjectConsumer addToBlobSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToBlobSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Date>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toDateSet
     */
    public static ObjectSObjectConsumer addToDateSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDateSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Datetime>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toDatetimeSet
     */
    public static ObjectSObjectConsumer addToDatetimeSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDatetimeSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Time>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toTimeSet
     */
    public static ObjectSObjectConsumer addToTimeSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToTimeSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Integer>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toIntSet
     */
    public static ObjectSObjectConsumer addToIntSet(final ISObjectToIntFunction mapper) {
        Validate.notNull(mapper);
        return new AddToIntSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Long>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toLongSet
     */
    public static ObjectSObjectConsumer addToLongSet(final ISObjectToLongFunction mapper) {
        Validate.notNull(mapper);
        return new AddToLongSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Double>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toDoubleSet
     */
    public static ObjectSObjectConsumer addToDoubleSet(final ISObjectToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDoubleSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<SObject>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toSet
     */
    public static ObjectSObjectConsumer addToSObjectSet(final ISObjectUnaryOperator mapper) {
        return new AddToSObjectSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to the
     * `Set<Object>` and adds to it the result of applying the `mapper` function
     * to the second input argument
     *
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see SObjectCollectors.toSet
     */
    public static ObjectSObjectConsumer addToObjectSet(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToObjectSet(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToBoolSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToBoolSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Boolean>) container).add((Boolean) mapper.apply(sObj));
        }
    }

    private class AddToIdSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToIdSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Id>) container).add((Id) mapper.apply(sObj));
        }
    }

    private class AddToStringSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToStringSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<String>) container).add((String) mapper.apply(sObj));
        }
    }

    private class AddToBlobSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToBlobSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Blob>) container).add((Blob) mapper.apply(sObj));
        }
    }

    private class AddToDateSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToDateSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Date>) container).add((Date) mapper.apply(sObj));
        }
    }

    private class AddToDatetimeSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToDatetimeSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Datetime>) container).add((Datetime) mapper.apply(sObj));
        }
    }

    private class AddToTimeSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToTimeSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Time>) container).add((Time) mapper.apply(sObj));
        }
    }

    private class AddToIntSet extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction mapper;
        private AddToIntSet(ISObjectToIntFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Integer>) container).add(mapper.apply(sObj));
        }
    }

    private class AddToLongSet extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction mapper;
        private AddToLongSet(ISObjectToLongFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Long>) container).add(mapper.apply(sObj));
        }
    }

    private class AddToDoubleSet extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction mapper;
        private AddToDoubleSet(ISObjectToDoubleFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Double>) container).add(mapper.apply(sObj));
        }
    }

    private class AddToSObjectSet extends ObjectSObjectConsumer {
        private final ISObjectUnaryOperator mapper;
        private AddToSObjectSet(ISObjectUnaryOperator mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<SObject>) container).add(mapper.apply(sObj));
        }
    }

    private class AddToObjectSet extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private AddToObjectSet(ISObjectFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, SObject sObj) {
            ((Set<Object>) container).add(mapper.apply(sObj));
        }
    }
    // @end-group
    //</editor-fold>

}
