/**
 * @description Provides common implementations of `Set<T> - T` {@link BiConsumer}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see BiConsumer
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SetObjectConsumers {

    @TestVisible
    private SetObjectConsumers() {}

    //<editor-fold desc="Add To Set<?> BiConsumers">
    // @start-group Add To Set<?> BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Object>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toSet
     */
    public static BiConsumer addToSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Boolean>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toBoolSet
     */
    public static BiConsumer addToBoolSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToBoolSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Id>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toIdSet
     */
    public static BiConsumer addToIdSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToIdSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<String>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toStringSet
     */
    public static BiConsumer addToStringSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToStringSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Blob>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toBlobSet
     */
    public static BiConsumer addToBlobSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToBlobSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Date>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDateSet
     */
    public static BiConsumer addToDateSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDateSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Datetime>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDatetimeSet
     */
    public static BiConsumer addToDatetimeSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDatetimeSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Time>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toTimeSet
     */
    public static BiConsumer addToTimeSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToTimeSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Integer>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toIntSet
     */
    public static BiConsumer addToIntSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToIntSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Long>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toLongSet
     */
    public static BiConsumer addToLongSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToLongSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Double>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDoubleSet
     */
    public static BiConsumer addToDoubleSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToDoubleSet(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<SObject>` and adds the second input argument to it.
     * 
     * @param mapper the mapping function
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toSObjectSet
     */
    public static BiConsumer addToSObjectSet(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToSObjectSet(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToSet extends BiConsumer {
        private final IFunction mapper;
        private AddToSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Object>) container).add(mapper.apply(o)); }
    }

    private class AddToBoolSet extends BiConsumer {
        private final IFunction mapper;
        private AddToBoolSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Boolean>) container).add((Boolean) mapper.apply(o)); }
    }

    private class AddToIdSet extends BiConsumer {
        private final IFunction mapper;
        private AddToIdSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Id>) container).add((Id) mapper.apply(o)); }
    }

    private class AddToStringSet extends BiConsumer {
        private final IFunction mapper;
        private AddToStringSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<String>) container).add((String) mapper.apply(o)); }
    }

    private class AddToBlobSet extends BiConsumer {
        private final IFunction mapper;
        private AddToBlobSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Blob>) container).add((Blob) mapper.apply(o)); }
    }

    private class AddToDateSet extends BiConsumer {
        private final IFunction mapper;
        private AddToDateSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Date>) container).add((Date) mapper.apply(o)); }
    }

    private class AddToDatetimeSet extends BiConsumer {
        private final IFunction mapper;
        private AddToDatetimeSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Datetime>) container).add((Datetime) mapper.apply(o)); }
    }

    private class AddToTimeSet extends BiConsumer {
        private final IFunction mapper;
        private AddToTimeSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Time>) container).add((Time) mapper.apply(o)); }
    }

    private class AddToIntSet extends BiConsumer {
        private final IFunction mapper;
        private AddToIntSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) mapper.apply(o)); }
    }

    private class AddToLongSet extends BiConsumer {
        private final IFunction mapper;
        private AddToLongSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) mapper.apply(o)); }
    }

    private class AddToDoubleSet extends BiConsumer {
        private final IFunction mapper;
        private AddToDoubleSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) mapper.apply(o)); }
    }

    private class AddToSObjectSet extends BiConsumer {
        private final IFunction mapper;
        private AddToSObjectSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<SObject>) container).add((SObject) mapper.apply(o)); }
    }
    // @end-group
    //</editor-fold>

}
