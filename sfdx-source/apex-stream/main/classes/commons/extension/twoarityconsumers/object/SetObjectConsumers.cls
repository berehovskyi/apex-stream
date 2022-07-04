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
    private SetObjectConsumers(){}

    //<editor-fold desc="Add To Set<?> BiConsumers">
    // @start-group Add To Set<?> BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Object>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toSet
     */
    public static BiConsumer addToSet() {
        return new AddToSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Boolean>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toBoolSet
     */
    public static BiConsumer addToBoolSet() {
        return new AddToBoolSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Id>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toIdSet
     */
    public static BiConsumer addToIdSet() {
        return new AddToIdSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<String>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toStringSet
     */
    public static BiConsumer addToStringSet() {
        return new AddToStringSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Blob>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toBlobSet
     */
    public static BiConsumer addToBlobSet() {
        return new AddToBlobSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Date>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDateSet
     */
    public static BiConsumer addToDateSet() {
        return new AddToDateSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Datetime>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDatetimeSet
     */
    public static BiConsumer addToDatetimeSet() {
        return new AddToDatetimeSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Time>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toTimeSet
     */
    public static BiConsumer addToTimeSet() {
        return new AddToTimeSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Integer>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toIntSet
     */
    public static BiConsumer addToIntSet() {
        return new AddToIntSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Long>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toLongSet
     */
    public static BiConsumer addToLongSet() {
        return new AddToLongSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<Double>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toDoubleSet
     */
    public static BiConsumer addToDoubleSet() {
        return new AddToDoubleSet();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * the `Set<SObject>` and adds the second input argument to it.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.toSObjectSet
     */
    public static BiConsumer addToSObjectSet() {
        return new AddToSObjectSet();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Object>) container).add(o); }
    }

    private class AddToBoolSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Boolean>) container).add((Boolean) o); }
    }

    private class AddToIdSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Id>) container).add((Id) o); }
    }

    private class AddToStringSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
    }

    private class AddToBlobSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Blob>) container).add((Blob) o); }
    }

    private class AddToDateSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Date>) container).add((Date) o); }
    }

    private class AddToDatetimeSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Datetime>) container).add((Datetime) o); }
    }

    private class AddToTimeSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Time>) container).add((Time) o); }
    }

    private class AddToIntSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
    }

    private class AddToLongSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
    }

    private class AddToDoubleSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
    }

    private class AddToSObjectSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<SObject>) container).add((SObject) o); }
    }
    // @end-group
    //</editor-fold>

}
