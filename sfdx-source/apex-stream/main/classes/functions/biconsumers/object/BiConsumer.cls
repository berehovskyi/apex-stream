/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IBiConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IBiConsumer
 * @see Collector
 */
public abstract inherited sharing class BiConsumer implements IBiConsumer {

    /**
     * @description Downstream collector.
     */
    public ICollector downstream { get; set; }

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `BiConsumer` that executes `this` operation first,
     * then the `after` operation in that order.
     * @param after the operation to perform after this operation
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `after` is null
     */
    public virtual BiConsumer andThen(final IBiConsumer after) {
        Validate.notNull(after);
        return new Compose(this, after);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Composed BiConsumers">
    // @start-group Composed BiConsumers
    /**
     * @description Returns a composed `BiConsumer` that executes `accumulator` operation,
     * if the second input argument satisfies the predicate.
     * @param predicate the predicate applied to the second input argument
     * @param accumulator the operation to perform after filtering
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `predicate` or `accumulator` is null
     */
    public static BiConsumer filtering(final IPredicate predicate, final IBiConsumer accumulator) {
        Validate.notNull(predicate);
        Validate.notNull(accumulator);
        return new Filtering(predicate, accumulator);
    }

    /**
     * @description Returns a composed `BiConsumer` that applies `accumulator` operation to
     * the result returned by the mapper.
     * @param mapper the operator applied to the second input argument
     * @param accumulator the operation to perform
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static BiConsumer mapping(final IFunction mapper, final IBiConsumer accumulator) {
        Validate.notNull(mapper);
        Validate.notNull(accumulator);
        return new Mapping(mapper, accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends BiConsumer {
        private final IBiConsumer before;
        private final IBiConsumer after;
        private Compose(IBiConsumer before, IBiConsumer after) {
            this.before = before;
            this.after = after;
        }
        public override void accept(Object o1, Object o2) {
            before.accept(o1, o2);
            after.accept(o1, o2);
        }
    }

    private class Filtering extends BiConsumer {
        private final IPredicate predicate;
        private final IBiConsumer accumulator;
        private Filtering(IPredicate predicate, IBiConsumer accumulator) {
            this.predicate = predicate;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            if (predicate.test(o)) { accumulator.accept(container, o); }
        }
    }

    private class Mapping extends BiConsumer {
        private final IFunction mapper;
        private final IBiConsumer accumulator;
        private Mapping(IFunction mapper, IBiConsumer accumulator) {
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            accumulator.accept(container, mapper.apply(o));
        }
    }
    // @end-group
    //</editor-fold>

}
